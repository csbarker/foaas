# SHFMAAS

v0.0.1

SHFMAAS (Say Hi As A Service) provides a modern, RESTful, scalable solution to the common problem of telling people hi.

# Content Negotiation

FOAAS will respond to the following 'Accept:' values with appropriate content

* text/plain - Content will be returned as a plain string.
* application/json - Content will be returned as a JSON object { message: 'message', subtitle: 'subtitle' }
* text/html - Content will be returned as an HTML page with a twitter bootstrap hero unit, containing the message and the subtitle.

# API

## /hi/:from/:name

Will return content of the form ':from says Hi. - :from', e.g. /hi/Tom/Chris will return 'Tom says Hi - Chris'

## /hello/:from/:name

Will return content of the form ':name says Hello. - :from', e.g. /hello/Tom/Chris will return 'Tom says Hello. - Chris'

/gday/:from/:name

Will return content of the form ':name says Hello. - :from', e.g. /hello/Tom/Chris will return 'Tom says G'day. - Chris'

Forked from FOAAS