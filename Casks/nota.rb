cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.62-beta"
  sha256 arm:   "63b60ab1a1f1321d23888eb79e499179c7bc969a8d7a17dd8d44c6b582276b40",
         intel: "120e42075a04f1a84f5f4273513b1f8602b2bbd44e7e53b31c038561fc0afce8"

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