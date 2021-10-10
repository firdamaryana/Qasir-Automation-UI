*** Settings ***
Documentation           Qasir Technical Test
Resource                ${EXECDIR}/keyword/qasir_login.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            disabled
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack

*** Variables ***
${csv-login}            ${EXECDIR}/csv/qasir_negative_test.csv

*** Test Cases ***
Negative - Login Qasir
    [Tags]              qasir
    ${csv}=             Get CSV Data       ${csv-login}
    FOR       ${i}      IN RANGE    ${csv.row_number}
        &{data_dict}=   Create Key-Value Pair from The Read CSV File      ${csv.data}    ${i+1}    ${csv.column_number}
        Log   Test Description: ${data_dict.test_number}_${data_dict.test_type}_${data_dict.test_desc}
        GIVEN User opens Qasir
        WHEN User inputs hp and password      ${data_dict.hp}       ${data_dict.password}
        AND User clicks masuk button
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='0'      THEN display warning message hp      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='1'      THEN display warning message hp      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='2'      THEN display warning message hp      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='3'      THEN display warning message hp      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='4'      THEN display warning message hp      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='5'      THEN display warning message password      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='6'      THEN display warning message password      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='7'      THEN display warning message password      ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='8'      THEN display invalid login                 ${data_dict.expected_display}
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_number}'=='9'      THEN display invalid login                 ${data_dict.expected_display}
        Close Browser
    END