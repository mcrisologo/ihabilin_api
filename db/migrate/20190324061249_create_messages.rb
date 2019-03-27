# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.timestamps

      t.references :user
      t.text :recipients, array: true, default: []
      t.string :subject
      t.text :body
    end
  end
end
