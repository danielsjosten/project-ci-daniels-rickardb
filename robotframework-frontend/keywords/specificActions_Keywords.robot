*** Settings ***
Library                                       DateTime
Library                                       Selenium2Library
Library                                       FakerLibrary
Library                                       String
Resource                                      ../keywords/completeSteps_Keywords.robot
Resource                                      ../variables/baseVariables.robot
Resource                                      ../variables/createAClientVariables.robot
Resource                            	      ../variables/createAReservationVariables.robot
Resource                                      ../variables/editAReservationVariables.robot
Resource                                      ../variables/login_logoutVariables.robot
Resource                                      ../variables/titleVariables.robot

#Keywords that perform a specific action
*** Keywords ***
input_entryDate
    #Get Current Date in specific format, saves in variable and sends to location
    ${date}=  Get Current Date  result_format=%Y-%m-%d
    Input Text   ${entryDate_location}      ${date}
    
input_exitDate
    #Date Time Between, converts to specific format and sends to location
    ${futureDate}=  Date Time Between  start_date=2017y  end_date=2018
    ${exitDate}=  Convert Date  ${futureDate}  result_format=%Y-%m-%d
    Input Text   ${exitDate_location}       ${exitDate}
    
reservation_Bedroom
    #Generates a random string between 2,5,7,6,8,4 and saves that value - Then picks from list with stored value
    ${randomBedroom}=  Generate Random String  1  257684
    Select From List By Value  ${reservation_bedroom_dropdown}  ${randomBedroom}
    
reservation_Client
    #Generates a random string between 1,4,5,6,2 and saves that value - Then picks from list with stored value
    ${randomClient}=  Generate Random String  1  14562
    Select From List By Value  ${reservation_client_dropdown}  ${randomClient}
    
reservation_Status
    #Generates a random string between 1,2,3,4 and saves that value - Then picks from list with stored value
    ${randomStatus}=  Generate Random String  1  1234
    Select From List By Value  ${reservation_status_dropdown}  ${randomStatus}
    
reservation_verifyEntryDate
    #Get Current Date in specified format then verifies element text with stored value
    ${dateVerify}=  Get Current Date  result_format=%Y/%m/%d
    Element Text Should Be  ${edit_reservation_entryDate_location}  ${dateVerify}
    
input_randomName
    #Generates Random String in lowercase, then verifies its lowercase and sends to location
    ${name}=  Generate Random String  8  [LOWER]
    Should Be Lowercase  ${name}
    Input Text  ${create_new_client_nameField}    ${name}
    
input_randomEmail
    #Generates Random String in letters, then verifies its a string.
    #Then opens new variable, Catenates with Separator between previous generated String and prior stored variable
    #Then sends the new variable to location
    ${email}=  Generate Random String  10  [LETTERS]
    Should Be String  ${email}
    ${newEmail}=  Catenate      SEPARATOR=    ${email}  ${emailEnding}
    Input Text  ${create_new_client_emailField}    ${newEmail}
    
input_randomSocialSecurityNumber
    #Generates Random String with Numbers, verifies and sends to location
    ${number}=  Generate Random String  10  [NUMBERS]
    Should Be String  ${number}
    Input Text  ${create_new_client_socialSecurityNumber}    ${number}
    
client_createdVerification
    #Verifies a fetched variable with a hardcoded saved variable
    Element Text Should Be  ${create_new_client_clientCreatedVerify}  ${verifyClientCreatedText}
     
client_deletedVerification
    #Verifies a fetched variable with a hardcoded saved variable
    Element Text Should Be  ${create_new_client_clientDeleted}  ${verifyClientDeletedText}