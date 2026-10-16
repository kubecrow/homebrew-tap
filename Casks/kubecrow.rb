cask "kubecrow" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "85a17d9d3cb0288e0800e9484afc49fa845ab66cd967c9b472d9020da89b4d30",
         intel: "3cf349f93cbf437deb55e915143d3bac9122a7c1c8cb7cc113be2b0b31a7c8cd"

  url "https://github.com/kubecrow/kubecrow/releases/download/v#{version}/KubeCrow-#{version}-#{arch}.dmg"
  name "KubeCrow"
  desc "Kubernetes IDE"
  homepage "https://kubecrow.com/"

  livecheck do
    url "https://github.com/kubecrow/kubecrow/releases/latest"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "KubeCrow.app"

  uninstall quit: "com.kubecrow.app"

  zap trash: [
    "~/Library/Application Support/KubeCrow",
    "~/Library/Caches/com.kubecrow.app",
    "~/Library/Caches/com.kubecrow.app.ShipIt",
    "~/Library/Caches/kubecrow-updater",
    "~/Library/HTTPStorages/com.kubecrow.app",
    "~/Library/Logs/KubeCrow",
    "~/Library/Preferences/com.kubecrow.app.plist",
    "~/Library/Saved Application State/com.kubecrow.app.savedState",
  ]
end
