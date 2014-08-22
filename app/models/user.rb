class User < ActiveRecord::Base
  validates :first_name, :last_name, :email,  presence: true
  has_many :addresses, :dependent => :destroy
  accepts_nested_attributes_for :addresses, allow_destroy: true, reject_if: :all_blank

  def as_json(options={})
    super(:include => [:addresses])
  end
end
