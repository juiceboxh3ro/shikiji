<template>
  <div class="container">
    <section id="view-buttons">
      <div>
        <button @click="showDakuten = !showDakuten" class="dakuten-toggle">Dakuten: {{ showDakuten ? "on": "off" }}</button>
        <button @click="showKata = !showKata" class="kata-toggle">{{ showKata ? "Katakana": "Hiragana" }}</button>
      </div>
    </section>

    <section class="kana-map">
      <div id="row-labels">
        <h3>a</h3>
        <h3>i</h3>
        <h3>u</h3>
        <h3>e</h3>
        <h3>o</h3>
      </div>
      <div class="column" :key="idx" v-for="row, idx in kana" >
        <template
          v-if="showDakuten ? true : 
             idx !== 'ga_column'
          && idx !== 'za_column'
          && idx !== 'da_column'
          && idx !== 'ba_column'
          && idx !== 'pa_column'
        ">
          <h2>{{ idx.split("_")[0] }}</h2>
          <StudyCard :row="row" :showKata="showKata" />
        </template>
      </div>
    </section>
  </div>
</template>

<script>
  import kana from "@/assets/data/kana.js"
  import StudyCard from '@/components/study/StudyCard.vue'

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
  margin-top: 80px;
}
.kana-map {
  width: 90%;
  margin: 20px auto 0;
  display: flex;
  flex-direction: row-reverse;
  justify-content: center;
  position: relative;
}
#row-labels {
  margin-top: 45px;
  margin-left: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 35px;
}
#view-buttons {
  width: 80%;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
}
#view-buttons div {
  width: 100px;
  display: flex;
  flex-direction: column;
  align-items: stretch;
  gap: 5px;
}
#view-buttons div button {
  cursor: pointer;
  padding: 8px 10px;
}
h2 {
  padding: 5px 0;
  margin-bottom: 5px;
}
h2:hover {
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
  background-color: var(--theme-color-main);
  color: var(--off-white-main);
  cursor: pointer;
}
h3 {
  font-size: 2.4rem;
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