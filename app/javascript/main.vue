<template>
  <div>
    <router-view />
    <div>
      {{ moment(new Date, 'HH') }}時
    </div>
  </div>
</template>

<script>
import moment from 'moment';
export default {
  data() {
    const formats = [
      "MMMM Do YYYY, h:mm:ss a",
      "dddd",
      "MMM Do YY",
      "YYYY [escaped] YYYY",
      "LTS"
    ];
    return {
      message: "Hello Vue!",
      tests: new Array(formats.length)
        .fill(new Date())
        .map((date, i) => ({ date, format: formats[i] }))
    }
  },
  methods: {
    moment(date, format) {
      return moment(date).format(format)
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: left;
}
</style>
