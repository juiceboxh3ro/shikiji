<template>
  <div v-if="kana_info != null" id="container">
    <section id="hira-kata">
      <section id="hira">
        <h3>Hiragana</h3>
        <h2>{{ kana_info.hira.reading }}</h2>
        <p>Origin: {{ kana_info.hira.origin }}</p>
        <p>{{ kana_info.hira.stroke }} strokes</p>
      </section>

      <section id="kata">
        <h3>Katakana</h3>
        <h2>{{ kana_info.kata.reading }}</h2>
        <p>Origin: {{ kana_info.kata.origin }}</p>
        <p>{{ kana_info.kata.stroke }} strokes</p>
      </section>
    </section>

    <section id="kana-info">
      <p>Romaji: <span>{{ kana_info.romaji.join(", ") }}</span></p>
    </section>

  </div>
  <div v-else>It's comin'...</div>
</template>

<script>
import kana from "../assets/data/kana.js"
export default {
  name: "Kana",
  data() {
    return {
      kana,
      single_kana: String,
      kana_info: null
    }
  },
  methods: {
    kanaInfo() {
      for (let col in kana) {
        for (let row in kana[col]) {
          if (kana[col][row].hira.reading == this.single_kana) {
            this.kana_info = kana[col][row]
            console.log(kana[col][row])
          } else if (kana[col][row].kata.reading == this.single_kana) {
            this.kana_info = kana[col][row]
          }
        }
      }
    },
  },
  computed: {
  },
  mounted() {
    this.single_kana = this.$route.params.kana
    this.kanaInfo()
  } 
}
</script>

<style scoped>
#container {
  padding: 15px 15px 35px;
  border: 1.5px solid black;
  border-radius: 5px;
  width: 300px;
  margin: 100px auto 0;
  background-color: white;
  box-shadow: 0 0 5px 3px rgba(0,0,0,0.1);
}
#hira-kata {
  display: flex;
  justify-content: space-around;
  align-items: center;
  gap: 20px;
  margin-bottom: 50px;
  width: 300px;
  margin: 30px auto;
}
#hira h3,
#hira h2,
#kata h3,
#kata h2 {
  margin: 0 0 15px;
}
</style>