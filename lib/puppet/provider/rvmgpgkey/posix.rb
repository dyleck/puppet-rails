require 'puppet/util/execution'

Puppet::Type.type(:rvmgpgkey).provide(:posix) do
  has_command(:gpg2, '/usr/bin/gpg2')

  def exists?
    execute([command(:gpg2), '-k', @resource[:fingerprint]], :failonfail => false).exitstatus == 0
  end

  def create
    gpg2(['--keyserver', 'hkp://keys.gnupg.net', '--recv-keys', @resource[:fingerprint]])
  end

  def destroy
    gpg2(['--batch', '--delete-key', @resource[:fingerprint]])
  end
end
