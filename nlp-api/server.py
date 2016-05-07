import random
import string
import os
import cherrypy
import requests

class StringGeneratorWebService(object):
	exposed = True

	@cherrypy.tools.json_out()
	@cherrypy.tools.accept(media='text/plain')
	def POST(self):
		print "got input!"
		inputData = cherrypy.request.body.read()
	
		print "input is json parsed!"
		print inputData

		watsonURL = "https://gateway.watsonplatform.net/concept-insights/api/v2/graphs/wikipedia/en-latest/annotate_text"
		conceptInsightUser = os.environ.get('CONCEPT_INSIGHT_USER')
		conceptInsightPass = os.environ.get('CONCEPT_INSIGHT_PASS')

		print "getting the text attr from input!"
		payload = inputData

		dev = inputData[0:1] == 'x'
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
		print payload

		payload = extractTopicsSection(payload)

		print "POSTing to Watson!"
		r = requests.post(watsonURL, 
				data = payload, 
				headers = {'Content-Type': 'text/plain'},
				auth=(conceptInsightUser, conceptInsightPass))


		print "Getting the annotations from Watson response!"
		conceptList = r.json().get('annotations', [])

		conceptList = filterByScore(conceptList)

		topicsList = payload.split('\n')
		
		resultTopics = [];
		for topic in topicsList:
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

		i = 0
		for topic in topicsList:
			print "topic: " + topic
			if i in conceptSetKeys:
				print "here"
				conceptsInTopic = conceptSet[i]
				tags = list(conceptsInTopic)
				print tags
				resultTopics[i]['tags'] = tags				
			i += 1

		return {'result': resultTopics}

def cleanupTag(candidate):
	parenIdx = candidate.find('(')

	if parenIdx < 0:
		return candidate
	else:
		return candidate[:parenIdx-1]


def extractTopicsSection(payload):
	return payload

def filterByScore(conceptList):
	result = []

	for concept in conceptList:
		if concept['score'] > 0.8:
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

