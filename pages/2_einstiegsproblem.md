---
transition: none
---

# Einstiegsproblem

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

---
transition: view-transition
---

# Einstiegsproblem

Der einfache Konstruktor

<div v-click="1" v-motion :initial="{opacity: 0, height: 0}" :enter="{opacity: 1, height: 'auto', transition: {duration: 500}}">

**Problem 1: Fixierte Argumente - Unflexibel**
</div>

```dart {1-3,5-7}
void main() {

  var burger = Burger('Sesam', 'Rind', true);
  //                                    ^cheese

  burger.patty = 'Veggie'; 
}
```

---
transition: none
---

# Einstiegsproblem

Der Telescoping Constructor

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

# Einstiegsproblem

Der Telescoping Constructor

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
      'Oliven', false, true, 'BBQ', false, true, false, true,
      false, true, 'Honig', true);


  print(burger.getDescription());
}
```

---
transition: slide-left
---

# Einstiegsproblem

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