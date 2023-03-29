cat token.txt >> '$TOKEN'

 curl -H "Content-Type: application/json" \
	    -H "Authorization: Bearer $TOKEN" \
			-d $1 \
      -X POST \
       $2
