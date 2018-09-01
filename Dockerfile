FROM clojure:alpine

# installing required packages
RUN apk add dbus firefox-esr xvfb nodejs nodejs-npm chromium

# installing node dependecies to run clojurescript tests via karma
RUN npm install --global --silent karma-cli karma karma-cljs-test karma-firefox-launcher karma-chrome-launcher

# required for applications that use dbus to start in container
RUN dbus-uuidgen --ensure

# Add script to make firefox to render in virtual frame buffer
COPY --chown=0:0 firefox-docker-launcher.sh /usr/bin/firefox-docker-launcher
RUN chmod 755 /usr/bin/firefox-docker-launcher

# Specify firefox binary for karma
ENV FIREFOX_BIN=/usr/bin/firefox-docker-launcher

# Add script to start chromium browser in container with limited environment
COPY --chown=0:0 chromium-docker-launcher.sh /usr/bin/chromium-docker-launcher
RUN chmod 755 /usr/bin/chromium-docker-launcher

# Specify chrome binary for karma
ENV CHROME_BIN=/usr/bin/chromium-docker-launcher
