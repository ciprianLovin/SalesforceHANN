@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://restcountries.com/v3.1/all', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('[{"name":{"common":"Dominican Republic","official":"Dominican Republic","nativeName":{"spa":{"official":"República Dominicana","common":"República Dominicana"}}},"cca2":"DO","cca3":"DOM","capital":["Santo Domingo"],"region":"Americas","subregion":"Caribbean"}]');
        res.setStatusCode(200);
        return res;
    }
}