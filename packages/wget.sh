PACKAGE_VERSION="1.15"
PACKAGE_SOURCES="http://ftp.gnu.org/gnu/wget/wget-$PACKAGE_VERSION.tar.xz"

wget_build() {
	[ -d wget-$PACKAGE_VERSION ] && rm -rf wget-$PACKAGE_VERSION
	tar -xJvf wget-$PACKAGE_VERSION.tar.xz
	cd wget-$PACKAGE_VERSION

	./configure --host=$HOST \
	            --prefix= \
	            --datarootdir=/usr/share \
	            --disable-debug \
	            --disable-nls \
	            --without-ssl
	$MAKE
}

wget_package() {
	$MAKE DESTDIR="$1" install
	install -D -m 644 README "$1/usr/share/doc/wget/README"
	install -m 644 NEWS "$1/usr/share/doc/wget/NEWS"
	install -m 644 AUTHORS "$1/usr/share/doc/wget/AUTHORS"
	install -m 644 COPYING "$1/usr/share/doc/wget/COPYING"
}