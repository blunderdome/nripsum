class Sentence < ActiveRecord::Base
  before_save :add_end_punctuation_if_missing

  VALID_END_PUNCTUATION = %w(. ! ?)

  END_PUNCTUATION_TO_APPEND = %w(. ! ? !? ?! ?? !!)

  def add_end_punctuation_if_missing
    if self.content.chars.last.in?(VALID_END_PUNCTUATION)
      # do nothing
    else
      self.content << END_PUNCTUATION_TO_APPEND.sample
    end
  end
end
