namespace :load do
  desc 'Load nodes from CSV'
  task nodes: :environment do
    require 'csv'
    csv_file = Rails.root.join('db', 'data', 'nodes.csv')

    ActiveRecord::Base.transaction do
      CSV.foreach(csv_file, headers: true) do |row|
        Node.find_or_initialize_by(id: row['id']).update!(
          parent_id: row['parent_id']
        )
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    puts "An error occurred: #{e.message}"
    raise e
  end
end
