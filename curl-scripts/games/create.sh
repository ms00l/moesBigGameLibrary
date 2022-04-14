#!/bin/bash
API="http://localhost:4741"
URL_PATH="/games"
TOKEN="fbe7c2e40bd509befe85a7932a67662d"
NAME="hieps dental surgery simulator"
CONSOLE="PC"
RATING="920375093845"
REVIEW="its really good"
STATUS="true"
OWNER="625823aa4d56cf4dd1503c7f"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
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