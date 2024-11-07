#!/bin/bash

echo $ALGO
echo $URL
echo $EMAIL
echo $PASSWORD
echo $THREADS

minerd --algo="$ALGO" --url="$URL" --user="$EMAIL" --pass="$PASSWORD" --threads=$THREADS