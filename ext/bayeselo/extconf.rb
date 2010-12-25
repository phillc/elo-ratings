require 'mkmf-rice'

extension_name = 'bayeselo'
have_library("stdc++")
dir_config(extension_name)
create_makefile(extension_name)
