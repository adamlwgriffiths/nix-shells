# Using yarn2nix in nix-shell

Uses a custom nodejs version.

To get this to work you _must_ over-ride yarn2nix-moretea, as yarn2nix is a closure and nodejs is already defined at this point.

Note: I couldn't get yarn2nix working without the npm-packages/default.nix file in a default.nix file. It threw errors otherwise.

## Usage from start

1. Install Yarn into a stand-alone nix-shell
```
$ nix-shell '<nixpkgs>' -p yarn
```
2. Add dependencies
```
$ yarn add miniflare
```
3. Edit package.json and add **at least** the "name" field.

Failure to do this will cause `attribute 'name' missing` errors

4. Exit shell (`$ exit`)
5. Edit the shell.nix and expose any required binaries from npm packages in the `mkYarnPackage` call.
6. Open the nix-shell
