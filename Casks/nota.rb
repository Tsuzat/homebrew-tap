cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.56-beta"
  sha256 arm:   "c2fd081f78e9b5feca004ad18a63c9a80c9ece235990e5340ad4dc2976e0a878",
         intel: "4cb5798e336d62eeb04292ad3ca8e34122a2687e63bc1f475b5683f2d8bb41c3"

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