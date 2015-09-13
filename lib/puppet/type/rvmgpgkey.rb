Puppet::Type.newtype(:rvmgpgkey) do
  ensurable

  newparam(:fingerprint) do
    desc "Specify key's fingerprint to add to gpg ring."
    isnamevar
  end
end
