exec {"apt-get update":
    path => "/usr/bin",
}


Package { ensure => "installed" }

$essentials  = [   "build-essential", "fakeroot", "debhelper", "autoconf", "automake", "libssl-dev", "graphviz", "python-all", "python-qt4", "python-twisted-conch", "libtool", "tmux", "vim", "python-pip", "python-paramiko", "python-sphinx", "python-dev" , "ssh", "emacs", "sshfs", "python-routes", "bison", "git"]

$pipPackages = [ "alabaster", "greenlet", "networkx" , "decorator", "eventlet", "msgpack-python", "oslo.config", "scapy", "thrift" ]

package { $essentials: }

package { $pipPackages:
  ensure => present,
  provider => pip,
  require => Package[$essentials],
}

package { "ryu":
  ensure => latest,
  provider => pip,
  require => Package["python-routes", "eventlet", "msgpack-python", "oslo.config"],
}

package {"openvswitch-switch":
  ensure  => present,
  require => Exec["apt-get update"],
}

package {"openvswitch-controller":
  ensure  => present,
  require => Exec["apt-get update"],
}

package {"mininet":
  ensure  => latest,
  require => Package["openvswitch-switch", "openvswitch-controller"],
}

# install swipl
package {"software-properties-common": 
  ensure => latest,
}

exec {"apt-add-repository ppa:swi-prolog/stable":
    path => "/usr/bin",
}

package {"swi-prolog":
  ensure => "installed",
  require => Exec["apt-add-repository ppa:swi-prolog/stable"],
}
