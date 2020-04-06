token=$1
ectoken=$2
/usr/bin/curl -X POST https://api.sandbox.paypal.com/v1/payments/billing-agreements/$ectoken/agreement-execute \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token"
