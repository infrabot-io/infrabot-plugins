# Plugins for infrabot
Here are shown example plugins. 

# Getting Started
In order to have better experience with developing PowerShell scripts you should either have to use PowerShell ISE or Visual Studio Code with PowerShell development extension installed. 

# Requirements
There are serveral rules which must be obeyed in order to create plugins:
* infrabot understands only __.plug__ files like a plugin
* Plugin is a simple __ZIP__ archive which may contain any number and any types of files. After creating zip archive, you must change its extension from __.zip__ to __.plug__ 
* In order to install plugin, you have to put __.plug__ file into _/plugins_ directory of the infrabot installation path. As soon as you do that, infrabot will create subdirectory in _/plugins_ with the name of the __.plug__ file, and extract all its content there.
* If you delete __.plug__ file, subdirectory with the same name in the _/plugins_ directory will be deleted as well. There is no point of putting files into directories created after plugin deployment
* There is no need to do anything after deployment of plugins. Infrabot automatically reads them after deployment (or deletion) and they are available for use immediately
* Each plugin must have one __plugin.json__ file and at least one __PS1__ PowerShell script or one __EXE__ file. _(Depends on plugin type)_
* __plugin.json__ must be located in a root directory of the ZIP archive
* Other files including main script can be located in any subdirectory of the plugin. _Note that you must write right paths to your files in your plugin!_
* 

# plugin.json file example
_Note that this is a simple example. You can find more complex variations of plugin.json file in Examples folder_ 

```
{
    "command_starts_with": "/gethostname",
    "command_data_id": [
        0
    ],
    "command_execute_file": "GetHostName.ps1",
    "command_help_manual": "Shows host name where BOT works. Write `/gethostname` to get host name",
    "command_help_short": "Shows host name where BOT works",
    "command_author": "infrabot.io",
    "command_version": "1.0.0.0",
    "command_website": "https://infrabot.io",
    "command_default_error": "",
    "command_execute_type": 4,
    "command_allowed_users_id": [],
    "command_show_in_get_commands_list": true,
    "command_execute_results": []
}
```

As you can notice from the example above, _command_execute_file_ parameter keeps our main script file name. If you have much more complex script which uses any number of other scripts and you decided to put them into subdirectories on plugin, you will have to set path according to main PS1 file. Example: 
```
"command_execute_file": "my\other\subdirectory\my_main_script_which_will_be_executed_by_bot.ps1",
```


