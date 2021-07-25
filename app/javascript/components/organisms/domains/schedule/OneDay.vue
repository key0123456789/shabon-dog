<template>
  <div class="column">
    <div class="date" :class="{'sunday': isSunday, 'saturday': isSaturday}">
      {{date.format('M/D')}}
      <br>
      {{date.format('ddd')}}
    </div>
    <div v-for="h in timeRange" :key="h">
      <div class="time" :key="h+'00'"></div>
      <div class="time" :key="h+'30'"></div>
    </div>
  </div>
</template>

<script>
import moment from "moment";
moment.locale('ja', {
  weekdays: ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"],
  weekdaysShort: ["日", "月", "火", "水", "木", "金", "土"],
});
export default {
  name: 'column',
  props: {
    date: {required: true, type: Object}
  },
  computed: {
    timeRange () {
      return this.$store.getters.timeRange;
    },
    isSaturday () {
      return this.date.day() == 6;
    },
    isSunday () {
      return this.date.day() == 0;
    },
  }
}
</script>

<style scoped>
.column {
  display: flex;
  flex-direction: row;
  text-align: center;
}
.date.sunday {
  background-color: #fddcdd;
}
.date.saturday {
  background-color: #d8eff8;
}
.date, .time {
    border-top: 1px solid #f6f6ed;
}
.time:last-child {
  border-bottom: 1px solid #f6f6ed;
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