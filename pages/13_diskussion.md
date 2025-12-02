# Diskussion

<div class="grid grid-cols-1 gap-3 mt-4">

<div class="p-3 rounded border border-gray-600">
<strong>Wann braucht man ein Interface?</strong>
<div v-click class="mt-2 text-sm text-gray-400">Wenn du mehrere Builder mit unterschiedlichen Implementierungen haben willst, die aber austauschbar sein sollen.</div>
</div>

<div class="p-3 rounded border border-gray-600">
<strong>Warum nicht einfach Konstruktor + Setter der Produktklasse nutzen um ein Objekt zu erstellen? Damit spar ich mir doch den Builder?</strong> <span class="text-gray-500">(JavaBeans Pattern)</span>
<div v-click class="mt-2 text-sm text-gray-400">Unfertige Objekte können versehentlich genutzt werden → Fehler. Lösung: Setter entfernen + Felder `final` → Objekt sofort immutable.</div>
</div>

<div class="p-3 rounded border border-gray-600">
<strong>Habt ihr das Pattern schon mal verwendet?</strong>
</div>

</div>
