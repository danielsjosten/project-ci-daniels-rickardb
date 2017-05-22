*** Settings ***
Library                                          String

*** Variables ***

${usr_pg_lbl}                                    Create New User

${btn_create_new_user}                           //*[@id="j_idt50"]/a[1]
${btn_save_user}                                 xpath=//a[text()='Save']
${btn_delete_user}                               xpath=//a[text()='Delete']

${admin}=                                        Administrator

#Form identifiers
${user_form_login}                               id=login
${user_form_password}                            id=password
${user_form_password_retype}                     id=retypingPassword

${user_form_type_of_user}                        id=typeUser
${user_form_client_dropdown}                     id=clientId
${user_form_client_dropdown_index1}              //*[@id="clientId"]/option[1]


${user_form_user_status_dropdown}                id=userStatusId
${user_form_status_dropdown_active}              xpath=//*[@id="userStatusId"]/option[1]
${user_form_status_dropdown_inactive}            xpath=//*[@id="userStatusId"]/option[2]


${user_was_created}                              User was successfully created.
${user_was_deleted}                              User was successfully deleted.

${user_form_client_dropdown_name}=               Daniel




*** Keywords ***
Click create new user
                                                 Click Element                                      ${btn_create_new_user}

Check that the first dropdown is set as admin
                                                 ${dropdown_1_}=                                    Get Text                                 ${user_form_type_of_user}
                                                 Log to Console                                     ${dropdown_1_}
                                                 Should Contain                                     ${dropdown_1_}                           ${admin}

Fill in the user credentials
                                                 ${user_name}=                                      Generate Random String                   8                                    [LOWER]
                                                 Input Text                                         ${user_form_login}                       ${user_name}

                                                 #Random Password
                                                 ${user_password}=                                  Generate Random String                   7                                    [NUMBERS]
                                                 Input Text                                         ${user_form_password}                    ${user_password}
                                                 Input Text                                         ${user_form_password_retype}             ${user_password}


                                                 #Select client Daniel from dropdown
                                                 Click Element                                      ${user_form_client_dropdown}
                                                 Wait Until Page Contains Element                   ${user_form_client_dropdown_index1}
                                                 Select From List By Label                          ${user_form_client_dropdown}             ${user_form_client_dropdown_name}

                                                 #Select status Active
                                                 Click Element                                      ${user_form_user_status_dropdown}
                                                 Wait Until Page Contains Element                   ${user_form_status_dropdown_inactive}
                                                 Click Element                                      ${user_form_status_dropdown_inactive}

                                                 #Click Save
                                                 Click Element                                      ${btn_save_user}

                                                 Wait Until Page Contains                           ${user_was_created}


Delete the user that was created

                                                 #Click delete and assert user was deleted
                                                 Click Element                                      ${btn_delete_user}
                                                 Wait Until Page Contains                           ${user_was_deleted}
















