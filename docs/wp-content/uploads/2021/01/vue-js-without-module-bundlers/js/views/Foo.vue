<template>
  <span>Foo</span>
</template>

<script>
module.exports = {
  mounted () {
    console.log('Hello World')
  }
}
</script>

<style scoped>
  span {
    background-color: orangered;
  }
</style>