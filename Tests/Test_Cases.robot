*** Settings ***
Library        SeleniumLibrary  
Library        OperatingSystem
Library        XML
Resource       ../Pages/Page_Login.robot
Resource       ../Pages/Page_Profile.robot
Resource       ../Actions/Actions.robot
Test Teardown  Delete All and Close Browser

*** Variables ***
${URL}                https://candidate-qa-test.dev.platform.compono.dev/
${username}           beatricedeguzman23@gmail.com
${password}           Be@102392
${resumepath}         ${CURDIR}/../TestData/Beatrice_CV.pdf
${invalidresumepath}  ${CURDIR}/../TestData/Zoom.jpeg 

*** Test Cases ***
Upload with invalid Resume for the first time
  [Tags]  Negative TC
  ${Normal_resumepath}  Normalize Path    ${invalidresumepath}
  Open Website and Login User  ${URL}  ${username}  ${password}
  Element Text Should Be       ${PrefillLabel}  Profile prefill is on${\n}Prefill my profile with information extracted from my CV
  Choose File                  ${UploadButtonModal}  ${Normal_resumepath}
  Element Should Be Visible    ${UploadFail}
  Click Element                ${CloseButton} 
  Element Should Not Be Visible    ${DeleteCVButton}

Upload with valid resume for the first time with Prefill OFF
  [Tags]  Positive TC
  ${Normal_resumepath}  Normalize Path    ${resumepath}
  Open Website and Login User  ${URL}  ${username}  ${password}
  Click Element                ${PrefillRadio}  
  Element Text Should Be       ${PrefillLabel}  Profile prefill is off${\n}Prefill my profile with information extracted from my CV
  Choose File                  ${UploadButtonModal}  ${Normal_resumepath}
  Set Browser Implicit Wait    30s
  Element Should Be Visible    ${SuccessUploadOFF}   
  Click Element                ${CloseButton}   
  Element Should Be Visible    ${DeleteCVButton}
  Element Should Not Be Visible       ${NeedsReview}

Upload with valid Resume for the first time with Prefill ON
  [Tags]  Positive TC
  ${Normal_resumepath}  Normalize Path    ${resumepath}
  Open Website and Login User  ${URL}  ${username}  ${password}
  Element Text Should Be       ${PrefillLabel}  Profile prefill is on${\n}Prefill my profile with information extracted from my CV
  Choose File                  ${UploadButtonModal}  ${Normal_resumepath}
  Set Browser Implicit Wait    30s
  Element Should Be Visible    ${SuccessUploadON}
  Click Element                ${CloseButton}   
  Element Should Be Visible    ${DeleteCVButton}
  Element Text Should Be       ${NeedsReview}  Needs review 
