exec { "couchbase-server-source": 
    command => "/usr/bin/wget http://packages.couchbase.com/releases/2.2.0/couchbase-server-community_2.2.0_x86.deb",

    cwd => "/home/vagrant/",

    creates => "/home/vagrant/couchbase-server-community_2.2.0_x86.deb",

    before => Package['couchbase-server']
}

exec { "install-deps":
    command => "/usr/bin/apt-get install libssl0.9.8",

    before => Package['couchbase-server']
}

package { "couchbase-server":
    provider => dpkg,

    ensure => installed,

    source => "/home/vagrant/couchbase-server-community_2.2.0_x86.deb"
}

