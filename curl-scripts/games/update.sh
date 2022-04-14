#!/bin/bash

API="http://localhost:4741"
URL_PATH="/games"
ID="62582eaf06b25e5e6ed96f31"
TOKEN="fbe7c2e40bd509befe85a7932a67662d"
NAME="hiep game 2 the redemption"
CONSOLE="PS2"
RATING="14575745"
REVIEW="its really good"
STATUS="true"
OWNER="625823aa4d56cf4dd1503c7f"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "game": {
      "name": "'"${NAME}"'",
      "console": "'"${CONSOLE}"'",
      "rating": "'"${RATING}"'",
      "review": "'"${REVIEW}"'",
      "status": "'"${STATUS}"'",
      "owner": "'"${OWNER}"'"
    }
  }'

echo
