import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import Schedule from './pages/Schedule.vue'

const routes = [
  {
    path: '/',
    component: Schedule
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})
export default router;

