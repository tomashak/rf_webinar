*** Variables ***
${input_search}=  //input[@id="search_product"]
${button_search}=  //button[@id="submit_search"]

*** Keywords ***
Vyhledej
    [Documentation]  Vyhleda zadane slovo
    [Arguments]  ${cohledat}
    Wait Until Element Is Visible  ${input_search}
    Capture Page Screenshot
    Input Text  ${input_search}  ${cohledat}
    Log  Zadal jsem neco do policka
    Click Element  ${button_search}    #klik na lupu