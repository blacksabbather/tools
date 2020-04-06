token=$1
order=$2
/usr/bin/curl -X POST https://api.sandbox.paypal.com/v2/checkout/orders/$order \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token"
