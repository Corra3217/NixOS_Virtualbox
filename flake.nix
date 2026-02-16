{
	description = "My NixOS virtualbox";

	inputs = {
		unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
	};

	outputs = { self, nixpkgs, ... } @ inputs:
		let 
		system = "x86_64-linux";
	this_dir = ./.
		in
		{
			nixosConfiguration.NixBox = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs };
				modules = [ "${this_dir}/configuration.nix" ]; 
			};


		};
}
