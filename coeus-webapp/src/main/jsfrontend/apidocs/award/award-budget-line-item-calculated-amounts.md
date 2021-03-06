## Award Budget Line Item Calculated Amounts [/award/api/v1/award-budget-line-item-calculated-amounts/]

### Get Award Budget Line Item Calculated Amounts by Key [GET /award/api/v1/award-budget-line-item-calculated-amounts/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"}

### Get All Award Budget Line Item Calculated Amounts [GET /award/api/v1/award-budget-line-item-calculated-amounts/]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"},
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"}
            ]

### Get All Award Budget Line Item Calculated Amounts with Filtering [GET /award/api/v1/award-budget-line-item-calculated-amounts/]
    
+ Parameters

    + budgetLineItemCalculatedAmountId (optional) - Budget Id. Maximum length is 22.
    + obligatedAmount (optional) - Obligated amount from award amount info. Maximum length is 15.

            
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json 

+ Response 200
    + Headers

            Content-Type: application/json;charset=UTF-8

    + Body
    
            [
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"},
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"}
            ]
			
### Get Schema for Award Budget Line Item Calculated Amounts [GET /award/api/v1/award-budget-line-item-calculated-amounts/]
	                                          
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
    
            {"columns":["budgetLineItemCalculatedAmountId","obligatedAmount"],"primaryKey":"budgetLineItemCalculatedAmountId"}
		
### Get Blueprint API specification for Award Budget Line Item Calculated Amounts [GET /award/api/v1/award-budget-line-item-calculated-amounts/]
	 
+ Parameters

     + _blueprint (required) - will instruct the endpoint to return an api blueprint markdown file for the resource
                 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: text/markdown

+ Response 200
    + Headers

            Content-Type: text/markdown;charset=UTF-8
            Content-Disposition:attachment; filename="Award Budget Line Item Calculated Amounts.md"
            transfer-encoding:chunked


### Update Award Budget Line Item Calculated Amounts [PUT /award/api/v1/award-budget-line-item-calculated-amounts/(key)]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"}
			
+ Response 204

### Update Multiple Award Budget Line Item Calculated Amounts [PUT /award/api/v1/award-budget-line-item-calculated-amounts/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"},
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 204

### Insert Award Budget Line Item Calculated Amounts [POST /award/api/v1/award-budget-line-item-calculated-amounts/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"}
			
+ Response 201
    
    + Body
            
            {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"}
            
### Insert Multiple Award Budget Line Item Calculated Amounts [POST /award/api/v1/award-budget-line-item-calculated-amounts/]

+ Request

    + Headers

            Authorization: Bearer {api-key}   
            Content-Type: application/json

    + Body
    
            [
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"},
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"}
            ]
			
+ Response 201
    
    + Body
            
            [
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"},
              {"budgetLineItemCalculatedAmountId": "(val)","obligatedAmount": "(val)","_primaryKey": "(val)"}
            ]
            
### Delete Award Budget Line Item Calculated Amounts by Key [DELETE /award/api/v1/award-budget-line-item-calculated-amounts/(key)]
	 
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Award Budget Line Item Calculated Amounts [DELETE /award/api/v1/award-budget-line-item-calculated-amounts/]

+ Parameters

      + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation

+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204

### Delete All Award Budget Line Item Calculated Amounts with Matching [DELETE /award/api/v1/award-budget-line-item-calculated-amounts/]

+ Parameters

    + _allowMulti (boolean, required) - flag to allow multiple resources to be deleted in one operation
    + budgetLineItemCalculatedAmountId (optional) - Budget Id. Maximum length is 22.
    + obligatedAmount (optional) - Obligated amount from award amount info. Maximum length is 15.

      
+ Request

    + Headers

            Authorization: Bearer {api-key}
            Content-Type: application/json

+ Response 204
