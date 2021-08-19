({
	createRecord : function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Expense__c"
        });
        createRecordEvent.fire();
    }
})