require 'sinatra'

# Set port for compatability with Nitrous.IO 
configure :development do   
  set :bind, '0.0.0.0'   
  set :port, 3000 # Not really needed, but works well with the "Preview" menu option
end

get '/madlibs' do
  erb :questions
end

post '/madlibs' do
  animal = params[:animal]
  color = params[:color]
  person = params[:person]
  object = params[:object]
  adjective = params[:adjective]
  verb = params[:verb]
  "The #{adjective} #{animal} started to #{verb} because the #{person} ran away with the #{object}"
end

__END__

@@questions
<!doctype html>
<html>
  <header>
    <title>Madlibs</title>
  </header>
  <body>
    <form method="POST" action="/madlibs">
      <p>Animal:</p>
      <input name="animal">
      <p>Color:</p>
      <input name="color">
      <p>Person:</p>
      <input name="person">
      <p>Object:</p>
      <input name="object">
      <p>Adjective:</p>
      <input name="adjective">
      <p>Verb:</p>
      <input name="verb">
      <input type="submit" value="Create Madlib">
    </form>
  </body>
</html>