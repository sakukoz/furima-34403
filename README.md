## Users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | string | null: false |

### Association
- has_many :items
- has_many :orders

## Items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery fee  | string     | null: false                    |
| location      | string     | null: false                    |
| delivery_days | string     | null: false                    |
| price         | integer    | null: false                    |
| seller        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## Orders テーブル

| Column    | Type       | Options                        |
| --------- |------------|------------------------------- |
| item      | references | null: false, foreign_key: true |
| buyer     | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addresses テーブル

| Column   | Type       | Options                        |
| -------- |------------|------------------------------- |
| order    | references | null: false, foreign_key: true |
| postcode | string     | null: false                    |
| region   | string     | null: false                    |
| city     | string     | null: false                    |
| street   | string     | null: false                    |
| building | string     |                                |
| phone    | string     | null: false                    |

### Association
- belongs_to :record
