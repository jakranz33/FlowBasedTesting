@SuppressWarnings('PMD.AvoidGlobalModifier')
global class AssertionStringEquality {

    private static final string DEFAULT_MESSAGE = 'Values are not equal';

    @InvocableMethod(
        label='Assert Two Text Values are Equal'
        description='Compare two Text/String values for Equality'
        category='Flow-based Testing'
    )
    global static List<String> execute(List<Request> requests) {
        List<String> results = new List<String>();

        for (Request r : requests) {
            string message = String.isNotBlank(r.message)?r.message:AssertionStringEquality.DEFAULT_MESSAGE;
            System.assertEquals(r.stringActual,r.stringExpected,message);
            results.add('Pass');
        }

        return results;
    }

    global class Request {
        @InvocableVariable(
            label='Actual Text/String Value'
            description='Actual String value for comparison'
            required=true
        )
        global String stringActual;

        @InvocableVariable(
            label='Expected Text/String Value'
            description='Expected String value for comparison'
            required=true
        )
        global String stringExpected;

        @InvocableVariable(
            label='Custom Message if fail'
            description='Optional custom message if this assertion fails'
        )
        global string message;
    }
}
