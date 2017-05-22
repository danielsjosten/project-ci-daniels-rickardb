*** Settings ***
Library                                       DateTime
Library                                       Selenium2Library
Library                                       FakerLibrary
Library                                       String
Resource                                      ../keywords/completeSteps_Keywords.robot
Resource                                      ../keywords/specificActions_Keywords.robot
Resource                                      ../variables/createAClientVariables.robot
Resource                           	          ../variables/createAReservationVariables.robot
Resource                                      ../variables/editAReservationVariables.robot
Resource                                      ../variables/login_logoutVariables.robot
Resource                                      ../variables/titleVariables.robot

*** Variables ***
#Base Variables
${chromedriverPath}                            /usr/local/bin/chromedriver
${baseUrl}                                     http://localhost:8080/hotel/faces/login/login.xhtml
${chromeBrowser}                               chrome     
${driverName}                                  webdriver.chrome.driver     
${username}                                    marc
${password}                                    1010
