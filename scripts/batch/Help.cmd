::
:: PROJECT:     RosBE - ReactOS Build Environment for Windows
:: LICENSE:     GNU General Public License v2. (see LICENSE.txt)
:: FILE:        Root/Help.cmd
:: PURPOSE:     Display help for the commands included with the ReactOS Build Environment.
:: COPYRIGHT:   Copyright 2020 Daniel Reimer <reimer.daniel@freenet.de>
::                             Peter Ward <dralnix@gmail.com>
::                             Colin Finck <colin@reactos.org>
::

@echo off
if not defined _ROSBE_DEBUG set _ROSBE_DEBUG=0
if %_ROSBE_DEBUG% == 1 (
    @echo on
)

:: Check if we are displaying help on all commands, if so, display it.
:: Otherwise check if we are displaying help on individual commands, if so,
:: display the help for that command.
if "%1" == "" (
    echo.
    echo Available Commands:
    echo    make [OPTIONS]       - Make does a standard build of ReactOS. OPTIONS are
    echo                           the standard ReactOS build options.
    echo    makex [OPTIONS]      - Same as 'make' but automatically determines the
    echo                           number of CPU Cores in the system and uses -j with
    echo                           the appropriate number.
    echo    basedir              - Switch back to the ReactOS source directory.

    if exist "%_ROSBE_BASEDIR%\charch.cmd" (
        echo    charch [OPTIONS]     - Change the Architecture to build ReactOS for
        echo                           for the current RosBE session.
    )

    if exist "%_ROSBE_BASEDIR%\chdefdir.cmd" (
        echo    chdefdir [OPTIONS]   - Change the ReactOS source directory for the
        echo                           current RosBE session.
    )

    if exist "%_ROSBE_BASEDIR%\chdefgcc.cmd" (
        echo    chdefgcc [OPTIONS]   - Change the Host or Target MinGW/GCC directory
        echo                           for the current RosBE session.
    )

    echo    clean [OPTIONS]      - Fully clean the ReactOS source directory and/or the
    echo                           RosBE build logs.

    echo    help [COMMAND]       - Display the available commands or give help on a
    echo                           specific command.

    if exist "%_ROSBE_BASEDIR%\kdbg.cmd" (
        echo    kdbg [OPTIONS]       - Outputs KDBG Debug Output and lets you give
        echo                           debug commands to it.
    )

    if exist "%_ROSBE_BASEDIR%\raddr2line.cmd" (
        echo    raddr2line [OPTIONS] - Translates program addresses into file names and
        echo                           line numbers to assist developers with finding
        echo                           specific bugs in ReactOS.
    )

    if exist "%_ROSBE_BASEDIR%\Remake.cmd" (
        echo    remake [OPTIONS]     - Cleans one or several specific modules and
        echo                           immediately rebuilds it cleanly.
    )

    if exist "%_ROSBE_BASEDIR%\Remakex.cmd" (
        echo    remakex [OPTIONS]    - Cleans one or several specific modules and
        echo                           immediately rebuilds it cleanly and multi-
        echo                           threaded.
    )

    if exist "%_ROSBE_BASEDIR%\scut.cmd" (
        echo    scut [OPTIONS]       - List, add, edit, remove, switch and default to
        echo                           shortcutted ReactOS source directories.
    )

    if exist "%_ROSBE_BASEDIR%\options.cmd" (
        echo    options              - Starts the RosBE configurator and sets the
        echo                           changes active immediately.
    )

    if exist "%_ROSBE_BASEDIR%\update.cmd" (
        echo    update [OPTIONS]     - Updates RosBE to the most recent files.
    )

    echo.
) else if /i "%1" == "make" (
    echo Usage: make [OPTIONS]
    echo Make does a standard build of ReactOS. OPTIONS are the standard ReactOS build
    echo options:
        echo.
        echo    all              - This target builds all of ReactOS.
        echo    "module"         - Builds only the module with the appropiate name.
        echo    bootcd           - Generates a BootCD ISO.
        echo    livecd           - Generates a LiveCD ISO.
        echo    install          - Installs ReactOS in the folder specified by the
        echo                       environment variable "ROS_INSTALL".
        echo    "module"_install - Installs only the module with the appropiate name in
        echo                       the folder specified by the environment variable
        echo                       "ROS_INSTALL".
        echo    clean            - Deletes all files generated by the build process.
        echo    "module"_clean   - Deletes only the files of one module with the
        echo                       appropiate name.
        echo    depends          - Does a full dependency check on the ReactOS Source
        echo                       and generates a new makefile. This will take a while.
        echo    "module"_depends - Does a dependency check for one module with the
        echo                       appropiate name.
) else if /i "%1" == "makex" (
    echo Usage: makex [OPTIONS]
    echo Same as 'make' but automatically determines the number of CPU Cores in the
    echo system and uses "make -j x" with the appropriate number. OPTIONS are the
    echo standard ReactOS build options:
        echo.
        echo    all              - This target builds all of ReactOS.
        echo    "module"         - Builds only the module with the appropiate name.
        echo    bootcd           - Generates a BootCD ISO.
        echo    livecd           - Generates a LiveCD ISO.
        echo    install          - Installs ReactOS in the folder specified by the
        echo                       environment variable "ROS_INSTALL".
        echo    "module"_install - Installs only the module with the appropiate name in
        echo                       the folder specified by the environment variable
        echo                       "ROS_INSTALL".
        echo    clean            - Deletes all files generated by the build process.
        echo    "module"_clean   - Deletes only the files of one module with the
        echo                       appropiate name.
        echo    depends          - Does a full dependency check on the ReactOS Source
        echo                       and generates a new makefile. This will take a while.
        echo    "module"_depends - Does a dependency check for one module with the
        echo                       appropiate name.
    echo NOTE: The number makex uses can be modified by editing Build.cmd
    echo       located in the RosBE directory, instructions for doing so are
    echo       contained within the file.
) else if /i "%1" == "basedir" (
    echo Usage: basedir
    echo Switches back to the ReactOS source directory.
) else if /i "%1" == "charch" (
    if exist "%_ROSBE_BASEDIR%\charch.cmd" (
        echo Usage: charch [OPTIONS]
        echo Change the Architecture to build ReactOS for, for the current RosBE session.
        echo Possible Architectures are: i386, ppc, arm, amd64.
        echo.
    )
) else if /i "%1" == "chdefdir" (
    if exist "%_ROSBE_BASEDIR%\chdefdir.cmd" (
        echo Usage: chdefdir [OPTIONS]
        echo Change the ReactOS source directory for the current RosBE session.
        echo.
        echo    previous - Switch to the previous ReactOS source directory.
    )
) else if /i "%1" == "chdefgcc" (
    if exist "%_ROSBE_BASEDIR%\chdefgcc.cmd" (
        echo Usage: chdefgcc [OPTIONS]
        echo Change the MinGW/GCC Target/Host directory for the current RosBE session.
        echo.
        echo    "Path" - Path to set the Host or Target GCC to.
        echo    "Type" - Set it to "target" or "host"
    )
) else if /i "%1" == "clean" (
    echo Usage: clean [logs]
    echo Fully clean the ReactOS source directory.
    echo.
    echo    all        - Removes build logs and compiler output in the RosBE-Logs directory.
    echo    logs       - Removes all build logs in the RosBE-Logs directory.
    echo    host-tools - Removes just the cmake host tools.
    echo    All other commands will be parsed as "make module_clean" and cleans the
    echo    specific module.
) else if /i "%1" == "help" (
    echo Usage: help [COMMAND]
    echo Shows help for the specified command or lists all available commands.
) else if /i "%1" == "kdbg" (
    if exist "%_ROSBE_BASEDIR%\kdbg.cmd" (
        echo Usage: kdbg [LOGFILE] [PIPE]
        echo Outputs KDBG Debug Output and lets you give debug commands to it.
        echo.
        echo WRITELOG - Outputs the Log File to ".\DBG-%DATE%-%TIME%.txt".
        echo.
    )
) else if /i "%1" == "raddr2line" (
    if exist "%_ROSBE_BASEDIR%\raddr2line.cmd" (
        echo Usage: raddr2line [FILE] [ADDRESS]
        echo Translates program addresses into file names and line numbers to assist
        echo developers with finding specific bugs in ReactOS. If either of the options
        echo is not given you will be prompted for it.
        echo.
        echo FILE    - This can be either a fully specified path or just the file name
        echo           [you can use a partial name ie. ntdll*] of the executable to be
        echo           analyzed. When using just a file the current directory and all
        echo           sub-directories are searched.
        echo ADDRESS - The address to be translated.
        echo.
    )
) else if /i "%1" == "Remake" (
    if exist "%_ROSBE_BASEDIR%\Remake.cmd" (
        echo    Usage: remake [OPTIONS]
        echo    Cleans one or several specific modules and immediately rebuilds it cleanly.
        echo.
        echo    OPTIONS - One or more Module names to rebuild.
    )
) else if /i "%1" == "Remakex" (
    if exist "%_ROSBE_BASEDIR%\Remakex.cmd" (
        echo    Usage: remakex [OPTIONS]
        echo    Cleans one or several specific modules and immediately rebuilds it cleanly
        echo    and multithreaded.
        echo.
        echo    OPTIONS - One or more Module names to rebuild.
    )
) else if /i "%1" == "scut" (
    if exist "%_ROSBE_BASEDIR%\scut.cmd" (
        scut.exe --help
    )
) else if /i "%1" == "options" (
    if exist "%_ROSBE_BASEDIR%\options.cmd" (
        echo Usage: options
        echo Starts the RosBE configurator and sets the changes active in the current
        echo RosBE session immediately.
    )
) else if /i "%1" == "update" (
    if exist "%_ROSBE_BASEDIR%\update.cmd" (
        echo Usage: update [OPTIONS]
        echo Updates all files of RosBE to the most recent files.
        echo.
        echo    delete X - Deletes Update Nr X.
        echo    info X   - Shows info about Update Nr X.
        echo    nr X     - Re/Installs Update Nr X.
        echo    reset    - Removes the Updates Cache. Not recommended.
        echo    status   - Shows the recent status of available, non installed updates.
    )
) else (
    echo Unknown command specified. No help available for %1.
)

title ReactOS Build Environment %_ROSBE_VERSION%