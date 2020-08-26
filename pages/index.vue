<template>
  <main>
    <ThePresentation />
    <TheSignatures />
  </main>
</template>

<script>
import ThePresentation from '~/components/ThePresentation'
import TheSignatures from '~/components/TheSignatures'

export default {
  components: {
    ThePresentation,
    TheSignatures,
  },
  async asyncData({ $content }) {
    const posts = await $content('blog').fetch()
    return { posts }
  },
}
</script>
