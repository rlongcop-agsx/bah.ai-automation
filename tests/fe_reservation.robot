*** Settings ***
Resource               ../source/bahai_app.robot
Resource               ../source/common.robot
Resource               ../data/variables/public_variables.robot
Resource               ../data/variables/locators.robot
Test Setup             Main Web Setup    
...                    ${BROWSER}
Test Teardown          Main Web Teardown

# robot -d logs/chrome -v BROWSER:chrome tests
# robot -d logs/firefox -v BROWSER:firefox tests
# robot -d logs/edge -v BROWSER:edge tests

*** Keywords ***
Login to Bahai App
    bahai_app.Navigate to the login page    ${LOGIN_PAGE}    
    ...                                     ${login_form}
    bahai_app.Enter credential              ${login_email_field}    
    ...                                     ${EMAIL}
    bahai_app.Enter credential              ${login_password_field}    
    ...                                     ${PASSWORD}
    bahai_app.Click button                  ${login_btn}
    bahai_app.Verify element displayed      ${profile_icon}

*** Test Cases ***
Test Case 1: Verify that the reserved now header is displayed.
    [Documentation]    The reserve property header should be displayed.
    [Tags]    RP-TC-002    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       Reservation Checkout

Test Case 2: Verify that the reservation amount is displayed.
    [Documentation]    The reservation amount should be displayed.
    [Tags]    RP-TC-003    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       ₱1,300,000

Test Case 3: Verify that the payment method is displayed.
    [Documentation]    The "Credit/Debit Card" should be displayed.
    [Tags]    RP-TC-004    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       Credit/Debit Card

Test Case 4: Verify that the Property Name is displayed.
    [Documentation]    The Property Name should be displayed.
    [Tags]    RP-TC-006    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       3BR Unit at The Trion Towers
    
Test Case 5: Verify that the Property Address is displayed.
    [Documentation]    The Property Address should be displayed.
    [Tags]    RP-TC-007    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       BGC, Taguig City

Test Case 6: Verify that the Property Type is displayed.
    [Documentation]    The Property Type should be displayed.
    [Tags]    RP-TC-009    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       Bedroom Unit

Test Case 7: Verify that the Property Developer is displayed.
    [Documentation]    The Property Developer should be displayed.
    [Tags]    RP-TC-010    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       Robinsons Land Corporation

Test Case 8: Verify that the Property Price is displayed.
    [Documentation]    The Property Price should be displayed.
    [Tags]    RP-TC-011    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       ₱26,000,000

Test Case 9: Verify that the Reservation Fee is displayed.
    [Documentation]    The Reservation Fee should be displayed.
    [Tags]    RP-TC-012    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       ₱1,300,000

Test Case 10: Verify that the Reservation Payment Info is displayed.
    [Documentation]    The Reservation Payment Info should be displayed.
    [Tags]    RP-TC-013    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       This amount will secure the property for 30 days. A reservation specialist will reach out to discuss the next steps of the purchase process.


Test Case 11: Verify that the Reservation Payment Disclaimer is displayed.
    [Documentation]    The Reservation Payment Disclaimer should be displayed.
    [Tags]    RP-TC-014    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       Please note that your payment will be processed in USD. Prices shown in PHP are for reference and may vary with exchange rates.

Test Case 12: Verify that the Amount Due Now is displayed.
    [Documentation]    The Amount Due Now should be displayed.
    [Tags]    RP-TC-015    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       ₱1,300,000

Test Case 13: Verify that the payment terms and conditions can be viewed.
    [Documentation]    The payment terms and conditions should be viewable.
    [Tags]    RP-TC-016    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_modal}
    bahai_app.Validate text displayed       Payment Terms and Conditions
    bahai_app.Validate text displayed       Reservation Policy
    bahai_app.Validate text displayed       A non-refundable reservation fee is required to secure the property listing. This fee will be credited toward the total purchase price but will not be refunded under any circumstances, including cancellation by the buyer.
    bahai_app.Validate text displayed       Payment Processing
    bahai_app.Validate text displayed       All payments must be made through Bahai Deals' approved payment gateways. Although prices may be shown in Philippine Peso (PHP) for convenience, transactions are processed and charged in United States Dollars (USD) based on the prevailing exchange rate at the time of payment.
    bahai_app.Validate text displayed       Exchange Rates
    bahai_app.Validate text displayed       Exchange rates are determined at the time of the transaction and may vary depending on market conditions. Bahai Deals is not responsible for any differences caused by fluctuations in the exchange rate.
    bahai_app.Validate text displayed       Late Payments
    bahai_app.Validate text displayed       Payments must be completed within the timelines specified by the developer or seller. Late payments may lead to penalties, cancellation of the reservation, or forfeiture of any rights to the reserved property.
    bahai_app.Validate text displayed       Final Payment
    bahai_app.Validate text displayed       Buyers are required to complete the full payment according to the agreed schedule. Failure to do so may result in cancellation of the sale and forfeiture of the reservation fee.
    bahai_app.Validate text displayed       Refunds and Cancellations
    bahai_app.Validate text displayed       Reservation fees are strictly non-refundable. If the buyer cancels, withdraws, or fails to complete the transaction, Bahai Deals and its sellers are under no obligation to refund any payments made. However, in cases where the seller defaults or if the property becomes unavailable, refunds may be considered on a case-by-case basis.
    bahai_app.Validate text displayed       Taxes and Fees
    bahai_app.Validate text displayed       Any applicable taxes, transaction charges, and service fees are the responsibility of the buyer, unless otherwise stated.
    bahai_app.Validate text displayed       Dispute Resolution
    bahai_app.Validate text displayed       Payment disputes must be reported to Bahai Deals within 30 days from the date of the transaction. Each dispute will be reviewed carefully, but the reversal of completed transactions is not guaranteed.

