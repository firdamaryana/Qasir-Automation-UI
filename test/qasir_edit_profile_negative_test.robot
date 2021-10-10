*** Settings ***
Documentation           Qasir Technical Test
Resource                ${EXECDIR}/keyword/qasir_login.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            disabled
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack

*** Variables ***
${csv-login}            ${EXECDIR}/csv/qasir_edit_profile_negative_test.csv

*** Test Cases ***
Negative - Update Profile
    [Tags]              qasir
    ${csv}=             Get CSV Data       ${csv-login}
    FOR       ${i}      IN RANGE    ${csv.row_number}
        &{data_dict}=   Create Key-Value Pair from The Read CSV File      ${csv.data}    ${i+1}    ${csv.column_number}
        Log   Test Description: ${data_dict.test_number}_${data_dict.test_type}_${data_dict.test_desc}
        GIVEN User opens Qasir
        AND Edit Profile - User inputs hp and password
        AND User clicks masuk button
        AND User clicks outlet button
        AND User clicks profile button
        WHEN Edit Profile - User inputs First name, Last Name, hp, email, and refferal code, old password, new password, and confirmation password     ${data_dict.first_name}       ${data_dict.last_name}        ${data_dict.hp}     ${data_dict.email}      ${data_dict.refferal_code}      ${data_dict.old_password}       ${data_dict.new_password}       ${data_dict.confirmation_password}
        AND User clicks ganti pin button
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='0'      THEN display message error first name edit profile      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='1'      THEN display message error hp alphabet edit profile      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='2'      THEN display message error hp 0 edit profile      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='3'      THEN display message error invalid old pin angka      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='4'      THEN display message error wrong combination      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='5'      THEN display message error wrong combination      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='6'      THEN display message error wrong combination      ${data_dict.expected_display}
        Close Browser
    END