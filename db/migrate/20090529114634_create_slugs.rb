# -*- encoding : utf-8 -*-
class CreateSlugs < ActiveRecord::Migration
  def self.up
    create_table :slugs do |t|
      t.string :name
      t.integer :sluggable_id
      t.integer :sequence, :null => false, :default => 1
      t.string :sluggable_type, :limit => 40
      t.string :scope, :limit => 40
      t.datetime :created_at
    end
    execute "CREATE UNIQUE INDEX index_slugs_on_name_and_sluggable_type_and_scope_and_sequence ON slugs (name(250), sluggable_type, scope, sequence)"
    add_index :slugs, :sluggable_id
  end

  def self.down
    drop_table :slugs
  end
end
