#!/usr/bin/env bash
DOMAIN=''
# https://gist.github.com/jonsuh/3c89c004888dfc7352be
NOCOLOR='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

display_usage() {
  echo -e "${YELLOW}This script archives websites."
  echo -e "${NOCOLOR}\nUsage:\n\t archive.sh [URL]\n"
  echo -e "${YELLOW}\nExample: archive.sh https://forum2018.diglib.org\n"
}

domain_from_url(){
  echo "$1" | cut -d'/' -f3
}

if [ $# == 0 ]
then
  display_usage
  exit 1
fi

# check whether user had supplied -h or --help . If yes display usage
if [[ ( $# == "--help") ||  $# == "-h" ]]
then
	display_usage
	exit 0
fi

echo "${GREEN}Archiving $1${NOCOLOR}"

DOMAIN=$(domain_from_url "$1")

# from https://www.petekeen.net/archiving-websites-with-wget
cmd="wget \
  --mirror \
  --warc-file=${DOMAIN} \
  --warc-cdx \
  --page-requisites \
  --adjust-extension \
  --convert-links \
  --execute robots=off \
  --directory-prefix=. \
  --span-hosts \
  --domains=${DOMAIN} \
  --random-wait \
  ${1}"
eval "$cmd"

mv "${DOMAIN}" docs
