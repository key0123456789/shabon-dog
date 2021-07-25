<template>
  <div>
    <h2>{{ schedule.name }}</h2>
    <calendar />
    <button @click="deleteSchedules()">削除</button>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      schedule: ''
    }
  },
  computed: {
    config() {
      return {
        headers: {
          'X-CSRF-TOKEN': document.head.children['csrf-token'].content
        }
      };
    }
  },
  created() {
    this.getSchedule();
  },
  methods: {
  }
}
</script>
