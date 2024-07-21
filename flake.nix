{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/c9ed026def59fe978203a2b28eccdbaa7e5fadc9";
	};
	outputs = { nixpkgs, ...}:
	let system = "x86_64-linux";
	pkgs = import nixpkgs { inherit system; };
	in {
		packages.${system}.default = pkgs.telegram-desktop.overrideAttrs (old: {
			name = "forkgram";
			version = "5.1.8";
			src = pkgs.fetchFromGitHub {
				fetchSubmodules = true;
				owner = "forkgram";
				repo = "tdesktop";
				rev = "09533daea4d3a7d83710da6b28740c5c73dcf5a3";
				hash = "sha256-piUWtscLkvea4atKFxxeOUKq9DwAh5EXF1eMVluWM2I=";
			};
		});
	};
}
