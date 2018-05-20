class VersionController < ApplicationController
  def index
    begin
      @version = YAML.load_file(Rails.root.join('version.yml'))['version']
    rescue
      @version = 'undefined'
    end
  end
end
