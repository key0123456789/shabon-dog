<template>
  <div class="calendar">
    <time-scale />
    <calendar-carousel />
  </div>
</template>

<script>
import CalendarCarousel from './CalendarCarousel.vue';
import TimeScale from "./TimeScale.vue";

export default {
  components: {
    TimeScale,
    CalendarCarousel
  }
}
</script>

<style>
.calendar {
  display: flex;
}
</style>
