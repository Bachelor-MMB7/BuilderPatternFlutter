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

---
transition: slide-left
---

# Einstiegsproblem <span style="color: #666; font-size: 0.6em; line-height: 1">\[1\]</span>

Der Subclass-Ansatz

<div v-click="1" v-motion :initial="{opacity: 0, height: 0}" :enter="{opacity: 1, height: 'auto', transition: {duration: 500}}">

**Problem 3: Explosion der Subklassen - Unwartbar**
</div>

```dart {2-13}
class Burger { /* Basisklasse */ }

class Cheeseburger extends Burger {
  Cheeseburger() : super('Sesam', 'Rind', true, false, false);
}

class VeggieBurger extends Burger {
  VeggieBurger() : super('Vollkorn', 'Gemüse', false, true, true);
}

class SwabBurger extends Burger {
  SwabBurger() : super('Brioche', 'Käsespätzle', true, true, true);
}
```
