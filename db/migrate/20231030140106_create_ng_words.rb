class CreateNgWords < ActiveRecord::Migration[6.1]
  def change
    create_table :ng_words do |t|
      validates :comment, format: { with: /\A[a-zA-Z]+\z/ }

      t.timestamps
    end
  end
end
