class Relay < ActiveRecord::Base
  validates :x_trans_id, presence: {message: "Must be provided!"},
                    uniqueness: true,
                    length: {minimum: 7, maximum: 10}
end
