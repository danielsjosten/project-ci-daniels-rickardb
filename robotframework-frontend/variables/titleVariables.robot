*** Settings ***
Library                                       DateTime
Library                                       Selenium2Library
Library                                       FakerLibrary
Library                                       String
Resource                                      ../keywords/completeSteps_Keywords.robot
Resource                                      ../keywords/specificActions_Keywords.robot
Resource                                      ../variables/baseVariables.robot
Resource                                      ../variables/createAClientVariables.robot
Resource                            	      ../variables/createAReservationVariables.robot
Resource                                      ../variables/editAReservationVariables.robot
Resource                                      ../variables/login_logoutVariables.robot

*** Variables ***
#Title variables
${reservation_title}                           List
${create_new_reservation_title}                Create New Hotel Reservation
${edit_reservation_title}                      Edit Hotel Reservation
${login_pg_title}                              Hotel Accomodation - login page
${client_title}                                List
${newClient_title}                             Create New Client
${create_new_client_clientCreatedTitle}        View
