# TurboJenny Programming Language
By Alberto Coscia <inbox[-at-]albertocoscia[-dot-]me>.

## Abstract
TurboJenny aspira ad essere il linguaggio del domani, oggi. Questo documento 
fornisce una specifica per la sua implementazione del domani, oggi.

## Introduzione
TurboJenny è un linguaggio interpretato, che non gli consente di essere
compilato, ma lui non lo sa e gira su una VM lo stesso.

### Tipizzazione
Da piccolo ha subito traumi infantili, cosa che gli ha impedito di formare concetti sociali precisi, specie nell'ambito dei tipi.
Perciò, TurboJenny è un linguaggio a bassa tipizzazione: sebbene non sia comunista, tutti i tipi che riusciate ad esprimere sono cittadini di prima classe che lavorano in coordinazione con i mezzi di produzione di proprietà ~~statale~~ del interprete.

#### Numeri
Deprecando l'abaco, i numeri sono espressi dai caratteri unicode da `U+0030` a `U+0039`.
La virgola è espressa da `.`.

#### Stringhe
Le stringhe sono espresse da sequenze di caratteri (sono preferibili le emoji) racchiuse fra `"` o `'`.

#### Booleani
I booleani sono due, unici ed indivisibili.
Generati, non creati, della stessa sostanza del binario.
Espressi da `true` e `false`.
I valori numerici non possono essere utilizzati per esprimere valori booleani.

### Emoji
TurboJenny è il linguaggio del domani, oggi.
Infatti, tutte le istruzioni più importanti hanno un equivalente emoji, che è fortemente consigliato utilizzare sia perché le espressioni letterali sono considerate obsolete, sia per aumentare la leggibilità e la facilità di scrittura del codice.

Questa feature è stata introdotta soprattutto per quegli sviluppatori che vogliano utilizzare la strana barra/cosa touch sul nuovo Mac, per aumentare la loro produttività e trovare un effettivo utilizzo a quell'affare.
In generale, è sconsigliato l' utilizzo di qualsiasi carattere Unicode al di sotto di `U+1F600`.

### File
I file per programmi TurboJenny devono essere file `text/plain` codificati in `UTF-8`.
Non devono essere compressi o importati in maniera contraria agli standard UE sulla sicurezza dei prodotti elettronici.

L'estensione dei file standard è `.jenny`.
L'interprete/compilatore/VM non è razzista, ma preferisce i file `.jenny` a quelli `.denny` e pensa che questi ultimi farebbero meglio a tornarsene a casa loro che in Italia siamo troppi.

## Sintassi
### Istruzioni
La fine di un'istruzione è identificata dal marcatore `🌚`.
Grazie a questo è possibile ottimizzare la leggibilità del programma mettendo più istruzioni sulla stessa linea.

Le linee stesse del programma devono essere troncate all'80esima colonna, poiché noi sviluppatori moderni dobbiamo poter accedere al source dal cloud da dispositivi palmari di dimensioni variabili dai 4 agli 8 pollici, possibilmente con una mela dietro.

### Commenti
I commenti sono i pensieri del programma, che ti giudica silenziosamente mentre scrivi codice di merda.
Sono introdotti dal simbolo `💭` e proseguono per tutta la linea.

### Identifier
Viene considerato identifier qualsiasi cosa soddisfi l'espressione regolare `[a-zA-Z]([a-zA-Z0-9]|\_)*`.
Gli identifier sono utilizzati per referenziare un simbolo come una variabile o una funzione.

### Blocchi
I blocchi di istruzioni sono racchiusi dai caratteri `⤵` e `⤴`.
Chiunque vada a capo prima di aprire un blocco dovrebbe rivalutare le proprie scelte di vita.

### Programma
Un intero programma TurboJenny deve essere contenuto in un unico file, perché TurboJenny si confonde facilmente ad operare su più file.
In particolare, le istruzioni devono essere contenute all'interno della dichiarazione del programma.

```
⏩ Test ⤵
    💭 ... istruzioni ...
⤴
```

### Espressioni

#### Primarie
Sono espressioni primarie i numeri, le stringhe, i booleani, gli identifier (come riferimento ad un simbolo) e le chiamate di funzione.
Le espressioni primarie possono essere combinate in espressioni matematiche e booleane.

La precedenza delle espressioni può essere modificata con l'uso dei marcatori `↪` (`(`) e `↩` (`)`), anche se saltare la fila è generalmente considerato maleducazione.

#### Matematiche
Sono espressioni matematiche l'addizione, la sottrazione, la divisione e la moltiplicazione, espresse dai simboli `➕➖➗✖️`.
I dettagli tecnici si intendono essere conosciuti al pubblico esperto dotato di licenza elementare.

#### Booleane
Sono espressioni booleane quelle espresse da valori booleani e gli operatori di comparazione e negazione logica.
Esse consentono di stabilire se il programma stia raccontando una bugia o la verità.

Gli operatori di comparazione sono illustrati dalla seguente tabella.

| Operatore | Significato       |
|----------:|:-----------------:|
|◀          |Minore             |
|▶          |Maggiore           |
|⬅          |Minore o uguale    |
|➡          |Maggiore o uguale  |
|🔛          |Uguale             |
|!=         |Diverso            |

