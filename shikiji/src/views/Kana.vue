<template>
  <div>
    {{ single_kana }}
    {{ kanaInfo }}
  </div>
</template>

<script>
export default {
  name: "Kana",
  data() {
    return {
      single_kana: String
    }
  },
  methods: {

  },
  computed: {

  },
  mounted() {
    this.single_kana = this.$route.params.kana
  } 
}
</script>

<style scoped>

</style>