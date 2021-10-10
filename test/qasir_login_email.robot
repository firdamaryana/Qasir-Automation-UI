*** Settings ***
Documentation           Qasir Technical Test
Resource                ${EXECDIR}/keyword/qasir_login.robot
Library                 SeleniumLibrary     timeout=60      run_on_failure=SeleniumLibrary.Capture Page Screenshot
Library                 csvLibrary.py
Default Tags            disabled
Force Tags              disabled
Test Teardown           Close Local Browser or Browser Stack

*** Variables ***
${csv-login}            ${EXECDIR}/csv/qasir_login_email.csv

*** Test Cases ***
Positive - Login Qasir
    [Tags]              qasir
    ${csv}=             Get CSV Data       ${csv-login}
    FOR       ${i}      IN RANGE    ${csv.row_number}
        &{data_dict}=   Create Key-Value Pair from The Read CSV File      ${csv.data}    ${i+1}    ${csv.column_number}
        Log   Test Description: ${data_dict.test_number}_${data_dict.test_type}_${data_dict.test_desc}
        GIVEN User opens Qasir
        AND User clicks email tab
        WHEN User inputs email and password      ${data_dict.email}       ${data_dict.password}
        AND User clicks masuk button
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_type}'=='P'      THEN the dashboard will be displayed
        Close Browser
    END

Positive - Menu Outlet Qasir
    [Tags]              qasir
    ${csv}=             Get CSV Data       ${csv-login}
    FOR       ${i}      IN RANGE    ${csv.row_number}
        &{data_dict}=   Create Key-Value Pair from The Read CSV File      ${csv.data}    ${i+1}    ${csv.column_number}
        Log   Test Description: ${data_dict.test_number}_${data_dict.test_type}_${data_dict.test_desc}
        GIVEN User opens Qasir
        AND User clicks email tab
        WHEN User inputs email and password      ${data_dict.email}       ${data_dict.password}
        AND User clicks masuk button
        AND User clicks outlet button
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_type}'=='P'      THEN the outlet dashboard will be displayed
        Close Browser
    END

Positive - Menu Profile Qasir
    [Tags]              qasir
    ${csv}=             Get CSV Data       ${csv-login}
    FOR       ${i}      IN RANGE    ${csv.row_number}
        &{data_dict}=   Create Key-Value Pair from The Read CSV File      ${csv.data}    ${i+1}    ${csv.column_number}
        Log   Test Description: ${data_dict.test_number}_${data_dict.test_type}_${data_dict.test_desc}
        GIVEN User opens Qasir
        AND User clicks email tab
        WHEN User inputs email and password      ${data_dict.email}       ${data_dict.password}
        AND User clicks masuk button
        AND User clicks outlet button
        AND User clicks profile button
        Run Keyword And Continue On Failure      Run Keyword If           '${data_dict.test_type}'=='P'      THEN the profile dashboard will be displayed
        Close Browser
    END