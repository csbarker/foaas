express = require 'express'
sanitizer = require 'sanitizer'

template = (message, subtitle) -> '
<html>
  <head>
    <title>Say Hi As A Service (SHFMAAS)</title>
    <meta charset="utf-8">
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
  </head>

  <body style="margin-top:40px;">
    <div class="container">
      <div id="view-10" view=""><div class="hero-unit">
        <h1>'+sanitizer.escape(message)+'</h1>
        <p><em>'+sanitizer.escape(subtitle)+'</em></p>
        </div>
      </div>
    </div>
    <script>!function(a,b,c,d,e,f,g){a.GoogleAnalyticsObject=e,a[e]=a[e]||function(){(a[e].q=a[e].q||[]).push(arguments)},a[e].l=1*new Date,f=b.createElement(c),g=b.getElementsByTagName(c)[0],f.async=1,f.src=d,g.parentNode.insertBefore(f,g)}(window,document,"script","//www.google-analytics.com/analytics.js","ga"),ga("create","UA-42551488-1","herokuapp.com"),ga("send","pageview");</script>
  </body>
</html>'

dooutput = (res, message, subtitle) ->
  res.format
    "text/plain": ->
      res.send "#{message} #{subtitle}"
    "application/json": ->
      res.send JSON.stringify { message: message, subtitle: subtitle }
    "text/html": ->
      res.send template(message,subtitle)

app = express()
app.use(express.bodyParser())
app.use(express.methodOverride())
app.use(app.router)
app.use(express.static('./public'))
app.use (req, res) ->
  res.sendfile("./public/index.html")

app.get '/hi/:name/:from', (req, res) ->
  message = "#{req.params.name} says Hi."
  subtitle = "- #{req.params.from}"
  dooutput(res, message, subtitle)

app.get '/hello/:name/:from', (req, res) ->
  message = "#{req.params.name} says Hello."
  subtitle = "- #{req.params.from}"
  dooutput(res, message, subtitle)

port = process.env.PORT || 5000 
app.listen port
console.log "FOAAS Started on port #{port}"
