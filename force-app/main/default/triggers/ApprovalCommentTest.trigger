trigger ApprovalCommentTest on Opportunity (before update) 
{
    Map<Id, opportunity> MapIDToOpportunity  = new Map<Id, opportunity>{};
        
        for(Opportunity ObjOpportunity : trigger.new)
        {
            Opportunity ObjOpportunityOld = trigger.oldmap.get(ObjOpportunity.Id);
        
            if (((ObjOpportunityOld.Status__c != 'Approved' 
                    && ObjOpportunity.Status__c == 'Approved' )
                ||(ObjOpportunityOld.Status__c != 'Rejected' 
                    && ObjOpportunity.Status__c == 'Rejected')))
            { 
                MapIDToOpportunity.put(ObjOpportunity.Id, ObjOpportunity);  
            }
        } 
        
        system.debug('MapIDToOpportunity@@@'+MapIDToOpportunity);

        if (!MapIDToOpportunity.isEmpty())  
        {
            List<Id> processInstanceIds = new List<Id>();

            for (Opportunity ObjOpportunity : [SELECT (SELECT ID FROM  ProcessInstances ORDER BY CreatedDate DESC LIMIT 1) 
                                                FROM Opportunity WHERE ID IN: MapIDToOpportunity.keySet()])
            {
                processInstanceIds.add(ObjOpportunity.ProcessInstances[0].Id);
            }
            
            system.debug('processInstanceIds@@@'+processInstanceIds);

    
            for (ProcessInstance pi : [SELECT TargetObjectId, 
                                        (SELECT Id, StepStatus, Comments FROM Steps ORDER BY CreatedDate DESC LIMIT 1 )
                                       FROM ProcessInstance
                                       WHERE Id IN : processInstanceIds
                                       ORDER BY CreatedDate DESC])   
            {                   
                if(pi.Steps.size() > 0)
                {
                    
                    system.debug('processInstanceddddIds@@@'+pi.Steps[0].Comments);
                    if ((pi.Steps[0].Comments == null || pi.Steps[0].Comments.trim().length() == 0))
                    {
                        MapIDToOpportunity.get(pi.TargetObjectId).addError('Please Provide a Approved/Rejected Reason. It should not be blank !');
                    }
                }  
            }
        }
}