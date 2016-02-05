class Question < ActiveRecord::Base
	has_many :answers, :dependent => :destroy, :autosave => true
	has_many :survey_answers 

	accepts_nested_attributes_for :answers, allow_destroy: true, :reject_if => proc { |att| att[:answer].blank? }
end
