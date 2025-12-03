# Verwandt zu Factory Pattern <span style="color: #666; font-size: 0.6em; line-height: 1">\[2\, 5\]</span>

<div class="grid grid-cols-2 gap-8 mt-6">
<div>

### 🏗️ Builder Pattern

<div class="text-sm space-y-3 mt-4">

<div class="p-3 rounded bg-blue-900/20 border-l-2 border-blue-500">
Konstruiert komplexe Objekte <strong>Schritt für Schritt</strong>
</div>

<div class="p-3 rounded bg-blue-900/20 border-l-2 border-blue-500">
Produkt wird erst bei <code>build()</code> zurückgegeben
</div>

<div class="p-3 rounded bg-blue-900/20 border-l-2 border-blue-500">
Erlaubt zusätzliche Konstruktionsschritte vor der Rückgabe
</div>

</div>
</div>
<div>

### 🏭 Abstract Factory

<div class="text-sm space-y-3 mt-4">

<div class="p-3 rounded bg-purple-900/20 border-l-2 border-purple-500">
Erstellt feste Produkt-Kombinationen <strong>in einem Schritt</strong>
</div>

<div class="p-3 rounded bg-purple-900/20 border-l-2 border-purple-500">
Gibt das Produkt <strong>sofort</strong> zurück
</div>

<div class="p-3 rounded bg-purple-900/20 border-l-2 border-purple-500">
Verhindert falsche Kombinationen
</div>

</div>
</div>
</div>

<div v-click class="mt-8 p-4 rounded bg-gray-800/50 text-center">

**Gemeinsamkeit:** Beide sind <span class="text-yellow-400">Creational Patterns</span> – sie kapseln die Objekterstellung

</div>

<!--
- Wenn du ein Objekt in einem Schritt erstellen kannst (new Auto()), aber du willst flexibel sein, welches Auto genau (BMW oder Audi) -> Nimm eine Factory.

- Wenn du ein Objekt schritt für Schritt selbst zusammenstellen willst, du die Reihenfolge beeinflussen möchtest, Teile des Burgers weglassen möchtest -> Nimm das Builder Pattern

Beispiel:
heisst bei dem builder wäre dann der vorteil dass ich nicht für jede art von burger eine factory klasse brauche, wo ich nur eine Art von Burger bekomme, sondern nur eine Burger Builder Klasse habe mit der ich verschiedene Burger nach meinen Wünschen erstellen kann.

Und bei der Factory hab ich den Vorteil das niemand einen falschen Burger erstellt, Zum Beispiel ein Entwickler könnte schreiben: builder.setBun("Vegan").setPatty("Rindfleisch").build(). Fatal! Ich bekomme genau den einen fertigen Burger den man nicht mehr zusammenstellen muss

und der unterschied zum director (wenn ich mit factory vergleiche) dass der Burger dennoch schritt für schritt zusammengebaut wird nur ich habe mehr kontrolle wie er zusammengebaut wird und kann als Entwickler das selbst noch steuern was ein burger es sein soll mit verschiedenen varianten. Beim Factory bekomme ich nur die eine variante von Burger

GEMEINSAMKEIT:
- Bei beiden Patterns wird die Objekterstellung nicht direkt in der Produktklasse gemacht, sondern in eine separate Klasse ausgelagert.
-->
