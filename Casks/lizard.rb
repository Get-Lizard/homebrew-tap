cask "lizard" do
  version "0.1.8"
  sha256 "9a3964a6a641b30fa456593e8901972997375c12e196b3e715f47280f3479aa4"

  url "https://github.com/Get-Lizard/lizard/releases/download/v#{version}/Lizard-#{version}.dmg"
  name "Lizard"
  desc "Fast, private launcher with local AI and Raycast-compatible extensions"
  homepage "https://github.com/Get-Lizard/lizard"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Lizard.app"
  binary "#{appdir}/Lizard.app/Contents/MacOS/lizardcli"

  uninstall quit: "io.lizard.app"

  zap trash: [
    "~/Library/Application Support/Lizard",
    "~/Library/Caches/Lizard",
    "~/Library/Preferences/io.lizard.app.plist",
    "~/.lizard",
  ]

  caveats <<~EOS
    Lizard runs Raycast-compatible extensions with Node.js: brew install node
    Open Lizard with ⌘Space (or the shortcut you pick in setup). Notes, work logs and screenshots you created are kept on uninstall.
  EOS
end
