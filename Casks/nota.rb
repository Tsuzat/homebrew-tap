cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.59-beta"
  sha256 arm:   "d784715303e01ff7724eaae3367f9751e4417e1cea6035268dae91d3645b82db",
         intel: "fea6b6fb393dbdcaac55316b1aa3e34b19dce67f8bd4dd8626832d9f644acbd7"

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