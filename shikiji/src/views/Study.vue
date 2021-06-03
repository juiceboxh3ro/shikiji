<template>
  <div class="column">
    <div class="row" :key="idx" v-for="row, idx in kana" >
      <template v-if="idx !== '特行' && idx !== '小行'">
        <h2>{{ idx }}</h2>
        <StudyCard :row="row" />
      </template>
    </div>
  </div>
</template>

<script>
  import kana from "@/assets/data/kana.json"
  import StudyCard from '@/components/study/StudyCard.vue'

  console.log(kana)
  export default {
    name: "Study",
    components: {
      StudyCard
    },
    data() {
      return {
        kana
      }
    },
  }
</script>

<style scoped>
h2 {
  margin-bottom: -5px;
}
.column {
  width: 90%;
  margin: 0 auto;
  display: flex;
  flex-direction: row-reverse;
  justify-content: center;
}
.row {
  display: flex;
  flex-direction: column;
}
</style>