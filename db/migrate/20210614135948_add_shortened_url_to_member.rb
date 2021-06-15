class AddShortenedUrlToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :shortened_url, :string
  end
end
