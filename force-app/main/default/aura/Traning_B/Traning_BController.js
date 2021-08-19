({
	fire12 : function(component, event, helper) {
		var compEvt = component.getEvent("sampleComponentEvent");
        compEvt.setParams({'message':'You Always Rock.'});
        compEvt.fire();
	},
})