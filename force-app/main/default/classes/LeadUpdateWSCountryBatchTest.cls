//test class for LeadUpdateWSCountryBatch
//test coverage: 100%

@isTest
public class LeadUpdateWSCountryBatchTest {
    @isTest
    static void testLeadUpdateWSCountryBatch() {
        WSCountry__c wsCountry1 = new WSCountry__C(Name = 'France', Capital__c = 'Paris', ISO2__c = 'FR', ISO3__c = 'FRA', Region__c = 'Europe', Subregion__c = 'Western Europe');
        insert wsCountry1;
    	Lead ld = new Lead(LastName='Lead1Test', company = 'test lead company', status = 'Open - Not Contacted', country = 'France');
        insert ld;
		Test.StartTest();
			Id batchJobId = Database.executeBatch(new LeadUpdateWSCountryBatch(), 10);
    	Test.stopTest();
    }
}