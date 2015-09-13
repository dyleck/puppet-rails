    class Logger
        @f = nil

      def initialize(fname)
	@f = File.open(fname,'a')
      end

      def log(message)
        @f.print(Time.now.to_s + ": " + message + "\n")
	@f.flush
      end
    end
