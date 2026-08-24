# 末尾不要加 /
$baseUrl = "https://the-cathedral-and-the-bazaar-unofficial.online"

mdbook build

Push-Location ./book

"$baseUrl/" | Out-File -FilePath "sitemap.txt" -Encoding utf8

Get-ChildItem -Recurse -Filter "*.html" | ForEach-Object {
    $relativePath = $_.FullName.Substring((Get-Location).Path.Length + 1)
    $relativePath = $relativePath -replace "\\", "/"
    "$baseUrl/$relativePath" | Out-File -FilePath "sitemap.txt" -Encoding utf8 -Append
}

Pop-Location

Write-Host "构建完成，sitemap.txt 已同步更新！" -ForegroundColor Green