<script lang="coffee">
# @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default
  name: 'Home'
  components: { HelloWorld }

</script>


<template lang="pug">
  div.home
    div.flex.justify-center
      img(alt="Vue logo" src="../assets/logo.png")
    HelloWorld(msg="Welcome to Your Vue.js App")
</template>