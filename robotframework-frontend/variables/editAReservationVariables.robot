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
Resource                                      ../variables/login_logoutVariables.robot
Resource                                      ../variables/titleVariables.robot

*** Variables ***
#Edit a Reservation variables
${edit_reservation_button_lastIndex}           xpath=//*[@id="j_idt49"]/table/tbody/tr[5]/td[8]/a[2]
${edit_reservation_successful}                 xpath=//*[@id="messagePanel"]/table/tbody/tr/td
${edit_showAllReservation_button}              xpath=//*[@id="j_idt50"]/a[4]
${edit_reservation_entryDate_location}         xpath=//*[@id="j_idt49"]/table/tbody/tr[5]/td[3]
