token=$1
disputeID=$2
curl -X POST https://api.sandbox.paypal.com/v1/customer/disputes/$disputeID/provide-evidence \
-H "Content-Type: multipart/related; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW" \
-H "Authorization: Bearer $token" \
-F 'input={
  "evidences": [
{
  "evidence_type": "PROOF_OF_FULFILLMENT",
  "evidence_info": {
  "tracking_info": [
    {
    "carrier_name": "FEDEX",
    "tracking_number": "122533485"
    }
  ]
  },
  "notes": "Test"
}
  ]
};type=application/json' \
-F 'file1=@/home/jay/webhook_api/node/public/uploads/file-1564719366194.JPG' | jq
