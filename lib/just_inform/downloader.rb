module JustInform
  class Downloader
    require 'open-uri' unless defined?(OpenURI)
    
    def self.get_latest
      if self.current_file?
        puts "Using downloaded file"
        latest = File.open(File.join 'data', self.current_filename)
      else
        puts 'Downloading file, this could take a minute...'
        latest = File.open(File.join('data',self.current_filename), 'wb') {|file| file << open('http://www.reginfo.gov/public/do/PRAXML?type=inventory').read}
        latest = File.open(File.join 'data', self.current_filename)
      end
    end
    
    private
    
    def self.current_file?
      true if File.exists?(File.join 'data', self.current_filename)
    end
    
    def self.current_filename
      filename = Time.now.strftime("%Y.%m.%d-CurrentInventoryReport.xml")
    end
    
  end
end

