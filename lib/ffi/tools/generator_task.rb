require 'ffi/tools/generator'
require 'rake'
require 'rake/tasklib'

##
# Rake task that calculates C structs for FFI::Struct.

# @private
class FFI::Generator::Task < Rake::TaskLib

  def initialize(rb_names)
    task :clean do rm_f rb_names end

    rb_names.each do |rb_name|
      ffi_name = "#{rb_name}.ffi"

      file rb_name => ffi_name do |t|
        puts "Generating #{rb_name}..." if Rake.application.options.trace

        FFI::Generator.new ffi_name, rb_name
      end
    end
  end

end
