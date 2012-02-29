class CreateEverything < ActiveRecord::Migration
  def change
    # Create sources
    create_table :sources do |t|
      t.string :name
    end

    # Create ticker
    create_table :tickers do |t|
      t.string :name
      t.references :source
    end
    add_index :tickers, :source_id

    # Create pages
    create_table :pages do |t|
      t.text :content
      t.references :ticker
      t.timestamps
    end
    add_index :pages, :ticker_id
  end
end
