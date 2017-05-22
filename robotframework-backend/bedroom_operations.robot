*** Settings ***
Library                              HttpLibrary.HTTP
Library                              Collections
Library                              String
Library                              json

*** variables ***
${http_context}=                     localhost:8080
${http_variable}=                    http
${header_content_json}               application/json
${header_accept_all}                 */*

#GET endpoints
${get_all_bedroom_endpoint}=         /hotel-rest/webresources/bedroom
${get_bedroom_counter_endpoint}=     /hotel-rest/webresources/bedroom/count
${get_specific_bedroom_endpoint}=    /hotel-rest/webresources/bedroom
#POST endpoints
${create_a_bedroom_endpoint}=        /hotel-rest/webresources/bedroom
#PUT endpoints
${edit_a_bedroom_endpoint}=          /hotel-rest/webresources/bedroom          #add id
#Delete endpoint
${delete_a_bedroom_endpoint}=        /hotel-rest/webresources/bedroom          #add id


#Bedroom testdata
${bedroom_data_description}          testroom
${bedroom_data_floor}                3
${bedroom_data_roomnumber}           301
${bedroom_data_dailyPrice}           5000
#status busy
#bed classic king

${bedroom_bed_type}                  {"id":2,"name":"CLASSIC BED KING"}
${bedroom_status}                    {"id":2,"code":1,"name":"BUSY"}


*** keywords ***
Get all bedrooms
                                     Create Http Context                       ${http_context}                                ${http_variable}
                                     Get                                       ${get_all_bedroom_endpoint}
                                     ${response_status}=                       Get Response Status
                                     ${response_body}=                         Get Response Body
                                     Log To Console                            ${response_status}
                                     Log To Console                            ${response_body}
                                     Should Contain                            ${response_status}                             200


 Get id of last created bedroom
                                     Create Http Context                       ${http_context}                                ${http_variable}

                                     #Get all clients - First request
                                     Get                                       ${get_all_bedroom_endpoint}
                                     ${response_status_first_request}=         Get Response Status
                                     Should Contain                            ${response_status_first_request}               200
                                     ${body_first_request}=                    Get Response Body

                                     # Get client Counter - Second request
                                     Get                                       ${get_bedroom_counter_endpoint}
                                     ${response_status_second_request}=        Get Response Status
                                     Should Contain                            ${response_status_second_request}              200
                                     ${body_second_request}=                   Get Response Body
                                     #Log to Console                           ${body_second_request}
                                     ${last_index}=                            Evaluate                                       ${body_second_request}-1
                                     #Log to Console                           ${last_index}
                                     ${json_id}=                               Get Json Value                                 ${body_first_request}       /${last_index}/id
                                     Log to Console                            ${\n}ID of last bedroom is: ${json_id}
                                     [Return]                                  ${json_id}


Create new bedroom

                                     ${id}=                                    Set Variable                                   100
                                     ${json_string}=                           catenate
                                     ...                                       {
                                     ...                                       "id": ${id},
                                     ...                                       "description": ${bedroom_data_description},
                                     ...                                       "floor": ${bedroom_data_floor},
                                     ...                                       "number": ${bedroom_data_roomnumber},
                                     ...                                       "priceDaily": ${bedroom_data_dailyPrice},
                                     ...                                       "bedroomStatusId": {
                                     ...                                       "id":2,
                                     ...                                       "code":1,
                                     ...                                       "name":"BUSY"
                                     ...                                       }
                                     ...                                       "typeBedroomId" {
                                     ...                                       "id":2,
                                     ...                                       "name":"CLASSIC BED KING"
                                     ...                                       }
                                     ...                                       }

                                     log to console                            \n${json_string}
                                     ${bedroom_json}=                          Stringify Json                                 ${json_string}


                                     ${request_body}=                          ${bedroom_json}
                                     Create Http Context                       ${http_context}                                ${http_variable}
                                     Set Request Header                        Content-Type                                   ${header_content_json}
                                     Set Request Header                        Accept                                         ${header_accept_all}
                                     Set request body                          ${request_body}
                                     Log to console                            ${\n}Creating bedroom:${request_body}
                                     Post                                      ${create_a_bedroom_endpoint}
                                     ${response_status}=                       Get response Status
                                     log to console                            ${\n}Status code:${response_status}
                                     Should contain                            ${response_status}                             204

                                     #${dictionary}=                           Create Dictionary                              id=${id}                    description=${bedroom_data_description}    floor=${bedroom_data_floor}    number=${bedroom_data_roomnumber}    priceDaily=${bedroom_data_dailyPrice}    bedroomStatusId=${bedroom_status}    typeBedroomId=${bedroom_bed_type}
                                     #${bedroom_json}=                         Stringify Json                                 ${dictionary}
                                     #log to console                           ${\n}${bedroom_json}




