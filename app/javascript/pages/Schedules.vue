<template>
  <div v-if="!loading">
    <input v-model="name" placeholder="スケジュール名を入れてください">
    <button @click="postSchedules()">登録する</button>
    <h3>登録済みのボード</h3>
    <ul v-for="schedule in schedules" :key="`schedule_${schedule.id}`">
      <li>
        <router-link :to="{ name: 'schedule', params: { id: `${schedule.id}` }}">{{ schedule.name }}</router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      loading: false,
      schedules: {},
      name: '',
    }
  },
  created() {
    this.loading = true;
    this.getSchedules();
    this.loading = false;
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
  methods: {
    getSchedules() {
      axios.get('/api/v1/schedules').then(response => {
        const responseData = response.data;
        this.schedules = responseData;
      })
    },
    postSchedules() {
      axios.post('/api/v1/schedules', { schedule: {name: this.name} }, this.config )
      .then(response => {
        this.$router.go({ path: this.$router.currentRoute.path, force: true })
      })
    }
  }
}
</script>
