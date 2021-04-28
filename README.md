<h1> ft_server </h1>

<div><p> LEMP-server inside a Docker container

Runs WordPress, MariaDB and phpMyAdmin

Built with Dockerfile </p></div>
<div>
<h3>Use </h3>

<h6>  docker build . --tag $tag </h6>

to build a container and

  docker run $tag

in order to run a container

To test workability in a domestic environment, expose ports with -p flag and connect to localhost via HTTP/HTTPS

  docker run **-p 80:80** $tag
  
</div>

