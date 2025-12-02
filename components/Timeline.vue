<script setup>
import { computed, ref, watch } from 'vue'
import { useNav } from '@slidev/client'

const { currentPage } = useNav()

// Seiten auf denen der Zeitstrahl ausgeblendet wird
const hiddenPages = [1, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 15, 16, 18, 23, 24, 25, 26, 27, 28, 29]

// Einblenden nach 1,1 Sek, Ausblenden nach 5 Sek
const isVisible = ref(false)
let showTimeout = null
let hideTimeout = null

watch(currentPage, () => {
  isVisible.value = false
  if (showTimeout) clearTimeout(showTimeout)
  if (hideTimeout) clearTimeout(hideTimeout)

  showTimeout = setTimeout(() => {
    isVisible.value = true
  }, 900)

  hideTimeout = setTimeout(() => {
    isVisible.value = false
  }, 4500)
}, { immediate: true })

// Bereiche: [startSeite, endSeite]
const sections = [
  { name: 'Intro', start: 1, end: 1 },
  { name: 'Builder', start: 7, end: 12 },
  { name: 'M. Chain.', start: 13, end: 16 },
  { name: 'Director', start: 17, end: 18 },
  { name: 'Demo', start: 19, end: 19 },
  { name: 'UML', start: 20, end: 20 },
  { name: 'Pro/Con', start: 21, end: 21 },
  { name: 'Factory', start: 22, end: 22 },
]

const currentSection = computed(() => {
  for (let i = 0; i < sections.length; i++) {
    if (currentPage.value >= sections[i].start && currentPage.value <= sections[i].end) {
      return i
    }
  }
  return 0
})
</script>

<template>
  <div v-if="!hiddenPages.includes(currentPage) && isVisible" class="fixed top-3 right-4 flex items-center gap-0.5 bg-transparent px-2 py-0.5 rounded-full z-50 opacity-50 transition-opacity duration-500">
    <template v-for="(section, index) in sections" :key="section.name">
      <div
        class="flex items-center gap-1"
      >
        <div
          class="w-1.5 h-1.5 rounded-full transition-all duration-300"
          :class="index <= currentSection ? 'bg-green-600 scale-110' : 'bg-gray-600'"
        />
        <span
          class="text-[8px] transition-all duration-300"
          :class="index === currentSection ? 'text-gray-300 font-bold' : 'text-gray-500'"
        >
          {{ section.name }}
        </span>
      </div>
      <div
        v-if="index < sections.length - 1"
        class="w-3 h-px transition-all duration-300"
        :class="index < currentSection ? 'bg-green-600' : 'bg-gray-600'"
      />
    </template>
  </div>
</template>
