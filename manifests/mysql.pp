# == Class: databases::mysql
#
# Configure users, databases and grants in MySQL.
#
# === Parameters
#
# [*databases*]
#   Hash of database hashes for mysql_database provider.
#
# [*grants*]
#   Hash of grant hashes for mysql_grant provider.
#
# [*users*]
#   Hash of user hashes for mysql_user provider.
#
# === Examples
#
# class { '::databases::mysql':
#   databases => {
#     'fizzle' => {
#       charset => 'utf8'
#     }
#   },
#   grants    => {
#     'foo@localhost/fizzle.*' => {
#       privileges => ['ALL'],
#       table      => 'fizzle.*',
#       user       => 'foo@localhost',
#     }
#   },
#   users     => {
#     'foo@localhost' => {
#       password_hash => '*F3A2A51A9B0F2BE2468926B4132313728C250DBF'
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
  $databases = {},
  $grants = {},
  $users = {}
  ) {

  create_resources(mysql_user, $users)
  create_resources(mysql_database, $databases)

  # If mysql_grant is run before the user is created with mysql_user,
  # the user will automatically be created.  (NO_AUTO_CREATE_USER
  # appears to be off by default.)  This exposes a race condition
  # before the user's password is set by mysql_user().  Therefore, it
  # may be desirable to find a way to chain these resources
  # appropriately.
  create_resources(mysql_grant, $grants)

}
