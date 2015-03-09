#!/bin/sh
#
# Deploy presentation stuff to github pages
#
set -x
: ${DEPLOY_DIR:=_gh-pages}
: ${DEPLOY_BRANCH:=gh-pages}
/usr/local/bin/convert -resize 16x16 railsmn_logo.png $DEPLOY_DIR/favicon.ico && \
/usr/local/bin/pandoc -s -o $DEPLOY_DIR/index.html -H favicon-include.html README.md && \
/bin/cp 2015-03-09-rails.mn-presentation.pdf $DEPLOY_DIR && \
GIT=/usr/local/bin/git && \
(cd $DEPLOY_DIR && $GIT checkout $DEPLOY_BRANCH && $GIT add --all --verbose && $GIT commit -m "$(date)" && $GIT push -fu origin HEAD) && \
echo "Deployed"
