# SMyLE
**S**MyLE **M**ake m**y** **L**ife **E**asier

# Install 
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/rieonke/SMyLE/master/install.sh)"
```

# Usage
## Docker
### Activate first running and healthy docker machine `dmae` (alias for `smyle_docker_machine_auto_env`)
```shell
#eval $(docker-machine env first-running-and-healthy-docker-machine)
➜ dmae
activating docker machine oracle-dev
```
### View active docker machine `dmcur`( alias for `smyle_docker_machine_current`)
```shell
➜ dmcur
   name: oracle-dev
     ip: 10.211.55.12
    cpu: 1
    mem: 4096
 dirver: parallels
  swarm: false
```

### Switch docker machine `dmse` (alias for `smyle_docker_machine_select_env`)
```shell
➜  dmse
1) oracle-dev  2) prl-dev
?# 2
activating docker machine prl-dev
```
