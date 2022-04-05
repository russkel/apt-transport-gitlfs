install: gitlfs
    install gitlfs $(DESTDIR)/usr/lib/apt/methods/gitlfs
    ln -s $(DESTDIR)/usr/lib/apt/methods/gitlfs $(DESTDIR)/usr/lib/apt/methods/gitlfs+git
    ln -s $(DESTDIR)/usr/lib/apt/methods/gitlfs $(DESTDIR)/usr/lib/apt/methods/gitlfs+https

uninstall:
    -rm -f $(DESTDIR)/usr/lib/apt/methods/gitlfs \
        $(DESTDIR)/usr/lib/apt/methods/gitlfs+https \
        $(DESTDIR)/usr/lib/apt/methods/gitlfs+git

.PHONY: install uninstall
