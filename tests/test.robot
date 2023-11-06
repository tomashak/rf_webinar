*** Settings ***
Documentation  Tohle je popis nasi suity, link do JIRA, kontakt, dulezite parametry,
...            tady je druhy radek dokumentace
...            treti radek
Library  SeleniumLibrary
#Resource  mainpage.resource
Test Setup  Nas start
Test Teardown  Close Browser

*** Variables ***
${URL}=  https://automationexercise.com/products
${BROWSER}=  chrome
#xpaths
${input_search}=  //input[@id="search_product"]
${button_search}=  //button[@id="submit_search"]
${page_title}=  //h2[contains(@class,"title")]

*** Keywords ***
Nas start
    [Documentation]  Vlastni keyword pro otevreni browseru a maximalizaci
    Open Browser  ${URL}  browser=${BROWSER}
    Maximize Browser Window

Vyhledej
    [Documentation]  Vyhleda zadane slovo
    [Arguments]  ${cohledat}
    Wait Until Element Is Visible  ${input_search}
    Capture Page Screenshot
    Input Text  ${input_search}  ${cohledat}
    Log  Zadal jsem neco do policka
    Click Element  ${button_search}    #klik na lupu

Zkontroluj
    [Documentation]  Zkontroluje ze se slovo vyhledalo
    [Arguments]  ${cokontrolovat}
    Wait Until Element Contains  ${page_title}  SEARCHED PRODUCTS  timeout=5s
    Page Should Contain  text=${cokontrolovat}
    Location Should Contain  expected=${cokontrolovat}
    Sleep  2s


*** Test Cases ***
Nas prvni TC
    [Documentation]  toto je dokumentace TC, zase ID, varovani apod
    ...              druhy radek    
    Vyhledej  cohledat=Top
    Zkontroluj  cokontrolovat=Top
