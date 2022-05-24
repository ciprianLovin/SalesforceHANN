public without sharing class LeadTriggerHelper {
    public LeadTriggerHelper() {
        System.debug('Inside LeadTriggerHelper Constructor');
    }
    
    public void updateLeadWSCountry(List<Lead> newLeads) {
        
        System.debug('Inside updateLeadWSCountry for insert');
        
        Map<String,Id> WSCountriesMap = getWSCountries();
        if(!WSCountriesMap.isEmpty()){
            for(Lead l:newLeads){
                if(l.Country != ''){
                    if(WSCountriesMap.get(l.Country) != null){
                        l.WSCountry__c = WSCountriesMap.get(l.Country);
                    }
                }
            }
        }
        
    }

    public Map<String, Id> getWSCountries(){
        
        System.debug('Inside getWSCountries');
        
        Map<String, Id> WSCountriesMap = new Map<String, Id>();
        for (WSCountry__c country : [SELECT Id, Name FROM WSCountry__c]) {
    		WSCountriesMap.put(country.Name, country.Id);
		}
        return WSCountriesMap;
        
    }
}