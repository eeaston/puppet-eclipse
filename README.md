puppet-eclipse
==============

Eclipse plugin for Puppet.

Provides eclipse via apt packaging, and allows module install via a custom class.

Example manifest that will install Eclipse + Aptana + PyDev:

    include eclipse
    eclipse::module {'aptana_core':
        repository => 'http://download.aptana.com/studio3/plugin/install',
        feature_id => 'com.aptana.feature.feature.group,com.aptana.pydev.feature.feature.group',
    } -> 
    eclipse::module {'aptana_pydev':
        repository => 'http://download.aptana.com/studio3/plugin/install',
        feature_id => 'com.aptana.pydev.feature.feature.group',
    }


TODO
----

This has only been checked on Ubuntu, would be useful to check if it works with Debian and Redhat

