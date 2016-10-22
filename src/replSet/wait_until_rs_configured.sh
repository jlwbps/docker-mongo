#!/bin/bash
mongoshell=$(/run/cmd/mongoshell.sh)
state=0
while [ "$state" != "1" ] && [ "$state" != "2" ]; do
    echo "=> Waiting replica set to be configured"
    sleep 5
    result=$($mongoshell admin --eval "rs.status().myState;")
    state="${result: -1}"
done