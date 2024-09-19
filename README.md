# m32.io
This is my personal website

## Usage
The website can be served locally using the `build.pl` script with the `watch` argument.

The `fetch` argument gathers some metadata about the repository that is used on the website.

The `build` argument will build the website. If you use nix, the preferred way is to just
run `nix build` in the repo root. The `result/` directory contents may be deployed where
ever they need to be deployed.

## Built With
The website is a static website generated with [zola](https://getzola.org), stylized
with the help of [tailwindcss](https://tailwindcss.com), built using [nix](https://nixos.org)
