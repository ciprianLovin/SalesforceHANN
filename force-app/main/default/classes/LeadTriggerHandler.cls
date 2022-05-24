public without sharing class LeadTriggerHandler implements TriggerHandler {
    private boolean triggerIsExecuting;
    private integer triggerSize;
    public LeadTriggerHelper helper;
    public LeadTriggerHandler(boolean triggerIsExecuting, integer triggerSize) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.triggerSize = triggerSize;
        this.helper = new LeadTriggerHelper();
    }
    public void beforeInsert(List<Lead> newLeads) {
		helper.updateLeadWSCountry(newLeads);
    }
    public void beforeUpdate(List<Lead> oldLeads, List<Lead> newLeads, Map<ID, SObject> oldLeadMap, Map<ID, SObject> newLeadMap) {
		helper.updateLeadWSCountry(newLeads);
    }
    /*not used for the purpose of this exercise - removed for better code coverage
    public void beforeDelete(List<Lead> oldLeads, Map<ID, SObject> oldLeadMap) {

    }
    public void afterInsert(List<Lead> newLeads, Map<ID, SObject> newLeadMap) {

    }
    public void afterUpdate(List<Lead> oldLeads, List<Lead> newLeads, Map<ID, SObject> oldLeadMap, Map<ID, SObject> newLeadMap) {

    }
    public void afterDelete(List<Lead> oldLeads, Map<ID, SObject> oldLeadMap) {

    }
    public void afterUndelete(List<Lead> newLeads, Map<ID, SObject> newLeadtMap) {

    }
*/
}