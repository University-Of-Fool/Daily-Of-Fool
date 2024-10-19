#!/bin/env bash

## Generate daily pages.
FILE_LIST=$(ls -1 text)
for FILE in $FILE_LIST;
    do
    echo "## $FILE" > /docs/$FILE'.md'
    echo "|EN_US|ZH_CN|" >> /docs/$FILE'.md'
    echo "|:----|:----|" >> /docs/$FILE'.md'
    for LINE in $(cat $FILE);
        do
            echo "'|'$LINE'|'" >> /docs/$FILE'.md'
        done
    done

## Generate index page.
cat README.md > /docs/index.md
echo "## 期刊列表" >> /docs/index.md
for FILE in $FILE_LIST;
    do
        echo "|[${FILE%.*}](./$FILE)|" >> /docs/index.md
    done
echo "## 使用协议" >> /docs/index.md
echo '```' >> /docs/index.md
cat LICENSE >> /docs/index.md
echo '```' >> /docs/index.md