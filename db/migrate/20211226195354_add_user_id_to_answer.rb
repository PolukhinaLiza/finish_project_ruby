class AddUserIdToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_reference :answers, :user, null: false, foreign_key: true, default: User.first.id
  end
end
