/usr/bin/curl -X POST -u 'Ae_qS8wU9-kYuUmYNtEoi7rlN5Au6zh8JRbRY0zdcsUwJGZxoqUAFBFqzCz_o89_idb4u7ob8_5ZvUI9:EGt2vawMCuLqQUxp_Bd1naHWSIt0Y3ygtdgIfkJ5RuiGMZqEZiB6-WgAnh0pk6jqJbr859bUNbVA_xMj' -d 'grant_type=client_credentials' https://api.sandbox.paypal.com/v1/oauth2/token|jq ".access_token"