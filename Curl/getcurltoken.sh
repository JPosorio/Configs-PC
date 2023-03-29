cat token.txt >> '$TOKEN'

 curl -H "Content-Type: application/json" \
	    -H "Authorization: Bearer $TOKEN" \
      -X GET \
       $1
