*** Settings ***
Library                                Collections
Resource                               client_operations.robot
Resource                               user_operations.robot
Resource                               bedroom_operations.robot

*** Test cases***
#Client
Test get total of clients
                                       Get the total of clients

Test create a new client
                                       Create a client

Test get all clients
                                       Get all clients

#Test get id from last client
#                                      Get id of last created client

Test get specific client from id
                                       Get specific client from id


Test create and delete client
                                       Delete client


Test create and update client
                                       Update client

#Bedroom
Get bedrooms
                                       Get all bedrooms

Test create new bedroom
                                       Create new bedroom

Test get last bedroom from database
                                       Get specific bedroom from id


Test Update bedroom
                                       Update previously created bedroom

Test Delete last created bedroom
                                       Delete bedroom


#User
Get all users
                                       Get All Users

Get total of users
                                       Get Total Of Users

Create a user
                                       Create A User

Update a user
                                       Update A User

Delete a user
                                       Delete A User

