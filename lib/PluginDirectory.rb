class PluginDirectory

  def initialize(options)
    @name, @path, @verbose = options[:name], options[:path], options[:verbose]
  end

  public

  def create_root_directory_for_plugin

    if @verbose
      puts "Creating Plugin Root Directory"
    end

    unless @path == nil
      Dir.chdir(@path.to_s)
      Dir.mkdir(@name.to_s)
      Dir.chdir(@name.to_s)
    end
  end

  def create_plugin_directory_structure
    if @verbose
      puts "Creating Plugin Directory Structure"
    end

    Dir.mkdir("src")
    Dir.mkdir("www")

    Dir.chdir("src")
    Dir.mkdir("ios")
    Dir.mkdir("android")

    Dir.chdir(@path.to_s + "/" + @name.to_s)
  end
end