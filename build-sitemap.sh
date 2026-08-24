#!/bin/bash

BASE_URL="https://the-cathedral-and-the-bazaar-unofficial.online"

cd ./book || exit

# 覆盖写入首页
echo "$BASE_URL/" > sitemap.txt

# 遍历所有 .html，拼接 URL
find . -name "*.html" -type f | sed 's|^\./||' | while read -r relpath; do
    echo "$BASE_URL/$relpath" >> sitemap.txt
done

echo -e "\033[0;32m构建完成，sitemap.txt 已同步更新！\033[0m"