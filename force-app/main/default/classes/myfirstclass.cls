public class myfirstclass {

    public void myfirstmethod(list<Lead> lstNewLead)
    {
        for(lead objlead : lstNewLead)
        {
           objlead.LastName = 'prefix' + objlead.LastName + 'suffix'; 
           system.debug('obj.LastName>>sdfjsks' + objlead.LastName ); 
        }
        
    }    
}