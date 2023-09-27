# TXMLConfigManager - Simple XML Configuration Manager for Delphi
The TXMLConfigManager is a lightweight Delphi library designed to simplify configuration management in Delphi applications by leveraging XML files. This library allows developers to manage key-value pairs in an organized and straightforward manner, similar to traditional INI files.

# Key Features:
Simplified Configuration Storage: Store and organize configuration settings using a clear key-value structure within XML files.

Easy Integration: Seamlessly integrate the XML-based configuration manager into your Delphi projects, providing a simple and effective way to manage application settings.

Flexible Usage: Access and modify configuration values for different sections and keys, adapting to the specific needs of your application.

Persistence: Changes made to the configuration are saved to the specified XML file, ensuring settings persist across application sessions.

How to Use:
# Initialization:

Create an instance of TXMLConfigManager by providing the desired XML file name.
# Read Configuration Settings:

Retrieve configuration values using the GetValue method, specifying the desired section and key.
# Update Configuration Settings:

Update or set configuration values using the SetValue method, specifying the section, key, and new value.
# Persistence:

Ensure changes to the configuration are saved using the SaveToFile method.


// Example Usage:

 ```pascal
var
  ConfigManager: TXMLConfigManager;
begin
  // Initialize the configuration manager with the XML file name
  ConfigManager := TXMLConfigManager.Create('config.xml');

  try
    // Read a value from the "Section1" section with the key "Key1"
    ShowMessage('Value: ' + ConfigManager.GetValue('Section1', 'Key1', 'Default'));

    // Set a value in the "Section1" section with the key "Key2"
    ConfigManager.SetValue('Section1', 'Key2', 'Value2');

    // Save the changes to the XML file
    ConfigManager.SaveToFile;
  finally
    // Free the configuration manager
    ConfigManager.Free;
  end;
end;
 ```

# Start Simplifying Your Configuration Management:
Integrate the TXMLConfigManager library into your Delphi applications to streamline configuration management using XML files. Enjoy an intuitive approach to storing and accessing application settings, enhancing the maintainability and adaptability of your projects.


#In this unit:

### 'TXMLConfigManager' 
is a class that represents a simple XML-based configuration manager.

### 'Create' 
initializes the XML configuration manager with the specified file name. If the file does not exist, it creates a new XML structure.

### 'Destroy' 
saves the changes to the XML file before destroying the object.

### 'GetValue' 
retrieves a value from the XML file based on the provided section and key.

### 'SetValue' 
sets a value in the XML file for the specified section and key.

### 'SaveToFile' 
saves the changes to the XML file.

To use this unit in your program, include it in your project and create an instance of TXMLConfigManager. You can then use GetValue and SetValue to read and write configuration data to the XML file, mimicking the behavior of an INI file. Remember to call SaveToFile to persist the changes to the XML file.



