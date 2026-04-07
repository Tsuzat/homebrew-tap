cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.66-beta"
  sha256 arm:   "f265c94b270be58c3a37b81a0526e767d39ae4302532620747089dc4bab9f5f1",
         intel: "4bfdc7b9c00558eb15b05d4735480d56869aa7e748a03f3e4e0d55d17cef6ba6"

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