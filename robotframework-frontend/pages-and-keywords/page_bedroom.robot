*** Variables ***
${bedroom_pg_label}                        Create New Bedroom


${btn_create_new_bedroom}                  //*[@id="j_idt50"]/a[1]
${btn_save_bedroom}                        xpath=//a[text()='Save']
${btn_delete_bedroom}                      xpath=//a[text()='Delete']



#Form identifiers
${bedroom_form_description}                id=description
${bedroom_form_floor}                      id=floor
${bedroom_form_roomnumber}                 id=number
${bedroom_form_dailyPrice}                 id=priceDaily

#Dropdown Bedroom Status
${bedroom_form_dropdown_1}                 id=bedroomStatusId
${bedroom_form_dropdown_1_vacant}          //*[@id="bedroomStatusId"]/option[1]
${bedroom_form_dropdown_1_busy}            //*[@id="bedroomStatusId"]/option[2]
${bedroom_form_dropdown_1_reform}          //*[@id="bedroomStatusId"]/option[3]

#Dropdown Bedroom Type
${bedroom_form_dropdown_2}                 id=typeBedroomId
${bedroom_form_dropdown_2_classic_king}    //*[@id="typeBedroomId"]/option[2]
${bedroom_form_dropdown_2_classic_twin}    //*[@id="typeBedroomId"]/option[3]
${bedroom_form_dropdown_2_top_twin}        //*[@id="typeBedroomId"]/option[4]
${bedroom_form_dropdown_2_top_king}        //*[@id="typeBedroomId"]/option[5]
${bedroom_form_dropdown_2_wheelchair}      //*[@id="typeBedroomId"]/option[6]

#Form testdata
${bedroom_data_description}                testroom
${bedroom_data_floor}                      3
${bedroom_data_roomnumber}                 301
${bedroom_data_dailyPrice}                 5000

${bedroom_was_created}                     Bedroom was successfully created.
${bedroom_was_deleted}                     Bedroom was successfully deleted.

*** Keywords ***

Click create new bedroom
                                           Click Element                           ${btn_create_new_bedroom}

Fill in the credentials for the room
                                           Input Text                              ${bedroom_form_description}                ${bedroom_data_description}
                                           Input Text                              ${bedroom_form_floor}                      ${bedroom_data_floor}
                                           Input Text                              ${bedroom_form_roomnumber}                 ${bedroom_data_roomnumber}
                                           Input Text                              ${bedroom_form_dailyPrice}                 ${bedroom_data_dailyPrice}

                                           Click Element                           ${bedroom_form_dropdown_1}
                                           Wait Until Page Contains Element        ${bedroom_form_dropdown_1_busy}
                                           Click Element                           ${bedroom_form_dropdown_1_busy}

                                           Click Element                           ${bedroom_form_dropdown_2}
                                           Wait Until Page Contains Element        ${bedroom_form_dropdown_2_classic_king}
                                           Click Element                           ${bedroom_form_dropdown_2_classic_king}

                                           Click Element                           ${btn_save_bedroom}
                                           Wait Until Page Contains                ${bedroom_was_created}

Delete the room that was created
                                           Click Element                           ${btn_delete_bedroom}
                                           Wait Until Page Contains                ${bedroom_was_deleted}
                                           Log To Console                          ${bedroom_was_deleted}










