# Section 1.1

cis_level = attribute('cis_level', default: '2', description: 'CIS profile level to audit', required: true)

title '1.1 Filesystem Configuration'

control 'inspec-profile-cis-security-1.1.1.1' do
  title 'Ensure mounting of cramfs filesystems is disabled'
  desc  "The cramfs filesystem type is a compressed read-only Linux filesystem embedded in small footprint systems. A cramfs image can be used without having to first decompress the image.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the server. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.1'
  tag level: 1

  describe kernel_module('cramfs') do
    it { should_not be_loaded }
    #it { should be_disabled }
  end
end

control 'inspec-profile-cis-security-1.1.1.2' do
  title 'Ensure mounting of freevxfs filesystems is disabled'
  desc  "The freevxfs filesystem type is a free version of the Veritas type filesystem. This is the primary filesystem type for HP-UX operating systems.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.2'
  tag level: 1

  describe kernel_module('freevxfs') do
    it { should_not be_loaded }
    #it { should be_disabled }
  end
end

control 'inspec-profile-cis-security-1.1.1.3' do
  title 'Ensure mounting of jffs2 filesystems is disabled'
  desc  "The jffs2 (journaling flash filesystem 2) filesystem type is a log-structured filesystem used in flash memory devices.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.3'
  tag level: 1

  describe kernel_module('jffs2') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end

control 'inspec-profile-cis-security-1.1.1.4' do
  title 'Ensure mounting of hfs filesystems is disabled'
  desc  "The hfs filesystem type is a hierarchical filesystem that allows you to mount Mac OS filesystems.\n\nRationale: Removing support for unneeded filesystem types reduces the local attack surface of the system. If this filesystem type is not needed, disable it."
  impact 1.0

  tag cis: 'distribution-independent-linux:1.1.1.4'
  tag level: 1

  describe kernel_module('hfs') do
    it { should_not be_loaded }
    it { should be_disabled }
  end
end
