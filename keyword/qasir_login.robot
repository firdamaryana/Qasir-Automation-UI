*** Settings ***
Documentation           Qasir Technical Test
Resource                ${EXECDIR}/variable/qasir_login.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot

*** Keywords ***
GENERAL - Login Qasir
    [Arguments]         ${hp}       ${password}
    Given User opens Qasir
    When User inputs hp and password     ${hp}       ${password}
    And User clicks masuk button
    And the dashboard will be displayed

User opens Qasir
    SeleniumLibrary.Open Browser         https://www.qasir.id/sign-in       browser=Chrome
    Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_login_hp}
    SeleniumLibrary.Wait Until Element Is Visible          ${txt_login_password}

User inputs hp and password
    [Arguments]         ${hp}       ${password}
    Login - Input hp                ${hp}
    Login - Input Password          ${password}

User inputs email and password
    [Arguments]         ${email}       ${password}
    Login - Input email                ${email}
    Login - Input Password             ${password}

User clicks email tab
    SeleniumLibrary.Wait Until Element Is Visible           ${tab_email}
    SeleniumLibrary.Click Element                           ${tab_email}

User clicks masuk button
    SeleniumLibrary.Click Button                           ${btn_login_masuk}

the dashboard will be displayed
    SeleniumLibrary.Wait Until Element Is Visible          ${qasir_beranda}

User clicks outlet button
    SeleniumLibrary.Wait Until Element Is Visible          ${outlet_menu}
    SeleniumLibrary.Click Element                          ${outlet_menu}

the outlet dashboard will be displayed
    SeleniumLibrary.Wait Until Element Is Visible          ${outlet_qasir_name}
    SeleniumLibrary.Wait Until Element Is Visible          ${outlet_qasir_telepon}
    SeleniumLibrary.Wait Until Element Is Visible          ${outlet_qasir_lokasi}

User clicks profile button
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_profile}
    SeleniumLibrary.Click Element                          ${btn_profile}
    SeleniumLibrary.Wait Until Element Is Visible          ${profile_pengguna}
    SeleniumLibrary.Click Element                          ${profile_pengguna}

the profile dashboard will be displayed
    Scroll Element Into View                               ${profile_refferal_code}
    Scroll Element Into View                               ${profile_confirm_pin}
    SeleniumLibrary.Wait Until Element Is Visible          ${profile_old_pin}
    SeleniumLibrary.Wait Until Element Is Visible          ${profile_new_pin}
    SeleniumLibrary.Wait Until Element Is Visible          ${profile_confirm_pin}

display warning message hp
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_hp_text}          SeleniumLibrary.Get Text      ${warning_hp}
    Should Be Equal As Strings    ${warning_hp_text}          ${expected_display}

display warning message password
    [Arguments]         ${expected_display}
    Sleep               3s
    ${warning_password_text}        SeleniumLibrary.Get Text        ${warning_password}
    Should Be Equal As Strings      ${warning_password_text}        ${expected_display}

display invalid login
    [Arguments]         ${expected_display}
    Sleep               3s
    ${invalid_login_text}        SeleniumLibrary.Get Text        ${invalid_login}
    Should Be Equal As Strings      ${invalid_login_text}        ${expected_display}

Login - Input hp
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_login_hp}               ${input}

Login - Input email
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_login_email}            ${input}

Login - Input Password
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${txt_login_password}         ${input}

Edit Profile - User inputs hp and password
    SeleniumLibrary.Input Text          id:sign-in-phonenumber                       8561736527
    SeleniumLibrary.Input Text          id:password                 123456

Edit Profile - User inputs First name, Last Name, hp, email, and refferal code
    [Arguments]         ${profile_first_name}       ${profile_last_name}        ${profile_phone_number}        ${profile_email}     ${profile_refferal_code}
    Edit Profile - Input First name                ${profile_first_name}
    Edit Profile - Input Last Name                 ${profile_last_name}
    Edit Profile - Input Hp                        ${profile_phone_number}
    Edit Profile - Input Email                     ${profile_email}
    Edit Profile - Input Refferal Code             ${profile_refferal_code}

Edit Profile - User inputs First name, Last Name, hp, email, and refferal code, old password, new password, and confirmation password
    [Arguments]         ${profile_first_name}       ${profile_last_name}        ${profile_phone_number}        ${profile_email}     ${profile_refferal_code}
    ...                 ${old_password}             ${new_password}             ${confirmation_password}
    Edit Profile - Input First name                ${profile_first_name}
    Edit Profile - Input Last Name                 ${profile_last_name}
    Edit Profile - Input Hp                        ${profile_phone_number}
    Edit Profile - Input Email                     ${profile_email}
    Edit Profile - Input Refferal Code             ${profile_refferal_code}
    Edit Profile - Input Old Password              ${profile_old_pin}
    Edit Profile - Input New Password              ${profile_new_pin}
    Edit Profile - Input Confirm Password          ${profile_confirm_pin}

