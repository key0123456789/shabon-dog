<template>
  <div>
    <h2>{{ schedule.name }}</h2>
    <calendar />
    <button @click="deleteSchedules()">削除</button>
  </div>
</template>

<script>
import axios from 'axios';
import Calendar from '../components/organisms/domains/schedule/Calendar.vue';

export default {
  components: {
    Calendar
  },
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
    getSchedule() {
      axios.get(`/api/v1/schedules/${this.$route.params.id}`).then(response => {
        this.schedule = response.data;
      })
    },
    deleteSchedules() {
      if(confirm('削除してよろしいですか？')) {
        axios.delete(`/api/v1/schedules/${this.$route.params.id}`, this.config )
        .then((r) => {
          this.$router.push({ name: 'schedules' })
          console.log(r);
        })
        .catch((e) => {
          this.$router.go({ path: this.$router.currentRoute.path, force: true })
          console.log(e);
        }).finally(() => {})
      }
    }
  }
}
</script>
