---
transition: none
---

# Director - Optional

<div class="grid grid-cols-2 gap-8">
<div>

**Ohne Director**

```dart {4,6-11}
void main() {
  var burger1 = BurgerBuilder('Brioche', 'Rind')
      .setCheese()
      .setPickles()
      .build();

  
  var burger2 = BurgerBuilder('Brioche', 'Rind')
      .setCheese()
      // Gürkchen vergessen!
      .build();
}
```

<div v-click="2" class="mt-4 text-red-400">

- Client Code muss Rezept kennen
- Reihenfolge nicht garantiert
- Code-Duplikation

</div>

</div>
<div class="relative">

<div v-click="1" v-click.hide="3" class="absolute inset-0 flex items-center justify-center">

<img src="/images/memes/karen.png" class="max-h-80 rounded shadow-lg" />

</div>

<div v-click="3">

**Mit Director**

```dart
void main() {
  var director = BurgerDirector();

  var burger1 = director.makeClassicBurger();
  var burger2 = director.makeClassicBurger();
}
```

</div>

</div>
</div>

---
transition: slide-left
---

# Director - Optional

<div class="grid grid-cols-2 gap-4">
<div>

**Mit Director**

```dart {2-4}
void main() {
  
  var director = BurgerDirector();
  var burger = director.makeClassicBurger();

}
```

<div class="mt-4 text-green-400">

Client bekommt Burger - muss Details nicht kennen!

</div>

</div>
<div class="relative h-80">

<div v-click="1" v-click.hide="2" class="absolute inset-0">

**Director-Klasse**

```dart
class BurgerDirector {

  Burger makeClassicBurger() {
    return BurgerBuilder('Brioche', 'Rind')
        .setCheese()
        .setPickles()
        .build();
  }

  Burger makeVeggieBurger() {
    return BurgerBuilder('Vollkorn', 'Gemüse')
        .setPickles()
        .build();
  }
}
```

</div>

<div v-click="2" class="absolute inset-0 flex items-center justify-center">

<img src="/images/memes/karen2.png" class="max-h-60 rounded shadow-lg" />

</div>

</div>
</div>

