class LongUri < ApplicationRecord
	validates :org_url, presence: true, uniqueness: true
end

