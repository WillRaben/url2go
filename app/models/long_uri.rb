class LongUri < ApplicationRecord
	validates :org_url, presence: true, uniqueness: true
	validate :url_validator

private

   def url_validator
   		if (Regexp::PERFECT_URL_PATTERN =~ :org_url) == nil
   			errors.add(:org_url, "is invalid")
   		end
   end
end

