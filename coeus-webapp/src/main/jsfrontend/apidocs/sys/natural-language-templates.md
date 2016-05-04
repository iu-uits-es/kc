## Natural Language Templates [/research-sys/api/v1/natural-language-templates/]

### Get Natural Language Templates by Key [GET /research-sys/api/v1/natural-language-templates/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"}

### Get All Natural Language Templates [GET /research-sys/api/v1/natural-language-templates/]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"},
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"}
            ]

### Get All Natural Language Templates with Filtering [GET /research-sys/api/v1/natural-language-templates/]
    
+ Parameters

    + languageCode (optional) - 
    + naturalLanguageUsageId (optional) - 
    + typeId (optional) - 
    + template (optional) - 
    + id (optional) - 
    + active (optional) - 

            
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json 

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"},
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"}
            ]
			
### Get Schema for Natural Language Templates [GET /research-sys/api/v1/natural-language-templates/]
	                                          
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
    
            {"columns":["languageCode","naturalLanguageUsageId","typeId","template","id","active"],"primaryKey":"id"}
		
### Get Blueprint API specification for Natural Language Templates [GET /research-sys/api/v1/natural-language-templates/]
	 
+ Parameters

     + _blueprint (required) - will instruct the endpoint to return an api blueprint markdown file for the resource
                 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: text/markdown

+ Response 200
    + Headers

            Content-Type: text/markdown;charset=UTF-8
            Content-Disposition:attachment; filename="Natural Language Templates.md"
            transfer-encoding:chunked


### Update Natural Language Templates [PUT /research-sys/api/v1/natural-language-templates/(key)]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"}
			
+ Response 204

### Update Multiple Natural Language Templates [PUT /research-sys/api/v1/natural-language-templates/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"},
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 204

### Insert Natural Language Templates [POST /research-sys/api/v1/natural-language-templates/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"}
			
+ Response 201
    
    + Body
            
            {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"}
            
### Insert Multiple Natural Language Templates [POST /research-sys/api/v1/natural-language-templates/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"},
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 201
    
    + Body
            
            [
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"},
              {"languageCode": "(val)","naturalLanguageUsageId": "(val)","typeId": "(val)","template": "(val)","id": "(val)","active": "(val)","_primaryKey": "(val)"}
            ]
            
### Delete Natural Language Templates by Key [DELETE /research-sys/api/v1/natural-language-templates/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Natural Language Templates [DELETE /research-sys/api/v1/natural-language-templates/]

+ Parameters

      + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation

+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Natural Language Templates with Matching [DELETE /research-sys/api/v1/natural-language-templates/]

+ Parameters

    + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation
    + languageCode (optional) - 
    + naturalLanguageUsageId (optional) - 
    + typeId (optional) - 
    + template (optional) - 
    + id (optional) - 
    + active (optional) - 

      
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204
