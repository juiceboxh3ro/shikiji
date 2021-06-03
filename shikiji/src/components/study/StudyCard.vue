<template>
  <div
    v-for="(item, objkey, idx) in row"
    :key="`${objkey}-${idx}`"
  >
    <template v-if="item?.hira?.reading">
      <div
        class="card content"
        v-if="(
          item.hira.reading !== 'ゐ'
          && item.hira.reading !== 'ゑ'
          && item.hira.reading !== '$'
        )"
      >
        {{ item.hira.reading }}
      </div>
      <div class="card" v-else>

      </div>
    </template>
  </div>
</template>

<script>
  export default {
    props: ["row"]
  }
</script>

<style scoped>
.card {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 15px;
  min-height: 50px;
  min-width: 50px;
  box-sizing: border-box;
  border-radius: 8px;
  color: var(--off-white-main);
  font-size: 2.4rem;
}
.content {
  background-color: var(--theme-color-main);
  cursor: pointer;
}
.content:hover {
  background-color: var(--theme-color-secondary);
}
</style>