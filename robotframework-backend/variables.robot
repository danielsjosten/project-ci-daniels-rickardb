*** settings ***
Resource                 bedroom_operations.robot
Resource                 client_operations.robot

*** variables ***
${bedroom_json1}=        {"id":100,"description":"testroom","floor":2,"number":501,"priceDaily":300,"bedroomStatusId":{"id":1,"code":0,"name":"VACANT"},
${bedroom_json2}=        "typeBedroomId":{"id":5,"name":"TOP BED KING"}}

#${last_bedroom_id}=     bedroom_id_for_update

${bedroom_json1_put}=    {"id":100,"description":"testroom","floor":2,"number":401,"priceDaily":500,"bedroomStatusId":{"id":1,"code":0,"name":"VACANT"},
${bedroom_json2_put}=    "typeBedroomId":{"id":5,"name":"TOP BED KING"}}


${bedroom_json}=         {"id":11,"description":"testroom","floor":2,"number":301,"priceDaily":300,"bedroomStatusId":{"id":1,"code":0,"name":"VACANT"},"typeBedroomId":{"id":5,"name":"TOP BED KING"}}


${userdata}=             {"id": 100,"login": "testset","password":"asdf","typeUser": 2,"clientId": Generate a random client ,"userStatusId":{"id": 1,"code": 1,"name": "ACTIVE"}}

