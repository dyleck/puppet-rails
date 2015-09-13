require 'puppet_x/dyleck/util/log'

Puppet::Type.type(:rvm).provide(:posix) do

	def create
		flog = PuppetX::Dyleck::Util::Logger.new("/tmp/puppet.log")
		flog.log("Version to install: #{@resource[:version]}")
		case @resource[:version]
		when "any"
			flog.log "Installing the latest version."
			system 'curl -sSL https://get.rvm.io | bash -s stable'
		else
			flog.log "Current: " + _rvm_version.to_s + ", desired: #{@resource[:version]}"
			if _rvm_version and @resource[:version] < _rvm_version
				if @resource[:downgrade]
					flog.log "Destoying existin rvm."
					self.destroy
				else
					raise Puppet::Error, "Newer version of RVM is already installed. Set downgrade to true in resource definition."
				end
			end
			flog.log "Installing version #{@resource[:version]}."
			system "curl -sSL https://get.rvm.io | bash -s -- --version #{@resource[:version]}"
		end
	end

	def destroy
		system 'echo yes | /usr/local/rvm/bin/rvm implode' 
	end

	def exists?
		flog = PuppetX::Dyleck::Util::Logger.new('/tmp/puppet.log')
		flog.log("exists? entry")
		retval = @resource[:version] == _rvm_version
		flog.log("exists? exit: #{retval}")
		retval
	end

	private

	def _rvm_version
		flog = PuppetX::Dyleck::Util::Logger.new("/tmp/puppet.log")
		flog.log("_rvm_version entry")
		if File.exists?('/usr/local/rvm/bin/rvm') 
			retval = `/usr/local/rvm/bin/rvm -v`.match(/rvm\s(\d+\.\d+\.\d+)/)[1]
		else
			retval = nil
		end
		flog.log("_rvm_version exit: #{retval}")
		retval
	end
end
