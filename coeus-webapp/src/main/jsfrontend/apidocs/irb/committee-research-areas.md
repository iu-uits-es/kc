## Committee Research Areas [/irb/api/v1/committee-research-areas/]

### Get Committee Research Areas by Key [GET /irb/api/v1/committee-research-areas/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"}

### Get All Committee Research Areas [GET /irb/api/v1/committee-research-areas/]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"},
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"}
            ]

### Get All Committee Research Areas with Filtering [GET /irb/api/v1/committee-research-areas/]
    
+ Parameters

    + id (optional) - Committee Research Area Id.
    + committeeIdFk (optional) - Committee Id Fk.
    + researchAreaCode (optional) - Research Area Code.

            
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json 

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"},
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"}
            ]
			
### Get Schema for Committee Research Areas [GET /irb/api/v1/committee-research-areas/]
	                                          
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
    
            {"columns":["id","committeeIdFk","researchAreaCode"],"primaryKey":"id"}
		
### Get Blueprint API specification for Committee Research Areas [GET /irb/api/v1/committee-research-areas/]
	 
+ Parameters

     + _blueprint (required) - will instruct the endpoint to return an api blueprint markdown file for the resource
                 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: text/markdown

+ Response 200
    + Headers

            Content-Type: text/markdown;charset=UTF-8
            Content-Disposition:attachment; filename="Committee Research Areas.md"
            transfer-encoding:chunked


### Update Committee Research Areas [PUT /irb/api/v1/committee-research-areas/(key)]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"}
			
+ Response 204

### Update Multiple Committee Research Areas [PUT /irb/api/v1/committee-research-areas/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"},
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 204

### Insert Committee Research Areas [POST /irb/api/v1/committee-research-areas/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"}
			
+ Response 201
    
    + Body
            
            {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"}
            
### Insert Multiple Committee Research Areas [POST /irb/api/v1/committee-research-areas/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"},
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 201
    
    + Body
            
            [
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"},
              {"id": "(val)","committeeIdFk": "(val)","researchAreaCode": "(val)","_primaryKey": "(val)"}
            ]
            
### Delete Committee Research Areas by Key [DELETE /irb/api/v1/committee-research-areas/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Committee Research Areas [DELETE /irb/api/v1/committee-research-areas/]

+ Parameters

      + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation

+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Committee Research Areas with Matching [DELETE /irb/api/v1/committee-research-areas/]

+ Parameters

    + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation
    + id (optional) - Committee Research Area Id.
    + committeeIdFk (optional) - Committee Id Fk.
    + researchAreaCode (optional) - Research Area Code.

      
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204
