# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2

DESCRIPTION="Simple (but not so easy to solve!) puzzle game"
HOMEPAGE="https://glightoff.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	gnome-base/librsvg
	media-libs/libpng:0=
	>=x11-libs/gtk+-2.6:2
"
DEPEND="${RDEPEND}"
BDEPEND="
	>=dev-util/intltool-0.29
	media-libs/libpng
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}"/${PN}-1.0.0-desktop.patch
)

src_prepare() {
	# Fix broken png files
	pngfix -q --out=out.png glightoff.png
	mv -f out.png glightoff.png || die

	gnome2_src_prepare
}
