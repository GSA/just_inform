# What Is Just Inform

Just Inform is a simple library to help parse the daily XML feed from [RegInfo.gov].  We needed a tool to help sort government forms based on burden hours, cost, and responses.

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

## Todo

* Add tests with 100% coverage
* Add ActiveRecord like finder methods (e.g. Parser.find_by_title('Passport'))
* Build into a Sinatra/Rails app that creates an API/webpage exhibiting the topX forms in gov by burden hours, cost, and response numbers.  This would be updated daily from the XML feed.

## License
[MIT License]

  [RegInfo.gov]: http://www.reginfo.gov
  [MIT License]: https://github.com/GSA-OCSIT/just_inform/blob/master/LICENSE.md
  [README]: https://github.com/GSA-OCSIT/just_inform/blob/master/README.md