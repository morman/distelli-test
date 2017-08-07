# distelli-test - testing distilli capability
FROM ubuntu:latest
MAINTAINER stephen.morman@gmail.com
# update OPS and load apps and create working dir
RUN apt-get update && apt-get install -y ruby bundler && mkdir -p /opt/distelli-test
# move the files to the working directory
ADD . /opt/distelli-test
# create context for subsequent commands
WORKDIR /opt/distelli-test
# install ruby dependencies
RUN bundle install
# make HTTP port available
EXPOSE 4567
# run service with bundler, binding to all addresses on port 4567
CMD ["ruby", "/opt/distelli-test/app.rb", "-p", "4567"]
# docker build -t "distelli-test:latest" .
# docker run -p 4567:4567 distelli-test:latest