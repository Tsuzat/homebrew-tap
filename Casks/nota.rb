cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.64-beta"
  sha256 arm:   "ec5c068fa710555388856699e0afa6e7c601bace68ea0780249140fb2c1e7171",
         intel: "2360240a28d82c93c75507d159dc4992fc8a7aa9c08090f862f7ccd3cad23b8f"

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