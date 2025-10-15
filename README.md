# Login Notify Userscript for UNRAID

A script to be run in Userscripts that checks SYSLOG for login attempts.

### What This Is

This is a very basic bash script that checks syslog for login attempts and sends a command to the built in notify script in UNRAID.

It was based on an old script by reddit user /u/sureguy but it no longer worked because syslog uses different verbiage now. You can edit it yourself by changing the grep string, or changing the index that awk prints, as these may be subject to change.

### Usage

If you don't have the User Scripts plugin by Andrew Zawadzki installed on your UNRAID system, install that first.

Create a new script in User Scripts once it is installed, name it as you wish, and save it. You can set it to "Run in Background" once that is complete, and set it to "Start with Array" so that it is scanning for logins once the array is started.

As long as the script is running it will check syslog lines with tail and return code 0 if a login attempt has succeeded or failed, and send a warning.

On my system I get both a popup and an email, you can change that setting in UNRAID notification settings.