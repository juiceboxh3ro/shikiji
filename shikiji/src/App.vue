<template>
  <div>
    <Navigation />
    <router-view />
  </div>
</template>

<script>
import "@/assets/styles/index.css"
import "@/assets/styles/animations.css"
import Navigation from './components/navigation/Navigation.vue'

export default {
  name: 'App',
  components: {
    Navigation
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
