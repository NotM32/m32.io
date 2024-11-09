# m32.io
This is my personal website

## Usage
The site may be built with `nix build`

## Development
The local development server is started with `nix run` in this repo's root. This starts 3 processes:
- Zola local server
- TailwindCSS watch process
- Data file periodic refresh

Alternatively, the website can be served locally using the `build.pl` script with the `watch` argument. 
The `fetch` argument gathers some metadata about the repository that is used on the website.
The `build` argument will build the website.

### Data files
When building with Nix or using the development server, Nix will build a data file (`.nix-data.json`),
that provides metadata to the build site.

Some data sources are fetched by the `build.pl` script that creates a `.data.yml` file.

## Built With
The website is a static website generated with [zola](https://getzola.org), stylized
with the help of [tailwindcss](https://tailwindcss.com), built using [nix](https://nixos.org)
