function fn() { 
				
				
		var config = {
			name : "test123",
			baseURL : 'https://reqres.in/api',
			tokenID: '21ece69913b01d4dcd0ddc01e6e49a737d12478afb655f1e98a8508a5fc9ec7b'

		} 

		var env = karate.env
		karate.log('Env is : ',env )

		if (!env) {
	
	config.baseURL = 'https://reqres.in/api'
}
		
		
	if(env == 'qa'){
				config.baseURL = 'https://reqres.in/api'
		}

		else if(env == 'dev'){
			config.baseURL = 'https://reqres.in/api/dev'
		}

		else{
			config.baseURL = 'https://reqres.in/api'
		}

		karate.configure('connectTimeout', 5000);
		karate.configure('readTimeout', 5000);

		//var result = karate.callSingle('classpath:tests/GetUserID.feature') 
		//config.userID = result.id;
		return config;

}
