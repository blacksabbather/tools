token=$1
disputeID=$2
curl https://api.sandbox.paypal.com/v1/customer/disputes/$disputeID \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" | jq
