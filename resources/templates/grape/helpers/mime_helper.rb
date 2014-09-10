def mime_to_grape_format(mime_type)
  return :json if mime_type =~ /\/json/
  return :xml if mime_type =~ /\/xml/
  return :txt if mime_type.start_with? 'text/plain'
  fail ArgumentError, "Unsupported mime format: #{mime_type}"
end
