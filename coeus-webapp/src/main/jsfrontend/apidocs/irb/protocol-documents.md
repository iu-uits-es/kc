## Protocol Documents [/irb/api/v1/protocol-documents/]

### Get Protocol Documents by Key [GET /irb/api/v1/protocol-documents/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"}

### Get All Protocol Documents [GET /irb/api/v1/protocol-documents/]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"}
            ]

### Get All Protocol Documents with Filtering [GET /irb/api/v1/protocol-documents/]
    
+ Parameters

    + documentNumber (optional) - The document id is generated by the workflow environment and is unique to each installation of Kuali... Maximum length is 14.
    + protocolWorkflowType (optional) - 
    + reRouted (optional) - 

            
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json 

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"}
            ]
			
### Get Schema for Protocol Documents [GET /irb/api/v1/protocol-documents/]
	                                          
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
    
            {"columns":["documentNumber","protocolWorkflowType","reRouted"],"primaryKey":"documentNumber"}
		
### Get Blueprint API specification for Protocol Documents [GET /irb/api/v1/protocol-documents/]
	 
+ Parameters

     + _blueprint (required) - will instruct the endpoint to return an api blueprint markdown file for the resource
                 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: text/markdown

+ Response 200
    + Headers

            Content-Type: text/markdown;charset=UTF-8
            Content-Disposition:attachment; filename="Protocol Documents.md"
            transfer-encoding:chunked


### Update Protocol Documents [PUT /irb/api/v1/protocol-documents/(key)]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"}
			
+ Response 204

### Update Multiple Protocol Documents [PUT /irb/api/v1/protocol-documents/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 204

### Insert Protocol Documents [POST /irb/api/v1/protocol-documents/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"}
			
+ Response 201
    
    + Body
            
            {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"}
            
### Insert Multiple Protocol Documents [POST /irb/api/v1/protocol-documents/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 201
    
    + Body
            
            [
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"},
              {"documentNumber": "(val)","protocolWorkflowType": "(val)","reRouted": "(val)","_primaryKey": "(val)"}
            ]
            
### Delete Protocol Documents by Key [DELETE /irb/api/v1/protocol-documents/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Protocol Documents [DELETE /irb/api/v1/protocol-documents/]

+ Parameters

      + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation

+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Protocol Documents with Matching [DELETE /irb/api/v1/protocol-documents/]

+ Parameters

    + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation
    + documentNumber (optional) - The document id is generated by the workflow environment and is unique to each installation of Kuali... Maximum length is 14.
    + protocolWorkflowType (optional) - 
    + reRouted (optional) - 

      
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204
