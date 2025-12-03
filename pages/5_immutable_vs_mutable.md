# Immutable vs. Mutable <span style="color: #666; font-size: 0.6em; line-height: 1">\[3\]</span>

<div class="grid grid-cols-2 gap-8">
<div>

**Mutable (veränderbar)**

```dart {1,3-15,19}
class Burger {
  // Private Attribute

  // Builder Parameter werden hier übergeben
  Burger(this._bun, this._patty,
         this._cheese, this._pickles);

  // Public Setter - Objekt veränderbar
  void setCheese(bool value) {
    _cheese = value;
  }

  void setPickles(bool value) {
    _pickles = value;
  }
  
  // Getter...
}
```

<div class="mt-4 text-yellow-400">

Objekt kann nach Erstellung geändert werden

</div>

</div>
<div v-click="1">

**Immutable (unveränderbar)** <span class="inline-block cursor-help" title="Wenn man das Objekt ändern möchte, erstellt man einfach ein neues Builder-Objekt mit den gewünschten Werten. So bleibt das Original unverändert und man hat volle Kontrolle.">ℹ️</span>

```dart {1,3-5,9}
class Burger {
  // Private Attribute

  Burger(this._bun, this._patty,
         this._cheese, this._pickles);

  // Getter...
}
```

<div v-click="1" class="mt-4 text-green-400">

Objekt kann nach Erstellung nicht geändert werden!

</div>

</div>
</div>
