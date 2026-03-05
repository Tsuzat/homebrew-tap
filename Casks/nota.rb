cask "nota" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.63-beta"
  sha256 arm:   "d8303995dc9f0110bbcc6c4cf47813c1142de915ea09ed496764a11c97930beb",
         intel: "2d2adec8e5bea21ae73f118305eff881dc6597a99228e32037b2552ba400d56c"

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