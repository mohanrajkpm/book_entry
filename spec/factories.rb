FactoryGirl.define do
  
  factory :book do
    name "MyIndia"
    author "wilsmith"
    isbn "o-1"
    price 200
    category 'Education'
    publish
  end
end