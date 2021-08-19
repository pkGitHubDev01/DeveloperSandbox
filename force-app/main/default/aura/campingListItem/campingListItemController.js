({
	packItem : function(component, event, helper) {
		var attr = component.get('v.item');
        attr.Name = 'Test';
        attr.Price__c = 1234.12;
        attr.Quantity__c = 12;
        attr.Packed__c = true;
        component.set('v.item',attr);
        
        var btn = event.getSource();
        btn.set("v.disabled",true);
	}
})