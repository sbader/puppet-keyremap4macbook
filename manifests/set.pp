# Public: set identifier to value
#
# identifier - the identifier to remap. Defaults to title.
# value - the value to set.
#
# Examples
#
#   # set the parameter.keyoverlaidmodifier_timeout to 300
#   keyremap4macbook::remap { 'parameter.keyoverlaidmodifier_timeout':
#     value => '300'
#   }
#
#   # explicitly specify the identifier
#   keyremap4macbook::remap { 'foobar':
#     identifier => 'parameter.keyoverlaidmodifier_timeout',
#     value      => '300'
#   }
define keyremap4macbook::set(
  $value,
  $identifier = $title
) {
  include keyremap4macbook::config

  keyremap4macbook::cli { "keyremap4macbook::set::${identifier}=${value}":
    command => "set ${identifier} ${value}",
    unless => "${keyremap4macbook::config::cli} export | grep '${identifier} ${value}'"
  }
}
