# Plugins for infrabot
Example plugins. 

# Getting Started
- Download plugins from this repository.
- Open [Plugin Editor](https://github.com/infrabot-io/infrabot/releases).
- From the context menu open downloaded file in the application

In order to have better experience with developing PowerShell scripts you should either have to use PowerShell ISE or Visual Studio Code with PowerShell development extension installed. 

# Requirements
There are several rules which you should know about plugin system:

* infrabot understands only __.plug__ files like a plugin
* Each plugin has its unique GUID which is generated during plugin creation. Generated GUID could not be changed
* Plugin is a custom binary file containing all the necessary configuration and data files. Data can be any file which is needed for your application or script to work. Plugins could be created\modified only via Plugin Editor tool
* Plugin installation could be achieved via copying __.plug__ file into __/plugins__ directory of the infrabot installation path. If file is a valid plugin file, infrabot will load plugin configuration, create subdirectory in __/plugins__ directory with the GIUD of the plugin, and extract all plugin\`s data contet there. If folder with the plugin\`s GUID already exists, it will be deleted first. No additional tasks are needed
* If you delete __.plug__ file, plugins reload will be automatically triggered. Subdirectory with the GUID of the plugin in the __/plugins__ directory will not be touched. You will have to clean folder manually. But note that, if you redeploy the same plugin again, the existing folder with the GUID will be deleted first and then recreated again with the further data extraction
* If you delete a plugin`s GUID directory in the __/plugins__ folder, the plugin will not be redeployed and command execution will fail, because extracted files were absent to be executed
* There is no need to do anything after deployment of plugins. Infrabot automatically reads them after deployment (or deletion) and they are available for use immediately, however you can force plugin reload via __/reloadconfig__ command execution
* Files for execution can be located in any subdirectory of the plugin. Note that you must specify relative path to your executable file in the plugin`s configuration
* Telegram commands list menu is automatically updated on changes. After changes, 3-5 minutes should pass in order to see updates in the chat menu
