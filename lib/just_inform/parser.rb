module JustInform
  class Parser
    require 'nokogiri' unless defined?(Nokogiri)
    attr_accessor :doc
    
    def initialize
      load
    end
    
    def inspect
      "#{self.class} - #{self.doc.children.first.name}"
    end
    
    # Show top 10 forms, PRA.top(sort_by_symbol, number_of_results)
    # parser.top(:burden,2) => [<Nokogiri::XML::Element>, <Nokogiri::XML::Element>]
    def top(limit=10, attrib_name=:burden_hours)
      @topx = []
      @topx_size = limit
      sort_method = attrib_name.to_sym
      
      reports.each_with_index do |report, index|
        if @topx.last
          add_report_to_topx(report.send(sort_method), index) if report.send(sort_method) > @topx.last[0]
        else
          @topx << [report.send(sort_method), reports[index]]
        end
      end
      
      @topx.map! {|x| [number_to_delimited(x[0]), x[1]]}
    end
    
    def reports(doc=@doc)
      reports = []
      
      doc.xpath('//InformationCollectionRequest').map {|r| reports << InformationCollectionRequest.new(r) }
      reports
    end
    
    private
    
    # pretify number results
    def number_to_delimited(number)
      number.to_s.gsub!(/(\d)(?=(\d\d\d)+(?!\d))/, "\\1,")
    end
    
    # add report search value (e.g. value of burden hours, responses, or cost) and index to @topx array
    def add_report_to_topx(sort_value, index)
      (0..@topx_size).map do |n|
        if sort_value > @topx[n][0]
          @topx.insert(n, [sort_value, reports[index]])
          break
        else
          next
        end
      end
      
      @topx = @topx[0..(@topx_size-1)]
    end
    
    # load XML data into Nokogiri and set @doc instance variable
    def load
      data = Downloader.get_latest
      @doc = ::Nokogiri::XML(data)
    end
    

  end
end
