#!/bin/bash

FILENAME=.todo_list

if [ ! -f $FILENAME ]; then
    touch $FILENAME
fi

function pretty_print() {
    list=$1
    echo "$list" | grep -n "[1-9]$"
    echo "------- Completed Tasks--------"
    echo "$list" | grep -n "0$"
}

function print() {
    list=`cat $FILENAME | `
    echo "$list"
}

throw_error() {
    echo "wrong command usage"
    echo "See command usage"
}


if [ $# -eq 0 ]; then
    todos=`cat $FILENAME | sort -rk2`
    pretty_print "$todos"

elif [ $# -eq 1 ]; then
    if [ "$1" == "-T" ]; then
        cat -b $FILENAME | head -5
    elif [ "$1" == "-W" ]; then
        cat -b $FILENAME 
    elif [ "$1" == "-P" ]; then
        todos=`cat $FILENAME | sort -rk2`
        pretty_print "$todos"
    else
        throw_error
    fi

elif [ $# -eq 3 ]; then
    if [ "$1" == "-A" ]; then
        echo "$2 $3" >> $FILENAME
    else
        throw_error
    fi
else
    throw_error
fi


