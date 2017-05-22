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


*** keywords ***
Get all bedrooms
                                     Create Http Context                       ${http_context}                ${http_variable}
                                     Get                                       ${get_all_bedroom_endpoint}
                                     ${response_status}=                       Get Response Status
                                     ${response_body}=                         Get Response Body
                                     Log To Console                            ${response_status}
                                     Log To Console                            ${response_body}
                                     Should Contain                            ${response_status}             200
                                     
                                     
Create new bedroom          

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
    
    
    
    
    
    
    
    
    
    
                              

