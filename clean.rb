#!/usr/bin/env ruby
require 'taglib'

options = {
	:clean_comments => false
}

if ARGV.length < 1
	puts "ERROR: no files specified"
else
	ARGV.each do |file|
		if File.extname( file ) == '.mp3'
			TagLib::FileRef.open(file) do |fileref|
				unless fileref.null?
					tag = fileref.tag
					puts file

					if options.clean_comments
						tag.comment = ""
					end


					fileref.save
				end
			end
		end
	end
end