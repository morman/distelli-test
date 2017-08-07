require 'sinatra'

# bind to all the addresses - Docker on OSX seems to need this
set :bind, '0.0.0.0'

# default route
get '/' do
  'Hi. This is the Distelli test.'
end
