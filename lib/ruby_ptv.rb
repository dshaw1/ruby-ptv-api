require "ruby_ptv/version"
require "ruby_ptv/client"

module RubyPtv
  class << self
    attr_accessor :options
  end
  self.options = {}

  # Define global configuration, if desired
  #
  # Required params:
  #   options[:dev_id]     - PTV developer ID
  #   options[:secret_key] - PTV developer key
  #
  def self.configure(params = {})
    raise(ArgumentError, "Options hash required.") unless params.is_a?(Hash)

    options[:dev_id]     = params[:dev_id]
    options[:secret_key] = params[:secret_key]
    options
  end

  # Returns global configuration hash
  #
  def self.configuration
    options
  end

  # Resets the global configuration
  #
  def self.reset_configuration
    self.options = {}
  end
end
