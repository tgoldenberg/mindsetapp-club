import random
import string

import cherrypy

class StringGeneratorWebService(object):
	exposed = True

	@cherrypy.tools.json_out()
	@cherrypy.tools.json_in()
	@cherrypy.tools.accept(media='application/json')
	def POST(self):
		data = cherrypy.request.json
		return {'key':'val', 'input': data}

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

