trigger AccountTrigger on Account (after update) {
   for(Account acc : Trigger.New){
        // if(acc.AccountNumber == null){
        //     acc.addError('Número do cliente é inválido: ' + );
        // }

        Map<ID,Schema.RecordTypeInfo> mapRtName = Account.sObjectType.getDescribe().getRecordTypeInfosById();
        String strName = mapRtName.get(acc.RecordTypeId).getName();

        Opportunity oppType = new Opportunity();

        if(String.isNotEmpty(strName)){
            if(strName == 'Parceiro'){
                // Cria uma nova oportudanidade
                oppType.Name = acc.Name + ' - opp Parceiro';
                oppType.AccountId = acc.Id;
                oppType.StageName = 'Qualification';
                oppType.CloseDate = date.today().addDays(30);
                insert oppType;
            }else{
                // Cria uma tarefa
                Task addTask = new Task();
                addTask.WhatId = acc.Id;
                addTask.Subject = 'Consumidor Final';
                addTask.Priority = 'Normal';
                addTask.Status = 'Not Started';
                insert addTask;
            }
        }else{
            acc.addError('É necessário inserir um tipo de registro');
        }
   }
}