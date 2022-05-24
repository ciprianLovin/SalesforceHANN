//test class for LeadTriggerHandler
//test coverage: 
@isTest
public class LeadTriggerHandler_Test {
    @isTest
    static void testLeadTriggerHandler() {
        Test.StartTest();
        WSCountry__c wsCountry1 = new WSCountry__C(Name = 'France', Capital__c = 'Paris', ISO2__c = 'FR', ISO3__c = 'FRA', Region__c = 'Europe', Subregion__c = 'Western Europe');
        insert wsCountry1;
        WSCountry__c wsCountry2 = new WSCountry__C(Name = 'Romania', Capital__c = 'Bucharest', ISO2__c = 'RO', ISO3__c = 'ROM', Region__c = 'Europe', Subregion__c = 'Eastern Europe');
        insert wsCountry2;
    	Lead ld = new Lead(LastName='Lead1Test', company = 'test lead company', status = 'Open - Not Contacted', country = 'France');
        insert ld;
        string Capital = [select Country_Capital__c from Lead where LastName = 'Lead1Test'][0].Country_Capital__c;
        System.AssertEquals(Capital,'Paris');
        ld.country = 'Romania';
        update ld;
        Capital = [select Country_Capital__c from Lead where LastName = 'Lead1Test'][0].Country_Capital__c;
        System.AssertEquals(Capital,'Bucharest');
    	Test.stopTest();
    }
}