# LuaPong
pong game in lua using LÖVE engine

# Requirements
To run this Pong game, you will need to download and install the LÖVE game engine. You can download it for free from the official LÖVE website: https://love2d.org/.

# Build
0.Once you have installed LÖVE, you can run the game by following these steps:

1.Compress the entire game folder into a ZIP file. Make sure that the "main.lua" file is at the top level of the ZIP file (i.e. not inside a subfolder).

2.Rename the ZIP file with a ".love" extension (e.g. "pong.love").

3.Double-click the ".love" file to run the game.

# Android

As long as you have LÖVE for Android installed from the Play Store or another source and assume you didn't download/use the "embed" suffix flavor, the following methods will work:

Transfer your game folder to /sdcard/Android/data/org.love2d.android/files/games/lovegame (/sdcard/lovegame also works in Pie and earlier) where main.lua is found at /sdcard/Android/data/org.love2d.android/files/games/lovegame/main.lua. In Android 11 or later, these directories only accessible through MTP in PC. Then run LÖVE for Android.

Transfer/download a .love of your game to the device and click on it. Some file explorers will run the .love using LÖVE for Android. If it does not you can install ES File Explorer which will. If you use Dropbox, you can use that to open .love files. May not work in Android Nougat or later due to Android restrictions.
