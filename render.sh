#!/bin/env bash

TARGET_DIR=docs

## Generate daily pages.
FILE_LIST=$(ls -1 text)
for FILE in $FILE_LIST;
    do
    echo "## $FILE" > $TARGET_DIR/$FILE'.md'
    echo "|EN_US|ZH_CN|" >> $TARGET_DIR/$FILE'.md'
    echo "|:----|:----|" >> $TARGET_DIR/$FILE'.md'
    for LINE in $(cat $FILE);
        do
            echo "'|'$LINE'|'" >> $TARGET_DIR/$FILE'.md'
        done
    done

## Generate index page.
cat README.md > $TARGET_DIR/index.md
echo "## 期刊列表" >> $TARGET_DIR/index.md
for FILE in $FILE_LIST;
    do
        echo "|[${FILE%.*}](./$FILE)|" >> $TARGET_DIR/index.md
    done
echo "## 使用协议" >> $TARGET_DIR/index.md
echo '```' >> $TARGET_DIR/index.md
cat LICENSE >> $TARGET_DIR/index.md
echo '```' >> $TARGET_DIR/index.md