cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.50-beta"
  sha256 arm:   "sha256:3a86bd67a2311ecc8f79300d064c6049ff70d0ce88585bfc6ae5cdb442d431ea",
         intel: "sha256:0aa258c5f9424a43af9b40d1dc3cdbd40371233c0634ffbb0d990ff8b539a23d"

  url "https://github.com/Tsuzat/Nota/releases/download/release-v#{version}/Nota_#{version}_#{arch}.dmg"
  name "Nota"
  desc "Fast, Lightweight, Feature-Rich Note-Taking App with Native AI Integration"
  homepage "https://www.nota.ink/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Nota.app"

  postflight do
    system_command "xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Nota.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/app.nota.ink",
    "~/Library/Caches/app.nota.ink",
    "~/Library/Preferences/app.nota.ink.plist",
    "~/Library/Saved Application State/app.nota.ink.savedState",
  ]
end