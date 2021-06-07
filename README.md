# アプリケーション名
techpit-match

# 概要
マッチングアプリサービス

# 本番環境
## URL

ログイン情報(テスト用)
- Eメール： test@test.com
- パスワード： abc123
またはゲストログインにより、ログイン可能

# DEMO
## トップページ

## ログイン機能(device)

## ゲストログイン機能

## いいね機能(ajax)

## スワイプ機能(ajax)

## チャットルーム作成機能

## チャット機能(Action Cable)

## レスポンシブ対応


# 使用技術
## バックエンド
Ruby:2.6.5, Ruby on Rails:6.0.0
## フロントエンド
HTML, CSS, JavaScript(jQuery), Bootstrap, WebPacker, Font Awesome
## データベース
MySQL, SequelPro
## インフラ
AWS(EC2), nginx, unicorn
## ソース管理
GitHub, GitHubDesktop
## テスト
RSpec
## エディタ
VSCode
# 課題・実装予定機能
- 通知機能
- 絞り込み検索

# テーブル設計

## users テーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| encrypted_password | string  | null: false |
| self_introduction  | text    |             |
| gender             | integer | null: false |
| profile_image      | string  |             |

### Association
has_many :reactions
has_many :chat_room_users
has_many :chat_rooms, through: :chat_room_users
has_many :chat_messages

## reactionsテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| status             | integer | null: false |
| from_user_id       | references  | null: false |
| to_user_id         | references  | null: false |

### Association
belongs_to :to_user, class_name: "User"
belongs_to :from_user, class_name: "User"

## chat_roomテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
|                    |         |             |

### Association
has_many :chat_room_users
has_many :users, through: :chat_room_users
has_many :chat_messages

## chat_room_usersテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| chat_room_id       | references  | null: false |
| user_id            | references  | null: false |

### Association
belongs_to :chat_room
belongs_to :user

## chat_messagesテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| content            | text    | null: false |
| user_id            | references  | null: false |
| chat_room_id       | references  | null: false |

## Association
belongs_to :user
belongs_to :chat_room