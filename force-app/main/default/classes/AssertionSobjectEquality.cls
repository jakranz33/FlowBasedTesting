@SuppressWarnings('PMD.AvoidGlobalModifier')
global class AssertionSobjectEquality {

    private static final string DEFAULT_MESSAGE = 'Records are not equal';

    @InvocableMethod(
        label='Assert SObject Equality'
        description='Compare two SObject Records for Equality'
        category='Flow-based Testing'
    )
    global static List<String> assertSobjectEquality(List<Request> requests) {
        List<String> results = new List<String>();

        for (Request r : requests) {
            r.sobjActual. .put('Id', '');
            r.sobjExpected.put('Id', '');
            string message = String.isNotBlank(r.message)?r.message:AssertionSobjectEquality.DEFAULT_MESSAGE;
            System.assertEquals(r.sobjActual,r.sobjExpected,message);
            results.add('Pass');
        }

        return results;
    }

    global class Request {
        @InvocableVariable(
            label='Actual SObject Record'
            description='First SObject Record for comparison'
            required=true
        )
        global SObject sobjActual;

        @InvocableVariable(
            label='Expected SObject Record'
            description='First SObject Record for comparison'
            required=true
        )
        global SObject sobjExpected;

        @InvocableVariable(
            label='Custom Message if fail'
            description='Optional custom message if this assertion fails'
        )
        global string message;
    }
}
