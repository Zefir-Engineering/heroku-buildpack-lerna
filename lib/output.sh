#!/usr/bin/env bash

indent() {
    sed -u 's/^/      /'
}

output() {
  while IFS= read -r LINE;
  do
    if [[ "$LINE" =~ ^-----\>.* ]]; then
      echo "$LINE" || true
    else
      echo "       $LINE" || true
    fi
  done
}

header() {
  echo "" || true
  echo "-----> $*" || true
}
