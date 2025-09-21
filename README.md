# Arch Linux PKGBUILD builder action

This action builds and validates Arch Linux package.
The `PKGBUILD` and `.SRCINFO` files should be under a subdirectory named the same as the `pkgbuild` of the package.
This assumption is made so this action works well with [aurpublish].

[aurpublish]: https://github.com/eli-schwartz/aurpublish

## Inputs

### `target`

**Required** Validation target. Can be one of: `pkgbuild`, `srcinfo`, `run`.

### `pkgname`

**Required** Path to DIRECTORY where the PKGBUILD file is.
Assumes the directory is the name of package, ie /path/to/pkgname/'

## Example usage

### pkgbuild

Verifies and builds the package.

```yml
uses: rokibhasansagar/arch-pkgbuild-builder@main
with:
  target: 'pkgbuild'
  pkgname: 'ucm-bin'
```

### srcinfo

Verifies if the `.SRCINFO` is up to date with the `PKGBUILD`.

```yml
uses: rokibhasansagar/arch-pkgbuild-builder@main
with:
  target: 'srcinfo'
  pkgname: 'ucm-bin'
```

### run

Installs the package and runs a given `command`.

```yml
uses: rokibhasansagar/arch-pkgbuild-builder@main
with:
  target: 'run'
  pkgname: 'ucm-bin'
  command: `ucm --version`
```

### debug mode (optional)

Add a `debug: true` key, ie.

 ```yml
 uses: rokibhasansagar/arch-pkgbuild-builder@main
 with:
   debug: true
   target: 'srcinfo'
   pkgname: 'ucm-bin'
 ```

This will run `entrypoint.sh` with `set -x` on.
