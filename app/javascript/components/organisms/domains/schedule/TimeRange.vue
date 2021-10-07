<template>
    <div v-for="h in timeRange" :key="h">
      <div class="time" :key="h+'00'"></div>
      <div class="time" :key="h+'30'"></div>
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
.date, .time {
    border-top: 1px solid #f6f6ed;
}
.time:last-child {
  border-bottom: 1px solid #f6f6ed;
}
.time {
  height: 20px;
}
</style>
