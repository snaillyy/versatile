# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop

HOMEPAGE="https://github.com/zigalenarcic/mangl"
DESCRIPTION="Mangl is a graphical man page viewer based on the mandoc library (https://mandoc.bsd.lv/)."
LICENSE="BSD-2"

SRC_URI="https://github.com/zigalenarcic/mangl/archive/refs/tags/v${PV}.tar.gz -> versatile-${P}.tar.gz"

KEYWORDS="~amd64"
SLOT="0"

IUSE=""

DEPEND="
	sys-libs/zlib
	app-arch/bzip2
	dev-util/pkgconf
	media-libs/freetype
	media-libs/mesa[opengl(+)]
	media-libs/glfw
"
RDEPEND="${DEPEND}"

src_install() {
	if [[ -f Makefile || -f GNUmakefile || -f makefile ]]; then
		emake DESTDIR="${D}" install
		rm "${D}/usr/share/applications/mangl.desktop"
	fi

	make_desktop_entry "mangl" "mangl" "mangl" "Viewer"
}

