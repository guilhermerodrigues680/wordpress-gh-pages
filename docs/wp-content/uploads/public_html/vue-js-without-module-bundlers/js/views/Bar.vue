<template>
  <span>Bar</span>
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
    background-color: purple;
  }
</style>