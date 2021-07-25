import { createApp } from "vue";
import Main from "../main.vue";
import router from '../router';
import store from '../store/index';

document.addEventListener("DOMContentLoaded", () => {
  const app = createApp(Main)
  app.use(router).use(store).mount('#main');
});
