<p align="center">
  <img src="versatile.png" alt="Repository's logo, versatile; supposed to look like a glassy theme but I'm not a great designer.">
</p>

# 🩵 versatile

Gentoo overlay for things that aren't on the official repos, or guru.
Made this because I was too shy to ask to be included, if you would like an ebuild written, open an issue and let me know!

## ⚙️ Enabling repository
Hashtag implies as a root user. (sudo emerge ...)
* Make sure `# emerge -av eselect-repository` is installed.
* `# eselect repository add versatile git https://github.com/snaillyy/versatile`
* `# emaint sync -r versatile`

## 🛠️ Installing a package
* `# emerge -av PixelCode-font`
