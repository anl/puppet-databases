# == Class: databases::mysql
#
# Configure users, databases and grants in MySQL.
#
# === Parameters
#
# [*users*]
#   Hash of user hashes for mysql_user provider.
#
# === Examples
#
# class { '::databases::mysql':
#   users => {
#     'foo@localhost' => {
#       password_hash => '*F3A2A51A9B0F2BE2468926B4132313728C250DBF'
#     },
#     'bar@localhost' => {
#       password_hash => '*E8D46CE25265E545D225A8A6F1BAF642FEBEE5CB'
#     }
#   }
# }
#
# === Authors
#
# Andrew Leonard
#
# === Copyright
#
# Copyright 2013 Andrew Leonard
#
class databases::mysql(
  $users = {}
  ) {

  create_resources(mysql_user, $users)

}
