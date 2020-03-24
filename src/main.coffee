import Vue from 'vue'
import App from './App.vue'
import router from './router.coffee'
import store from './store.coffee'
import './assets/styles/index.css'

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: (h) -> h(App)
}).$mount('#app')
