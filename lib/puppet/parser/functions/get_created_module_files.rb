module Puppet::Parser::Functions
  newfunction(:get_created_module_files, :type => :rvalue) do |args|
    feature_ids = args[0]
    res = []
    feature_ids.split(',').each do|feature_id|
        fname = feature_id.split('.feature.group')[0]
        path = "/usr/lib/eclipse/features/#{fname}_*/feature.xml"
        res.push("! -f " + path)
    end
    debug("Eclipse plugin file checks: #{res}\n")
    "test " + res.join(" -o ")
  end
end
