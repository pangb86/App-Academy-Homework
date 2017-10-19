class Person
  validates :name, presence: true, uniqueness: true
  validates :house_id, presence: true, uniqueness: true
end
