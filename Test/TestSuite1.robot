*** Settings ***
Library    SeleniumLibrary       

Suite Setup    Log    I'm inside suite setup    
Suite Teardown    Log    I'm inside suite teardown   
Test Setup    Log    I'm inside test setup
Test Teardown    Log    I'm inside test teardown    

Default Tags    Sanity
*** Test Cases ***
MyTC1
    [Tags]    Smoke
    Log    I'm inside MyTC1 
    
MyTC2
    Log   I'm inside MyTC2
    Set Tags    Regression
    # Remove Tags    Regression
    
MyTC3
    Log    I'm inside MyTC3    
    
    
MyFirstTest 
    Log    Hellow World...    
    
FirstSeleniumTest
    Open Browser    https://google.com    Chrome
    Maximize Browser Window
    Set Browser Implicit Wait    10
    Input Text    name=q    Automation step by step  
    Press Keys    name=q     ENTER
    #Click Button    name=btnK    
    Sleep    3    
    Close Browser
    Log    Test Completed    
    
SampleLoginTest
    [Documentation]    This is sample Login test
    Open Browser    https://opensource-demo.orangehrmlive.com/    Chrome
    Maximize Browser Window
    Set Browser Implicit Wait    10
    Input Text       id=txtUsername        Admin
    Input Text       id=txtPassword        admin123
    Click Button     id=btnLogin
    Click Element    id=welcome
    Click Element    link=Logout
    Close Browser
    Log              Test Completed  
    
LoginTestWithVariablesAndKeywords
    [Documentation]    This is sample Login test
    Open Browser    ${URL}   Chrome
    Maximize Browser Window
    Set Browser Implicit Wait    10
    LoginKW
    Click Element    id=welcome
    Click Element    link=Logout
    Close Browser
    Log              Test Completed                
    Log              This test was executed by %{username} and %{os}
       
*** Variables ***
${URL}     https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text       id=txtUsername        @{CREDENTIALS}[0]
    Input Text       id=txtPassword        &{LOGINDATA}[password]
    Click Button     id=btnLogin





