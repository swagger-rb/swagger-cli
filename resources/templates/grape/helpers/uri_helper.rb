def uri_template_to_grape(uri_fragment)
  uri_fragment.gsub(/\{([^\}]+)\}/, ':\1').inspect
end
