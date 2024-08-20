{
	inputs = {
		nixpkgs.url = "github:NickCao/nixpkgs/telegram-desktop";
	};
	outputs = { nixpkgs, ...}:
	let system = "x86_64-linux";
	pkgs = import nixpkgs { inherit system; };
	in {
		packages.${system}.default = pkgs.telegram-desktop.overrideAttrs (old: rec {
			pname = "forkgram";
			version = "5.4.1";
			src = pkgs.fetchFromGitHub {
				fetchSubmodules = true;
				owner = "forkgram";
				repo = "tdesktop";
				rev = "v${version}";
				hash = "sha256-c3W6ap4k3UXJl4QwXMmo9SB6IFyApLM0PTXiKg5zn6Y=";
			};
		});
	};
}
