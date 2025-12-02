# Vorteile und Nachteile

<div class="grid grid-cols-2 gap-6 mt-4">
<div>

### ✅ Vorteile

<div class="text-sm space-y-3 mt-4">

<div class="p-2 rounded bg-green-900/20 border-l-2 border-green-500">
<strong>Garantierte Immutability</strong><br>
<span class="text-gray-400">Objekt kann nach der Erstellung nicht geändert werden</span>
</div>

<div class="p-2 rounded bg-green-900/20 border-l-2 border-green-500">
<strong>Bessere Lesbarkeit</strong><br>
<span class="text-gray-400">Keine überfüllten Konstruktoren oder Parameter-Verwechslung.</span>
</div>

<div class="p-2 rounded bg-green-900/20 border-l-2 border-green-500">
<strong>Trennung Konstruktion / Repräsentation</strong><br>
<span class="text-gray-400">Gleicher Prozess kann unterschiedliche Objekte erzeugen.</span>
</div>

</div>
</div>
<div>

<div v-click="1">

### ❌ Nachteile

<div class="text-sm space-y-3 mt-4">

<div class="p-2 rounded bg-red-900/20 border-l-2 border-red-500">
<strong>Zusätzliche Klasse</strong><br>
<span class="text-gray-400">Builder-Klasse bedeutet mehr Code und Overhead.</span>
</div>

<div class="p-2 rounded bg-red-900/20 border-l-2 border-red-500">
<strong>Code-Duplizierung</strong><br>
<span class="text-gray-400">Builder enthält dieselben Felder wie das Produkt.</span>
</div>

<div class="p-2 rounded bg-red-900/20 border-l-2 border-red-500">
<strong>Unnötige Komplexität</strong><br>
<span class="text-gray-400">Overkill für einfache Objekte. Mögliche Performance-Nachteile.</span>
</div>

</div>
</div>
</div>
</div>
