*** Settings ***
Library                                       DateTime
Library                                       Selenium2Library
Library                                       FakerLibrary
Library                                       String
Resource                                      ../keywords/completeSteps_Keywords.robot
Resource                                      ../keywords/specificActions_Keywords.robot
Resource                                      ../variables/baseVariables.robot
Resource                                      ../variables/createAClientVariables.robot
Resource                                      ../variables/editAReservationVariables.robot
Resource                                      ../variables/login_logoutVariables.robot
Resource                                      ../variables/titleVariables.robot

*** Variables ***
#Create a Reservation variables
${menu_reservation}                            xpath=//*[@id="side-menu"]/li[6]/a
${create_new_reservation_button}               xpath=//*[@id="j_idt50"]/a[1]
${entryDate_location}                          id=entryDate
${exitDate_location}                           id=exitDate
${reservation_bedroom_dropdown}                id=bedroomId
${reservation_client_dropdown}                 id=clientId
${reservation_status_dropdown}                 id=reservationStatusId
${reservation_save_button}                     xpath=//*[@id="j_idt50"]/a[1]
${reservation_error_message}                   xpath=//*[@id="messagePanel"]/table/tbody/tr/td
${reservation_table}                           xpath=//*[@id="j_idt49"]/table
