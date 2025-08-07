# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

HOMEPAGE="https://qwerasd205.github.io/PixelCode/"
DESCRIPTION="Pixel Code is a monospace pixel art style programming font which is designed to maximize readability and code-friendliness, while sticking to a pixel grid."

SRC_URI="https://github.com/qwerasd205/PixelCode/releases/download/v${PV}/otf.zip -> ${PN}-otf-${PV}.zip
ttf? ( https://github.com/qwerasd205/PixelCode/releases/download/v${PV}/ttf.zip -> ${PN}-ttf-${PV}.zip )"

S="${WORKDIR}/"

FONTDIR="/usr/share/fonts/PixelCode"

LICENSE="OFL-1.1"
SLOT="0"

KEYWORDS="~amd64"

IUSE="+otf ttf"
REQUIRED_USE="|| ( otf ttf )"

BDEPEND="app-arch/unzip"

src_install() {
	for i in {otf,ttf}; do
		use $i;
		FONT_S="${WORKDIR}/$i";
		FONT_SUFFIX="$i";
		font_src_install;
	done
}
