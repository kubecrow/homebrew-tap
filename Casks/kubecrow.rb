cask "kubecrow" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "8f11ff0ce638a2979bbeacc1a438e0d47424f40ac426b8aafbf3ef60fc6409cb",
         intel: "9f35e0bf097022221dfa941f0defcdb0d0411086f8ae5ae6fb40428eecc4b1d9"

  url "https://github.com/kubecrow/kubecrow/releases/download/v#{version}/KubeCrow-#{version}-#{arch}.dmg"
  name "KubeCrow"
  desc "Kubernetes IDE for the Mac"
  homepage "https://kubecrow.com/"

  livecheck do
    url "https://github.com/kubecrow/kubecrow/releases/latest"
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"

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
