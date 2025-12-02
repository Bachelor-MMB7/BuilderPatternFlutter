# Verwandt zu Factory Pattern

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
Erstellt <strong>Familien</strong> von verwandten Objekten
</div>

<div class="p-3 rounded bg-purple-900/20 border-l-2 border-purple-500">
Gibt das Produkt <strong>sofort</strong> zurück
</div>

<div class="p-3 rounded bg-purple-900/20 border-l-2 border-purple-500">
Fokus auf Austauschbarkeit von Objektfamilien
</div>

</div>
</div>
</div>

<div v-click class="mt-8 p-4 rounded bg-gray-800/50 text-center">

**Gemeinsamkeit:** Beide sind <span class="text-yellow-400">Creational Patterns</span> – sie kapseln die Objekterstellung

</div>
