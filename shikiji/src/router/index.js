import { createRouter, createWebHistory } from 'vue-router'
// import store from '../store'
import Landing from '../views/Landing.vue'

const router = createRouter({
  history: createWebHistory(),
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Landing',
      component: Landing,
      meta: {}
    },
    {
      path: '/kana',
      name: 'KanaMap',
      component: () => import('../views/KanaMap.vue'),
      meta: {}
    },
    {
      path: '/kioku',
      name: 'Kioku',
      component: () => import('../views/Kioku.vue'),
      meta: {}
    }
  ],
  scrollBehavior(_, _2, savedPosition) {
    if (savedPosition) return savedPosition
    return {
      left: 0,
      top: 0,
    }
  }
})

export default router