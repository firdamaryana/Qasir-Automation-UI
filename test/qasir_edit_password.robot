*** Settings ***
Documentation           Qasir Technical Test
Resource                ${EXECDIR}/keyword/qasir_login.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            disabled
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack

*** Variables ***
${csv-login}            ${EXECDIR}/csv/qasir_edit_password.csv

*** Test Cases ***
Positive - Edit Password Qasir
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
        WHEN Edit Profile - User input old password, new password, and confirm password     ${data_dict.old_password}       ${data_dict.new_password}        ${data_dict.confirm_password}
        AND User clicks ganti pin button
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='0'      THEN display message success edit password      ${data_dict.expected_display}
        Close Browser
    END