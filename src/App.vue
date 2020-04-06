<template lang="pug">
  div#app.bg-black
    div.pt-8
      router-link(to="/") Home |&nbsp;
      router-link(to="/about") About
    router-view
</template>

<style lang="stylus">
#app
  font-family Avenir, Helvetica, Arial, sans-serif
  -webkit-font-smoothing antialiased
  -moz-osx-font-smoothing grayscale
  text-align center
  color #ffffff
  height 100vh
</style>

