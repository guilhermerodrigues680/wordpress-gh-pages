<template>
  <div>
    <v-list-item>
      <v-list-item-content>
        <v-list-item-title>Navegação</v-list-item-title>
      </v-list-item-content>
    </v-list-item>

    <v-divider></v-divider>

    <v-list dense>
      <v-list-item
        link
        v-for="link in links"
        :key="link.title"
        :to="link.to"
        color="primary"
        :ripple="{ class: 'primary--text' }"
      >
        <v-list-item-icon>
          <v-icon>{{link.icon}}</v-icon>
        </v-list-item-icon>

        <v-list-item-content>
          <v-list-item-title>{{link.title}}</v-list-item-title>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </div>
</template>

<script>
module.exports = {
  data: () => ({
    links: [
      { icon: "mdi-home", title: "Páginal Inicial", to: "/" },
      { icon: "mdi-view-dashboard", title: "Foo", to: "/foo1" },
      { icon: "mdi-plus", title: "Bar", to: "/bar1" },
      { icon: "mdi-forum", title: "About", to: "/about" }
    ]
  })
}
</script>