FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '00000000' }
    password_confirmation { password }
    last_name             { '太郎' }
    first_name            { '山田' }
    last_kana             { 'タロウ' }
    first_kana            { 'ヤマダ' }
    birthday              { '1999-03-07' }
  end
end
