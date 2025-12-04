---
transition: none
---

# Einstiegsproblem <span style="color: #666; font-size: 0.6em; line-height: 1">\[1\]</span>

Der einfache Konstruktor

```dart {1-8|1-16}
class Burger {
  // Zutaten
  String _bun;
  String _patty;
  bool _cheese;

  // Konstruktor
  Burger(this._bun, this._patty, this._cheese);

  // Setter
  set bun(String bun) => _bun = bun;
  
  //Getter
    String getDescription() {
        return 'Burger mit $_bun Brot, $_patty Patty, '
            '${_cheese ? "mit" : "ohne"} Käse';
    }
}
```

<!--
Bevor wir zum Builder Pattern kommen, müssen wir uns erst einmal vor Augen führen, warum es dieses Pattern überhaupt gibt. Dazu schauen wir uns einige typische Probleme an.

Wie gesagt möchten wir Burger erstellen. Dafür seht ihr hier eine Klasse Burger...
-->

---
transition: view-transition
---

# Einstiegsproblem <span style="color: #666; font-size: 0.6em; line-height: 1">\[1\]</span>

Der einfache Konstruktor

<div v-click="1" v-motion :initial="{opacity: 0, height: 0}" :enter="{opacity: 1, height: 'auto', transition: {duration: 500}}">

**Problem 1: Fixierte Argumente - Unflexibel**
</div>

```dart {1-3,5-7}
void main() {

  var burger = Burger('Sesam', 'Rind', false);
  //                                    ^cheese

  burger.patty = 'Veggie'; 
}
```

---
transition: none
---

# Einstiegsproblem <span style="color: #666; font-size: 0.6em; line-height: 1">\[1\]</span>

Telescoping Constructor Pattern (Anti-Pattern)

```dart {1,6-8,10,14-18}
class Burger {
  // Zutaten
  final String _bun;
  final String _patty;
  final bool _cheese;
  final bool _sauce;
  final bool _onion;

  // Konstruktor
  Burger(
    this._bun,
    this._patty,
    this._cheese,
    this._sauce,
    this._onion,
  );
}
```

<!--
Für das nächste Problem erweitern wir die Burger-Klasse um zwei weitere Zutaten.
-->

---
transition: view-transition
---

# Einstiegsproblem <span style="color: #666; font-size: 0.6em; line-height: 1">\[1\]</span>

Telescoping Constructor Pattern (Anti-Pattern)

<div v-click="3" v-motion :initial="{opacity: 0, height: 0}" :enter="{opacity: 1, height: 'auto', transition: {duration: 500}}">

**Problem 2: Überladene Konstruktoren - Unübersichtlich**
</div>

```dart {1-3,16|1,6,16|1,8-13,16}
void main() {

  var burger = Burger('Sesam', 'Rind', true);
  //                                    ^cheese

  var burger2 = Burger('Sesam', 'Rind', true, false, true);
  //                                           ^sauce, ^onion

  var special400 = Burger('Sesam', 'Rind', true, true, true,
      false, true, false, false, true, false, true, false, 'Mais',
      'Oliven', false, true, 'BBQ', false, 5, 2, true,
      false, true, 'Honig', true);  //     ^🌶️-Schoten 🥵


  print(burger.getDescription());
}
```

<!--
Schauen wir uns dafür nochmal den einfachen Konstruktor-Aufruf an, um das Problem zu verdeutlichen.

1. Hier sehen wir nochmal unseren ursprünglichen Burger-Konstruktor mit drei Parametern – noch überschaubar.
2. Fügen wir jetzt Sauce und Zwiebeln hinzu, haben wir schon fünf Parameter und man selbst muss genau wissen, welcher Wert an welcher Stelle steht.
3. Und jetzt stellt euch vor, ein Kunde möchte einen 'Special 400' mit vielen Extras... Der Konstruktor fährt aus wie ein Teleskop – daher der Name Telescoping Constructor. Das ist ein Anti-Pattern: Je mehr Optionen, desto länger und unübersichtlicher wird der Aufruf. Und welcher Boolean steht nochmal für die Chili-Schoten?
-->

---
transition: slide-left
---

# Einstiegsproblem <span style="color: #666; font-size: 0.6em; line-height: 1">\[1\]</span>

Der Subclass-Ansatz

<div v-click="1" v-motion :initial="{opacity: 0, height: 0}" :enter="{opacity: 1, height: 'auto', transition: {duration: 500}}">

**Problem 3: Explosion der Subklassen - Unwartbar**
</div>

```dart {2-3,5-14}
class Burger { /* Basisklasse */ }

class Cheeseburger extends Burger {
  // Konstruktor der Basisklasse aufrufen
  Cheeseburger() : super('Sesam', 'Rind', true, false, false);
}

class VeggieBurger extends Burger {
  VeggieBurger() : super('Vollkorn', 'Gemüse', false, true, true);
}

class SwabBurger extends Burger {
  SwabBurger() : super('Brioche', 'Käsespätzle', true, true, true);
}
```

<!--
Man könnte jetzt denken: Dann machen wir doch einfach für jede Burger-Variante eine eigene Subklasse.

Das funktioniert bei drei Burgern noch. Aber was passiert, wenn wir eine neue Zutat hinzufügen – zum Beispiel Tomate? dann müssen wir in jeder Subklasse den Konstruktor-Aufruf der Basisklasse anpassen. Bei drei Klassen machbar, bei dreißig ein Alptraum.

Und was ist mit einem Cheeseburger mit Zwiebeln? Oder einem Veggie-Burger ohne Sauce? Für jede Kombination bräuchten wir eine eigene Klasse – die Anzahl explodiert regelrecht.
-->
