module JustInform
  class InformationCollectionRequest
    attr_accessor :raw_data
    
    def inspect
      title
    end
    
    def initialize(data)
      @raw_data = data
    end
    
    def abstract
      @raw_data.at_css('Abstract').content
    end
    
    def agency_code
      @raw_data.at_css('AgencyCode').content
    end
    
    def icr_reference_number
      @raw_data.at_css('ICRReferenceNumber').content
    end
    
    def omb_control_number
      @raw_data.at_css('OMBControlNumber').content
    end
    
    def title
      @raw_data.at_css('Title').content
    end
    
    def total_burden_hours
      @raw_data.at_css('Burden BurdenHour TotalQuantity').content.to_i
    end
    alias_method :burden_hours, :total_burden_hours
    alias_method :burden, :total_burden_hours

    def total_cost
      @raw_data.at_css('Burden BurdenCost TotalAmount').content.to_i
    end
    alias_method :cost, :total_cost

    def total_responses
      @raw_data.at_css('Burden BurdenResponse TotalQuantity').content.to_i
    end
    alias_method :responses, :total_responses
    
  end
end
