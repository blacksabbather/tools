/usr/bin/curl https://pilot-payflowpro.paypal.com \
  -d 'PARTNER=PayPal&VENDOR=minjwang&USER=minjwang&PWD=abcd1234&TRXTYPE=S&ACTION=G&TENDER=P&TOKEN=EC-00R74274P4109054K'|sed -s 's/\&/\n/g'
