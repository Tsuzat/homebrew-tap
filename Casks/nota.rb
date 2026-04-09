cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.67-beta"
  sha256 arm:   "2b8c1a03ad45fd4b34ad1e99f1488d9adfa38f10b195d27108149aa899c8ca1d",
         intel: "39cb87003448d036ce73f9194ee020faea2dc8243c87ef1850531c5a40c10184"

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