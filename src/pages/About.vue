<script lang="coffee">
export default
  name: 'about'
  data: -> return {}
</script>

<template lang="pug">
  div.bg-black.h-screen.flex.justify-center.items-center
    div.content-box
      div.content-row
        span.option our values
      div.divider
      div.content-row
        span.option our service
      div.divider
      div.content-row
        span.option feature case studies
      div.divider
      div.content-row
        span.option classic case studies
      div.divider
      div.content-row
        span.option contact us
</template>

<style lang="stylus">
div
  box-sizing content-box
.divider
  height 1px
  background-color white
.content-box
  width 550px
  height 400px
.content-row
  cursor pointer
  letter-spacing -0.02em
  font-weight 700
  color white
  font-size 40px
  display flex
  justify-content center
  align-items center
  height 80px
  transition all 250ms ease
  &:hover
    opacity: 0.6
    transform scale(1.05, 1.05)
</style>
