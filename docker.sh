#!/usr/bin/env bash
# -*- tab-width: 4; encoding: utf-8 -*-

_smyle_array_contains() {
    local seeking=$1
    shift
    local array=("$@")
    for element in "${array[@]}"; do
        if [[ $element == $seeking ]]; then
            return 0
        fi
    done
    return 1
}

smyle_docker_machine_auto_env() {

    local running_dms=()
    for m_active in $( docker-machine ls | awk '$4 == "Running" && $8 =="" {print $1}') 
    do
        running_dms+=("${m_active}")
    done

    if [ ${#running_dms[@]} -gt 0 ]
    then
        echo "activating docker machine ${running_dms[1]}"
        eval $(docker-machine env ${running_dms[1]})
    fi
}

smyle_docker_machine_select_env() {
    local running_dms=()
    for m_active in $( docker-machine ls | awk '$4 == "Running" && $8 =="" {print $1}') 
    do
        running_dms+=("${m_active}")
    done

    select odm in "${running_dms[@]}"
    do
        if _smyle_array_contains ${odm} "${running_dms[@]}"
        then
            echo "activating docker machine ${odm}"
            eval $(docker-machine env ${odm})
        else
            echo "no such docker machine, quit"
        fi
        break
    done
}

smyle_docker_machine_current() {

    if [ ! $DOCKER_MACHINE_NAME = "" ]
    then
        inspect_json=$(docker-machine inspect $DOCKER_MACHINE_NAME)
        echo "   name: "$DOCKER_MACHINE_NAME
        echo "     ip: "$(echo $inspect_json | jq -r ".Driver.IPAddress")
        echo "    cpu: "$(echo $inspect_json | jq -r ".Driver.CPU")
        echo "    mem: "$(echo $inspect_json | jq -r ".Driver.Memory")"M"
        echo " dirver: "$(echo $inspect_json | jq -r ".DriverName")
        echo "  swarm: "$(echo $inspect_json | jq -r ".HostOptions.SwarmOptions.IsSwarm")
    else
        echo "no active docker machine, run dmae first"
    fi
}

smyle_docker_alias() {
    alias dmae=smyle_docker_machine_auto_env
    alias dmcur=smyle_docker_machine_current
    alias dmse=smyle_docker_machine_select_env
}

if [ $SMYLE_USE_ALIAS -eq 1 ]
then
    smyle_docker_alias
fi

