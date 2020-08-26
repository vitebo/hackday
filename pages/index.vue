<template>
  <main>
    <ThePresentation />
    <TheDepositions :depositions="depositions" />
    <TheSignatures />
  </main>
</template>

<script>
import ThePresentation from '~/components/ThePresentation'
import TheDepositions from '~/components/TheDepositions'
import TheSignatures from '~/components/TheSignatures'

export default {
  components: {
    ThePresentation,
    TheDepositions,
    TheSignatures,
  },
  async asyncData({ $content }) {
    const depositions = await $content('depositions').fetch()
    return { depositions }
  },
}
</script>
