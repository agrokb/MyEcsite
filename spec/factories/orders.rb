FactoryBot.define do
  factory :order do
    num { "MyString" }
    recipient { "MyString" }
    tel { "MyString" }
    address { "MyString" }
    note { "MyText" }
    user { nil }
    state { "MyString" }
    paid_at { "2020-06-05 17:39:28" }
    transaction_id { "MyString" }
  end
end
