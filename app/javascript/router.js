import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import Schedules from './pages/Schedules.vue'
import Schedule from './pages/Schedule.vue'

const routes = [
  {
    path: '/schedules',
    component: Schedules,
    name: 'schedules'
  },
  {
    path: '/schedules/:id',
    component: Schedule,
    name: 'schedule'
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})
export default router;

