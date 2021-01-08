<template>
  <div>
    <p>Pagina nao encontrada</p>
    <p>A página que você procura não existe. :/</p>
  </div>
</template>

<script>
module.exports = {
  mounted () {
    console.log(this, 'Hello World 404', this.$router.currentRoute.path)
  },

  computed: {
    pathNaoEncontrado: function () {
      return this.$router.currentRoute.path
    }
  }
}
</script>

<style scoped>
  span {
    background-color: pink;
  }
</style>