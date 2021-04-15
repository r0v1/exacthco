module CartHelper

  def generate_sequence_number
    ((rand*100000).to_i + 5000).to_s
  end

  def generate_random_amount_15_30
    (rand(15..30).to_i).round(2)
  end

  def generate_timestamp
    Time.now.to_i.to_s
  end

  def generate_hmac_string(login, sequence, timestamp, amount, currency)
     # Concatenating the values included in the x_fp_hash
     # hmac_string = "#{x_login}^#{x_fp_sequence}^#{x_fp_timestamp}^#{x_amount}^#{x_currency_code}"
     "#{login}^#{sequence}^#{timestamp}^#{amount}^#{currency}"
  end

  def generate_md5_hash(transaction_key, hmac_string)
     OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("md5"), transaction_key, hmac_string)
  end

  def generate_hmac_sha256_hash(transaction_key, hmac_string)
    OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), transaction_key, hmac_string)
  end

end
