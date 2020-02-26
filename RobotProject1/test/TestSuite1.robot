*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    I am inside suite setup
Suite Teardown    Log    I am inside suite teardown
Test Setup    Log    I am inside test test setup
Test Teardown    Log    I am inside test teardown

Default Tags    sanity


*** Test Cases *** 
InputSearchButton
    [Tags]    google
    Open Browser                https://google.com    chrome
    Set Browser Implicit Wait   5
    Input Text                  name=q    Automation
    Press Keys                  name=q    ENTER
    # Click Button    name=btnK    
    Sleep                       2     
    Close Browser
    Log                         Test Complete    
    
LoginTest
    [Documentation]                   This is a simple login test
    Open Browser                      ${URL}    chrome
    Set Browser Implicit Wait         5 
    LoginKW                           @{CREDENTIALS}[0]    @{CREDENTIALS}[1]
    Set Browser Implicit Wait         5 
    Wait Until Element Is Visible     id=welcome 
    Click Element                     id=welcome   
    Click Link                        link=Logout
    Close Browser
    Log                               Test completed
    Log                               This test was executed by %{username} on %{os}
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/ 
@{CREDENTIALS}    admin    admin123
&{LOGINDATA}    username=admin    password=admin123

*** Keywords ***
LoginKW
    [Arguments]    ${username}    ${password}
    Input Text                        id=txtUsername    ${username}
    Input Password                    id=txtPassword    ${password}
    # Input Password                    id=txtPassword    &{LOGINDATA}[password]
    Click Button                      id=btnLogin
    