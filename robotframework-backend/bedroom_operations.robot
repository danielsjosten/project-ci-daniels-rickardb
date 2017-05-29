*** Settings ***
Library                              HttpLibrary.HTTP
Library                              Collections
Library                              String
Library                              json

Resource                             variables.robot

*** variables ***
${http_context}=                     localhost:8080
${http_variable}=                    http
${header_content_json}               application/json
${header_accept_all}                 */*

#GET endpoints
${get_all_bedroom_endpoint}=         /hotel-rest/webresources/bedroom/
${get_bedroom_counter_endpoint}=     /hotel-rest/webresources/bedroom/count
${get_specific_bedroom_endpoint}=    /hotel-rest/webresources/bedroom/
#POST endpoints
${create_a_bedroom_endpoint}=        /hotel-rest/webresources/bedroom/
#PUT endpoints
${edit_a_bedroom_endpoint}=          /hotel-rest/webresources/bedroom/                      #add id
#Delete endpoint
${delete_a_bedroom_endpoint}=        /hotel-rest/webresources/bedroom/                      #add id


#Bedroom testdata
${bedroom_data_description}          testroom
${bedroom_data_floor}                3
${bedroom_data_roomnumber}           301
${bedroom_data_dailyPrice}           5000


*** keywords ***
Get all bedrooms
                                     Create Http Context                                    ${http_context}                                                  ${http_variable}
                                     Get                                                    ${get_all_bedroom_endpoint}
                                     ${response_status}=                                    Get Response Status
                                     ${response_body}=                                      Get Response Body
                                     Log To Console                                         \nResponse status:\n${response_status}
                                     Log To Console                                         \nShowing all bedrooms in database:\n${response_body}
                                     Should Contain                                         ${response_status}                                               200


 Get id of last created bedroom
                                     Create Http Context                                    ${http_context}                                                  ${http_variable}

                                     #Get all clients - First request
                                     Get                                                    ${get_all_bedroom_endpoint}
                                     ${response_status_first_request}=                      Get Response Status
                                     Should Contain                                         ${response_status_first_request}                                 200
                                     ${body_first_request}=                                 Get Response Body

                                     # Get client Counter - Second request
                                     Get                                                    ${get_bedroom_counter_endpoint}
                                     ${response_status_second_request}=                     Get Response Status
                                     Should Contain                                         ${response_status_second_request}                                200
                                     ${body_second_request}=                                Get Response Body
                                     ${last_index}=                                         Evaluate                                                         ${body_second_request}-1
                                     ${json_id}=                                            Get Json Value                                                   ${body_first_request}       /${last_index}/id
                                     Log to Console                                         ${\n}ID of last bedroom is: ${json_id}
                                     [Return]                                               ${json_id}

Get specific bedroom from id
                                     ${id_last_bedroom_in_database}=                        Get id of last created bedroom
                                     Create Http Context                                    ${http_context}                                                  ${http_variable}
                                     Get                                                    ${get_specific_bedroom_endpoint}${id_last_bedroom_in_database}
                                     ${response_status}=                                    Get Response Status
                                     ${response_body}=                                      Get Response Body
                                     Log To Console                                         \nResponse status:\n${response_status}
                                     Log To Console                                         \nLast bedrooms in database:\n${response_body}
                                     Should Contain                                         ${response_status}                                               200

Create new bedroom
                                     ${request_body}=                                       Catenate                                                         SEPARATOR=                  ${bedroom_json1}                                                                                                                                             ${bedroom_json2}

                                     Create Http Context                                    ${http_context}                                                  ${http_variable}
                                     Set Request Header                                     Content-Type                                                     ${header_content_json}
                                     Set Request Header                                     Accept                                                           ${header_accept_all}
                                     Set request body                                       ${request_body}
                                     Log to console                                         ${\n}Creating bedroom with data:\n${request_body}
                                     Post                                                   ${create_a_bedroom_endpoint}
                                     ${response_status}=                                    Get response Status
                                     log to console                                         \nResponse status:\n${response_status}
                                     Should contain                                         ${response_status}                                               204


Update previously created bedroom
                                     ${id_of_last_created_bedroom}=                         Get id of last created bedroom
                                     ${request_body}=                                       Catenate                                                         SEPARATOR=                  {"id":${id_of_last_created_bedroom},"description":"testroom","floor":2,"number":401,"priceDaily":500,"bedroomStatusId":{"id":1,"code":0,"name":"VACANT"},    "typeBedroomId":{"id":5,"name":"TOP BED KING"}}
                                     Create Http Context                                    ${http_context}                                                  ${http_variable}
                                     Set Request Header                                     Content-Type                                                     ${header_content_json}
                                     Set Request Header                                     Accept                                                           ${header_accept_all}
                                     Set Request Body                                       ${request_body}

                                     Put                                                    ${edit_a_bedroom_endpoint}${id_of_last_created_bedroom}

                                     Log to Console                                         \nUpdating bedroom with data:\n${request_body}

                                     ${response_status}=                                    Get Response Status
                                     log to console                                         ${\n}Status code:${response_status}
                                     Should Contain                                         ${response_status}                                               204






Delete bedroom
                                     ${id_of_last_created_bedroom}=                         Get id of last created bedroom
                                     Create Http Context                                    ${http_context}                                                  ${http_variable}
                                     Set Request Header                                     Content-Type                                                     ${header_content_json}
                                     Set Request Header                                     Accept                                                           ${header_accept_all}
                                     #Get the bedroom that will be deleted to display it
                                     #Get last bedroom
                                     Get                                                    ${get_specific_bedroom_endpoint}${id_of_last_created_bedroom}
                                     ${response_status_first_request}=                      Get Response Status
                                     Should Contain                                         ${response_status_first_request}                                 200
                                     ${body_first_request}=                                 Get Response Body

                                     Delete                                                 ${delete_a_bedroom_endpoint}${id_of_last_created_bedroom}
                                     ${response_status}=                                    Get Response Status
                                     ${bedroom_that was deleted}=                           Get Response Body
                                     Should Contain                                         ${response_status}                                               204
                                     Log to console                                         \nThe following bedroom was deleted:\n${body_first_request}


