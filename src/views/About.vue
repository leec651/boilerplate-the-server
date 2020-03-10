<script lang="coffee">
axios = require 'axios'

export default
  name: "About"
  data: ->
    name: 'emma'
    file: ''
  methods:
    handleFileUpload: () ->
      this.file = this.$refs.file.files[0]
    submitFile: () ->
      formData = new FormData()
      formData.append 'exemptions', this.file
      # TODO handle error
      {status, data} = await axios.post 'http://localhost:3000/multer', formData,
        headers:
          'Content-Type': 'multipart/form-data'
      console.log status, data

</script>

<template lang="pug">
  div.about
    div.mt-8.flex.items-center.justify-center
      label.w-64.flex.flex-col.items-center.px-4.py-6.bg-blue-white.text-blue-700.rounded-lg.shadow-lg.tracking-wide.uppercase.border.border-blue-700.cursor-pointer(
        class="hover:text-white hover:bg-blue-700"
      )
        span.mt-2.text-base.leading-normal Select a file
        input.hidden(
          type='file'
          ref="file"
          v-on:change="handleFileUpload()"
        )
    div.mt-1.text-sm(v-if="file") Uploading {{ this.file.name }}

    button.mt-4.bg-blue-500.text-white.font-bold.py-2.px-4.rounded(
      :disabled="!this.file"
      :class="{'cursor-not-allowed': !this.file, 'opacity-50': !this.file, 'hover:bg-blue-700': 1}"
    ) Submit
</template>
