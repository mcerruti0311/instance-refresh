// Apex Trigger emailSupervisorReminderToFixTimecard


// System.DmlException: Insert failed. First exception on row 0; 
// first error: FIELD_FILTER_VALIDATION_EXCEPTION, 
// The specified user is not Active or is not an SIS Employee.: [Approver_For_Expenses__c] 
// Stack Trace: Class.Test_FlowLocationDataUtil.TestUtil: line 31, column 1

@isTest	
public class Test_FlowLocationDataUtil {
 
    
    @isTest Public Static void TestUtil(){  


        
    Contact Approver = New Contact(FirstName = 'John', LastName = 'Doe', RecordTypeId = '012A0000000FIpkIAG', Employment_Status__c = 'Active'); 
    Insert Approver;
        
    Contact Approver2 = New Contact(FirstName = 'Joe', LastName = 'Bo', RecordTypeId = '012A0000000FIpkIAG', Employment_Status__c = 'Active'); 
    Insert Approver2;
        
 	Contact MasterApprover = New Contact(FirstName = 'Jane', LastName = 'Smith', RecordTypeId = '012A0000000FIpkIAG', Employment_Status__c = 'Active'); 
    Insert MasterApprover;   
        
 	Account Client = New Account(Name ='ABC Corp.');   
    Insert Client;

    
 	Location_Data__c Parent = New Location_Data__c(RecordTypeId = '012A0000000GiyV', 
                                                   name = 'Parent',
                                                   Code_as_it_appears_in_Chronotek__c='34567',
                                                   City__c='Culver City', State__c='CA', 
                                                   client_account__c = client.id, 
                                                   Master_Approver_For_Expenses__c = MasterApprover.id, 
                                                   Approver_For_Expenses__c = Approver.id,
                                                   OwnerID = '00GA0000001Me4c',
                                                   Inactivate_Code__c = True);
   Insert Parent;

  Location_Data__c ChildToUpdate = New Location_Data__c(RecordTypeId = '012A0000000GiyQ' ,
                                                        name = 'Child',
                                                        Parent_Location__c=parent.id ,
                                                        Code_as_it_appears_in_Chronotek__c='12345', 
                                                        City__c='Culver City', 
                                                        State__c='CA',
                                                        OwnerID = '00GA0000001Me4c',
                                                        Inactivate_Code__c = True,
                                                        Approver_For_Expenses__c = Approver2.id
                                                        );
   
   Insert ChildToUpdate; 
        
        
        system.debug('Child BEFORE Running Test');
        system.debug(ChildToUpdate.id);
        system.debug(ChildToUpdate.Approver_For_Expenses__c);
        system.debug(ChildToUpdate.Master_Approver_For_Expenses__c);
        system.debug(ChildToUpdate.Client_Account__c);
        
        system.debug('Parent BEFORE Running Test');
        system.debug(Parent.id);
        system.debug(Parent.Approver_For_Expenses__c);
        system.debug(Parent.Master_Approver_For_Expenses__c);
        system.debug(Parent.Client_Account__c);
        
  List<id> ChildID = new list<id>{ChildToUpdate.id};

    //test.startTest();     
  	FlowLocationDataUtil.UpdateNewChild(ChildID); 
  	//test.stopTest();
      
   Location_Data__c createdChild = [Select ID, 
                                    	   Approver_For_Expenses__c, 
                                    	   Master_Approver_For_Expenses__c, 
                                           Client_Account__c
     								From Location_Data__c
                				 	Where ID in :ChildID
                                    LIMIT 1];
        
        system.debug('Child AFTER Running Test');
        system.debug(createdChild.id);
        system.debug(createdChild.Approver_For_Expenses__c);
        system.debug(createdChild.Master_Approver_For_Expenses__c);
        system.debug(createdChild.Client_Account__c);
        
        
system.assertEquals(Approver2.id, createdChild.Approver_For_Expenses__c);                                        
system.assertEquals(Parent.Master_Approver_For_Expenses__c, createdChild.Master_Approver_For_Expenses__c);                                         
system.assertEquals(Parent.Client_Account__c, createdChild.Client_Account__c);

    
        
//END Test Portion - FlowLocationDataUtil.UpdateNewChild
//START Test Portion - FlowLocationDataChildListUtil.CreateChildListString
        
Location_Data__c ParentNoNum = New Location_Data__c(RecordTypeId = '012A0000000GiyV', 
                                                   name = 'Parent',
                                                   Code_as_it_appears_in_Chronotek__c='34567',
                                                   City__c='Culver City', State__c='CA', 
                                                   client_account__c = client.id, 
                                                   Master_Approver_For_Expenses__c = MasterApprover.id, 
                                                   Approver_For_Expenses__c = Approver.id,
                                                   OwnerID = '00GA0000001Me4c',
                                                   Inactivate_Code__c = True);
   Insert ParentNoNum;

  Location_Data__c ChildNoNum = New Location_Data__c(RecordTypeId = '012A0000000GiyQ' ,
                                                        name = 'Child',
                                                        Parent_Location__c=ParentNoNum.id ,
                                                        Code_as_it_appears_in_Chronotek__c='12345', 
                                                        City__c='Culver City', 
                                                        State__c='CA',
                                                        OwnerID = '00GA0000001Me4c',
                                                        Inactivate_Code__c = True,
                                                        Approver_For_Expenses__c = Approver2.id
                                                        );
   
   Insert ChildNoNum; 
 ////////////////////////////////////////////////////////////////////////////////       
Location_Data__c Parent20000 = New Location_Data__c(RecordTypeId = '012A0000000GiyV', 
                                                   name = '20000 - Parent',
                                                   Code_as_it_appears_in_Chronotek__c='34567',
                                                   City__c='Culver City', State__c='CA', 
                                                   client_account__c = client.id, 
                                                   Master_Approver_For_Expenses__c = MasterApprover.id, 
                                                   Approver_For_Expenses__c = Approver.id,
                                                   OwnerID = '00GA0000001Me4c',
                                                   Inactivate_Code__c = True);
   Insert Parent20000;

  Location_Data__c Child20001 = New Location_Data__c(RecordTypeId = '012A0000000GiyQ' ,
                                                        name = '20001 - Child',
                                                        Parent_Location__c=Parent20000.id ,
                                                        Code_as_it_appears_in_Chronotek__c='12345', 
                                                        City__c='Culver City', 
                                                        State__c='CA',
                                                        OwnerID = '00GA0000001Me4c',
                                                        Inactivate_Code__c = True,
                                                        Approver_For_Expenses__c = Approver2.id
                                                        );
   
   Insert Child20001; 
////////////////////////////////////////////////////////////////////////////////   
List<id> ParentIDNoNum = new list<id>{ParentNoNum.id};

        

//test for FlowLocationDataChildListUtil.CreateChildListString();        
        List<String> ChildNumStringList = New List<string>();
        ChildNumStringList = FlowLocationDataChildListUtil.CreateChildListString(ParentIDNoNum);
        List<String> Expected = New List<string>{'Child'}; 
            
		system.assertEquals(Expected, ChildNumStringList);
        
///////////////////

 //test for FlowLocationDataCompareProposedNumber.NumberAvailability();       
        List<Integer> IntegerTestList = New List<Integer>{20000};    
        List<Boolean> NumberChecker = New List<Boolean>();
        NumberChecker = FlowLocationDataCompareProposedNumber.NumberAvailability(IntegerTestList);
        List<Boolean> ExpectedBoolean = New List<Boolean>{True};   
        
		system.assertEquals(ExpectedBoolean, NumberChecker);    
            
///////////////////

List<id> ParentID20000 = new list<id>{Parent20000.id};      

    //test for FlowLocationDataLargestChildNumber.FindLargestChildNumber()
    List<String> ChildNumStringList2 = New List<string>();
    ChildNumStringList2 = FlowLocationDataLargestChildNumber.FindLargestChildNumber(ParentID20000);
    List<String> Expected2 = New List<string>{'20002'}; 
        
    List<String> ChildNumStringList3 = New List<string>();
    ChildNumStringList3 = FlowLocationDataLargestChildNumber.FindLargestChildNumber(ParentIDNoNum);
    List<String> Expected3 = New List<string>{'#####'}; 
        
	system.assertEquals(Expected2, ChildNumStringList2);
	system.assertEquals(Expected3, ChildNumStringList3);

///////////////////
        
         }
    }