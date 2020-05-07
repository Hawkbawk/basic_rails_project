# basic_rails_project

## About
An extremely basic rails project that allows for creating small posts (called articles)
and then commenting on them. The articles and rails are stored in a postgresql database,
run in its own Docker container. The server, meanwhile, is also running on its own Docker
container.

## Dependencies
In order to run this Rails server, you will need dinghy for Mac, at least if you want to
run it in the Docker containers and make it an easy setup process. Follow the install
instructions on https://github.com/codekitchen/dinghy. If dinghy doesn't include 
docker-compose, go ahead and use homebrew to install that as well. My personal VM has
8 GB of RAM allocated to it, 4 CPU cores, and 100 GB of hard drive space.

## Running
In order to start up the Rails server, simply clone this repo, navigate there in a terminal,
and then simply run
`docker-compose run`
to start the server and database in the foreground, or run
`docker-compose run -d`
to start it in the background.
Assuming you used dinghy, simply navigate to [myrailsapp.docker] and enjoy some terrible UI.
