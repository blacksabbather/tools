<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "https://api.sandbox.paypal.com/v1/customer/disputes/PP-D-15909/provide-evidence",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"input\"\r\n\r\n{\n  \"evidences\": [\n{\n  \"evidence_type\": \"PROOF_OF_FULFILLMENT\",\n  \"evidence_info\": {\n  \"tracking_info\": [\n    {\n    \"carrier_name\": \"FEDEX\",\n    \"tracking_number\": \"122533485\"\n    }\n  ]\n  },\n  \"notes\": \"Test\"\n}\n  ]\n};type=application/json\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"file1\"\r\n\r\n@/home/jay/webhook_api/node/public/uploads/PP_Sandbox_UserGuide-1579310821217.pdf\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Bearer A21AAG2peRPkNtaafecVjDvV0T4YjCL9Fw6dwBKRJgKqfXeQ-oGc1X6Tp5X-aELdOf9zLUdMKgzFjhj-5RUCHTecGUOsicQyA",
    "Content-Type: multipart/related; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
    "Postman-Token: 717d9c7d-cb20-4ec4-8100-55c6e1de4e3b",
    "cache-control: no-cache",
    "content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW"
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
