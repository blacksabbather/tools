token=$1
planid=$2
/usr/bin/curl -X POST https://api.sandbox.paypal.com/v1/payments/billing-agreements/ \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" \
-d '{
  "name": "Override Agreement",
  "description": "PayPal payment agreement that overrides merchant preferences and shipping fee and tax information.",
  "start_date": "2020-04-22T09:13:49Z",
  "payer": {
    "payment_method": "paypal",
    "payer_info": {
      "email": "jay_wong-customer@me.com"
    }
  },
  "plan": {
    "id": "'$planid'"
  },
  "shipping_address": {
    "line1": "Hotel Staybridge",
    "line2": "Crooke Street",
    "city": "San Jose",
    "state": "CA",
    "postal_code": "95112",
    "country_code": "US"
  }
}'