Edit Profile - Input First name
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${profile_first_name}            ${input}

Edit Profile - Input Last name
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${profile_last_name}             ${input}

Edit Profile - Input Hp
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${profile_phone_number}          ${input}

Edit Profile - Input Email
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${profile_email}                 ${input}

Edit Profile - Input Refferal Code
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${profile_refferal_code}         ${input}

User clicks simpan button
    SeleniumLibrary.Click Button       ${btn_profile_save}

display message success edit profile
    [Arguments]         ${expected_display}
    Sleep               3s
    ${message_success_text}        SeleniumLibrary.Get Text        ${message_success}
    Should Be Equal As Strings      ${message_success_text}        ${expected_display}

display message error first name edit profile
    [Arguments]         ${expected_display}
    Sleep               3s
    ${profile_warning_first_name_text}        SeleniumLibrary.Get Text        ${profile_warning_first_name}
    Should Be Equal As Strings      ${profile_warning_first_name_text}        ${expected_display}

display message error hp 0 edit profile
    [Arguments]         ${expected_display}
    Sleep               3s
    ${profile_warning_hp_0_text}        SeleniumLibrary.Get Text        ${profile_warning_hp_0}
    Should Be Equal As Strings      ${profile_warning_hp_0_text}        ${expected_display}

display message error hp alphabet edit profile
    [Arguments]         ${expected_display}
    Sleep               3s
    ${profile_warning_hp_alphabet_text}        SeleniumLibrary.Get Text        ${profile_warning_hp_alphabet}
    Should Be Equal As Strings      ${profile_warning_hp_alphabet_text}        ${expected_display}

display message error refferal code edit profile
    [Arguments]         ${expected_display}
    Sleep               3s
    ${profile_warning_refferal_code_text}        SeleniumLibrary.Get Text        ${profile_warning_refferal_code}
    Should Be Equal As Strings      ${profile_warning_refferal_code_text}        ${expected_display}

display message error invalid old pin
    [Arguments]         ${expected_display}
    Sleep               3s
    ${profile_warning_invalid_old_pin_text}        SeleniumLibrary.Get Text        ${profile_warning_invalid_old_pin}
    Should Be Equal As Strings      ${profile_warning_invalid_old_pin_text}        ${expected_display}

display message error invalid old pin angka
    [Arguments]         ${expected_display}
    Sleep               3s
    ${profile_warning_invalid_old_pin_text_1}        SeleniumLibrary.Get Text        ${profile_warning_invalid_old_pin_1}
    Should Be Equal As Strings      ${profile_warning_invalid_old_pin_text_1}        ${expected_display}

display message error wrong combination
    [Arguments]         ${expected_display}
    Sleep               3s
    ${profile_warning_wrong_combination_text}        SeleniumLibrary.Get Text        ${profile_warning_wrong_combination}
    Should Be Equal As Strings      ${profile_warning_wrong_combination_text}        ${expected_display}

display message error invalid new pin
    [Arguments]         ${expected_display}
    Sleep               3s
    ${profile_warning_invalid_new_pin_text}        SeleniumLibrary.Get Text        ${profile_warning_invalid_new_pin}
    Should Be Equal As Strings      ${profile_warning_invalid_new_pin_text}        ${expected_display}

Edit Profile - User input old password, new password, and confirm password
    [Arguments]         ${profile_old_pin}          ${profile_new_pin}          ${profile_confirm_pin}
    Edit Profile - Input Old Password              ${profile_old_pin}
    Edit Profile - Input New Password              ${profile_new_pin}
    Edit Profile - Input Confirm Password          ${profile_confirm_pin}

Edit Profile - Input Old Password
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${profile_old_pin}                 ${input}

Edit Profile - Input New Password
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${profile_new_pin}                 ${input}

Edit Profile - Input Confirm Password
    [Arguments]         ${input}
    SeleniumLibrary.Input Text    ${profile_confirm_pin}             ${input}

User clicks ganti pin button
    SeleniumLibrary.Click Button       ${btn_ganti_pin}

display message success edit password
    [Arguments]         ${expected_display}
    Sleep               3s
    ${message_success_text}        SeleniumLibrary.Get Text        ${message_success}
    Should Be Equal As Strings      ${message_success_text}        ${expected_display}

User clicks logout button
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_profile}
    SeleniumLibrary.Click Element                          ${btn_profile}
    SeleniumLibrary.Wait Until Element Is Visible          ${btn_logout}
    SeleniumLibrary.Click Element                          ${btn_logout}
