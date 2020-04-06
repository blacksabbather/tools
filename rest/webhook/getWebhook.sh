token=$1
/usr/bin/curl -X GET https://api.sandbox.paypal.com/v1/notifications/webhooks \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" 
