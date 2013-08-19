module JustInform
  class Downloader
    require 'tempfile' unless defined?(Tempfile)
    require 'fileutils' unless defined?(FileUtils)
    require 'net/http' unless defined?(Net::HTTP)
    
    def self.get_latest
      if self.current_file?
        puts "Using downloaded file at #{File.join('/tmp', self.current_filename)} and parsing with Nokogiri"

        latest = File.open(File.join('/tmp', self.current_filename), 'r')
      else
        thread = download

        print "%.2f%% Complete\r" % thread[:progress].to_f until thread.join 1
        latest = File.open(File.join('/tmp', self.current_filename), 'r')
      end
    end
        
    def self.download
      Thread.new do
        thread = Thread.current
        body = thread[:body] = []

        file = File.open(File.join('/tmp',self.current_filename), 'w+b')

        Net::HTTP.new('www.reginfo.gov').request_get('/public/do/PRAXML?type=inventory') do |response|
          length = thread[:length] = response['Content-Length'].to_i
          file_size_in_mb = response['Content-Length'].to_i/1024/1024
          puts "Downloading ~#{file_size_in_mb} MB of XML data and parsing with Nokogiri. This may take a few minutes depending on your processor and internet connection"
          
          response.read_body do |fragment|
            file.write(fragment)
            thread[:done] = (thread[:done] || 0) + fragment.length
            thread[:progress] = thread[:done].quo(length) * 100
          end
          file.close
        end
      end
    end
    
    private
    
    def self.current_file?
      true if File.exists?(File.join('/tmp', self.current_filename))
    end
    
    def self.current_filename
      filename = Time.now.strftime("%Y.%m.%d-CurrentInventoryReport.xml")
    end
    
  end
end

