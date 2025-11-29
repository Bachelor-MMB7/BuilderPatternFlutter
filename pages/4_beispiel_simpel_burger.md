---
transition: none
---

# Vergleich

<div class="grid grid-cols-2 gap-8">
<div class="flex flex-col">

**Vorher: Ohne Builder Pattern**

<div class="relative">

<!-- Code 1 links -->
<div v-click.hide="2">

```dart {1-2,4}
void main() {
  var burger = Burger('Sesam','Rind',true,false,false);
  //                                      ^pickles?
}
```

</div>

<!-- Code 2 links -->
<div v-click="2" v-motion :initial="{ y: 50, opacity: 0 }" :enter="{ y: 0, opacity: 1, transition: { duration: 500 } }" class="absolute top-0 left-0 right-0">

```dart
void main() {
  var burger = Burger(
    'Sesam','Rind',false,true,
    false,false,false,false,false,
      false,true,false,
        false,0,false,false,0,
  );
}
```

</div>

</div>

</div>
<div v-click="1" class="flex flex-col">

**Nachher: Mit Builder Pattern** 

<div class="relative">

<!-- Code 1 rechts -->
<div v-click.hide="2">

```dart
void main() {
  var burgerBuilder = BurgerBuilder('Brioche','Rind');
  burgerBuilder.setCheese();
  var burger = burgerBuilder.build();
}
```

</div>

<!-- Code 2 rechts -->
<div v-click="2" v-motion :initial="{ y: 50, opacity: 0 }" :enter="{ y: 0, opacity: 1, transition: { duration: 500 } }" class="absolute top-0 left-0 right-0">

```dart
void main() {
  var burgerBuilder = BurgerBuilder('Sesam','Rind');
  burgerBuilder.setCheese();
  burgerBuilder.setPickles();
  var burger = burgerBuilder.build();
}
```

</div>

</div>

</div>
</div>

<!-- Texte in einem gemeinsamen Container -->
<div v-click="3" class="grid grid-cols-2 gap-8 mt-24">
<div class="text-red-400">

Problem: Parameter unklar, unflexibel, nicht schön

</div>
<div class="text-green-400">

Lösung: Selbstdokumentierend!

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
  var burgerBuilder = BurgerBuilder('Brioche','Rind');
  burgerBuilder.setCheese();
  var burger = burgerBuilder.build();
}
```

</div>
<div>

**Builder-Klasse** <span class="inline-block cursor-help" title="cheese und pickles werden bereits bei der Erstellung einer Instanz der Builder-Klasse initialisiert, da sie Standardwerte besitzen. Die Instanz hat automatisch die Werte false für die Variablen cheese und pickles, bevor der Konstruktor die Variablen bun und patty füllt.">ℹ️</span>

```dart {1-12}
class BurgerBuilder {
  // Felder
  String _bun;
  String _patty;
  bool _cheese = false;
  bool _pickles = false;

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

# BurgerBuilder - void Setter

<div class="grid grid-cols-2 gap-4">
<div>

**Verwendung (main)**

```dart {3}
void main() {
  var burgerBuilder = BurgerBuilder('Brioche','Rind');
  burgerBuilder.setCheese();
  var burger = burgerBuilder.build();
}
```

</div>
<div>

**Setter-Methoden**

```dart {6-8}
class BurgerBuilder {
  // ...
  bool _cheese = false;
  // ...

  void setCheese() {
    _cheese = true;
  }

  void setPickles() {
    _pickles = true;
  }
  
  // ...
  
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
  var burgerBuilder = BurgerBuilder('Brioche','Rind');
  burgerBuilder.setCheese();
  var burger = burgerBuilder.build();
}
```

</div>
<div>

**build()-Methode** <span class="inline-block cursor-help" title="In der build()-Methode werden die Builder-Attribute dem Konstruktor der Burger-Produktklasse übergeben. Damit wird ein neues Burger-Objekt erstellt. In main() bekommt man also kein Builder-Objekt zurück, sondern ein Objekt vom Typ der Produktklasse Burger. Warum? Der Builder ist nur für die Konstruktion zuständig - alle anderen Methoden (z.B. getDescription()) bleiben in der Produktklasse. So vermeidet man Code-Duplikation, falls es mehrere Builder gibt.">ℹ️</span>

```dart {15-16}
class BurgerBuilder {
  String _bun;
  String _patty;
  bool _cheese = false;
  bool _pickles = false;
  
  // BurgerBuilder(...)
  
  void setCheese() {
    _cheese = true;
  }
  
  // void setPickles() {...}

  Burger build() {
    return Burger(_bun, _patty, _cheese, _pickles);
  }
}
```

</div>
</div>