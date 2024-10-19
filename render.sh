#!/bin/env bash

DESTINATION=site
mkdir -p $DESTINATION

## Generate daily pages.
FILE_LIST=$(ls -1 text)
for FILE in $FILE_LIST;
    do
    echo "## $FILE" > $DESTINATION/$FILE'.md'
    echo "|EN_US|ZH_CN|" >> $DESTINATION/$FILE'.md'
    echo "|:----|:----|" >> $DESTINATION/$FILE'.md'
    for LINE in $(cat $FILE);
        do
            echo "'|'$LINE'|'" >> $DESTINATION/$FILE'.md'
        done
    done

## Generate index page.
cat README.md > $DESTINATION/index.md
echo "## 期刊列表" >> $DESTINATION/index.md
for FILE in $FILE_LIST;
    do
        echo "|[${FILE%.*}](./$FILE)|" >> $DESTINATION/index.md
    done
echo "## 使用协议" >> $DESTINATION/index.md
echo '```' >> $DESTINATION/index.md
cat LICENSE >> $DESTINATION/index.md
echo '```' >> $DESTINATION/index.md