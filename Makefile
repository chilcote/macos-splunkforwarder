PKGTITLE="splunk_forwarder"
PKGVERSION=$(shell ./version.sh)
PKGID=com.splunk.forwarder
PROJECT="splunk_forwarder"

#################################################

##Help - Show this help menu
help: 
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

##  clean - Clean up temporary working directories
clean:
	rm -f ./splunk_forwarder*.{dmg,pkg}
	rm -rf ./pkgroot/opt*

##  pkg - Create a package using pkgbuild
pkg: clean
	mkdir -p pkgroot/opt
	tar xfj splunkforwarder*.tgz -C pkgroot/opt
	pkgbuild --root pkgroot --scripts scripts --identifier ${PKGID} --version ${PKGVERSION} --ownership recommended ./${PKGTITLE}-${PKGVERSION}.pkg

##  dmg - Wrap the package inside a dmg
dmg: pkg
	rm -f ./${PROJECT}*.dmg
	rm -rf /tmp/${PROJECT}-build
	mkdir -p /tmp/${PROJECT}-build/
	cp ./README.md /tmp/${PROJECT}-build
	cp -R ./${PKGTITLE}-${PKGVERSION}.pkg /tmp/${PROJECT}-build
	hdiutil create -srcfolder /tmp/${PROJECT}-build -volname "${PROJECT}" -format UDZO -o ${PROJECT}-${PKGVERSION}.dmg
	rm -rf /tmp/${PROJECT}-build
