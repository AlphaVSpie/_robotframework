*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}      https://scouts-test.futbolkolektyw.pl/login
${BROWSER}        Chrome
${SIGNINBUTTON}   xpath =//*[@id="__next"]/form/div/div[2]/button/span[1]
${EMAILINPUT}     xpath =//*[@id="login"]
${PASSWORDINPUT}  xpath =//*[@id="password"]
${PAGELOGO}       xpath =//*[@id="__next"]/div[1]/main/div[3]/div[1]/div/div[1]
${SINGOUTBUTTON}  xpath =//*[@id="__next"]/div[1]/div/div/div/ul[2]/div[2]/div[2]/span
${DASHBOARD URL}  https://scouts-test.futbolkolektyw.pl/
${VALIDATIONSINGIN}  xpath =//*[@id="__next"]/form/div/div[1]/div[3]/span
${REMINDPASSWORD}   xpath=//*[@id="__next"]/form/div/div[1]/a
${REMINDEMAILPASS}  xpath =//*[@id="__next"]/div[1]/div/div[1]/div/div/input
${SENDBUTTON}   xpath =//*[@id="__next"]/div[1]/div/div[2]/button/span
${SENTBOXMESSAGE}   xpath =//*[@id="__next"]/div[2]/div
${ADDPLAYER}     xpath =//span[normalize-space()='Add player']
${ADDPLAYERPAGE URL}   https://scouts-test.futbolkolektyw.pl/en/players/add
${ADDLANGUAGEBUTTON}   xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[15]/button
${LANGUAGEBOX}    xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[15]/div/div/div
${MAINPAGEBUttoN}   xpath = //*[@id="__next"]/div[1]/div/div/div/ul[1]/div[1]/div[2]/span
${NAMEFIELD}     xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[2]/div/div/input
${SURNAMEFIELD}   xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[3]/div/div/input
${AGEFIELD}     xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[7]/div/div/input
${MAINPOSITITONFIELD}   xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[11]/div/div/input
${DISTRICK}      xpath =//*[@id="mui-component-select-district"]
${OPOLE}    xpath =//*[@id="menu-district"]/div[3]/ul/li[8]
${LAnGUAGESFIELD}   xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[15]/div/div/div/input
${SUBMITNEWPL}     xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[3]/button[1]/span[1]
${EMPTYFIELDSMESSSAGE}   xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[3]/div/p
${EMAILPLAYER}    xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[1]/div/div/input
${PHONE}     xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[4]/div/div/input
${WEIGTH}   xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[5]/div/div/input
${HEIGHT}   xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[6]/div/div/input
${LEG}    xpath =//*[@id="mui-component-select-leg"]
${RIGHTLEG}   xpath =//*[@id="menu-leg"]/div[3]/ul/li[1]
${CLUB}   xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[9]/div/div/input
${LEVEl}  xpath =//*[@id="__next"]/div[1]/main/div[2]/form/div[2]/div/div[10]/div/div/input
${CONFIRMATIONMESS}    xpath =//*[@id="__next"]/div[2]/div
*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]   Close Browser

Sing out
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Dashboard wait
    Sign out
    Login Page
    [Teardown]    Close Browser
Negative login
    Open login page
    Type in email
    Type in password negative
    Click on the Submit button
    Validation message
    [Teardown]  Close Browser

Remind password
    Open Login Page
    Click Remind Password
    Type in emailremindpass
    Click Send button
    Sent message is visible
    [Teardown]    Close Browser
Add Player test
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click Add Player
    Add Player Page Uploaded
    [Teardown]    Close Browser
Add Language button
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click Add Player
    Add Player Page Uploaded
    Click Add Language
    Language is visible
    [Teardown]    Close Browser

Return to Main page test
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click Add Player
    Add Player Page Uploaded
    Click Main Page button
    [Teardown]    Close Browser

Empty required field test
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click Add Player
    Add Player Page Uploaded
    Type in name
    Click in surname
    Type in age
    Type in main position
    Click district
    Click Opole
    Click Add Language
    Type in Language
    Click submit
    Empty req fields message
    [Teardown]     Close Browser

New Player Creating Test
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert Dashboard
    Click Add Player
    Add Player Page Uploaded
    Type in email Field
    Type In Name
    Type in Surname
    Type in Phone
    Type in weight
    Type in height
    Type In Age
    Click at leg
    Click right leg
    Type in Club
    Type in level
    Type In Main Position
    Click District
    Click Opole
    Click Add Language
    Type In Language
    Click submit
    Confirmation Message

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}   ${BROWSER}
    Title Should Be    Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   user07@getnada.com
Type in password
    Input Password   ${PASSWORDINPUT}   Test-1234
Click on the Submit button
    Click Element    ${SIGNINBUTTON}
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png
Dashboard wait
   Wait Until Location Is   ${DASHBOARD URL}
Sign out
   Click Element    ${SINGOUTBUTTON}
Login Page
   Wait Until Location Is  ${LOGIN URL}
Type in password negative
   Input Password    ${PASSWORDINPUT}   T0st-1294
Validation message
   Wait Until Element Is Visible   ${VALIDATIONSINGIN}
Click Remind Password
   Click Element    ${REMINDPASSWORD}
Type in emailremindpass
   Input Text    ${REMINDEMAILPASS}   user07@getnada.com
Click Send button
   Click Element    ${SENDBUTTON}
Sent message is visible
   Wait Until Element Is Visible   ${SENTBOXMESSAGE}
Click Add Player
   Click Element    ${ADDPLAYER}
Add Player Page uploaded
   Wait Until Location Is   ${ADDPLAYERPAGE URL}
   Title Should Be    Add player
Click Add Language
   Click Element    ${ADDLANGUAGEBUTTON}
Language is visible
   Wait Until Element Is Visible    ${LANGUAGEBOX}
Click Main Page button
   Click Element   ${MAINPAGEBUttoN}
Type in name
   Input Text    ${NAMEFIELD}   Don
Click in surname
   Click Element   ${SURNAMEFIELD}
Type in age
   Input Text    ${AGEFIELD}    26.07.1996
Type in main position
   Input Text    ${MAINPOSITITONFIELD}    Forward
Click district
   Click Element    ${DISTRICK}
Click Opole
   Click Element    ${OPOLE}
Type in Language
   Input Text   ${LAnGUAGESFIELD}    English
Click submit
   Click Element    ${SUBMITNEWPL}
Empty req fields message
   Wait Until Element Is Visible    ${EMPTYFIELDSMESSSAGE}
Type in email Field
   Input Text   ${EMAILPLAYER}    user07@getnada.com
Type in Surname
   Input Text    ${SURNAMEFIELD}     Omarov
Type in Phone
   Input Text    ${PHONE}    3857572298
Type in weight
   Input Text    ${WEIGTH}    98
Type in height
   Input Text    ${HEIGHT}    190
Click at leg
   Click Element    ${LEG}
Click right leg
   Click Element    ${RIGHTLEG}
Type in Club
   Input Text    ${CLUB}     REAL OLIMP
Type in level
   Input Text    ${LEVEl}    PRO
Confirmation message
   Wait Until Element Is Visible    ${CONFIRMATIONMESS}