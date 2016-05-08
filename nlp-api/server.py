import random
import string
import os
import cherrypy
import requests
import re

class StringGeneratorWebService(object):
	exposed = True

	@cherrypy.tools.json_out()
	@cherrypy.tools.accept(media='text/plain')
	def POST(self):
		print "got input!"
		inputData = cherrypy.request.body.read()
	
		watsonURL = "https://gateway.watsonplatform.net/concept-insights/api/v2/graphs/wikipedia/en-latest/annotate_text"
		conceptInsightUser = os.environ.get('CONCEPT_INSIGHT_USER')
		conceptInsightPass = os.environ.get('CONCEPT_INSIGHT_PASS')

		print "getting the text attr from input!"
		#print inputData
		payload = cleanInputText(inputData)

		dev = inputData[0:1] == 'x'

		# Dev flag is forced on
		dev = True

		if not dev:
			return {
					"title": "Mrs. Johnson's Algebra II Class",
  "topics" : [
    {
      "topic": "Introduction to Functions and Polynomials",
      "tags": [
        "Function",
        "Polynomial"
      ]
    },
    {
      "topic": "Equations and Factoring",
      "tags": [
        "Equation",
        "Factoring"
      ]
    },
    {
      "topic": "Quadratic and Exponential Functions",
      "tags": [
        "Quadratic Function",
        "Exponent",
        "Function"
      ]
    }
  ]
}

		print "Payload!"
		#print payload

		title = findTitle(payload)

		payload = extractTopicsSection(payload)

		print "POSTing to Watson!"
		r = requests.post(watsonURL, 
				data = payload, 
				headers = {'Content-Type': 'text/plain'},
				auth=(conceptInsightUser, conceptInsightPass))


		print "Getting the annotations from Watson response!"
		conceptList = r.json().get('annotations', [])
		#print conceptList
		conceptList = filterByScore(conceptList)

		topicsList = payload.split('\n')
		
		resultTopics = [];
		for topic in topicsList:
			topic = ' '.join(topic.split())
			if topic and topic != ' ':
				resultTopics.append({'topic':topic, 'tags':[]})
		
		conceptSet = {}
		for concept in conceptList:
			# Each topic has a newline at the end of it. Count how many newlines we have to cross to get to this concept's location.
			topicNumber = payload[:concept.get('text_index', [])[0]].count('\n')
			conceptsInTopic = conceptSet.get(topicNumber, set([]))

			conceptLabel = cleanupTag(concept['concept']['label'])

			if conceptLabel != '':
				conceptsInTopic.add(conceptLabel)
			
			conceptSet[topicNumber] = conceptsInTopic
		
		conceptSetKeys = set(conceptSet.keys())

		#print conceptSet

		i = 0
		for topicResult in resultTopics:
			topic = topicResult['topic']
			print "topic: |" + topic + "|"
			topic = topic.lstrip().rstrip()
			if i in conceptSetKeys:
				conceptsInTopic = conceptSet[i]
				tags = list(conceptsInTopic)
				print "\ttags: " + str(tags)
			elif len(topic) > 0:
				tags = [topic.split(' ')[-1].capitalize()]
				print "\tlast word: " + str(tags)

			resultTopics[i]['tags'] = tags
			i += 1

		return {'result': resultTopics, 'title': title}

def findTitle(text):
	return text.split('\n')[1].lstrip().rstrip()
	#return "Algebra 1"

def cleanInputText(text):
	print text.count('\n')
	text = re.sub(r'\n+', '\n', text)
	print text.count('\n')
	return ''.join([i if ord(i) < 128 else ' ' for i in text])

def cleanupTag(candidate):
	parenIdx = candidate.find('(')

	if parenIdx < 1:
		return candidate
	else:
		return candidate[:parenIdx-1]


def extractTopicsSection(payload):
	startIdx = payload.find('Study:') + len('Study:') + 2
	endIdx = payload.find('Evaluations')
	return payload[startIdx:endIdx]

def filterByScore(conceptList):
	result = []

	for concept in conceptList:
		if concept['score'] > 0.7:
			result.append(concept)

	return result

if __name__ == '__main__':
	conf = {
	 '/': {
	     'request.dispatch': cherrypy.dispatch.MethodDispatcher(),
	     'tools.sessions.on': True,
	     'tools.response_headers.on': True,
	     'tools.response_headers.headers': [('Content-Type', 'application/json')]
	 }
	}

	cherrypy.config.update({'server.socket_host': '0.0.0.0',
		                        'server.socket_port': 8080,
					                       })

	cherrypy.quickstart(StringGeneratorWebService(), '/', conf)

