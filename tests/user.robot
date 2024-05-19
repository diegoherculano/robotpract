*** Settings ***
Documentation       User Scenary

Library             RequestsLibrary
Library             JSONSchemaLibrary
Library             FakerLibrary


*** Variables ***
${BASE_URL}         https://serverest.dev
${USERS_SCHEMA}     users.json


*** Test Cases ***
GET Users
    ${RESPONSE}    GET    ${BASE_URL}/usuarios
    Should Be Equal As Strings    ${RESPONSE.status_code}    200
    Validate Json    ${USERS_SCHEMA}    ${RESPONSE.json()}

POST User
    ${EMAIL_FAKE}    FakerLibrary.Email
    ${HEADERS}    Create Dictionary    Content-Type=application/json
    ${JSON}    Create Dictionary
    ...    nome=Douglas Araujo
    ...    email=${EMAIL_FAKE}
    ...    password=12332asdads
    ...    administrador=true
    ${RESPONSE}    POST    ${BASE_URL}/usuarios    headers=${HEADERS}    json=${JSON}
    Should Be Equal As Strings    ${RESPONSE.status_code}    201
