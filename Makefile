PREFIX ?= /usr

all: ; 

install:
	install -D -m755 outlook.com $(DESTDIR)$(PREFIX)/bin/outlook.com
	xdg-desktop-menu install --novendor outlook.com.desktop
	xdg-icon-resource install --novendor --size 16 icons/16x16/outlook.com.png
	xdg-icon-resource install --novendor --size 22 icons/22x22/outlook.com.png
	xdg-icon-resource install --novendor --size 24 icons/24x24/outlook.com.png
	xdg-icon-resource install --novendor --size 32 icons/32x32/outlook.com.png
	xdg-icon-resource install --novendor --size 48 icons/48x48/outlook.com.png
	xdg-icon-resource install --novendor --size 64 icons/64x64/outlook.com.png
	xdg-icon-resource install --novendor --size 128 icons/128x128/outlook.com.png
	xdg-icon-resource install --novendor --size 256 icons/256x256/outlook.com.png
