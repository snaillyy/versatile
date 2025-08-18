# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

HOMEPAGE="https://github.com/0xType/0xProto"
DESCRIPTION="Pixel Code is a monospace pixel art style programming font which is designed to maximize readability and code-friendliness, while sticking to a pixel grid."

SRC_URI="https://github.com/0xType/0xProto/archive/refs/tags/${PV}.zip -> ${P}.zip"

S="${WORKDIR}/${P}/fonts/"

FONTDIR="/usr/share/fonts/0xProto"

LICENSE="OFL-1.1"
SLOT="0"

KEYWORDS="~amd64"

IUSE="+otf ttf"
REQUIRED_USE="|| ( otf ttf )"

BDEPEND="app-arch/unzip"

src_install() {
	useFlags=( "otf" "ttf" )

	for x in ${useFlags[@]}; do
		use $x && { FONT_S="$S"; FONT_SUFFIX="$x"; font_src_install; }
	done
}
