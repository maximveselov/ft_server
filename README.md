<style>
  .code {
  font-family: "Lucida Console", "Courier New", monospace; 
  font-weight: light;
  }
  .text {
  background-color: gray;
  }
</style>

<h1> ft_server </h1>

<div class="text"><p> LEMP-server inside a Docker container

Runs WordPress, MariaDB and phpMyAdmin

Built with Dockerfile </p></div>
<div>
<h3>Use </h3>

<div class="code">  docker build . --tag $tag </div>

to build a container and

  docker run $tag

in order to run a container

To test workability in a domestic environment, expose ports with -p flag and connect to localhost via HTTP/HTTPS

  docker run **-p 80:80** $tag
  
</div>

