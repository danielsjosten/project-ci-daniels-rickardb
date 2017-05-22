*** Settings ***
Library                   Collections
Resource                  client_operations.robot
Resource                  user_operations.robot

*** Test cases***
Test get total of clients
    Get the total of clients
    
Test create a new client
    Create a client  

Test get all clients
    Get all clients
    
Test get id from last client
    Get id of last created client
    
Test get specific client from id
    Get specific client from id   
    
    
Test create and delete client
    Delete client     
   
   
Test create and update client
    Update client   
    
    
Test
    Create client for update    