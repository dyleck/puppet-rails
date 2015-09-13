require "puppet/parameter/boolean"

Puppet::Type.newtype(:rvm) do

	ensurable

	newparam(:version, :namevar => true) do
		desc "Namevar, specify the version of RVM to install."
	end

	newparam(:downgrade, :boolean => true, :parent => Puppet::Parameter::Boolean) do
		desc "Specify if RVM should be downgradede if newer version is detected."
	end
end
