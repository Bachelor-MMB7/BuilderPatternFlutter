---
transition: none
---

# Einstiegsproblem

Der einfache Konstruktor

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
transition: view-transition
---

# Einstiegsproblem

Der einfache Konstruktor

<div v-click="1" v-motion :initial="{opacity: 0, height: 0}" :enter="{opacity: 1, height: 'auto', transition: {duration: 500}}">

**Problem 1: Fixierte Argumente - Unflexibel**
</div>

```java {1-3,5-7}
class Main {
    static void main(String[] args) {

        //                                          cheese
        Burger burger = new Burger("Sesam", "Rind", true);

        System.out.println(burger.getDescription());
    }
}
```

---
transition: none
---

# Einstiegsproblem

Der Telescoping Constructor

```java {1,6-8,9,1,11,15-21}
public class Burger {
    // Zutaten
    private String bread;
    private String patty;
    private boolean cheese;
    private boolean sauce;
    private boolean onion;

    // Konstruktor
    public Burger(String bread, String patty, boolean cheese, 
                  boolean sauce, boolean onion) {
        this.bread = bread;
        this.patty = patty;
        this.cheese = cheese;
        this.sauce = sauce;
        this.onion = onion;
    }
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

```java {1-2,5-6|8-9|9-15}
class Main {
    static void main(String[] args) {

        //                                          cheese
        Burger burger = new Burger("Sesam", "Rind", true);

        //                                          cheese, sauce, tomato, onion
        Burger burger2 = new Burger("Sesam", "Rind", true, false, true, false);

        Burger special400 = new Burger("Sesam", "Rind", true, true, true, true,
                false, true, false, false, true, false, true, false, "Mais",
                "Oliven", false, true, "BBQ", false, true, false, true,
                false, true, "Honig", true);


        System.out.println(burger.getDescription());
    }
}
```

---
transition: transition-view
---

# Einstiegsproblem

Der Subclass-Ansatz

<div v-click="1" v-motion :initial="{opacity: 0, height: 0}" :enter="{opacity: 1, height: 'auto', transition: {duration: 500}}">

**Problem 3: Explosion der Subklassen - Unwartbar**
</div>

```java {all}
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
    public SwabBurger() {
        super("Brioche", "Käsespätzle", true, true, true, true, true);
    }
}
```
