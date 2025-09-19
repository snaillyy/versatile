# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake desktop

HOMEPAGE="https://github.com/fstl-app/fstl"
DESCRIPTION="fstl is a very fast .stl file viewer."
LICENSE="MISC-FREE"

SRC_URI="https://github.com/fstl-app/fstl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

IUSE="mimeopen"

DEPEND="
	=dev-qt/qtgui-5*
	=dev-qt/qtopengl-5*
	mimeopen? ( dev-perl/File-MimeInfo )
"
RDEPEND="${DEPEND}"
BDEPEND="dev-build/cmake"

src_install() {
	if [[ -f "CMakeLists.txt" ]]; then
		cmake_run_in "${S}/" "cmake_build"
		cmake_src_compile
		cmake_src_install
		make_desktop_entry "fstl" "fstl" "fstl" "Graphics"
	fi
}

