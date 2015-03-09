#!/bin/sh
#
# Deploy presentation stuff to github pages
#
set -x
: ${DEPLOY_DIR:=_gh-pages}
: ${DEPLOY_BRANCH:=gh-pages}
GIT=/usr/local/bin/git
/usr/local/bin/pandoc -o $DEPLOY_DIR/index.html README.md
/bin/cp 2015-03-09-rails.mn-presentation.pdf $DEPLOY_DIR
(cd $DEPLOY_DIR && $GIT checkout $DEPLOY_BRANCH && $GIT add --all --verbose && $GIT commit -m "$(date)" && $GIT push -fu origin HEAD)
echo "Deployed"
