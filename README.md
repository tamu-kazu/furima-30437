# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| last_kana  | string  | null: false |
| first_kana | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| nickname   | string  | null: false |
| birthday   | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| name     | string     | null: false |
| text     | text       | null: false |
| price    | integer    | null: false |
| genre_id | integer    | null: false |



### Association

- belongs_to :user
- has_one :purchase 
- belongs_to_active_hash :genre

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefectures   | string  | null: false |
| municipality  | string  | null: false |
| address       | string  | null: false |
| building_name | string  | null: false |
| phone_number  | string  | null: false |


### Association

- belongs_to :purchase