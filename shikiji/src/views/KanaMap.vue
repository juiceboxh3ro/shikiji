<template>
  <div class="container">
    <button @click="showDakuten = !showDakuten" class="dakuten-toggle">Dakuten: {{ showDakuten ? "on": "off" }}</button>
    <button @click="showKata = !showKata" class="kata-toggle">{{ showKata ? "Katakana": "Hiragana" }}</button>
    <div class="column" :key="idx" v-for="row, idx in kana" >
      <template
        v-if="idx !== '特行'
          && idx !== '小行'
          && (showDakuten ? true : 
            idx !== 'が行'
            && idx !== 'ざ行'
            && idx !== 'だ行'
            && idx !== 'ば行'
            && idx !== 'ぱ行'
          )"
      >
        <h2>{{ idx }}</h2>
        <StudyCard :row="row" :showKata="showKata" />
      </template>
    </div>
  </div>
</template>

<script>
  import kana from "@/assets/data/kana.json"
  import StudyCard from '@/components/study/StudyCard.vue'

  console.log(kana)
  export default {
    name: "KanaMap",
    components: {
      StudyCard
    },
    data() {
      return {
        kana,
        showDakuten: true,
        showKata: false,
      }
    },
  }
</script>

<style scoped>
.container {
  width: 90%;
  margin: 0 auto;
  display: flex;
  flex-direction: row-reverse;
  justify-content: center;
  position: relative;
}
.dakuten-toggle, .kata-toggle {
  position: absolute;
  width: 100px;
  height: 25px;
  top: 0;
  right: 0;
}
.kata-toggle {
  top: 30px;
}
h2 {
  padding: 5px 0;
  margin-bottom: 5px;
}
h2:hover {
  background-color: var(--theme-color-main);
  color: var(--off-white-main);
  cursor: pointer;
}
.column {
  display: flex;
  flex-direction: column;
  border-radius: 5px;
}
.column:hover {
  background-color: #dfdfdf;
}
</style>