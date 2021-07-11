<template>
  <div>
    <h3>ScheduleのVueページ</h3>
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
      schedules: {}
    }
  },
  created() {
    this.getSchedules();
  },
  methods: {
    getSchedules() {
      axios.get('/api/v1/schedules/index.json').then(response => {
        const responseData = response.data;
        this.schedules = responseData;
      })

    }

  }
}

</script>
