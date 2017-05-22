*** Settings ***
Library                             HttpLibrary.HTTP
Library                             Collections
Library                             String
Library                             json

Resource                            client_operations.robot

*** variables ***
${http_context}=                    localhost:8080
${http_variable}=                   http
${header_content_json}              application/json
${header_accept_all}                */*
#GET endpoints
${get_all_user_endpoint}=           /hotel-rest/webresources/user/
${get_user_counter_endpoint}=       /hotel-rest/webresources/user/count
${get_specific_user_endpoint}=      /hotel-rest/webresources/user/
#POST endpoints
${create_a_user_endpoint}=          /hotel-rest/webresources/user/
#PUT endpoints
${edit_a_user_endpoint}=            /hotel-rest/webresources/user/         #add id
#Delete endpoint
${delete_a_user_endpoint}=          /hotel-rest/webresources/user/         #add id

#User Testdata
${id}=    20
${login}=    "ricky"
${password}=    "101010"
${typeUser}=    2

*** keywords ***
Generate random user
    ${id}=  Set Variable    20
    ${login}=    Generate Random String    5    [LOWER]
    ${password}=    Generate Random String    5    [NUMBERS]
    ${typeUser}=    Set Variable    2
    ${clientId}=    Set Variable    {"id": 5, "name": "YANNE", "createDate": 1473267124445, "email": "yanne_alencar@hotmail.com", "gender": "F", "socialSecurityNumber": "5374855"}
    ${userStatusId}=    Set Variable    {"id": 1, "code": 1, "name": "ACTIVE"}
    ${dictionary}=    Create Dictionary    id=${id}  login=${login}  password=${password}  typeUser=${typeUser}  clientId=${clientId}  userStatusId=${userStatusId}
    ${user_json1}=    Stringify Json    ${dictionary}
    [return]        ${user_json1}


Get All Users
    Create HTTP Context            ${http_context} 
    Get                            ${get_all_user_endpoint}
    ${response_status}=            Get Response Status
    ${response_body}=              Get Response Body
    Log To Console                 ${response_status}
    Log To Console                 ${response_body}
    Should Contain                 ${response_status}  200                      

Create A User
    ${request_body}=               Generate random user
    Create Http Context            ${http_context}             ${http_variable}
    Set Request Header             Content-Type                ${header_content_json}
    Set Request Header             Accept                      ${header_accept_all}
    Set request body               ${request_body}
    Log To Console                 ${request_body}
    Post                           ${create_a_user_endpoint}
    ${response_status}=            Get response Status
    Log to console                 ${\n}Status code:${response_status}
    Should contain                 ${response_status}                                           204

    