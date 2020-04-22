global class UpdateContactAddresses implements 
    Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT  LeadSource,Rating '+
            ' FROM Lead ' + 
            'Where Country = \'US\''
        );
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> IT = new List<Lead>();
        for (Lead I : scope) {
             
                I.leadsource='Web';
                I.Rating='Hot';
            IT.add(I);
                // add contact to list to be updated
                
                // increment the instance member counter
                recordsProcessed+=1;
            
        }
        update IT;
    }    
    global void finish(Database.BatchableContext bc){
     
    }    
}