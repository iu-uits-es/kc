## Time And Money Documents [/award/api/v1/time-and-money-documents/]

### Get Time And Money Documents by Key [GET /award/api/v1/time-and-money-documents/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"}

### Get All Time And Money Documents [GET /award/api/v1/time-and-money-documents/]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"}
            ]

### Get All Time And Money Documents with Filtering [GET /award/api/v1/time-and-money-documents/]
    
+ Parameters

    + documentNumber (optional) - 
    + rootAwardNumber (optional) - 
    + documentStatus (optional) - 

            
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json 

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"}
            ]
			
### Get Schema for Time And Money Documents [GET /award/api/v1/time-and-money-documents/]
	                                          
+ Parameters

      + _schema (required) - will instruct the endpoint to return a schema data structure for the resource
      
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            {"columns":["documentNumber","rootAwardNumber","documentStatus"],"primaryKey":"documentNumber"}
		
### Get Blueprint API specification for Time And Money Documents [GET /award/api/v1/time-and-money-documents/]
	 
+ Parameters

     + _blueprint (required) - will instruct the endpoint to return an api blueprint markdown file for the resource
                 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: text/markdown

+ Response 200
    + Headers

            Content-Type: text/markdown;charset=UTF-8
            Content-Disposition:attachment; filename="Time And Money Documents.md"
            transfer-encoding:chunked


### Update Time And Money Documents [PUT /award/api/v1/time-and-money-documents/(key)]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"}
			
+ Response 204

### Update Multiple Time And Money Documents [PUT /award/api/v1/time-and-money-documents/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 204

### Insert Time And Money Documents [POST /award/api/v1/time-and-money-documents/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"}
			
+ Response 201
    
    + Body
            
            {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"}
            
### Insert Multiple Time And Money Documents [POST /award/api/v1/time-and-money-documents/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 201
    
    + Body
            
            [
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","rootAwardNumber": "(val)","documentStatus": "(val)","_primaryKey": "(val)"}
            ]
            
### Delete Time And Money Documents by Key [DELETE /award/api/v1/time-and-money-documents/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Time And Money Documents [DELETE /award/api/v1/time-and-money-documents/]

+ Parameters

      + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation

+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Time And Money Documents with Matching [DELETE /award/api/v1/time-and-money-documents/]

+ Parameters

    + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation
    + documentNumber (optional) - 
    + rootAwardNumber (optional) - 
    + documentStatus (optional) - 

      
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204
