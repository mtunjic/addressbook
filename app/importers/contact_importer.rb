module ContactImporter

  # Import contacts from csv file and return as array
  def from_csv(file)
    contacts = []
    CSV.foreach(file.path) do |row|
      create!(user_id: row[0].to_i, first_name: row[1].strip,
              last_name: row[2].strip, email: row[3].strip,
              group_id: row[4].to_i)
      # contacts << [Contact.new(first_name: row[0],
      #             last_name: row[1], email: row[2])] #TODO: add all fileds
    end
  end
end
