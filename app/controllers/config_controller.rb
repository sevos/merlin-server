class ConfigController < ApplicationController
  respond_to :json

  def show
    environment = params[:environment]
    @configs = {}

    Dir[Rails.root.join('config.d', '*.yml')].each do |path|
      yaml = YAML.load(File.read(path))[environment]
      @configs[File.basename(path, '.*')] = yaml
    end

    respond_with @configs
  end
end
