{
	description = "My NixOS virtualbox";

	inputs = {
		unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
	};

	outputs = { self, nixpkgs, ... } @ inputs:
	let 
	system = "x86_64-linux";
	this_dir = ./.;
	testpkgs = inputs.unstable.legacyPackages.x86_64-linux;
	in
	{
		nixosConfigurations.NixBox = nixpkgs.lib.nixosSystem {
			inherit system;
			specialArgs = { inherit inputs testpkgs system; };
			modules = [ "${this_dir}/configuration.nix" ]; 
		};
	};
}
