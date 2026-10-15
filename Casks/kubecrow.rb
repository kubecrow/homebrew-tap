cask "kubecrow" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "c4714300addd74fc2344ba462e621da2a39ee562a21ea83a03d7665370c347a3",
         intel: "d0e7f34001a756004c088a836c5f6853e3f1d22a6db589da3125bc3b126f071f"

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
