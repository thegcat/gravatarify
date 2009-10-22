# Loads all required submodules

# Base -> provides the basic gravatar_url method, can also be used for
# custom implementations, just include Gravatarify::Base.
require 'gravatarify/base'
require 'gravatarify/object_support'
require 'gravatarify/helper'

# setup for AR und DataMapper, note: DataMapper yet untested :) but I suppose it works, because
# it works as expected on plain old ruby objects!
ActiveRecord::Base.send(:include, Gravatarify::ObjectSupport) if defined?(ActiveRecord)
DataMapper::Model.append_inclusions(Gravatarify::ObjectSupport) if defined?(DataMapper)

# and HAML support (if defined)
Haml::Helpers.send(:include, Gravatarify::Helper) if defined?(Haml)
