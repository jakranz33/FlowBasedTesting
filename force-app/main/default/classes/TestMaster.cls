
@isTest
public class TestMaster {

    @isTest
    public static void runFlowTest() { // NOPMD because the asserts are in the Flows
        string flowName = 'Test_Opportunity_set_to_Closed_Won';
        Map<String,Object> noInputs = new Map<String,Object>();
        Flow.Interview flowInstance = Flow.Interview.createInterview(flowName, noInputs);
        flowInstance.start();
    }
}