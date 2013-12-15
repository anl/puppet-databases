class { '::mysql::server':
  remove_default_accounts => true,
} ->

# Include this module
class { '::databases::mysql':
  databases => {
    'fizzle' => {
      charset => 'utf8'
    }
  },
  grants    => {
    'foo@localhost/fizzle.*' => {
      privileges => ['ALL'],
      table      => 'fizzle.*',
      user       => 'foo@localhost',
    },
    'bar@localhost/fizzle.*' => {
      privileges => ['ALL'],
      table      => 'fizzle.*',
      user       => 'bar@localhost',
    }
  },
  users     => {
    'foo@localhost' => {
      password_hash => '*F3A2A51A9B0F2BE2468926B4132313728C250DBF'
    },
    'bar@localhost' => {
      password_hash => '*E8D46CE25265E545D225A8A6F1BAF642FEBEE5CB'
    }
  }
}
