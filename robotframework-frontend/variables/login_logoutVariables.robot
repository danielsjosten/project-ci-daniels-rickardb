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
Resource                                      ../variables/titleVariables.robot

*** Variables ***
#Login Form variables
${login_pg_label_login}                        Login
${login_pg_username_textfield}                 id=login
${login_pg_password_textfield}                 id=senha
${login_pg_btn_login}                          id=loginBtn

# Logout Form variables
${dashboard_pg_label_dashboard}                Dashboard
${logout_menu}                                 xpath=//a[@class='dropdown-toggle']
${logout_submenu}                              xpath=//i[@class='fa fa-sign-out fa-fw']

