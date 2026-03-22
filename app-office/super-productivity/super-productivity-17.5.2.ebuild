# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop

HOMEPAGE="https://super-productivity.com/"
DESCRIPTION="Privacy-first productivity system for developers and professionals."

MY_PV="${PV//_rc/-rc.}"
SRC_URI="https://github.com/johannesjo/super-productivity/releases/download/v${MY_PV}/superProductivity-x86_64.AppImage -> ${P}.AppImage"

S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+bin"
RESTRICT="strip"

DEPEND="sys-fs/fuse:0"
RDEPEND="${DEPEND}"

src_install() {
	newbin ${DISTDIR}/${P}.AppImage super-productivity

	make_desktop_entry "super-productivity" "Super Productivity ${PV}" "super-productivity" "Office"
}
