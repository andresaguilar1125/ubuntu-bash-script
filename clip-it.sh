#!/bin/bash
# Gnome extension

# Install gnome-browser-connector
sudo apt-get update
sudo apt-get install -y gnome-browser-connector

# Open the Chrome Web Store URL to add the GNOME Shell Integration extension
xdg-open "https://chromewebstore.google.com/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep?pli=1"

# Install the Clipboard Indicator extension using gnome-extensions
# Ensure you have gnome-shell-extensions and jq installed
sudo apt-get install -y gnome-shell-extensions jq

# Get the UUID of the Clipboard Indicator extension
extension_uuid="clipboard-indicator@tudmotu.com"

# Download and install the Clipboard Indicator extension
if ! gnome-extensions list | grep -q $extension_uuid; then
  mkdir -p ~/.local/share/gnome-shell/extensions/$extension_uuid
  curl -L "https://extensions.gnome.org/extension-data/clipboard-indicatortudmotu.com.v46.shell-extension.zip" -o /tmp/clipboard-indicator.zip
  unzip /tmp/clipboard-indicator.zip -d ~/.local/share/gnome-shell/extensions/$extension_uuid
  gnome-extensions enable $extension_uuid
fi

echo "Installation completed. Please add the GNOME Shell Integration extension from the opened browser tab."
