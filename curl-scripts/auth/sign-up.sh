#!/bin/bash


API="http://localhost:4741"
URL_PATH="/sign-up"
EMAIL="bing@m.com"
PASSWORD="moe2"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'

echo

ID="625823aa4d56cf4dd1503c7f"
TOKEN="6868519a20d2d8156359afd0cef4bc97"