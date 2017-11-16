class TaksJob < ApplicationRecord
  belongs_to :task
  belongs_to :job
end