La negazione logica è espressa da `❗️`;

### Variabili

#### Dichiarazione
TurboJenny basa lo storage delle proprie variabili sulla base di un identifier.
Una variabile può essere così dichiarata:

```
💭 Crea una variabile jenny con valore booleano true
startuppa jenny 🔜 true🌚
```

Com'è possibile notare, la cosa è completamente priva di tipi, razze e sessi, favorendo un ambiente multiculturale ed inclusivo, prossibilmente senza wage gap fra gli uomini e le donne che scrivono codice di discutibile qualità.

Non è possibile creare una variabile con un simbolo già assegnato ad un'altra variabile. Questo perché crediamo fermamente nel capitalismo e nella proprietà privata.

Non è possibile dichiarare una variabile con valore nullo. Questo perché non lasciamo le cose a met-

#### Assegnazione
Se avete cambiato idea sul valore di una variabile, TurboJenny vi consente di assegnarne un altro senza giudicarvi (stronzi).

```
💭 Porta il valore della variabile jenny a 2000
innova jenny 🔜 2000🌚
```

### Strutture di controllo

#### Alternative
Le strutture di controllo di tipo alternativo (sì, sono tanto alternative. Tipo hipster e molto #trasgry #obey) sono `❓` (if) e `⁉` (else).
Sono seguiti da un'espressione racchiusa fra `↪` (`(`) e `↩` (`)`), che deve risultare in un valore booleano (in caso contrario, verrà trattata come falso _materiale_).

```
❓ ↪️ 1 == 0↩️ ⤵
    💭 Non verrà eseguito
⤴ ⁉️ ⤵
    💭 Verrà eseguito
⤴
```

#### Iterative
L'unica struttura di controllo di tipo iterativo è 🔄 (while). È un tipo a posto, tende solo a ripetersi spesso quando parla.
Di nuovo, l'espressione che la segue deve essere booleana etc.

```
🔄 ↪️count < 15↩️ ⤵
    💭 Verrà eseguito finché la condizione non sarà soddisfatta.
⤴
```

#### Macro
Le macro sono istruzioni speciali e particolarmente snob che non restituiscono valori e non possono essere utilizate come espressioni.

### Stampa ed urlo
TurboJenny, nella sua missione di aiutare lo sviluppatore fra una pausa caffè e l'altra, distingue due modi per stampare a terminale dei valori: la stampa e l'urlo.

La prima istruzione è pensata per log verbosi, che finiranno salvati in un event storage da qualche parte per non essere mai letti da nessuno. La parte eccitante del programma - gli errori, quindi - sono invece evidenziati dall'urlo in un bellissimo grassetto di color rosso sangue, che richiama quello pianto durante il debug su un sistema in produzione.

Le due istruzioni possono essere richiamate con `💬` per la stampa e `🗯` per l'urlo. Possono stampare sia espressioni che referenze a variabili.

```
💭 Stampa ciao
💬 "ciao"🌚
💭 Urla ciao
🗯 "ciao"🌚
💭 Urla la variabile jenny
🗯 jenny🌚
``` 

### Funzioni
Le funzioni sono blocchi di istruzioni che possono essere richiamati da altre parti del codice perché facciano il lavoro sporco al posto loro.

Sono dichiarate dal marcatore `⚙` e seguite da un identifier ed un blocco di istruzioni. Possono essere chiamate con `⚡`.

```
💭 Dichiara una funzione testz
⚙️ testz ⤵
    💭 Return restituisce il valore ed interrompe l'esecuzione
    ✅ "CIAO"🌚
    💭 Non verrà eseguito
    🗯 "CC"🌚
⤴

💭 Chiama e stampa il valore restituito da testz
💬 "Valore restituito: " + ⚡testz🌚
```

## Segregazione degli identifier
I simboli dichiarati nel programma sono registrati in diversi _scope_ a seconda di dove avvenga la loro dichiarazione.
Questo aspetto del linguaggio è sconosciuto ai più, in quanto la discriminazione stona in un sistema di ispirazione comunista

Per poter accedere ai simboli di uno scope superiore è necessario preporre all'identifier della funzione o variabile `🔝`.

### Espressioni letterali corrispondenti
È qui sotto riportata la tabella di conversione fra le emoticon e le espressioni letterali utilizzabili da tutti coloro che hanno una laurea in ingegneria informatica ma che di questi simbolini da ragazzini non ci capiscono nulla.

| Simbolo   | Espressione letterale   |
|----------:|:-----------------------:|
| 💭 | // |
| ⏩ | presenta il futuro a |
| 💬 | stampa |
| 💬| urla |
| ❓ | se |
| ⁉ | altrimenti |
| 🔄 | finché |
| ✅ | restituisci |
| ◀ | < |
| ▶ | > |
| ⬅ | <= |
| ➡ | => |
| 🔛 | == |
| = | con |
| 🔜 | con |
| 🌚 | ; |
| 🔝 | globale |
| ⚙ | fn |
| ⚡ | chiama |
| ↪ | ( |
| ↩ | ) |
| ⤵ | { |
| ⤴ | } |
| ➗ | / |
| ➖ | - |
| ➕ | + |
| ✖ | * |
| ❗ ️| ! |
| ☝️ | vero |
| 👌 | falso |