TOKEN=`/usr/bin/curl https://pilot-payflowpro.paypal.com \
  -d 'PARTNER=PayPal&VENDOR=minjwang&USER=minjwang&PWD=abcd1234&TRXTYPE=S&ACTION=S&AMT=35.00&CUSTOM=TRVV14459&RETURNURL=http://www.confirmation_page.com&CANCELURL=http://www.order_page.com&TENDER=P' | perl -ne 'print $1."\n" if(/TOKEN=(\S+?)&/);'`
echo "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=$TOKEN"