Test Case 14: Verify that the "Back to property" text button is displayed.
    [Documentation]    The "Back to property" text button should be displayed.
    [Tags]    RP-TC-017    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       Back to Property

Test Case 15: Verify that the user can close the Reservation Checkout page.
    [Documentation]    The user should be able to close the Reservation Checkout page.
    [Tags]    RP-TC-018    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${back_btn}
    bahai_app.Validate text displayed       3BR Unit at The Trion Towers

Test Case 16: Verify that the Credit/Debit payment instruction is displayed.
    [Documentation]    The Credit/Debit payment instruction should be displayed.
    [Tags]    RP-TC-133    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Validate text displayed       You will be redirected to Stripe to complete your payment

Test Case 17: Verify that the Consent checkbox is displayed.
    [Documentation]    The Consent checkbox should be displayed.
    [Tags]    RP-TC-034    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Verify element displayed      ${consent_checkbox}

Test Case 18: Verify that the user can check the Consent checkbox.
    [Documentation]    The user should be able to check the Consent checkbox.
    [Tags]    RP-TC-035    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Validate checkbox             ${consent_checkbox}
    ...                                     checked

Test Case 19: Verify that the user can successfully navigate to the Stripe checkout page.
    [Documentation]    The user should be able to continue to the Stripe Checkout page.
    [Tags]    RP-TC-037    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Validate text displayed       3BR Unit at The Trion Towers

Test Case 20: Verify that the user's email is displayed.
    [Documentation]    The user's email should be displayed.
    [Tags]    RP-TC-023    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Validate text displayed       ${EMAIL}

Test Case 21: Verify that the Card Number field is displayed.
    [Documentation]    The Card Number field should be displayed.
    [Tags]    RP-TC-021    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Verify element displayed      ${card_number_field}

Test Case 22: Verify that the user can enter a Card Number.
    [Documentation]    The user should be able to enter a Card Number.
    [Tags]    RP-TC-022    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Enter credential              ${card_number_field}    
    ...                                     4242 4242 4242 4242
    bahai_app.Validate value displayed      ${card_number_field}
    ...                                     4242 4242 4242 4242

Test Case 23: Verify that the cardholder name field is displayed.
    [Documentation]    The cardholder name field should be displayed.
    [Tags]    RP-TC-025    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Verify element displayed      ${cardholder_name_field}

Test Case 24: Verify that the user can enter a Cardholder Name.
    [Documentation]    The user should be able to enter a Cardholder Name.
    [Tags]    RP-TC-026    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Enter credential              ${cardholder_name_field}    
    ...                                     John Doe
    bahai_app.Validate value displayed      ${cardholder_name_field}    
    ...                                     John Doe
    
Test Case 25: Verify that the Expiry Date field is displayed.
    [Documentation]    The Expiry Date field should be displayed.
    [Tags]    RP-TC-028    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Verify element displayed      ${expiry_date_field}

Test Case 26: Verify that the user can enter an Expiry Date.
    [Documentation]    The user should be able to enter an Expiry Date.
    [Tags]    RP-TC-029    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Enter credential              ${expiry_date_field}    
    ...                                     12 / 25
    bahai_app.Validate value displayed      ${expiry_date_field}    
    ...                                     12 / 25

Test Case 27: Verify that the CVC field is displayed.
    [Documentation]    The CVC field should be displayed.
    [Tags]    RP-TC-031    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Verify element displayed      ${cvc_field}

Test Case 28: Verify that the user can enter a CVC.
    [Documentation]    The user should be able to enter a CVC.
    [Tags]    RP-TC-032    
    ...       credit/debit
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com    
    bahai_app.Enter credential              ${cvc_field}    
    ...                                     123
    bahai_app.Validate value displayed      ${cvc_field}    
    ...                                     123

Test Case 29: Verify that the user is navigated to the Stripe's Consumer Terms of Service page.
    [Documentation]    The user should be navigated to the Stripe's Consumer Terms of Service page.
    [Tags]    RP-TC-024    
    ...       credit/debit    
    ...       reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Verify element displayed      ${payment_form}
    bahai_app.Click the Terms text link     Terms
    bahai_app.Switch to new tab             https://stripe.com/legal/consumer
    bahai_app.Validate text displayed       Consumer Terms of Service

Test Case 30: Verify that the user is navigated to the Stripe's Privacy Policy page.
    [Documentation]    The user should be navigated to the Stripe's Privacy Policy page.
    [Tags]                                  RP-TC-027    
    ...                                     credit/debit    
    ...                                     reserve
    Login to Bahai App
    bahai_app.Click button                  ${properties_nav}
    bahai_app.Click a Property              3BR Unit at The Trion Towers
    bahai_app.Click button                  ${reserve_btn}
    bahai_app.Click button                  ${consent_checkbox}
    bahai_app.Click button                  ${proceed_btn}
    bahai_app.Page URL Should Contain       checkout.stripe.com
    bahai_app.Verify element displayed      ${payment_form}
    bahai_app.Click the Privacy text link   Privacy
    bahai_app.Switch to new tab             https://stripe.com/privacy
    bahai_app.Validate text displayed       Privacy Policy
