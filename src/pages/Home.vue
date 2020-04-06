<script lang="coffee">
# @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default
  name: 'home'
  components: { HelloWorld }

</script>


<template lang="pug">
  div.home
    div.flex.justify-center.mt-20
      img(alt="Vue logo" src="../assets/logo.png")
    HelloWorld(msg="Welcome to Your Vue.js App")
</template>