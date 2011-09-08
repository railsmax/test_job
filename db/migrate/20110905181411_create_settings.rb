class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.boolean :boolean_setting
      t.string :string_setting
      t.integer :integer_setting
      t.float :float_setting,{:length => 17, :decimals => 14}

      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
