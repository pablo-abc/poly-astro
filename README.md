# poly-astro

A polymode for [Astro](https://astro.build) components.

It requires for you to have [web-mode](https://web-mode.org) and [polymode](https://polymode.github.io) installed.

## Known issues

This works ok-ish for most of my use-cases. There's a small issue on which syntax highlighting does not show up until you start editing a specific section, but the mode switching and indentation seems to work without any issues.

## Usage

Require the package and load it for astro files:

```elisp
(add-to-list 'auto-mode-alist '("\\.astro\\'" . poly-astro))
```

Any `.astro` file you open now should be properly highlighted and use the correct modes per section.
