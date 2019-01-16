cask 'virtualbox-extension-pack' do
  version '5.2.24,128163'
  sha256 '5a3ee585e1c0f5006c563665af9f476d32539f73ee7728bee7b145bb659abb7d'

  url "https://download.virtualbox.org/virtualbox/#{version.before_comma}/Oracle_VM_VirtualBox_Extension_Pack-#{version.before_comma}-#{version.after_comma}.vbox-extpack"
  appcast 'https://download.virtualbox.org/virtualbox/LATEST.TXT'
  name 'Oracle VirtualBox Extension Pack'
  homepage 'https://www.virtualbox.org/'

  conflicts_with cask: 'virtualbox-extension-pack-beta'
  depends_on cask: 'virtualbox'
  container type: :naked

  stage_only true

  postflight do
    system_command '/usr/local/bin/VBoxManage',
                   args:  [
                            'extpack', 'install',
                            '--replace', "#{staged_path}/Oracle_VM_VirtualBox_Extension_Pack-#{version.before_comma}-#{version.after_comma}.vbox-extpack"
                          ],
                   input: 'y',
                   sudo:  true
  end

  uninstall_postflight do
    next unless File.exist?('/usr/local/bin/VBoxManage')

    system_command '/usr/local/bin/VBoxManage',
                   args: [
                           'extpack', 'uninstall',
                           'Oracle VM VirtualBox Extension Pack'
                         ],
                   sudo: true
  end

  caveats do
    license 'https://www.virtualbox.org/wiki/VirtualBox_PUEL'
  end
end
