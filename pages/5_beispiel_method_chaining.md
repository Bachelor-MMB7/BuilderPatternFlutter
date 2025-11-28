---
transition: none
---

# Void vs Method Chaining

<div class="grid grid-cols-2 gap-8">
<div class="flex flex-col">

**Vorher: Mit void Settern**

```dart
void main() {
  var burgerBuilder = BurgerBuilder('Brioche','Rind');
  burgerBuilder.setCheese();
  var burger = burgerBuilder.build();
}
```

<div v-click="1" class="mt-auto text-yellow-400">

Funktioniert, aber viel Schreibarbeit

</div>

</div>
<div v-click="2" class="flex flex-col">

**Nachher: Mit Method Chaining**

```dart
void main() {
  var burger = BurgerBuilder('Brioche','Rind')
      .setCheese()
      .build();
}
```

<div v-click="3" class="mt-auto text-green-400">

Kürzer und eleganter!

</div>

</div>
</div>

---
transition: none
---

# Method Chaining - Setter

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

**Setter-Methoden** <span class="inline-block cursor-help" title="'this' ist das aktuelle Objekt - der BurgerBuilder mit allen Werten (_bun, _patty, _cheese, etc.). setCheese() gibt mit 'return this' das komplette Objekt zurück, worauf dann build() zugreifen kann. Es ist immer dasselbe Objekt, das durchgereicht wird: setCheese() verändert es und gibt es weiter, build() empfängt es und erstellt daraus den fertigen Burger.">ℹ️</span>

```dart {6-9}
class BurgerBuilder {
  // ...
  bool _cheese = false;
  // ...

  BurgerBuilder setCheese() {
    _cheese = true;
    return this;
  }

  BurgerBuilder setPickles() {
    _pickles = true;
    return this;
  }

  // ...

}
```

</div>
</div>

---
transition: slide-left
---

# Method Chaining - build()

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

```dart {16-18}
class BurgerBuilder {
  String _bun;
  String _patty;
  bool _cheese = false;
  bool _pickles = false;

  // BurgerBuilder(...)

  BurgerBuilder setCheese() {
    _cheese = true;
    return this;
  }

  // BurgerBuilder setPickles() {...}

  Burger build() {
    return Burger(_bun, _patty, _cheese, _pickles);
  }
}
```

</div>
</div>
