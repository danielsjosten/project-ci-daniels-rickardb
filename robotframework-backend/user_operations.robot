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
${get_all_clients_endpoint}=        /hotel-rest/webresources/client/
${get_clients_counter_endpoint}=    /hotel-rest/webresources/client/count
${get_specific_client_endpoint}=    /hotel-rest/webresources/client/
#POST endpoints
${create_a_client_endpoint}=        /hotel-rest/webresources/client/
#PUT endpoints
${edit_a_client_endpoint}=          /hotel-rest/webresources/client/         #add id
#Delete endpoint
${delete_a_client_endpoint}=        /hotel-rest/webresources/client/         #add id

*** keywords ***
