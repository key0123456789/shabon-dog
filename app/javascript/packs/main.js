import { createApp } from "vue";
import Main from "../main.vue";
import router from '../router';

document.addEventListener("DOMContentLoaded", () => {
  createApp(Main).use(router).mount('#main');
});