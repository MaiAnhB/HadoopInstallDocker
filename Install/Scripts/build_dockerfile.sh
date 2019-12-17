# add current user to docker group so that it can execute docker commands
sudo usermod -aG docker $USER

# start docker
sudo systemctl start docker

# init a docker swarm cluster and listens on localhost
docker swarm init --advertise-addr 127.0.0.1

# create an overlay network
docker network create --driver overlay swarm-net

# build dockerfile
docker build --tag daphnemaianh/hadoop:2.7.4 .
