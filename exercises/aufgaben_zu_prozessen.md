## Aufgaben zu Prozessen

- Was ist der Unterschied zwischen `ps` und `ps -f` ?
- Was ist der Unterschied zwischen `ps` und `ps -e` ?
- Welche Parameter für das Kommando `ps` gibt es noch?<br/>
  Was fällt Dir bei der Suche nach weiteren Parametern auf?
- Wie kannst Du Dir im `pstree` Kommando die PID* mit anzeigen lassen?
- Was fällt Dir auf, wenn Du das Kommando `ps` oder `pstree` mit PID* mehrmals ausführst?
- Führe das Kommando<br/>
  `start-logging.sh`<br/>
  aus. Dann lass Dir `pstree` anzeigen.
- Führe das Kommando `start-logging.sh --count=2500` aus (Benutze dazu die [&uparrow;] Taste). Dann lass Dir `pstree` anzeigen.
- Suche mit `pstree` nach dem Prozess, der mit dem Parameter `--count=2500` gestartet wurde und lass Dir die PID dieses Prozesses anzeigen. Dann beende ihn mit `kill`. Überprüfe, ob es geklappt hat.
- Führe das Kommando `sleep 90 &` (mit `&`) aus und lass Dir die PID dieses Prozesses anzeigen. Dann beende ihn mit dem "bösen" `kill -9`

*PID = Prozess ID <!-- .element class="ta-right" -->
