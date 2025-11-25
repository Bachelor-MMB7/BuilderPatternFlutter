# Einstiegsproblem

Das Telescoping Constructor Problem

```java {1-12|1-19}
public class Burger {
    // Zutaten
    private String bread;
    private String patty;
    private boolean cheese;

    // Konstruktor
    public Burger(String bread, String patty, boolean cheese) {
        this.bread = bread;
        this.patty = patty;
        this.cheese = cheese;
    }

    // Methode
    public String getDescription() {
        return "Burger mit " + bread + ", " + patty +
                (cheese ? ", Käse" : "");
    }
}
```

---

# Einstiegsproblem

Das Telescoping Constructor Problem

<div v-click="1" v-motion :initial="{opacity: 0, height: 0}" :enter="{opacity: 1, height: 'auto', transition: {duration: 500}}">

**Problem 1: Einfacher Konstruktor - Unflexibel**

</div>

```java {1-3,5-7}
public class Main {
    public static void main(String[] args) {
        
        //                                          cheese
        Burger burger = new Burger("Sesam", "Rind", true);
        
        System.out.println(burger.getDescription());
    }
}
```

---

# Einstiegsproblem

Das Telescoping Constructor Problem

```java {1,6-8,1,6-10,12,16-21}
public class Burger {
    // Zutaten
    private String bread;
    private String patty;
    private boolean cheese;
    private boolean sauce;
    private boolean tomato;
    private boolean onion;

    // Konstruktor
    public Burger(String bread, String patty, boolean cheese, 
                  boolean sauce, boolean tomato, boolean onion) {
        this.bread = bread;
        this.patty = patty;
        this.cheese = cheese;
        this.sauce = sauce;
        this.tomato = tomato;
        this.onion = onion;
    }
}
```

---

# Einstiegsproblem

Das Telescoping Constructor Problem

<div v-click="3" v-motion :initial="{opacity: 0, height: 0}" :enter="{opacity: 1, height: 'auto', transition: {duration: 500}}">

**Problem 2: Überladene Konstruktoren - Unübersichtlich**

</div>

```java {1-2,5-6|8-9|9-15}
public class Main {
    public static void main(String[] args) {
        
        //                                          cheese
        Burger burger = new Burger("Sesam", "Rind", true);

        //                                          cheese, sauce, tomato, onion
        Burger burger2 = new Burger("Sesam", "Rind", true, false, true, false);
        
        Burger special400 = new Burger("Sesam", "Rind", true, true, true, true,
                false, true, false, false, true, false, true, false, "Mais", 
                "Spätzle", false, true, "BBQ", false, true, false, true,
                false, true, "Honig", true);
        
        
        System.out.println(burger.getDescription());
    }
}
```

---

# Einstiegsproblem

Der Subclass-Ansatz - Klassenexplosion

<v-clicks>

**Problem 3: Subklassen für jede Variante**

```java {all|1-5|7-11|13-17|19-23}
public class Burger { /* Basisklasse */ }

public class Cheeseburger extends Burger {
    public Cheeseburger() {
        super("Sesam", "Rind", true, false, false, false, false);
    }
}

public class VeggieBurger extends Burger {
    public VeggieBurger() {
        super("Vollkorn", "Gemüse", false, true, true, false, true);
    }
}

public class DeluxeBurger extends Burger {
    public DeluxeBurger() {
        super("Brioche", "Rind", true, true, true, true, true);
    }
}

public class ChickenBurger extends Burger { /* ... */ }
public class DoubleCheese extends Burger { /* ... */ }
public class BaconBurger extends Burger { /* ... */ }
// 💥 Für jede Kombination eine neue Klasse!
```

</v-clicks>

---
transition: none
---

# Einstiegsproblem

Zusammenfassung der Probleme

<v-clicks>

| Ansatz | Problem |
|--------|---------|
| **Ein Konstruktor** | Lange Parameterliste, schwer lesbar |
| **Überladene Konstruktoren** | Kombinatorische Explosion, Code-Duplikation |
| **Subklassen** | Klassenexplosion, unflexibel bei neuen Zutaten |

<br>

**Die Konsequenzen:**

```java
// Was bedeutet dieser Aufruf? 🤔
Burger b = new Burger("Sesam", "Rind", true, false, true, false, true);
//                                      ^^^^  ^^^^^  ^^^^  ^^^^^  ^^^^
//                                      Käse? Salat? Tomate? Zwiebel? Sauce?
```

<div class="mt-4 p-4 bg-red-900 bg-opacity-30 rounded-lg">

**Lösung gesucht:** Ein Muster, das flexible Objekterstellung ermöglicht, ohne diese Probleme!

</div>

</v-clicks>
