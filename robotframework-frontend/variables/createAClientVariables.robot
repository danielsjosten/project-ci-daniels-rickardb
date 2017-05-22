*** Settings ***
Library                                       DateTime
Library                                       Selenium2Library
Library                                       FakerLibrary
Library                                       String
Resource                                      ../keywords/completeSteps_Keywords.robot
Resource                                      ../keywords/specificActions_Keywords.robot
Resource                                      ../variables/baseVariables.robot
Resource                            	      ../variables/createAReservationVariables.robot
Resource                                      ../variables/editAReservationVariables.robot
Resource                                      ../variables/login_logoutVariables.robot
Resource                                      ../variables/titleVariables.robot

*** Variables ***
#Crete a new Client variables
${menu_client}                                 xpath=//*[@id="side-menu"]/li[5]/a
${create_new_client_button}                    xpath=//*[@id="j_idt50"]/a[1]
${create_new_client_nameField}                 id=name
${create_new_client_emailField}                id=email
${create_new_client_genderBtnMale}             id=gender:0
${create_new_client_socialSecurityNumber}      id=socialSecurityNumber
${emailEnding}                                 @nackademin.se
${create_new_client_saveButton}                xpath=//*[@id="j_idt52"]/a[1]
${create_new_client_clientCreatedVerify}       xpath=//*[@id="messagePanel"]/table/tbody/tr/td
${verifyClientCreatedText}                     Client was successfully created.
${create_new_client_clientCreatedDelete}       xpath=//*[@id="j_idt51"]/a[1]
${create_new_client_clientDeleted}             xpath=//*[@id="messagePanel"]/table/tbody/tr/td
${verifyClientDeletedText}                     Client was successfully deleted.
