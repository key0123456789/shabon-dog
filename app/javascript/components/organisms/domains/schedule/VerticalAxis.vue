<template>
  <div class="left-side">
    <div class="date"></div>
    <div v-for="h in timeRange" :key="h">
      <div class="time" :class="h+'00'" :key="h+'00'">
        {{h}}:00
      </div>
      <div class="time" :class="h+'30'" :key="h+'30'"></div>
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    timeRange () {
      return this.$store.getters.timeRange;
    }
  }
}
</script>

<style scoped>
.left-side {
  border-left: 1px solid #eee;
  border-right: 1px solid #eee;
}
.time {
  font-size: 10px;
  padding: 0 5px;
}
.time:nth-child(2n+1) {
  border-top: none;
}
.date, .time {
  border-top: 1px solid #eee;
}
.time:last-child {
  border-bottom: 1px solid #eee;
}
.date {
  height: 3.5rem;
  text-align: center;
  line-height: 1.5rem;
  font-size: 12px;
  padding: 0.25rem auto;
}
.time {
  height: 20px;
}
</style>
