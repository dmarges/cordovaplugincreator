class PluginFiles
  def initialize(options)
    @name, @path, @bundle_id, @verbose = options[:name], options[:path], options[:bundle_id], options[:verbose]
  end

  def create_plugin_xml_file
    if @verbose
      puts "Creating Plugin XML File"
    end

    bundle_id_as_path = @bundle_id.gsub("\.", "\/")

    plugin_template = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <plugin xmlns=\"http://apache.org/cordova/ns/plugins/1.0\"
            id=\"#{@bundle_id}.#{@name}\" version=\"0.0.1\">
      <name>#{@name}</name>
      <description>#{@name}</description>
      <license>Apache 2.0</license>
      <keywords></keywords>
      <js-module src=\"www/#{@name}.js\" name=\"#{@name}\">
        <clobbers target=\"#{@name}\" />
      </js-module>
      <platform name=\"android\">
        <config-file target=\"res/xml/config.xml\" parent=\"/*\">
          <feature name=\"#{@name}\">
            <param name=\"android-package\" value=\"#{@bundle_id}.#{@name}\" />
          </feature>
        </config-file>
        <source-file src=\"src/android/CDV#{@name}.java\" target-dir=\"src/#{bundle_id_as_path}/#{@name}/\" />
      </platform>
      <platform name=\"ios\">
        <config-file target=\"config.xml\" parent=\"/*\">
          <feature name=\"#{@name}\">
            <param name=\"ios-package\" value= \"CDV#{@name}\" />
          </feature>
        </config-file>
        <header-file src=\"src/ios/CDV#{@name}.h\" target-dir=\"#{@name}/Classes\" />
        <source-file src=\"src/ios/CDV#{@name}.m\" target-dir=\"#{@name}/Classes\" />
      </platform>
    </plugin>"

    File.write(Dir.pwd + "/plugin.xml", plugin_template)
  end

  def create_plugin_readme
    if @verbose
      puts "Creating Plugin README file"
    end

    File.write(Dir.pwd + "/README.md", "##{@name}")
  end

  def create_package_file
    if @verbose
      puts "Creating Plugin Package file"
    end

    package_template = "{
      \"version\": \"0.0.1\",
      \"name\": \"#{@bundle_id}.#{@name}\",
      \"cordova_name\": \"#{@name}\",
      \"description\": \"#{@name}\",
      \"license\": \"MIT\",
      \"keywords\": [],
      \"engines\": [
        {
          \"name\": \"cordova\",
          \"version\": \">=3.0.0\"
        }
      ]
    }"

    File.write(Dir.pwd + "/package.json", package_template)
  end

  def create_ios_header_file

    if @verbose
      puts "Creating iOS header file"
    end

    ios_header_template = "
      //CDV#{@name}
      //
      #import <Cordova/CDV.h>

      @interface #{@name} : CDVPlugin
      @end
    "

    Dir.chdir(Dir.pwd + "/src/ios")
    File.write(Dir.pwd + "/CDV#{@name}.h", ios_header_template)
  end

  def create_ios_implementation_file
    if @verbose
      puts "Creating iOS source file"
    end

    ios_implementation_template = "
      //CDV#{@name}.m
      //
      #import \"CDV#{@name}.h\"

      @implementation #{@name}
      @end
    "

    File.write(Dir.pwd + "/CDV#{@name}.m", ios_implementation_template)
  end

  def create_android_source_file
    if @verbose
      puts "Creating Android source file"
    end

    android_source_template = "
      /**
       * #{@name}
       */

      package #{@bundle_id}.#{@name};

      import org.apache.cordova.CallbackContext;
      import org.apache.cordova.CordovaPlugin;
      import org.apache.cordova.PluginResult;
      import org.apache.cordova.PluginResult.Status;
      import org.json.JSONArray;
      import org.json.JSONException;
      import org.json.JSONObject;
      import java.util.Iterator;

      public class CDV#{@name} extends CordovaPlugin {

        @Override
        public boolean execute(String action, JSONArray inputs, CallbackContext callbackContext) throws JSONException {
          PluginResult result = null;
          callbackContext.sendPluginResult(result);
          return true;
        }
      }
    "

    Dir.chdir(@path + "/" + @name + "/" + "src/android")
    File.write(Dir.pwd + "/CDV#{@name}.java", android_source_template)
  end

  def create_javascript_source_file
    if @verbose
      puts "Creating JavaScript source file"
    end

    javascript_source_file = "
      var #{@name} = {
      };

      module.exports = #{@name};
    "

    Dir.chdir(@path + "/" + @name + "/" + "www")
    File.write(Dir.pwd + "/#{@name}.js", javascript_source_file)
  end
end