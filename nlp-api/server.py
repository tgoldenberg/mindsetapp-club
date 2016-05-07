import random
import string
import os
import cherrypy
import requests

class StringGeneratorWebService(object):
	exposed = True

	@cherrypy.tools.json_out()
	@cherrypy.tools.json_in()
	@cherrypy.tools.accept(media='application/json')
	def POST(self):
		print "got input!"
		inputData = cherrypy.request.json
	
		print "input is json parsed!"
		print inputData

		watsonURL = "https://gateway.watsonplatform.net/concept-insights/api/v2/graphs/wikipedia/en-latest/annotate_text"
		conceptInsightUser = os.environ.get('CONCEPT_INSIGHT_USER')
		conceptInsightPass = os.environ.get('CONCEPT_INSIGHT_PASS')

		print "getting the text attr from input!"
		payload = inputData.get('text', "")

		dev = inputData.get("dev", False)
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

		print "POSTing to Watson!"
		r = requests.post(watsonURL, 
				data = payload, 
				headers = {'Content-Type': 'text/plain'},
				auth=(conceptInsightUser, conceptInsightPass))

		print "About to print Watson response!"
		print r.content

		print "Getting the annotations from Watson response!"
		conceptList = r.json().get('annotations', [])

		for concept in conceptList:
			print concept
		
		return {'concepts': conceptList}


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

