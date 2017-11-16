##Drafted by Aramis Calderon (email: aramis.calderon@halfaker.com/ phone: 7608055923)##
Feature: Adapt VET360 phone number BIO to Corp PTCPNT_PHONE data table
		As Department of Veterans Affairs Enterprise, I want to convert phone number records in VET360 to 
		VBA Corp phone records schema. 

    Assumptions:
	- International numbers will not be in scope for IOC.
		
    Field Mappings:
	- New PTCPNT_PHONE record is created with VET360 effectiveStartDate.
	- Existing Corp phone record's END_DT is set to VET360 effectiveStartDate.
	- Work phone number from VET360 maps to PHONE_TYPE_NM Daytime.
	- Home phone number from VET360 maps to PHONE_TYPE_NM Nighttime.
	- Mobile phone number from VET360 maps to PHONE_TYPE_NM Cellular.
	- VET360 phoneNumber populates Corp PHONE_NBR field.
	- VET360 phoneType populates Corp PHONE_TYPE_NM field.
	- VET360 areaCode populates Corp AREA_NBR field.
	- VET360 phoneNumberExt populates Corp EXTNSN_NBR field.
	- VET360 effectiveStartDate populates Corp EFCTV_DT field.
	- VET360 effectiveEndDate populates Corp END_DT field.
	- VET360 sourceDate populates Corp JRN_DT field.
	- VET360 orginatingSourceSys populates Corp JRN_OBJ_ID field.
	- VET360 sourceSystem populates Corp JRN_EXTNL_APPLCN_NM field.
    - VET360 sourceSysUser populates Corp JRN_USER_ID field.
	- Corp JRN_LCTN_ID value will be derived from service.
	- Corp JRN_STATUS_TYPE_CD value will be derived from type of transaction.
	

	
	Background: Veteran phone record from VET360 adapted to Corp PTCPNT_PHONE table.
		Given VET360 BIO Schema for phone
			| Attribute Name                    | Coded Value            | Mandatory/Optional | Type            | Length | Standard | common/core | IOC |
			| International Indicator           | internationalInd       | Mandatory          | Boolean         |        | none     |             | Y   |
			| Country Code                      | countryCode            | Optional           | Enumerated List |        | E.164    |             | Y   |
			| Area Code                         | areaCode               | Optional           | String          | 3      | none     |             | Y   |
			| Phone Number                      | phoneNumber            | Mandatory          | String          | 14     | none     |             | Y   |
			| Phone Number Extension            | phoneNumberExt         | Optional           | String          | 10     | none     |             | Y   |
			| Phone Type                        | phoneType              | Mandatory          | Enumerated List |        | none     |             | Y   |
			| Effective Start Date              | effectiveStartDate     | Optional           | Date            |        | ISO 8601 |             | Y   |
			| Effective End Date                | effectiveEndDate       | Optional           | Date            |        | ISO 8601 |             | Y   |
			| Text Message Capable Indicator    | textMessageCapableInd  | Optional           | Boolean         |        | none     |             | Y   |
			| Text Message Permission Indicator | textMessagePermInd     | Optional           | Boolean         |        | none     |             | Y   |
			| Voice Mail Acceptable Indicator   | voiceMailAcceptableInd | Optional           | Boolean         |        | none     |             | Y   |
			| TTY Indicator                     | ttyInd                 | Optional           | Boolean         |        | none     |             | Y   |
			| Connection Status Code            | connectionStatusCode   | Optional           | Enumerated List |        | none     |             | Y   |
			| Confirmation Date                 | ConfDate               | Optional           | Date            |        | ISO 8601 |             | Y   |
			| Source System                     | sourceSystem           | Optional           | String          | 255    | none     | core        | Y   |
			| Originating Source System         | orginatingSourceSys    | Optional           | String          | 255    | none     | core        | Y   |
			| Source System User                | sourceSysUser          | Optional           | String          | 255    | none     | core        | Y   |
			| Source Date                       | sourceDate             | Mandatory          | Date/Time (GMT) |        | ISO 8601 | core        | Y   |
			| Telephone ID                      | telephoneId            | Optional           | String          |        | none     |             | Y   |
		
		Given VBA Corp Schema for PTCPNT_PHONE
			| Attribute Name							| Coded Value			| Mandatory/Optional		| Type          |	Length |		
			| COMMUNICATION DEVICE AREA NUMBER			| AREA_NBR				| Optional					| NUMBER		|	4	   |					
			| PARTICIPANT PHONE COUNTRY NUMBER			| CNTRY_NBR				| Optional					| NUMBER		|	4	   |
			| PARTICIPANT PHONE EFFECTIVE DATE			| EFCTV_DT				| Mandatory					| DATE			|          |
			| END DATE									| END_DT				| Optional					| DATE			|		   |
			| COMMUNICATION DEVICE EXTENSION NUMBER		| EXTNSN_NBR			| Optional					| VARCHAR2   	|	5	   |
			| FRGN PHONE RFRNC TXT 						| FRGN_PHONE_RFRNC_TXT	| Optional					| VARCHAR2  	|	30     |
			| JOURNAL DATE								| JRN_DT				| Mandatory					| DATE			|		   |
			| JOURNAL EXTERNAL APPLICATION NAME			| JRN_EXTNL_APPLCN_NM	| Optional					| VARCHAR2   	|	50	   |
   			| JOURNAL EXTERNAL KEY TEXT					| JRN_EXTNL_KEY_TXT		| Optional					| VARCHAR2  	|	50     |
			| JOURNAL EXTERNAL USER IDENTIFER			| JRN_EXTNL_USER_ID		| Optional					| VARCHAR2  	|	50     |
			| JOURNAL LOCATION IDENTIFIER				| JRN_LCTN_ID			| Mandatory					| VARCHAR2  	|	4      |
			| JOURNAL OBJECT IDENTIFIER					| JRN_OBJ_ID			| Mandatory					| VARCHAR2      |	32	   |
			| JOURNAL STATUS TYPE CODE					| JRN_STATUS_TYPE_CD	| Mandatory					| VARCHAR2  	|	12	   |
			| JOURNAL USER IDENTIFIER					| JRN_USER_ID			| Mandatory					| VARCHAR2  	|	50     |
			| PARTICIPANT PHONE NUMBER					| PHONE_NBR				| Mandatory					| NUMBER    	|	11     |
			| PARTICIPANT TELEPHONE TYPE NAME			| PHONE_TYPE_NM			| Mandatory					| VARCHAR2   	|	50     |
			| Identifier of PTCPNT						| PTCPNT_ID				| Mandatory					| NUMBER    	|	15     |
		

		Given the system has defined a valid Domestic Phone Number
			| attrbuteName           | value                    |
			| vet360Id               | 1                        |
			| sourceSystem           | VETSGOV                  |
			| orginatingSourceSys    | VET360                   |
			| sourceSysUser          | Janey                    |
			| internationalInd       | false                    |
			| areaCode               | 703                      |
			| phoneNumber            | 6585098                  |
			| phoneType              | WORK                     |
			| phoneNumberExt         | 123456                   |
			| ttyInd                 | True                     |
			| sourceDate             | Today                    |
			| voiceMailAcceptableInd | true                     |
			| textMessageCapableInd  | true                     |
			| textMessagePermInd     | True                     |
			| effectiveStartDate     | Today                    |
				
	Scenario Outline: Drop record if the Phone Type is not to be synchronized with Corp
		Given the valid Domestic Phone Number exists in VET360
		And existing phoneType is "<VET360phoneType>"
		When converting BIO from VET360 to Corp 
		Then the Adapter will drop record and take no further action 
		Examples:
		| VET360phoneType |
		|Temporary |
		|Pager|
	
	Scenario: Dropping a Phone Number record that is not Domestic
		Given the valid Domestic Phone Number exists in VET360
		And existing internationalInd is "TRUE"
		When converting BIO from VET360 to Corp 
		Then the Adapter will drop record and take no further action 
	
	Scenario: Updating existing record in Corp
		Given the following person phone record in VET360
			| SourceSystem |internationalInd | phoneType | countryCode | areaCode | phoneNumber | phoneNumberExt | ttyInd | sourceDate | voiceMailAcceptableInd | textMessageCapableInd | textMessagePermInd | effectiveStartDate | sourceSysUser  | orginatingSourceSys|
			| VET360		 | False		   | Daytime   |   	1		 | 703	 	| 6585098	  | 12345		 | False  | Today      | True       		    |  False               | True               | Today            	  | VHAISDFAULKJ   | ADR                |
		When converting BIO from VET360 to Corp 
		And the veteran record has an existing active Corp phone record 
		Then the system will populate the END_DT field with the effectiveStartDate value 
			| PHONE_TYPE_NM |PHONE_NBR | EFCTV_DT | END_DT | AREA_NBR | JRN_LCTN_ID |  
			| Work		    |6585098   | Today -90|Today -1| 703	  |	 	00001	| 
		And the JRN_STATUS_TYPE_CD = "U"	
		And the JRN_USER_ID = sourceSysUser
		And the JRN_EXTNL_APPLCN_NM = SourceSystem
	    And the JRN_DT = sourceDate
		And the JRN_OBJ_ID = orginatingSourceSys
		And commits the following new PTCPNT_PHONE record and recieves a 200 response
			| PHONE_TYPE_NM |PHONE_NBR | EFCTV_DT | END_DT | AREA_NBR | JRN_DT | JRN_LCTN_ID | JRN_USER_ID | JRN_STATUS_TYPE_CD | JRN_OBJ_ID | EXTNSN_NBR | JRN_EXTNL_APPLCN_NM |  
     		| Work		    |6585098	 | Today	|		 | 703	  | Today  | 	00001	 |     VET360  |     U              |    ADR     |  12345     |		VET360	     |	
	
	Scenario: Inserting new phone record in Corp
		Given the following person phone record in VET360
			| SourceSystem |internationalInd | phoneType | countryCode | areaCode | phoneNumber | phoneNumberExt | ttyInd | sourceDate | voiceMailAcceptableInd | textMessageCapableInd | textMessagePermInd | effectiveStartDate | sourceSysUser  | orginatingSourceSys|
			| VET360	   | False		     | Mobile    |   	1		 | 760	 	| 7574155	|        		 | False  | Today      | True       		    |  True                 | True               | Today              | Jane           | Vets.gov           |
		When converting BIO from VET360 to Corp
		And the veteran record does not have an existing active Corp phone record 
		Then the Adapter will insert the following record and recieve a 200 response
			| PHONE_TYPE_NM |PHONE_NBR | EFCTV_DT | AREA_NBR | JRN_LCTN_ID |  
			| Cellular	    |7574155   | Today    | 760	     |	00001	| 
		And the JRN_STATUS_TYPE_CD = "I"	
		And the JRN_USER_ID = sourceSysUser
		And the JRN_EXTNL_APPLCN_NM = SourceSystem
	    And the JRN_DT = sourceDate
		And the JRN_OBJ_ID = orginatingSourceSys
		
	Scenario Outline: Accepts record if the Phone Type is to be synchronized with Corp
		Given the valid Domestic Phone Number exists in Corp
		And existing phoneType is "<VET360phoneType>"
		When converting BIO from VET360 to Corp 
		Then the Adapter will convert the Domestic Phone Number to the following Corp DIO with "<phoneType>" and recieve a 200 response
			|PHONE_NBR | EFCTV_DT | AREA_NBR | JRN_LCTN_ID |  
			|7574155   | Today    | 760	     |	00001	| 
		And the JRN_STATUS_TYPE_CD = "I"	
		And the JRN_USER_ID = sourceSysUser
		And the JRN_EXTNL_APPLCN_NM = SourceSystem
	    And the JRN_DT = sourceDate
		And the JRN_OBJ_ID = orginatingSourceSys
		Examples:
		| phoneType |VET360phoneType|
		|Daytime    |Work  |
		|Nighttime  |Home  |
		|Fax        |Fax   |
		|Cellular   |Mobile|