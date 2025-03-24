{
  inputs = {
    # We use the unstable nixpkgs repo for some packages.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  }: {
    # replace 'joes-desktop' with your hostname here.
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [./configuration.nix];
    };
  };
}
