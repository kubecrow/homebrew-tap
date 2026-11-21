cask "kubecrow" do
  arch arm: "arm64", intel: "x64"

  version "1.0.1"
  sha256 arm:   "2e54fe74860d1f083cf4ee1cfa2dbec05f6e73bad0bc731763db6962e57dbeae",
         intel: "38ee7af7f0441bbaff48e248562065815101d9ae1f107a75ec90cb67461d8e3a"

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
