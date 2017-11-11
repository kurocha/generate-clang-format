
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "2.0"

define_target "generate-clang-format" do |target|
	target.description = <<-EOF
		Generates a basic clang-format configuration for the project.
	EOF
	
	target.depends "Generate/Template"
	target.provides "Generate/Clang/Format"
	
	target.build do
		directory = Files::Path.new('.')
		substitutions = target.context.substitutions
		
		source_path = Build::Files::Directory.new(target.package.path + "templates/format")
		
		generate source: source_path, prefix: directory, substitutions: substitutions
	end
end

define_configuration "language-clang-format" do |configuration|
	configuration.public!
	
	configuration.require "generate-template"
end
