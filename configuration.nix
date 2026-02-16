{ config, lib, pkgs, testpkgs, ... }: 
{
	imports = [ /etc/nixos/hardware-configuration.nix ];

	system.stateVersion = "25.11";
	nix.settings.experimental-feature = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "NixPad";
	networking.networkmanager.enable = true;

	time.timeZone = "Australia/Sydney";

	nixpkgs.config.allowUnfree = false;

	services = {
		pipewire = {
			enable = true;
			pulse.enable = true;
		};

		xserver = {
			enable = true;
			desktopManager.xfce.enable = true;
		};
		displayManager.sddm.enable = true;
	};

	users.users.us3r = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" ];
		packages = with testpkgs; [
			gcc
				tor-browser
				firefox
				vlc
		];
	};

	environment.systemPackages = with pkgs; [
		testpkgs.man-db
			testpkgs.man-pages
			testpkgs.man-pages-posix
			testpkgs.tealdeer
			ascii
			wget
			htop
			iwd
			hardinfo2
			usbutils
			vim 
			alacritty
			tree 
			gedit


			gimp
			testpkgs.git

	];
}
