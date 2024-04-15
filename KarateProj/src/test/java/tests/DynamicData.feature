Feature: Dynamic Data Demo

Background:
	* url 'https://gorest.co.in'

	* def dyn_string = 
	"""
		function(s){
			var text = "";
			var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			for(var i=0; i<s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
				return text;
		}
	"""
	* def dynamicString = dyn_string(10)
	* print dynamicString
	
	* def requestPayload = 
	"""
	{
        "name": "John",
        "gender": "male",
        "status": "active"
    }	
	"""
	 # * requestPayload.email = dynamicString + "@gmail.com"
	  * set requestPayload.email = dynamicString + "@gmail.com"
	  
    * print requestPayload
	
Scenario: Handle Data Dynamically
Given path '/public/v1/users'	
And request requestPayload
And header Authorization = 'Bearer ' + tokenID
When method post
Then status 201
And match $.data.id == '#present'
And match $.data.name == '#present'
And match $.data.name == 'John'
And match $.data.email == requestPayload.email
