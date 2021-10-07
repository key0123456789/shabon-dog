<template>
  <div id="carousel" class="carousel"
    @mousedown="onTouchStart" @touchstart="onTouchStart"
    @mousemove="onTouchMove" @touchmove="onTouchMove"
    @mouseup="onTouchEnd" @touchend="onTouchEnd"
    @mouseleave="onTouchEnd" @touchleave="onTouchEnd"
    @transitionend="onTransitionEnd"
  >
    <one-day
      v-for="date in dateList"
      :key="date.format('YYYY-MM-DD')"
      :date="date"
      :style="[columnStyle, isTransition]"
    />
  </div>
</template>

<script>
import OneDay from './OneDay.vue';

export default {
  name: 'carousel',
  components: {
    OneDay
  },
  props: {
    columns: {
      type: Array,
      require: true
    }
  },
  data () {
    return {
      startX: null,
      diffX: 0,
      currentNum: 0,
      isAnimating: true,
    }
  },
  computed: {
    displayDays () {
      return this.$store.state.displayDays;
    },
    currentDate () {
      return this.$store.state.currentDate;
    },
    dateList () {
      let i = -this.displayDays;
      let result = [];
      while (i < this.displayDays * 2) {
        result.push(this.currentDate.clone().add(i, 'days'));
        i++;
      }
      return result;
    },
    columnStyle () {
      return {
        width: 100 / (this.displayDays + 1) + '%',
        transform: `
          translate3d(${this.diffX}px, 0, 0)
          translate3d(${this.currentNum * (-100)}%, 0, 0)`
      };
    },
    isTransition () {
      if (this.isAnimating) {
        return { transition: 'all 0.2s ease-out' };
      } else {
        return { transition: 'none' };
      }
    }
  },
  created () {
    this.currentNum = this.displayDays;
  },
  methods: {
    getClientX (e) {
      // タッチデバイスとマウスデバイスの差分吸収
      if ('ontouchstart' in window) {
        // タッチデバイスのとき
        return e.touches[0].clientX;
      } else {
        // マウスデバイスのとき
        return e.clientX;
      }
    },
    onTouchStart (e) {
      this.isAnimating = false;
      this.startX = this.getClientX(e);
    },
    onTouchMove (e) {
      if (this.startX == null) {
        return;
      }
      this.diffX = this.getClientX(e) - this.startX;
    },
    onTouchEnd () {
      this.isAnimating = true;
      this.startX = null;
      const columnwidth = this.$el.clientWidth / this.displayDays;
      const diffDays = -1 * Math.round(this.diffX / columnwidth);
      this.currentNum += diffDays;
      this.diffX = 0;
    },
    onTransitionEnd () {
      this.isAnimating = false;
      const diffDays = this.currentNum - this.displayDays;
      const newDate = this.currentDate.clone().add(diffDays, 'days');
      this.$store.commit('updateDate', newDate);
      this.currentNum = this.displayDays;
    },
  }
}
</script>

<style>
.carousel {
  white-space: nowrap;
  overflow: hidden;
  box-sizing: border-box;
  font-size: 0;
}
.carousel > .column {
  display: inline-block;
  margin: 0;
  padding: 0;
  font-size: 16px;
  border-right: 1px solid #eee;
  border-left: 1px solid #eee;
}
</style>
