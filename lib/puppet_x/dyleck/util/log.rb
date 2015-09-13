module PuppetX
  module Dyleck
    module Util
      class Logger
	@f = nil

	def initialize(fname)
          begin
	    @f = File.open(fname,'a')
          rescue Exception => e
            $stderr.puts "Cannot write to log file #{fname}, because of #{e.class}"
          end
	end

	def log(message)
	  @f.print(Time.now.to_s + ": " + message + "\n")
	  @f.flush
	end
      end
    end
  end
end
