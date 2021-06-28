import { createApp } from "vue";
import Main from "../main.vue";

document.addEventListener("DOMContentLoaded", () => {
  const app = createApp(Main);
  app.mount("#main");
});