import router from './router/index.js'

import titleMixin from './mixins/titleMixin.js'

Vue.mixin(titleMixin)

new window.Vue({
  router,
  el: '#app',
  vuetify: new Vuetify(),

  components: {
    'app-world': window.httpVueLoader('js/components/AppWorld.vue'),
    'app-navigation': window.httpVueLoader('js/components/layout/AppNavigation.vue')
  },

  data: () => ({
    drawer: null
  })
})