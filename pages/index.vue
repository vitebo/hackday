<template>
  <main>
    <ThePresentation />
    <TheDepositions />
  </main>
</template>

<script>
import ThePresentation from '~/components/ThePresentation'
import TheDepositions from '~/components/TheDepositions'

export default {
  components: {
    ThePresentation,
    TheDepositions,
  },
  async asyncData({ $content }) {
    // eslint-disable-next-line no-console
    console.log($content)
    const depositions = await $content('depositions').fetch()
    // eslint-disable-next-line no-console
    console.log(depositions)
    return { depositions }
  },
}
</script>
