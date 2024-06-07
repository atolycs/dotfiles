#!/usr/bin/env bash

function greeting() {
	printf "Welcome to the installation script for the \n\n"
	printf "+-----------------------------------------+\n"
	printf "|                                         |\n"

	printf '|      |        |     _| _)  |            |\n'
	printf '|   _` |   _ \   _|   _|  |  |   -_) (_-< |\n'
	printf '| \__,_| \___/ \__| _|   _| _| \___| ___/ |\n'

	printf "|                                         |\n"
	printf "+-----------------------------------------+\n"
}

function main() {

	# Welcome screen
	greeting
}

main $@
