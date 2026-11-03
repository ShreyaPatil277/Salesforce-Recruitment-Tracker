trigger PreventDuplicateApplication on Application__c (before insert) {
    Set<Id> positionIds = new Set<Id>();
    Set<String> emails = new Set<String>();

    for (Application__c a : Trigger.new) {
        positionIds.add(a.Position__c);
        emails.add(a.Candidate_Email__c);
    }

    Set<String> existing = new Set<String>();
    for (Application__c e : [SELECT Position__c, Candidate_Email__c
                             FROM Application__c
                             WHERE Position__c IN :positionIds
                             AND Candidate_Email__c IN :emails]) {
        existing.add(e.Position__c + '|' + e.Candidate_Email__c.toLowerCase());
    }

    for (Application__c a : Trigger.new) {
        String key = a.Position__c + '|' + a.Candidate_Email__c.toLowerCase();
        if (existing.contains(key)) {
            a.addError('This candidate has already applied for this position.');
        } else {
            existing.add(key);
        }
    }
}
