cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.51-beta"
  sha256 arm:   "57d95b2221cdeae45fd5516d43e8ca96aa94f4619e59f86e12775a4e32cf5bee",
         intel: "3b963e0df77c96afc60acf847eefc7c0303cdfe7dbbfe41450bbe8cedddb356a"

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