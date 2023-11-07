class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post_image
  
  validate :comment, length: { in: 3..50 }
  
  validate :check_for_ng_words
   private
   
   def check_for_ng_words
     ng_words = ["バカ", "アホ"] # NGワードのリスト
     
     ng_words.each do |ng_word|
      if comment&.match?(/#{Regexp.escape(ng_word)}/i)
        errors.add(:comment, "contains prohibited words.") # エラーメッセージの追加
      end
     end 
   end
end
