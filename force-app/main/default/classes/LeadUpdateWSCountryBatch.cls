// Batch Job for updating existing Lead with WSCountry
global class LeadUpdateWSCountryBatch implements Database.Batchable<sobject>{

   // Start Method
	global Database.Querylocator start (Database.BatchableContext BC) {
        //get all the accounts
		return Database.getQueryLocator('SELECT id, Country FROM Lead where country <> \'\'');
	}
   
	// Execute method
	global void execute (Database.BatchableContext BC, List<sobject> scope) {
		List<Lead> leadsToUpdate = new List<Lead>();
        string theUrl;
        Map<String, Id> WSCountriesMap = new Map<String, Id>();
        for (WSCountry__c country : [SELECT Id, Name FROM WSCountry__c]) {
    		WSCountriesMap.put(country.Name, country.Id);
		}
        
		// List to hold updated customer
		for (sObject objScope: scope) {
			Lead leadObj = (Lead)objScope ;
			
            if(!WSCountriesMap.isEmpty()){
            	if(WSCountriesMap.get(leadObj.Country) != null){
            		leadObj.WSCountry__c = WSCountriesMap.get(leadObj.Country);
            	}
        	}
            
         	leadsToUpdate.add(leadObj); // Add records to the List
         	System.debug('Value of leadsToUpdate '+leadsToUpdate);
      	}
       
		// Check if List is empty or not
		if (leadsToUpdate != null && leadsToUpdate.size()>0) {
            // Update the Records
         	Database.update(leadsToUpdate); 
         	System.debug('List Size '+ leadsToUpdate.size());
      	}
   }
   
	// Finish Method
	global void finish(Database.BatchableContext BC) {
    
	}
}