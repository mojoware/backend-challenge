FactoryBot.define do
  factory :member do
    first_name { 'John' }
    last_name  { 'Doe' }
    url  { 'http://something.com' }
  end
end
