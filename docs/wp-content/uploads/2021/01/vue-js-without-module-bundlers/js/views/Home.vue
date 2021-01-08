<template>
  <v-container fluid class="fill-height align-start">
    <v-container fluid class="ma-0 pa-0">

    <v-row>
      <v-col>
        <h1 class="text-h3 font-weight-light">
          Home
        </h1>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <app-world></app-world>
      </v-col>
    </v-row>
    </v-container>
  </v-container>
</template>

<script>
module.exports = {
  title: 'Home',

  components: {
    'app-world': httpVueLoader('../../js/components/AppWorld.vue')
  },

  mounted () {
    console.log('Hello World')
  }
}
</script>
