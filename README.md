# docker-jekyll-ghpages
Dockerfile for gh-pages that uses bundler

## Building This Image

From this repository directory:

     docker build -t digitaldrummerj/gh-pages .

## Using Docker Image

Create a Dockerfile in your Jekyll site directory that contains your Gemfile and Gemfile.lock.

     From digitaldrummerj/gh-pages:onbuild

To build image for your Jekyll blog.  Replace [Image Name] with your image name:   

     docker build -t [Image Name] .

To run your Jekyll site from your Jekyll site directory. Replace [Image Name] with your image name:

     docker run --name blog -t -i -p 4000:4000 -v $PWD:/src [Image Name]
     
     
Then launch your browser and navigate to http://[Docker Machine Ip]:4000/.  

To find the docker machine ip run:

     echo $(docker-machine ip `docker-machine active`)     


based on [http://jonweisz.com/docker-jekyll-bundler/](http://jonweisz.com/docker-jekyll-bundler/)
