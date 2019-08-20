# SMyLE
**S**MyLE **M**ake m**y** **L**ife **E**asier

# Install 
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/rieonke/SMyLE/master/install.sh)"
```

# Usage
## Docker
### Auto env docker machine `dmae` (alias for `smyle_docker_machine_auto_env`)
```shell
#eval $(docker-machine env first-running-and-healthy-docker-machine)
➜ dmae
activating docker machine oracle-dev
```
### View current activate docker machine `dmcur`( alias for `smyle_docker_machine_current`)
```shell
➜ dmcur
   name: oracle-dev
     ip: 10.211.55.12
    cpu: 1
    mem: 4096
 dirver: parallels
  swarm: false
```

### Select current docker machine `dmse` (alias for `smyle_docker_machine_select_env`)
```shell
➜  dmse
1) oracle-dev  2) prl-dev
?# 2
activating docker machine prl-dev
```
