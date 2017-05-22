*** Settings ***
Library                                HttpLibrary.HTTP
Library                                Collections
Library                                String
Library                                json

*** variables ***
${http_context}=                       localhost:8080
${http_variable}=                      http
${header_content_json}                 application/json
${header_accept_all}                   */*
#GET endpoints
${get_all_clients_endpoint}=           /hotel-rest/webresources/client/
${get_clients_counter_endpoint}=       /hotel-rest/webresources/client/count
${get_specific_client_endpoint}=       /hotel-rest/webresources/client/
#POST endpoints
${create_a_client_endpoint}=           /hotel-rest/webresources/client/
#PUT endpoints
${edit_a_client_endpoint}=             /hotel-rest/webresources/client/         #add id
#Delete endpoint
${delete_a_client_endpoint}=           /hotel-rest/webresources/client/         #add id

*** keywords ***
Generate a random client
                                       ${id}=                                   Set Variable                                                 100
                                       ${name}=                                 Generate random String                                       10                          [LOWER]
                                       ${createDate}=                           Set Variable                                                 1473633063279
                                       ${email}=                                Catenate                                                     SEPARATOR=                  ${name}              @email.com
                                       ${socialSecurityNumber}=                 Generate Random String                                       9                           [NUMBERS]
                                       ${gender}=                               Generate Random String                                       1                           MF
                                       ${dictionary}=                           Create Dictionary                                            id=${id}                    name=${name}         createDate=${createDate}    email=${email}    gender=${gender}    socialSecurityNumber=${socialSecurityNumber}
                                       ${client_json}=                          Stringify Json                                               ${dictionary}
                                       [return]                                 ${client_json}


## Method using the GET                /webresources/client/count
Get the total of clients
                                       Create Http Context                      ${http_context}                                              ${http_variable}
                                       Set Request Header                       Content-Type                                                 ${header_content_json}
                                       Set Request Header                       Accept                                                       ${header_accept_all}
                                       Get                                      ${get_clients_counter_endpoint}
                                       ${response_status}=                      Get response Status
                                       ${total_clients}=                        Get response body
                                       log to console                           ${\n}Getting the total of clients:${total_clients}
                                       log to console                           ${\n}Status code:${response_status}
                                       Should contain                           ${response_status}                                           200
                                       #log to console                          ${total_clients}
                                       [Return]                                 ${total_clients}

## Method using                        POST                                     /webresources/client/count
Create a client
                                       ${request_body} =                        Generate a random client
                                       Create Http Context                      ${http_context}                                              ${http_variable}
                                       Set Request Header                       Content-Type                                                 ${header_content_json}
                                       Set Request Header                       Accept                                                       ${header_accept_all}
                                       Set request body                         ${request_body}
                                       Log to console                           ${\n}Creating client:${request_body}
                                       Post                                     ${create_a_client_endpoint}
                                       ${response_status}=                      Get response Status
                                       log to console                           ${\n}Status code:${response_status}
                                       Should contain                           ${response_status}                                           204


Get all clients
                                       Create Http Context                      ${http_context}                                              ${http_variable}
                                       Get                                      ${get_all_clients_endpoint}
                                       ${response_status}=                      Get Response Status
                                       ${response_body}=                        Get Response Body
                                       Log To Console                           ${response_status}
                                       Log To Console                           ${response_body}
                                       Should Contain                           ${response_status}                                           200

Get id of last created client
                                       Create Http Context                      ${http_context}                                              ${http_variable}

                                       #Get all clients - First request
                                       Get                                      ${get_all_clients_endpoint}
                                       ${response_status_first_request}=        Get Response Status
                                       Should Contain                           ${response_status_first_request}                             200
                                       ${body_first_request}=                   Get Response Body
                                       #Log to Console                          ${body_first_request}

                                       # Get client Counter - Second request
                                       Get                                      ${get_clients_counter_endpoint}
                                       ${response_status_second_request}=       Get Response Status
                                       Should Contain                           ${response_status_second_request}                            200
                                       ${body_second_request}=                  Get Response Body
                                       #Log to Console                          ${body_second_request}
                                       ${last_index}=                           Evaluate                                                     ${body_second_request}-1
                                       #Log to Console                          ${last_index}
                                       ${json_id}=                              Get Json Value                                               ${body_first_request}       /${last_index}/id
                                       Log to Console                           ${json_id}
                                       [Return]                                 ${json_id}


Get specific client from id
                                       ${id_to_get}=                            Get id of last created client
                                       Create Http Context                      ${http_context}                                              ${http_variable}
                                       Set Request Header                       Content-Type                                                 ${header_content_json}
                                       Set Request Header                       Accept                                                       ${header_accept_all}
                                       Get                                      ${get_specific_client_endpoint}${id_to_get}
                                       ${response_status}=                      Get Response Status
                                       ${response_body}=                        Get Response Body
                                       Should contain                           ${response_status}                                           200
                                       Log to console                           ${response_body}


Delete client
                                       Create a client
                                       ${id_of_created_client}=                 Get id of last created client
                                       Create Http Context                      ${http_context}                                              ${http_variable}
                                       Set Request Header                       Content-Type                                                 ${header_content_json}
                                       Set Request Header                       Accept                                                       ${header_accept_all}
                                       Delete                                   ${delete_a_client_endpoint}${id_of_created_client}
                                       ${response_status}=                      Get Response Status
                                       Should Contain                           ${response_status}                                           204







Generate a random client for update
                                       ${id}=                                   Get id of last created client
                                       ${name}=                                 Generate random String                                       10                          [LOWER]
                                       ${createDate}=                           Set Variable                                                 1473633063279
                                       ${email}=                                Catenate                                                     SEPARATOR=                  ${name}              @email.com
                                       ${socialSecurityNumber}=                 Generate Random String                                       9                           [NUMBERS]
                                       ${gender}=                               Generate Random String                                       1                           MF
                                       ${dictionary}=                           Create Dictionary                                            id=${id}                    name=${name}         createDate=${createDate}    email=${email}    gender=${gender}    socialSecurityNumber=${socialSecurityNumber}
                                       ${update_client_json}=                   Stringify Json                                               ${dictionary}
                                       [return]                                 ${update_client_json}




## Method using                        POST                                     /webresources/client/count
Create client for update
                                       ${request_body} =                        Generate a random client for update
                                       Create Http Context                      ${http_context}                                              ${http_variable}
                                       Set Request Header                       Content-Type                                                 ${header_content_json}
                                       Set Request Header                       Accept                                                       ${header_accept_all}
                                       Set request body                         ${request_body}
                                       Log to console                           ${\n}Creating client:${request_body}
                                       Post                                     ${create_a_client_endpoint}
                                       ${response_status}=                      Get response Status
                                       log to console                           ${\n}Status code:${response_status}
                                       Should contain                           ${response_status}                                           204



Update client
                                       Create a client
                                       ${id_of_created_client}=                 Get id of last created client

                                       ${request_body_new_client_data}=         Generate a random client for update
                                       log to console                           Loggin this new user ${request_body_new_client_data}

                                       Create Http Context                      ${http_context}                                              ${http_variable}
                                       Set Request Header                       Content-Type                                                 ${header_content_json}
                                       Set Request Header                       Accept                                                       ${header_accept_all}
                                       Set Request Body                         ${request_body_new_client_data}

                                       log to console                           ${edit_a_client_endpoint}${id_of_created_client}
                                       Put                                      ${edit_a_client_endpoint}${id_of_created_client}

                                       Log to Console                           Updating client with data:${request_body_new_client_data}

                                       ${response_status}=                      Get Response Status
                                       log to console                           ${\n}Status code:${response_status}
                                       Should Contain                           ${response_status}                                           204









