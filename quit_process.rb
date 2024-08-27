class QuitProcess < Formula
    desc "Script to kill Netskope processes"
    homepage "https://github.com/j3rry01v/killnetskoppu"
    url "https://github.com/j3rry01v/killnetskoppu/raw/main/quit_process.sh"
    sha256 "fa5840080bc3c3539b99071248bd53bf69ec0ee441dc5abc71b793f799755627"
    version "1.0.0"
  
    def install
      bin.install "quit_process.sh"
      # Additional command to manually copy the plist if needed
    end
  
    def plist
      <<~EOS
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>Program</key>
          <string>#{opt_bin}/quit_process.sh</string>
          <key>RunAtLoad</key>
          <true/>
          <key>KeepAlive</key>
          <true/>
          <key>StandardErrorPath</key>
          <string>#{var}/log/quit_process.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/quit_process.log</string>
        </dict>
        </plist>
      EOS
    end
  end
  