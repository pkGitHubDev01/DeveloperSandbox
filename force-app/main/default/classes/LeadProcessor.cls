global class LeadProcessor implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('SELECT ID, Name,Address,Status,LeadSource From Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope)
    {
        for(Lead leads : scope)
        {
            leads.LeadSource = 'Dreamforce';
        }
        update scope;
    }    
    
    global void finish(Database.BatchableContext bc)
    {
    }
}