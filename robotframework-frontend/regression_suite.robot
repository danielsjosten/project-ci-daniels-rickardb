*** Settings ***
Library                                                               OperatingSystem
Library                                                               Selenium2Library
Library                                                               String

Resource                                                              ./pages-and-keywords/testsetup_and_teardown.robot
Resource                                                              ./pages-and-keywords/page_login.robot
Resource                                                              ./pages-and-keywords/page_dashboard.robot
Resource                                                              ./pages-and-keywords/page_client.robot
Resource                                                              ./pages-and-keywords/page_bedroom.robot
Resource                                                              ./pages-and-keywords/page_user.robot
Resource                                                              ./keywords/completeSteps_Keywords.robot
Resource                                                              ./keywords/specificActions_Keywords.robot
Resource                                                              ./variables/baseVariables.robot
Resource                                                              ./variables/createAClientVariables.robot
Resource                                                              ./variables/createAReservationVariables.robot
Resource                                                              ./variables/editAReservationVariables.robot
Resource                                                              ./variables/login_logoutVariables.robot
Resource                                                              ./variables/titleVariables.robot

Test Setup                                                            Setup
Test Teardown                                                         Teardown



*** Test Cases ***

Create a New Client
    performLogin
    createNewClient
    Perform Logout

#Create New Reservation     #--- BROKEN because of bug in the system
 #   performLogin
  #  createNewReservation
   # performLogout
    
#Edit a Reservation         #--- BROKEN because of bug in the system
 #   performLogin
  #  editReservation
   # performLogout
    
Test Case Valid Login And Logout
                                                                      Test Case Valid Login
                                                                      Perform Logout


Test Case Invalid Login
                                                                      Test Case Invalid Login

Assert that the dashboard-links are working
                                                                      Test Case Valid Login
                                                                      Click dashboard link bedrooms
                                                                      Click dashboard link bills
                                                                      Click dashboard link clients
                                                                      Click dashboard link reservations
                                                                      Perform Logout


Create new client and delete
                                                                      Test Case Valid Login
                                                                      click left-link client
                                                                      click create new client
                                                                      Fill in credentials for client and save
                                                                      Delete client that was created
                                                                      Perform Logout


Test create new Bedroom and delete
                                                                      Test Case Valid Login
                                                                      Click left-link bedroom
                                                                      Click create new bedroom
                                                                      Fill in the credentials for the room
                                                                      Delete the room that was created
                                                                      Perform Logout





Test Check if a specific client exists in the client list
                                                                      Test Case Valid Login
                                                                      Click left-link client
                                                                      Check if client is in clientlist
                                                                      Perform Logout


Create client Daniel
                                                                      Test Case Valid Login
                                                                      Click left-link client
                                                                      Click create new client
                                                                      Create client Daniel
                                                                      Perform Logout


#This testcase depends on the one above, since there needs to be a
#client with name Daniel for the creation of the user
Test create new user and delete
                                                                      Test Case Valid Login
                                                                      Click left-link user
                                                                      Click create new user
                                                                      Check that the first dropdown is set as admin
                                                                      Fill in the user credentials
                                                                      Delete the user that was created
                                                                      Perform Logout


Delete client Daniel
                                                                      Test Case Valid Login
                                                                      Click left-link client
                                                                      Delete client Daniel from list
                                                                      Perform Logout



