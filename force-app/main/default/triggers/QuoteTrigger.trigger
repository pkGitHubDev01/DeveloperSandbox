trigger QuoteTrigger on Quote (after insert) 
{
    set<ID> setofId = new set<Id>();
    for(quote objquote :  trigger.new)
    {
        setofId.add(objquote.id);
    }
    
    list<QuoteLineItem> lst = [select id from QuoteLineitem where QuoteId in : setofId];
    
    system.debug('lst>>>' +lst);
    
}