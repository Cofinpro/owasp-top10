# Fun with Linux and the Shell

Konzept für eine kurze, knackige Einführung in Limnux Basics und das Terminal

## Linux Konzepte

### Basics

Multi-Tasking & Multi-User OS!

- Alles ist eine Datei (!)
- Kommandos sind klein & fokussiert
- Kommandos können verkettet werden

### Linux Flavours

### Linux Directory Structure

## Prozesse & System Boot

- Prozesskonzept
- User (uid, euid, root, normale user, su, sudo)
- Device-Dateien
- Kommandos: `ps`, `top|htop`, `lsof`, `mount`

## Terminal & Shell

### Basics

- Verschiedene Shells => Default `bash` (nextgen `zsh`)
- Shell history
- Dateien und Verzeichnisse
  - Dateisystem (Inode based FS)
  - versteckte Dateien/Verzeichnisse
  - Dateiberechtigungen (`ls`, `chmod`. `chown`, `chgrp`, `inode`)
- Konfigurationsmöglichkeiten (`/etc/bash.profile`, `/etc/bashrc`, `~/.bash_profile`)
- Shell Completion
- aliases (und functions)
- wichtige Systemvariablen
- Wildcards
- `man`, `apropos`

### Navigation & erstellen

- `cd`, `ls`, `pwd`
- Verzeichnisse/Dateien anlegen `mkdir (-p)`, `touch`, `echo`

### Dateien anlegen, lesen, löschen & finden

- `find`, `locate`
- `mkdir` create new directory: <kbd>mkdir &lt;directory name&gt;</kbd>
- `cp` copy files: <kbd>cp &lt;source&gt; &lt;target&gt;</kbd>
    multiple options available: <kbd>cp -i ...</kbd>, <kbd>cp -R ...</kbd>
- `mv` move and rename files and directories: <kbd>mv &lt;source&gt; &lt;target&gt;</kbd>
- `rm`, `rmdir` delete files and directories: <kbd>rm [-options] &lt;filename&gt;</kbd>, <kbd>rmdir &lt;diretory name&gt;</kbd>
    delete recursive, force deletion of non-empty directory: <kbd>rm -rf</kbd>
- `ln`    create (symbolic) links, nake files and directoories available in a different location: <kbd>ln -s &lt;target&gt; &lt;link name&gt;</kbd>
    calling <code>ln</code> without <code>-s</code> option, creates hard links.
- `cat`    concatenate files and print to standard out: <kbd>cat [-options] &lt;files&gt;</kbd>
    using <code>-</code> instead of <code>&lt;filenames&gt;</code> reads from standard input
- `less`
- `grep` simple usage

## Benutzerinfos und Benutzer wechseln

- `who`, `w`, `whoami`
- `sudo`, `su`

## DER EDITOR

- nano
- vi modes (command, edit, ex) and how to switch
- basics (edit, save, open, copy/del text)

## Networking

- Kommandos: `ifconfig`, `netstat`, `ping`, `telnet`

## Connceting to other Hosts

- `telnet`
-  `ssh`, `scp`

## Prozesse und Prozessmanagement

- `ps`, `top`, `htop`, `nice`, `pstree`
- WH Umgebungen (aliases, Var.)
- Prozess-Umgebungen (Grundlage für Docker)

## Shell Coding

- Variables
- Control Structures
- sub-shells
