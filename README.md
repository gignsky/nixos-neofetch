# ✨ NixOS Neofetch

> Declarative NixOS module to install Neofetch with a custom per-user configuration and enriched system info.

## 📦 Features

- 🔒 **Secure config directory :** Creates and protects ```~/.config/neofetch``` with ```700``` permissions and correct ownership.

- ⚙️ **Custom config deployment :** Installs your ```config.conf``` into ```~/.config/neofetch``` with ```600``` permissions.

- 📊 **Extended info :** Adds modules for local IP, column count, CPU temperature and refresh rate.

- 📦 **Package installation :** Ensures ```neofetch``` is present in ```environment.systemPackages```.

- 🔄 **Idempotent :** Cleans and recreates the config folder on each rebuild for consistent state.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing Neofetch configs.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/neofetch{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-neofetch = fetchGit {
    url = "https://github.com/typovrak/nixos-neofetch.git";
    ref = "main";
    rev = "ccbdda07415143d1b2a602f17d573b7afc217890"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-neofetch}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Run ```neofetch``` to see your system summary.

Add this command to your ```.zshrc``` or ```.bashrc``` to see it everytime a new terminal is opened.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
