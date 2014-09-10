def grape_param(param)
  param_method = param.required? ? 'requires' : 'optional'
  param_attrs = {
    type: grape_type(param.type),
    desc: param.description
  }

  clean_param_attrs = param_attrs.map do | k, v |
    "#{k}: #{v.inspect}" unless v.nil?
  end
  param_args = [param.name.inspect].concat(clean_param_attrs).compact.join(', ')
  "#{param_method} #{param_args}"
end

def grape_type(type)
  case type
  when 'string'
    String
  when 'integer'
    Integer
  # more types...
  else
    nil
  end
end
