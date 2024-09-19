*** Settings ***
Library        SeleniumLibrary 
Resource       ../Pages/Page_Login.robot
Resource       ../Pages/Page_Profile.robot

*** Keywords ***
Open Website and Login User
  [Arguments]  ${URL}  ${username}  ${password}
  Open Browser                 ${URL}  googlechrome
  Maximize Browser Window
  Set Browser Implicit Wait    10
  Input Text                   ${UserInput}  ${username}
  Input Password               ${PassInput}  ${password}
  Click Element                ${LoginButton}
  Set Browser Implicit Wait    30
  Element Should Be Visible    ${ModalHeader}  Upload CV / Resume

Delete CV
  Reload Page
  Click Element  ${DeleteCVbutton}
  Alert Should Be Present  Do you want to delete this copy of your CV?  ACCEPT 
  Close Browser

Delete CV and Prefill
  Reload Page
  Click Element  ${DeleteCVbutton}
  Alert Should Be Present  Do you want to delete this copy of your CV?  ACCEPT 
  Go To   https://candidate-qa-test.dev.platform.compono.dev/profile/experience-and-skills
  ${CountToDelete}  Get Element Count  ${DeleteButton}
  ${CountToDelete}  Convert To Integer    ${CountToDelete}
  FOR    ${i}    IN RANGE    ${CountToDelete}
      Click Button   ${DeleteButton}
      Handle Alert   ACCEPT  30
      Sleep  10s
      Log    ${i}
  END 
  Go To  https://candidate-qa-test.dev.platform.compono.dev/profile/qualifications
  ${CountToDelete}  Get Element Count  ${DeleteButton}
  ${CountToDelete}  Convert To Integer    ${CountToDelete}
  FOR    ${i}    IN RANGE    ${CountToDelete}
      Click Button    ${DeleteButton}
      Handle Alert   ACCEPT  30
      Sleep    10s
      Log    ${i}
  END
  Close Browser

Delete All and Close Browser
  ${IsDeleteCVButtonVisible}=  Run Keyword And Return Status  Element Should Be Visible  ${DeleteCVButton}
  ${IsNeedsReviewVisible}=  Run Keyword And Return Status    Element Should Be Visible    ${NeedsReview}
  Run Keyword If  '${IsDeleteCVButtonVisible}' == 'False' and '${IsNeedsReviewVisible}' == 'False'
  ...    Close Browser
  ...  ELSE IF  '${IsDeleteCVButtonVisible}' == 'True' and '${IsNeedsReviewVisible}' == 'False'
  ...    Delete CV
  ...  ELSE   
  ...    Delete CV and Prefill