cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.68-beta"
  sha256 arm:   "61bd0f07029db0d30e94389b853b16398792327add627ce0e14e57bf3e995209",
         intel: "0b53a6531ffa19d11ddb975763efebf1bd712b95eab3679da3af3bf134020fdd"

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