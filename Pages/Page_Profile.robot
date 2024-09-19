*** Variables ***    

${ProfileHeader}         //div[@class="Content-zupwss-0 cruslZ"and text()="Profile"]
${UploadButton}          //button[@data-testid="upload-cv-button"]
${NeedsReview}           //h3[@class="H3-sc-1f2idct-0 sc-gojNiO nSMOr" and text()="Experience and Skills"]//span
${DeleteCVbutton}        //h2[@class="sc-GMQeP kArsSQ"]

##Upload CV Modal
${ModalHeader}           //h3[@class="H3-sc-1f2idct-0 iQVOHt"]
${PrefillRadio}          //div[@class="sc-kPVwWT gZwsmE"]//input
${PrefillLabel}          //div[@class="sc-kPVwWT gZwsmE"]//label
${UploadButtonModal}     //input[@data-testid="upload-cv-input"]
${UploadFail}            //div[@class="sc-iujRgT DUXry"]

##Success Dialogue
${SuccessUploadON}       //p[@class="P-sc-1ninpix-0 gnGpAv" and text()="Your CV has been uploaded, and your profile has been prefilled!"]
${SuccessUploadOFF}      //p[@class="P-sc-1ninpix-0 gnGpAv" and text()="Success, your CV has been uploaded!"]
${CloseButton}           //*[local-name()='svg' and @class='CloseIconButton-sc-19wgu2s-0 cIsOEY']/*[local-name()='path']

##Experience and Skills page
${DeleteButton}          //button[span="Delete this item"]