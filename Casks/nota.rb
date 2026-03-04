cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.61-beta"
  sha256 arm:   "d7eafe5a2dcb1f3de3e0e0d85d7d4a236a341b3e47ec772fe9d0b21ec770a7e0",
         intel: "0ad63abc4118212a7fac82fb5379582905c7ea9b26def8a7c6872caed90b1d03"

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