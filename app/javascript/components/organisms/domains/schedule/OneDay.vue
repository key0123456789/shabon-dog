<template>
  <div class="column">
    <div class="date" :class="{'sunday': isSunday, 'saturday': isSaturday}">
      <div class="date__inner">
        <div class="date__item">{{date.format('M/D')}}</div>
        <div class="date__item">{{date.format('ddd')}}</div>
      </div>
    </div>
    <time-range />
  </div>
</template>

<script>
import moment from "moment";
import TimeRange from './TimeRange.vue';

moment.locale('ja', {
  weekdays: ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"],
  weekdaysShort: ["日", "月", "火", "水", "木", "金", "土"],
});

export default {
  components: { TimeRange },
  props: {
    date: {
      required: true,
      type: Object
    }
  },
  computed: {
    isSaturday () {
      return this.date.day() === 6;
    },
    isSunday () {
      return this.date.day() === 0;
    },
  }
}
</script>

<style scoped lang="scss">
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
.time {
  border-top: 1px solid #f6f6ed;
}
.time:last-child {
  border-bottom: 1px solid #f6f6ed;
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
