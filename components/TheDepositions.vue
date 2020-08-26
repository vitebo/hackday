<template>
  <section class="the-depositions">
    <ZCarousel
      :slides-per-view-desktop="1"
      :slides-per-view-mobile="1"
      class="the-depositions__carousel"
    >
      <VTestimony />
    </ZCarousel>
  </section>
</template>

<script>
import { ZCarousel } from '@quero/zilla-vue'
import VTestimony from '~/components/VTestimony'

export default {
  components: {
    ZCarousel,
    VTestimony,
  },
  async asyncData({ $content }) {
    // eslint-disable-next-line no-console
    console.log('pey')
    const depositions = await $content('depositions').fetch()
    // eslint-disable-next-line no-console
    console.log(depositions)
    return { depositions }
  },
}
</script>

<style lang="scss">
$component-name: 'the-depositions';

.#{$component-name} {
  background-color: #002b50;
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;

  &__carousel {
    max-width: 500px;
  }
}
</style>
