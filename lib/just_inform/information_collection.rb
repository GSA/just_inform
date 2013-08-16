module JustInform
  class InformationCollection
    attr_accessor :burden_hours, :cost, :file_name, :form_name, :raw_data, :parent_id, :responses, :title
    
    def initialize(data)
      parent_id = data.at_css('ICRReferenceNumber')
      @raw_data, @parent_id = data, parent_id
    end
    
  end
end
