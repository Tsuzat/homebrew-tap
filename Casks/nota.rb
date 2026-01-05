cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.51-beta"
  sha256 arm:   "7838337d9a622c3fe7ff8fe3021bbc1b4bf9d56394542eee6e2f7c8752b7ef09",
         intel: "2445e2a26c4b72948bc5be0289398cfcffcd29147c830163b36d514737b9010b"

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