({
	getExpenses: function(component) 
	{
		var action = component.get("c.getExpenses");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.expenses", response.getReturnValue());
                this.updateTotal(component);
            }
        });
        $A.enqueueAction(action);
	},
	
	updateTotal : function(component) 
	{  
		var expenses = component.get("v.expenses");
		var total = 0;
        var totalReimbursedCount = 0;
        
		for(var i=0; i<expenses.length; i++){
          var e = expenses[i];
          total += e.Amount__c;
            
          if(expenses[i].Reimbursed__c == true)
          	totalReimbursedCount ++;    
		}
      	
        component.set('v.ReimbursedItem',totalReimbursedCount);
		component.set("v.total", total);
		component.set("v.exp", expenses.length);	
	},
  
	createExpense: function(component, expense) 
	{
		var action = component.get('c.saveExpense');
		action.setParams({'expense':expense});
		
		action.setCallback(this,function(response){
			if(response.getState() == 'SUCCESS' && component.isValid())
			{
				//Update expense array
				var expenses = component.get('v.expenses');
                var expense = response.getReturnValue();
                var IsAlreadyExist = false;
                
                for(var i=0; i < expenses.length; i++)
                {
                    if(expenses[i].Id == expense.Id)
                    	IsAlreadyExist = true;    	
                } 
                
                if(IsAlreadyExist == false)
					expenses.push(response.getReturnValue());
                
				component.set('v.expenses',expenses);
				
				//Update expense total amount
				this.updateTotal(component);
			}	
		});
		$A.enqueueAction(action);
    },
})