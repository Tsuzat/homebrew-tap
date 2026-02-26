cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.60-beta"
  sha256 arm:   "87c783268ca2ed7dbfb4df1a55c14c25f23926c86541595bc5d2f8f16583ef06",
         intel: "11a4b95388c7d61fdc48bde14d1be94adfe5b3efc47bf90c143398dfab98c4db"

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