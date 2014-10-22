class PluginExampleApp
  def initialize options
    @name, @path, @bundle_id, @verbose = options[:name], options[:path], options[:bundle_id], options[:verbose]
  end

  def create_example_app_for_testing
    if @verbose
      puts "Creating Example Cordova App for Plugin"
    end

    Dir.chdir(@path)

    if @verbose
      puts "Running Create Command"
    end

    create_successful = system("cordova create #{@name}_example #{@bundle_id}.#{@name} #{@name}")

    if @verbose && create_successful
      puts "Create Command Successful"
    end

    Dir.chdir("#{@name}_example")

    if @verbose
      puts "Adding platforms"
    end

    system("cordova platform add ios")
    system("cordova platform add android")

    if @verbose
      puts "Platforms added"
    end
  end

  def install_plugin
    if @verbose
      puts "Adding our plugin"
    end

    plugin_successful = system("cordova plugin add #{@path}/#{@name}")

    if @verbose && plugin_successful
      puts "Plugin installed successfully"
    end
  end

  def build_example_app
    if @verbose
      puts "Running Build command"
    end

    build_successful = system("cordova build")

    if @verbose && build_successful
      puts "Built successfully"
    end
  end
end