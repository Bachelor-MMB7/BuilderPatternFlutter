---
transition: none
---

# Builder Pattern - Vorher/Nachher

<div class="grid grid-cols-2 gap-8">
<div class="flex flex-col">

**Vorher: Direkter Konstruktor**

```dart {1-3}
void main() {

  var burger = Burger('Sesam','Rind',true,true,false);
  //                                           ^onions?
}
```

<div v-click="1" class="mt-auto text-red-400">

Problem: Parameter unklar, unflexibel

</div>

</div>
<div v-click="2" class="flex flex-col">

**Nachher: Builder Pattern**

```dart
void main() {
  var burger = BurgerBuilder('Brioche','Rind')
      .setCheese()
      .build();
}
```

<div v-click="3" class="mt-auto text-green-400">

Lösung: Selbstdokumentierend!

</div>

</div>
</div>

---
transition: zoom-in
---

# BurgerBuilder

<div class="grid grid-cols-2 gap-4">
<div>

**Verwendung (main)**

```dart {1-2}
void main() {
  var burger = BurgerBuilder('Brioche','Rind')
      .setCheese()
      .build();
}
```

</div>
<div>

**Builder-Klasse** <span class="inline-block cursor-help" title="cheese und onions werden bereits bei der Erstellung einer Instanz der Builder-Klasse initialisiert, da sie Standardwerte besitzen. Die Instanz hat automatisch die Werte false für die Variablen cheese und onions, bevor der Konstruktor die Variablen bun und patty füllt.">ℹ️</span>

```dart {1-12}
class BurgerBuilder {
  // Felder
  String _bun;
  String _patty;
  bool _cheese = false;
  bool _onions = false;

  // Konstruktor
  BurgerBuilder(
    this._bun,
    this._patty,
  );

  // ...

}
```

</div>
</div>

---
transition: none
---

# BurgerBuilder - Setter

<div class="grid grid-cols-2 gap-4">
<div>

**Verwendung (main)**

```dart {3}
void main() {
  var burger = BurgerBuilder('Brioche','Rind')
      .setCheese()
      .build();
}
```

</div>
<div>

**Setter-Methoden**

```dart {4-6}
class BurgerBuilder {
  // ...

  void setCheese() {
    _cheese = true;
  }

  void setOnions() {
    _onions = true;
  }
}
```

</div>
</div>

---
transition: none
---

# BurgerBuilder - build()

<div class="grid grid-cols-2 gap-4">
<div>

**Verwendung (main)**

```dart {4}
void main() {
  var burger = BurgerBuilder('Brioche','Rind')
      .setCheese()
      .build();
}
```

</div>
<div>

**build()-Methode**

```dart {15-16}
class BurgerBuilder {
  String _bun;
  String _patty;
  bool _cheese = false;
  bool _onions = false;
  
  // BurgerBuilder(...)
  
  void setCheese() {
    _cheese = true;
  }
  
  // void setOnions() {...}

  Burger build() {
    return Burger(_bun, _patty, _cheese, _onions);
  }
}
```

</div>
</div>

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

  print(burger.getDescription());
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
  final String _bread;
  final String _patty;
  final bool _cheese;
  final bool _sauce;
  final bool _onion;

  // Konstruktor
  Burger(
    this._bread,
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