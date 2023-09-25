# Ablauf

## Allgemeine Struktur

- 4 mal 2h in Präsenz auf zB 2-4 Wochen verteilt.
- Am Ende der ersten drei Einheiten werden Aufgaben verteilt, die bis zum nächsten Mal gelöst werden sollen
- Die letzten drei Sitzungen starten daher immer mit Klärung der Aufgaben und dabei Wiederholung des Stoffes der vorherigen Sitzung

## Sitzungsthemen

### 0. Vorbereitung
- VirtualBox mit AlmaLinux (ggf. in Gruppen)

### 1. Sitzung

- Geschichte Unix/Linux
  - Abstammungsbaum
  - Solaris, FreeBSD, MacOS, Linux
- Vergleich Windows/Unix
  - Prozesstabelle (Taskmanager/pstree)
  - CMD/Shell
- Prozessbaum (`ps`, `pstree`, `top`, `htop`, `/proc`)
- Anzeigen von Prozessen
- Beenden von Prozessen
- Was ist die Shell
- absolute und rel. Pfadangaben
- Bewegen im Verzeichnisbaum und anlegen/löschen von Dateien/Verzeichnissen ( `cd`, `pwd`, `ls`, `mkdir`, `touch`, `echo`,`rm`, `rmdir`)
#### Aufgaben:
  - Anlegen und Löschen von Dateien rel. und absolut
  - Anlegen von Links (symbolisch und hart)
  - Rechercheaufgabe: "Unterschied symbolic/hard links"
  - Anlegen und Löschen einer Datei `*` und einer Datei `-i`

### 2. Sitzung

- Besprechung der Aufgaben
- Manpages
- Aliases
- Globale Variablen `PATH`, `HOME`
- Starten der Shell (globale und lokale `bash_profile`, `bashrc`) Wiederaufnahme von Variablen
- Prozess-Umgebung (`set`, `env`)
- Wie interpretiert die bash die Cmd-Line
- Kurzer Ausflug ins Filesystem
- Suchen nach Dateien und deren Inhalten (`find`, `grep`)
- Mehrbenutzerkonzept (Gruppen und User)
  - whoami
  - id
  - useradd
  - groupadd
  - /etc/passwd, /etc/shadow, /etc/groups
  - sudo
- Verzeichnisse und Dateien und deren Berechtigungen (`rwx`, `chmod`, `chown`, `umask`, `chgrp`) - ggf. auch Attributsystem `lsattr`, `chattr`
- Ausführen von Shell-Skripten (`source`, `bash ...`, `chmod 700 + #!`)
#### Aufgaben:
  - setzen von aliases, manuell und in `bashrc`
  - Setzen von lokalen und globalen Variablen und Skriptausführung


### 3. Sitzung

- Besprechung der Aufgaben
- Dateienden mit `head` und `tail` anschauen
- Terminal Editoren
- VIM Editor
  - die drei Modi des VIM
  - Editieren, Speichern (Verlassen)
  - Konfiguration `vimrc`
- Nano Editor
- Dateien öffnen mit `less`
  - Navigieren
  - Suchen
  - "Follow"-Modus
- Packen und Entpacken
#### Aufgaben
  - Idee: eigenen Service auf virtueller Maschine aufsetzen (Jenkins, Gitlab?, ...)


### 4. Sitzung

- Besprechung der Aufgaben
- Was ist eine Linux-Distribution?
  - RHEL: RockyLinux, AlmaLinux (RHEL Clones)
- Connecting to Remote `ssh` und `scp`


-----


```bash
#!/bin/bash

cd $HOME

# helper  -------
function printContentFor() {
   inhabitant=$1 # asterix|troubadix|miraculix|obelix
   content=""

   if [[ $inhabitant == "asterix" ]]
   then
       content="
       Das Haus des schlauesten Kriegers
       der gerne Wildschwein isst
       und gerne mit seinem Kumpel Obelix singt und lacht"

   elif [[ $inhabitant == "troubadix" ]]
   then
       content="
       Das Baumhaus unseres Musikers
       er singt und musiziert, so viel er kann
       Wildschwein kriegt er selten, da er bei Festen
       meist gefesselt ist"
   elif [[ $inhabitant == "miraculix" ]]
   then
       content="
       Das Haus des Druiden
       hier wird der Zaubertrank gebraut
       und Obelix bekommt nie etwas davon"
   elif [[ $inhabitant == "obelix" ]]
   then
       content="Das Haus des Hinkelsteinlieferanten
       der beste Freund von Asterix, mit dem
       er gerne lacht und singt und vor allem Wildschwein isst
       Allerdings gibt ihm Miraculix nur ausnahmsweise Zaubertrank"
   fi
   echo -e "$content\n"
}

# main -------
# create gallisches dorf
mkdir -p $HOME/gallisches-dorf/{asterix,troubadix,miraculix,obelix}
cd $HOME/gallisches-dorf

for name in *
do
   cd $name
   printContentFor $name > $name.haus
   cd -
done

# create römische lager
mkdir -p $HOME/roemische-lager/{babaorum,kleinbonum,laudanum,aquarium}
cd $HOME/roemische-lager

for name in *
do
   cd $name
   echo "Das Zelt des Zenturios von $name" > $name-centurio.zelt
   cd -
done

```
