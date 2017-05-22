*** Settings ***
Resource                              ../keywords/completeSteps_Keywords.robot
Resource                              ../keywords/specificActions_Keywords.robot
Resource                              ../variables/baseVariables.robot
Resource                              ../variables/createAClientVariables.robot
Resource                              ../variables/createAReservationVariables.robot
Resource                              ../variables/editAReservationVariables.robot
Resource                              ../variables/login_logoutVariables.robot
Resource                              ../variables/titleVariables.robot
Library                               Selenium2Library
Library                               OperatingSystem

Test setup                            Setup  
Test teardown                         Teardown

*** Test cases ***

#All Test cases only calls on Keywords, within these Keywords are step-by-step methods.
#All these keywords are stored in keywords folder.

Create a New Client
    performLogin
    createNewClient
    performLogout
      
#Create New Reservation
 #   performLogin
  #  createNewReservation
   # performLogout
    
#Edit a Reservation
 #   performLogin
  #  editReservation
   # performLogout
 
     