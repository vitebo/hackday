<template>
  <main>
    <ThePresentation />
    <TheDepositions :depositions="depositions" />
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
    const depositions = await $content('depositions').fetch()
    // eslint-disable-next-line no-console
    console.log(depositions)
    return { depositions }
  },
}
</script>
