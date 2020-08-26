<template>
  <main>
    <ThePresentation />
  </main>
</template>

<script>
import ThePresentation from '~/components/ThePresentation'

export default {
  components: {
    ThePresentation,
  },
  async asyncData({ $content }) {
    const posts = await $content('blog').fetch()
    return { posts }
  },
}
</script>
