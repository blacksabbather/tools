<?php
//$data = shell_exec('/bin/ls -l');
//print_r($data);
//echo $argv[0]."\n";
//echo $argv[1]."\n";
//echo $argv[2]."\n";
$token=$argv[1];
$disputeID=$argv[2];
$url="https://api.sandbox.paypal.com/v1/customer/disputes/".$disputeID."/provide-evidence";
$ContentType="Content-Type: multipart/related; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW";
$Auth="Authorization: Bearer ".$token;
$input_str='input={
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
};type=application/json';
$file_str="file1=@/home/jay/webhook_api/node/public/uploads/file-1564719366194.JPG";
$cmd="/usr/bin/curl -X POST ".$url." -H \"".$ContentType."\" -H \"".$Auth."\" -F '".$input_str."' -F '".$file_str."'";
echo $cmd."\n";
$data = shell_exec($cmd);
echo $data;
/*
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
*/
