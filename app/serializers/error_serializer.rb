module ErrorSerializer
  def self.serialize(errors)
    return if errors.nil?

    json = {}

    new_hash = errors.to_hash.map do |k, v|
      v.map do |msg|
        { id: k, title: msg, timestamp: Time.now.to_i }
      end
    end.flatten
    json[:errors] = new_hash
    json
  end
end
