<template>
  <main>
    <TheHeader />
    <ThePresentation />
    <TheDepositions :depositions="depositions" />
    <TheSignatures />
    <TheFooter />
  </main>
</template>

<script>
import TheHeader from '~/components/TheHeader'
import ThePresentation from '~/components/ThePresentation'
import TheDepositions from '~/components/TheDepositions'
import TheSignatures from '~/components/TheSignatures'
import TheFooter from '~/components/TheFooter'

export default {
  components: {
    TheHeader,
    ThePresentation,
    TheDepositions,
    TheSignatures,
    TheFooter,
  },
  async asyncData({ $content }) {
    const depositions = await $content('depositions').fetch()
    return { depositions }
  },
}
</script>
