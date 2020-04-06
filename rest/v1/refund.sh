token=$1
txn=$2
curl -X POST https://api.sandbox.paypal.com/v1/payments/sale/$txn/refund \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" \
-d '{
  "amount": {
    "total": "2.34",
    "currency": "USD"
  }
}'
