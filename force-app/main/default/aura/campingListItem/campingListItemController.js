({
	packItem : function(component, event, helper) {
        //get the object first
        var a = component.get("v.item", true);
        
        //make changes to the object
        a.Packed__c=true;
        
        component.set("v.item", a);  
        
        var btn = event.getSource();
		btn.set("v.disabled",true);
	}
})