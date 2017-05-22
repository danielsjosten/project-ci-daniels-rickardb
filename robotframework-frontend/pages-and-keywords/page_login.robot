*** Settings ***
Resource                           ../credentials/login_variables.robot
Resource                           page_dashboard.robot


*** Variables ***

${login_pg_label_login}            Login

#Login Form
${login_pg_user_username_field}    id=login
${login_pg_user_password_field}    id=senha
${login_pg_btn_login}              id=loginBtn

${login_pg_error_invalid_login}    //*[@id="messagePanel"]/table/tbody/tr/td



*** Keywords ***
Test_Case_Valid_Login
                                   #Login as admin
                                   Input Text                                   ${login_pg_user_username_field}    ${valid_username}
                                   Input Text                                   ${login_pg_user_password_field}    ${valid_password}
                                   Click Element                                ${login_pg_btn_login}
                                   Wait until page contains                     ${dashboard_pg_label_dashboard}

Test_Case_Invalid_Login
                                   #Login as unregistered user
                                   Input Text                                   ${login_pg_user_username_field}    ${invalid_username}
                                   Input Text                                   ${login_pg_user_password_field}    ${invalid_password}
                                   Click Element                                ${login_pg_btn_login}
                                   Wait Until Page Contains Element             ${login_pg_error_invalid_login}
                                   ${text}=                                     Get text                           ${login_pg_error_invalid_login}
                                   Log To Console                               ${text}
                                   Should Be Equal                              ${text}                            Login and Password Wrong

