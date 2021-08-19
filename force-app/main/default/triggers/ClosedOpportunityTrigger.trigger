trigger ClosedOpportunityTrigger on Opportunity (After Insert) 
{
    List<Task> taskListToInsert = new List<Task>();
    for(Opportunity opp: Trigger.new)
    {
        if(opp.StageName == 'Closed Won')
        {
         Task objTask = new Task();
            objTask.Subject = 'Follow Up Test Task';
            objTask.whatId = opp.Id;
            taskListToInsert.add(objTask);
        }
    }
    if(taskListToInsert.size()>0)
    {
            insert taskListToInsert;
    }
}