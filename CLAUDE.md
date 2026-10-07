# CLAUDE.md (opencv-ios)

## 概要
OpenCV の iOS 向け Swift Package (Package.swift: swift-tools-version 6.0、iOS 14+、OpenCV 4.10.2 の binaryTarget)。`create_xcframework.sh` で xcframework を作成する。

## 注意
- `/frameworks` `/opencv` `/opencv_contrib` は .gitignore 済みの生成物・取得物。コミットしない。
- Package.swift の `version` と `checksum` は対で更新する。片方だけ変更しない。
- 認証情報・トークンはリポジトリに含めない。
