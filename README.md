# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| name     | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| nickname | string  | null: false |
| birthday | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| price           | integer    | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | integer    | null: false                    |
| area            | string     | null: false                    |
| date            | integer    | null: false                    | 


### Association

- belongs_to :user
- has_many :purchases 

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
| card          | integer    | null: false                    |
| period        | integer    | null: false                    |
| security_code | integer    | null: false                    |
| price         | integer    | null: false                    |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefectures   | string  | null: false |
| municipality  | string  | null: false |
| address       | integer | null: false |
| building_name | string  | null: false |
| phone_number  | integer | null: false |


### Association

- belongs_to :purchase