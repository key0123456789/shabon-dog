<template>
  <div class="time-scale">
    <div class="date">
      <div class="date__inner">
        <div class="date__item"></div>
        <div class="date__item"></div>
      </div>
    </div>
    <time-range :scale="true" />
  </div>
</template>

<script>
import TimeRange from './TimeRange.vue';

export default {
  components: {
    TimeRange
  }
}
</script>


<style lang="scss">
.time-scale {
  width: 100px;
  border: 1px solid #eeeeee;
}
.date {
  text-align: center;
  font-size: 12px;
  &__inner {
    padding: 8px 0;
  }
  &__item {
    height: 20px;
  }
}
</style>
