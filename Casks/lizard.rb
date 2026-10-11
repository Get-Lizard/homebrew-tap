cask "lizard" do
  version "0.1.0"
  sha256 "c492b49128f3fbc419f49d203de9886bac2717efd8bd048b60cad78f2498ea52"

  url "https://github.com/Get-Lizard/lizard/releases/download/v#{version}/Lizard-#{version}.dmg"
  name "Lizard"
  desc "Fast, private launcher with local AI and Raycast-compatible extensions"
  homepage "https://github.com/Get-Lizard/lizard"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "Lizard.app"

  uninstall quit: "io.lizard.app"

  zap trash: [
    "~/Library/Application Support/Lizard",
    "~/Library/Caches/Lizard",
    "~/Library/Preferences/io.lizard.app.plist",
    "~/.lizard",
  ]

  caveats <<~EOS
    Lizard runs Raycast-compatible extensions with Node.js: brew install node
    Open Lizard with ⌃Space. Notes, work logs and screenshots you created are kept on uninstall.
  EOS
end
