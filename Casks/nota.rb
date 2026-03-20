cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.65-beta"
  sha256 arm:   "894bdae275d3257fe400f62942a8963ed1aa0c099a92a33770435f51d7a9fa27",
         intel: "fd80b64c6c0c026d9288cbd879aea2e6eb5fe154540a8a3aa14019dd32d2348f"

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