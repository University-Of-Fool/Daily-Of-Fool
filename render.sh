#!/bin/env bash

SOURCE=text
DESTINATION=site
mkdir -p $DESTINATION

## Generate daily pages.
FILE_LIST=$(ls -1 $SOURCE)
for FILE in $FILE_LIST;
    do
    echo "## $FILE" > $DESTINATION/$FILE.md
    echo "|EN_US|ZH_CN|" >> $DESTINATION/$FILE.md
    echo "|:---|:---|" >> $DESTINATION/$FILE.md
    sed -n '1,$p' $SOURCE/$FILE | while read -r LINE;
        do
            echo "|$LINE|  " >> $DESTINATION/$FILE.md
        done
    done

## Generate index page.
cat README.md > $DESTINATION/index.md
echo "## 期刊列表" >> $DESTINATION/index.md
echo "|期数|日期(YYYYMMDD)|" >> $DESTINATION/index.md
echo "|:---|:---|" >> $DESTINATION/index.md
let NUM=0
for FILE in $FILE_LIST;
    do
        let NUM=$NUM+1
        echo "|$NUM|[${FILE%.*}](./$FILE)|" >> $DESTINATION/index.md
    done
echo "## 使用协议" >> $DESTINATION/index.md
echo '```' >> $DESTINATION/index.md
cat LICENSE >> $DESTINATION/index.md
echo '```' >> $DESTINATION/index.md