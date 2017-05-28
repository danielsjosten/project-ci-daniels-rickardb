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


*** keywords ***
Generate Random User and Client Data
    #User
    ${id}=  Set Variable    50
    ${login}=    Generate Random String    10    [LOWER]
    ${password}=    Generate Random String    10    [NUMBERS]
    ${typeUser}=    Set Variable    2
    #Client - Getting id from last created Client in client_operations.robot
    ${clientId}=    Get id of last created client
    ${name}=    Generate Random String    5    [UPPER]
    ${createDate}=    Set Variable    1473633063279
    ${email}=    Catenate    SEPARATOR=    ${login}@email.com
    ${gender}=    Generate Random String    1    MF
    ${socialSecurityNumber}=    Generate Random String    10    [NUMBERS]
    #UserStatusId
    ${userStatusId}=    Generate Random String    1    20
    ${code}=    Generate Random String    1    20
    ${statusName}=    Set Variable    ACTIVE
    #Dictionary
    ${dictionary_first}=    Create Dictionary    id=${clientId}  name=${name}  createDate=${createDate}  email=${email}  gender=${gender}  socialSecurityNumber=${socialSecurityNumber}
    ${dictionary_second}=    Create Dictionary    id=${userStatusId}  code=${code}  name=${statusName}
    ${dictionary}=    Create Dictionary    id=${id}  login=${login}  password=${password}  typeUser=${typeUser}  clientId=${dictionary_first}  userStatusId=${dictionary_second}
    ${user_json}=    Stringify Json    ${dictionary}
    [return]        ${user_json}
    
Modify User Data    [Arguments]    ${last_created_user_id}
    #User
    ${id}=  Set Variable    ${last_created_user_id}
    ${login}=    Generate Random String    10    [LOWER]
    ${password}=    Generate Random String    10    [NUMBERS]
    ${typeUser}=    Set Variable    2
    #Client - Getting id from last created Client in client_operations.robot
    ${clientId}=    Get id of last created client
    ${name}=    Generate Random String    5    [UPPER]
    ${createDate}=    Set Variable    1473633063279
    ${email}=    Catenate    SEPARATOR=    ${login}@email.com
    ${gender}=    Generate Random String    1    MF
    ${socialSecurityNumber}=    Generate Random String    10    [NUMBERS]
    #UserStatusId
    ${userStatusId}=    Generate Random String    1    20
    ${code}=    Generate Random String    1    20
    ${statusName}=    Set Variable    ACTIVE
    #Dictionary
    ${dictionary_first}=    Create Dictionary    id=${clientId}  name=${name}  createDate=${createDate}  email=${email}  gender=${gender}  socialSecurityNumber=${socialSecurityNumber}
    ${dictionary_second}=    Create Dictionary    id=${userStatusId}  code=${code}  name=${statusName}
    ${dictionary}=    Create Dictionary    id=${id}  login=${login}  password=${password}  typeUser=${typeUser}  clientId=${dictionary_first}  userStatusId=${dictionary_second}
    ${user_json}=    Stringify Json    ${dictionary}
    [return]        ${user_json}
    
Get Last Created User Id
    Create Http Context            ${http_context}            ${http_variable}
    Get                            ${get_all_user_endpoint}
    ${response_status1}=           Get Response Status
    Should Contain                 ${response_status1}        200
    ${request_body1}=              Get Response Body
    Get                            ${get_user_counter_endpoint}
    ${response_status2}=           Get Response Status
    Should Contain                 ${response_status2}        200
    ${request_body2}=              Get Response Body
    ${last_created_user}=          Evaluate    ${request_body2}-1
    ${user_id}=                    Get Json Value    ${request_body1}    /${last_created_user}/id
    [return]                       ${user_id}
    
    
Get All Users
    Create Http Context            ${http_context}            ${http_variable}
    Get                            ${get_all_user_endpoint}
    ${response_status}=            Get Response Status
    ${response_body}=              Get Response Body
    Log To Console                 ${response_status}
    Log To Console                 ${response_body}
    Should Contain                 ${response_status}         200                      
    
Get Total Of Users
    Create Http Context            ${http_context}            ${http_variable}
    Get                            ${get_user_counter_endpoint}
    ${response_status}=            Get Response Status
    Should Contain                 ${response_status}         200
    ${response_body}=              Get Response Body
    ${info_text}                   Set Variable               Total number of users: 
    Log To Console                 \n${info_text}${response_body}
    
Create A User
    ${client_json}=                Generate Random User and Client Data
    Create Http Context            ${http_context}             ${http_variable}
    Set Request Header             Content-Type                ${header_content_json}
    Set Request Header             Accept                      ${header_accept_all}
    Set Request Body               ${client_json}
    Log To Console                 \n${client_json}
    Post                           ${create_a_user_endpoint}
    ${response_status}=            Get response Status
    Log To Console                 ${\n}Status code:${response_status}
    Should Contain                 ${response_status}          204

Update A User
    ${last_user_id}=               Get Last Created User Id
    ${request_body}=               Modify User Data            ${last_user_id}
    Create Http Context            ${http_context}             ${http_variable}
    Set Request Header             Content-Type                ${header_content_json}
    Set Request Header             Accept                      ${header_accept_all}
    Set Request Body               ${request_body}
    Put                            ${edit_a_user_endpoint}${last_user_id}
    ${response_status}=            Get Response Status
    Log To Console                 ${response_status}
    Should Contain                 ${response_status}          204
    
Delete A User
    ${last_user_id}=               Get Last Created User Id
    Create Http Context            ${http_context}             ${http_variable}
    Delete                         ${delete_a_user_endpoint}${last_user_id}
    ${response_status}=            Get Response Status
    Should Contain                 ${response_status}          204
    