trigger test on Lead (before insert, before update) {

    myfirstclass obj = new myfirstclass();
    obj.myfirstmethod(trigger.new);
    

}