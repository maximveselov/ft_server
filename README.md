# ft_server

## LEMP-server inside a Docker container

Runs WordPress, MariaDB and phpMyAdmin

Built with Dockerfile

Use 
{
  docker build . --tag $tag 
}
to build a container and
{
  docker run $tag
}
in order to run a container

To test workability in a domestic environment, expose ports with -p flag and connect to localhost via HTTP/HTTPS
{
  docker run -p 80:80 $tag
}
