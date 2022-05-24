public class CalloutCountryWS {
    public static void getInfoFromExternalService() {
        List<WSCountry__c> WSCountriesToUpdate = new List<WSCountry__c>();
      	string theUrl = 'https://restcountries.com/v3.1/all';
       
       	try{
       		HttpRequest req = new HttpRequest();
       		req.setEndpoint(theUrl);
       		req.setMethod('GET');
       		Http http = new Http();
       		HTTPResponse res = http.send(req);
       		if (res.getStatusCode() == 200) {
       			String jsonResponse = res.getBody();
                system.debug('jsonResponse= ' + jsonResponse);
                List<Object> countryList = (List<Object>)JSON.deserializeUntyped(jsonResponse);
				for(Object c : countryList){
                    
                    //get the required data from the webservice
    				Map<String,Object> data = (Map<String,Object>)c;
                    
                    //the name
                    Map<String,Object> name = (Map<String,Object>)data.get('name');
                    String WSName = (String)name.get('common');
                    //iso code 2
                    String WSISO2 = (String)data.get('cca2');
                    //iso code 3
                    String WSISO3 = (String)data.get('cca3');
                    //capital
                    List<Object> capitals = (List<Object>)data.get('capital');
                    String theCapital = '';
                    if(capitals != null){
                    	for(Object cap : capitals){
                        	if(cap != null){
                            	if(theCapital != ''){
                                	theCapital = theCapital + ', ' + (String)cap;
                                }
                                else{
                                    theCapital = (String)cap;
                                }
                            }
                        }
                    }                    
                    String WSCapital = theCapital;
                    //region
                    String WSRegion = (String)data.get('region');
                    //subregion
                    String WSSubregion = (String)data.get('subregion');
                    
    				//create the WSCountry object to be upsert and add it to the list
                    if(data != null){
    					WSCountry__c wscountry = new WSCountry__c(
                        									Name = WSName,
                            								External_Name__c = WSName,
                            								ISO2__c = WSISO2,
                            								ISO3__c = WSISO3,
                            								Capital__c = WSCapital,
                            								Region__c = WSRegion,
                            								Subregion__c = WSSubregion
                   		);
                        WSCountriesToUpdate.add(wscountry);
                    }
				}
            Schema.SObjectField ftoken = WSCountry__c.Fields.External_Name__c;
            database.upsert(WSCountriesToUpdate,ftoken,false);
            }
		}
        catch(Exception e){
        	System.debug('Error-' + e.getMessage());   
        }
    }
}