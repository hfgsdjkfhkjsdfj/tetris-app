# GitHub リポジトリ作成・プッシュ手順

## 🔧 実行コマンド

### 1. GitHub.com でリポジトリ作成
```
1. https://github.com/ にアクセス
2. 「New repository」をクリック
3. Repository name: tetris-app
4. Description: Flutter Tetris Game for iOS TestFlight deployment
5. Public を選択
6. 「Create repository」をクリック
```

### 2. リモートリポジトリ設定・プッシュ
```bash
cd /home/kasdsadhj6/tetris_app

# リモートリポジトリ追加
git remote add origin https://github.com/[YOUR_USERNAME]/tetris-app.git

# ブランチ名をmainに変更
git branch -M main

# 初回プッシュ
git push -u origin main
```

### 3. GitHub Actions 確認
```
プッシュ後、以下を確認:
1. GitHub → Actions タブ
2. 「iOS Build and Deploy」ワークフロー実行確認
3. ビルドログ確認
```

## ⚠️ 注意事項

### 現在のGit状況
- ✅ git init 完了
- ✅ 初期コミット完了 (3352ba6)
- ⚠️ リモートリポジトリ未設定

### プッシュ前に必要な作業
1. GitHub.com でリポジトリ作成
2. [YOUR_USERNAME] を実際のGitHubユーザー名に置換
3. git push 実行

## 🎯 プッシュ後の流れ

1. **GitHub Actions 自動実行**
   - Flutter build実行
   - iOS archive作成  
   - App Store Connect アップロード

2. **初回実行時のエラー**
   - GitHub Secrets未設定のためエラー予想
   - Apple Developer Program加入後に再実行

3. **成功後**
   - TestFlight で利用可能
   - 開発者モード不要でインストール

## 📋 必要なGitHub Secrets

Apple Developer Program加入後に設定:
```
APPSTORE_ISSUER_ID
APPSTORE_KEY_ID  
APPSTORE_PRIVATE_KEY
IOS_DISTRIBUTION_CERTIFICATE_P12
IOS_DISTRIBUTION_CERTIFICATE_PASSWORD
```

## 🚀 実行準備完了

すべての設定完了。GitHub リポジトリ作成後、即座にプッシュ可能です。