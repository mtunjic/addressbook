module ContactConverter
  # convert all contacts to csv
  def to_csv(*attributes)
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |record|
        csv << attributes.map { |attr| record.send(attr) }
      end
    end
  end
end