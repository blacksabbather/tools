<?php
function buildMultiPartRequest($delimiter, $files)
{

	$data = '';
	foreach ($files as $name => $content) {

		$file_contents = file_get_contents($content['fileName']);

		$data  .= "--".$delimiter."\r\n" .
			"Content-Disposition: form-data; name=\"" . $name . "\"; filename=\"" . $content['fileName'] . "\"\r\n" .
			"Content-Type: " . $content["Content-Type"] . "\r\n\r\n" .
			$file_contents . "\r\n";
	}

	$data  .= "--".$delimiter."--\r\n";
	return $data;
}

$boundary = uniqid();
$delimiter = '-------------' . $boundary;

$data = buildMultiPartRequest($delimiter, ['input' => ['fileName' => '/home/jay/evi.json', "Content-Type" => 'application/json'], 'file1' => ['fileName' => '/home/jay/webhook_api/node/public/uploads/PP_Sandbox_UserGuide-1579310821217.pdf', "Content-Type" => 'Content-type : application/pdf']]);
echo $data;

$url = "https://api.sandbox.paypal.com/v1/customer/disputes/PP-D-15909/provide-evidence";

$curl = curl_init();

curl_setopt_array(
	$curl, 
	array(
		CURLOPT_URL => $url,
		CURLOPT_RETURNTRANSFER => 1,
		CURLOPT_SSL_VERIFYPEER => false,
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_CUSTOMREQUEST => "POST",
		CURLOPT_POST => 1,
		CURLOPT_POSTFIELDS => $data,
		CURLOPT_HTTPHEADER => array(
			"Authorization: Bearer A21AAG2peRPkNtaafecVjDvV0T4YjCL9Fw6dwBKRJgKqfXeQ-oGc1X6Tp5X-aELdOf9zLUdMKgzFjhj-5RUCHTecGUOsicQyA",
			"Cache-Control: no-cache",
			"Content-Type: multipart/related; boundary=" . $delimiter,
			"Content-Length: " . strlen($data)

		)
	)
);

$response = curl_exec($curl);
print_r($response);

curl_close($curl);
