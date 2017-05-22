*** Settings ***
Library                                        Selenium2Library
Library                                        OperatingSystem
Library                                        DateTime
Resource                                       ../keywords/specificActions_Keywords.robot
Resource                                       ../variables/baseVariables.robot
Resource                                       ../variables/createAClientVariables.robot
Resource                                       ../variables/createAReservationVariables.robot
Resource                                       ../variables/editAReservationVariables.robot
Resource                                       ../variables/login_logoutVariables.robot
Resource                                       ../variables/titleVariables.robot

#Keywords that perform complete steps
*** Keywords ***
    
performLogin   
    Input Text                                 ${login_pg_username_textfield}                      ${username} 
    Input Text                                 ${login_pg_password_textfield}                      ${password} 
    Click Element                              ${login_pg_btn_login}
    Wait Until Page Contains                   ${dashboard_pg_label_dashboard} 
    
#performLogout     
  #  Wait Until Page Contains Element           ${logout_menu}
  #  Click Element                              ${logout_menu}
   # Wait Until Page Contains Element           ${logout_submenu}
    #Click Element                              ${logout_submenu}                 
    #Wait Until Page Contains                   ${login_pg_label_login}     
    #Title Should Be                            ${login_pg_title}   
   
   
   #TestCase - Create New Reservation
createNewReservation
    Wait Until Page Contains Element           ${menu_reservation}
    Click Element                              ${menu_reservation}
    Wait Until Page Contains Element           ${create_new_reservation_button}
    Title Should Be                            ${reservation_title}
    Click Element                              ${create_new_reservation_button}
    Wait Until Page Contains Element           ${entryDate_location}
    Title Should Be                            ${create_new_reservation_title}
    #Calls Keyword input_entryDate
    input_entryDate
    #Calls Keyword input_exitDate
    input_exitDate
    #Calls Keyword reservation_Bedroom
    reservation_Bedroom
    #Calls Keyword reservation_Client
    reservation_Client
    #Calls Keyword reservation_Status
    reservation_Status
    Click Element                              ${reservation_save_button}
    Wait Until Page Contains Element           ${reservation_error_message}
    Element Should Be Visible                  ${reservation_error_message}
    
    
    #TestCase - Edit an existing Reservation
editReservation
    Wait Until Page Contains Element           ${menu_reservation}
    Click Element                              ${menu_reservation}
    Wait Until Page Contains Element           ${edit_reservation_button_lastIndex}
    Title Should Be                            ${reservation_title}
    Click Element                              ${edit_reservation_button_lastIndex}
    Wait Until Page Contains Element           ${entryDate_location}
    Title Should Be                            ${edit_reservation_title}
    #Calls Keyword input_entryDate
    input_entryDate
    #Calls Keyword input_exitDate
    input_exitDate
    Click Element                              ${reservation_save_button}
    Wait Until Page Contains Element           ${edit_reservation_successful}
    Click Element                              ${edit_showAllReservation_button}
    Wait Until Page Contains Element           ${reservation_table}
    Title Should Be                            ${reservation_title}
    #Calls Keyword reservation_verifyEntryDate
    reservation_verifyEntryDate
    
    
    #TestCase - Create a new Client and Deletes it afterwards
createNewClient
    Wait Until Page Contains Element           ${menu_client}
    Click Element                              ${menu_client}
    Wait Until Page Contains Element           ${create_new_client_button}
    Title Should Be                            ${client_title}
    Click Element                              ${create_new_client_button}
    Wait Until Page Contains Element           ${create_new_client_nameField}
    Title Should Be                            ${newClient_title}
    #Calls Keyword input_randomName
    input_randomName                   
    #Calls Keyword input_randomEmail        
    input_randomEmail
    Click Element                              ${create_new_client_genderBtnMale}
    input_randomSocialSecurityNumber
    Click Element                              ${create_new_client_saveButton}
    Wait Until Page Contains Element           ${create_new_client_clientCreatedVerify}
    Title Should Be                            ${create_new_client_clientCreatedTitle}
    #Calls Keyword client_createdVerification
    client_createdVerification
    Click Element                              ${create_new_client_clientCreatedDelete}
    Wait Until Page Contains Element           ${create_new_client_clientDeleted}
    #Calls Keyword client_deletedVerification
    client_deletedVerification