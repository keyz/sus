#!/bin/bash

echo "pid: $$"

printf "type something: "
read input
echo "you typed: $input"

while sleep 0.5; do echo "pid: $$"; done
