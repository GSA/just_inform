# What Is Just Inform

Just Inform is a simple library to help parse the daily XML feed from [RegInfo.gov](http://www.reginfo.gov/).  

## Basic Usage

    # Install the gem
    gem install just_inform

    # Load IRB
    irb
    
    # Create a new parser instance (same as JustInform::Parser.new)
    parser = JustInform.new

    # Return an array with the sort value (cost) and InformationCollectionRequest objects
    parser.top(10, :cost)  => 
    [["33,672,000,000", U.S. Individual Income Tax Return], ["8,190,000,004", Rule 10b-10 Confirmation of Securities Transactions (17 C.F.R. 240.10b-10)], ["2,857,465,000", Exchange Act  Form 10-K], ["2,727,479,226", America Invents Act Section 10 Patent Fee Adjustments], ["1,801,830,000", Application for a U.S. Passport], ["1,300,147,200", ASSIST Database], ["1,280,341,567", Form SD], ["910,000,000", Online Application for Nonimmigrant Visa], ["791,160,764", Rules for Patent Maintenance Fees], ["772,798,833", Initial Patent Applications]]

You can also sort by burden hours (:burden) and number of responses (:responses).

## Public domain

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
