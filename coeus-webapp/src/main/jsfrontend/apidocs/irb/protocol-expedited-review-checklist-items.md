## Protocol Expedited Review Checklist Items [/irb/api/v1/protocol-expedited-review-checklist-items/]

### Get Protocol Expedited Review Checklist Items by Key [GET /irb/api/v1/protocol-expedited-review-checklist-items/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"}

### Get All Protocol Expedited Review Checklist Items [GET /irb/api/v1/protocol-expedited-review-checklist-items/]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"},
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"}
            ]

### Get All Protocol Expedited Review Checklist Items with Filtering [GET /irb/api/v1/protocol-expedited-review-checklist-items/]
    
+ Parameters

    + protocolExpeditedCheckListId (optional) - 
    + protocolId (optional) - 
    + submissionIdFk (optional) - 
    + protocolNumber (optional) - 
    + sequenceNumber (optional) - 
    + submissionNumber (optional) - 
    + expeditedReviewCheckListCode (optional) - 

            
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json 

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"},
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"}
            ]
			
### Get Schema for Protocol Expedited Review Checklist Items [GET /irb/api/v1/protocol-expedited-review-checklist-items/]
	                                          
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
    
            {"columns":["protocolExpeditedCheckListId","protocolId","submissionIdFk","protocolNumber","sequenceNumber","submissionNumber","expeditedReviewCheckListCode"],"primaryKey":"protocolExpeditedCheckListId"}
		
### Get Blueprint API specification for Protocol Expedited Review Checklist Items [GET /irb/api/v1/protocol-expedited-review-checklist-items/]
	 
+ Parameters

     + _blueprint (required) - will instruct the endpoint to return an api blueprint markdown file for the resource
                 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: text/markdown

+ Response 200
    + Headers

            Content-Type: text/markdown;charset=UTF-8
            Content-Disposition:attachment; filename="Protocol Expedited Review Checklist Items.md"
            transfer-encoding:chunked


### Update Protocol Expedited Review Checklist Items [PUT /irb/api/v1/protocol-expedited-review-checklist-items/(key)]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"}
			
+ Response 204

### Update Multiple Protocol Expedited Review Checklist Items [PUT /irb/api/v1/protocol-expedited-review-checklist-items/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"},
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 204

### Insert Protocol Expedited Review Checklist Items [POST /irb/api/v1/protocol-expedited-review-checklist-items/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"}
			
+ Response 201
    
    + Body
            
            {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"}
            
### Insert Multiple Protocol Expedited Review Checklist Items [POST /irb/api/v1/protocol-expedited-review-checklist-items/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"},
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 201
    
    + Body
            
            [
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"},
              {"protocolExpeditedCheckListId": "(val)","protocolId": "(val)","submissionIdFk": "(val)","protocolNumber": "(val)","sequenceNumber": "(val)","submissionNumber": "(val)","expeditedReviewCheckListCode": "(val)","_primaryKey": "(val)"}
            ]
            
### Delete Protocol Expedited Review Checklist Items by Key [DELETE /irb/api/v1/protocol-expedited-review-checklist-items/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Protocol Expedited Review Checklist Items [DELETE /irb/api/v1/protocol-expedited-review-checklist-items/]

+ Parameters

      + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation

+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Protocol Expedited Review Checklist Items with Matching [DELETE /irb/api/v1/protocol-expedited-review-checklist-items/]

+ Parameters

    + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation
    + protocolExpeditedCheckListId (optional) - 
    + protocolId (optional) - 
    + submissionIdFk (optional) - 
    + protocolNumber (optional) - 
    + sequenceNumber (optional) - 
    + submissionNumber (optional) - 
    + expeditedReviewCheckListCode (optional) - 

      
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204
