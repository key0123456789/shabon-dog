import { createStore } from 'vuex'
import moment from 'moment';

export default createStore({
  state: {
    currentDate: moment(),
    displayDays: 7,
    timeStart: 9,
    timeEnd: 24,
  },
  getters: {
    timeRange: function (state) {
      let t = state.timeStart;
      let result = [];
      while (t < state.timeEnd) {
        result.push(t);
        t++;
      }
      return result;
    }
  },
  mutations: {
    updateDate (state, newDate) {
      state.currentDate = newDate;
    },
    updateDisplayDays (state, newDisplayDays) {
      state.displayDays = newDisplayDays;
    },
  },
  actions: {
  },
  modules: {
  }
})