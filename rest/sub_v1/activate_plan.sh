token=$1
planid=$2
/usr/bin/curl -X PATCH https://api.sandbox.paypal.com/v1/payments/billing-plans/$planid/ \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" \
-d '[
  {
    "op": "replace",
    "path": "/",
    "value": {
      "state": "ACTIVE"
    }
  }
]'
