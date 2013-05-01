#
# Install Eclipse base package
#
# Edward Easton
# 2012-10-28
#

class eclipse {
    include apt_update
    Class['apt_update']  ->
    package {
        ["eclipse", "eclipse-jdt", "eclipse-pde"]: 
            ensure => installed;
    }
}

# Module installation
define eclipse::module($repository, $feature_id) {
    exec { "eclipse-module-$title":
        command => "java -jar /usr/lib/eclipse/plugins/org.eclipse.equinox.launcher_1.2.0.dist.jar -repository ${repository} -installIU ${feature_id} -noSplash -os linux -ws gtk -arch x86 -launcher /usr/lib/eclipse/eclipse -name Eclipse --launcher.library /usr/lib/eclipse/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_1.1.100.dist/eclipse_1408.so --launcher.overrideVmargs -debug  -consolelog  -application org.eclipse.equinox.p2.director -vm /usr/lib/jvm/java-6-openjdk-i386/jre/bin/../lib/i386/client/libjvm.so -vmargs -Xms40m -Xmx384m -Dorg.eclipse.equinox.p2.reconciler.dropins.directory=/usr/share/eclipse/dropins -XX:MaxPermSize=256m -Djava.class.path=/usr/lib/eclipse/plugins/org.eclipse.equinox.launcher_1.2.0.dist.jar",
        path => "/bin:/usr/bin:/usr/local/bin",
        require => Class["eclipse"],
        logoutput => true,
        onlyif => get_created_module_files($feature_id),
    }
}
