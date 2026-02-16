cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.57-beta"
  sha256 arm:   "30acd285edcf3632ca691f458319de725fe0ab2d024cfad4c0660537ba134d10",
         intel: "b215e3e5928124f5a39aac9363b1bccff578000fad94535b26f804ef77258242"

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