# nixos-neofetch

nixos-neofetch = fetchGit {
	url = "https://github.com/typovrak/nixos-neofetch.git";
	ref = "main";
};

(import "${nixos-neofetch}/configuration.nix")
