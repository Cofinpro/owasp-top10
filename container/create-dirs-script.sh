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

warn() {
    echo $* 1>&2
}

# main -------
# create gallisches dorf
warn "starting $0"
warn "01. -- gallisches dorf"

mkdir -p $HOME/gallisches-dorf/{asterix,troubadix,miraculix,obelix}
cd $HOME/gallisches-dorf

for name in *
do
    cd $name && warn "$HOME/gallisches-dorf/$name: created dir "

    warn "$HOME/gallisches-dorf/$name/$name.haus: creating file and content"
    printContentFor $name > $name.haus
    cd -
done

# create römische lager

warn "02. -- römisches lager"

mkdir -p $HOME/roemische-lager/{babaorum,kleinbonum,laudanum,aquarium}
cd $HOME/roemische-lager

for name in *
do
   cd $name
   echo "Das Zelt des Zenturios von $name" > $name-centurio.zelt && warn "$HOME/roemische-lager/$name-centurio.zelt: created file"
   cd -
done

warn "finished $0"
