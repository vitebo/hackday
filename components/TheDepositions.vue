<template>
  <section class="the-depositions">
    <ZCarousel
      :slides-per-view-desktop="1"
      :slides-per-group-desktop="1"
      :slides-per-view-mobile="1"
      :slides-per-group-mobile="1"
      class="the-depositions__carousel"
    >
      <VTestimony
        v-for="item in depositions"
        :key="item.slug"
        :description="item.testimony"
        :contact="item.contact"
      />
    </ZCarousel>
    <VTriangle :size="280" class="the-depositions__triangle" :deg="-20" />
    <footer class="the-depositions__footer">
      <ZText size="large" color="inverted" tag="p" align="center">
        Contribua com a causa
      </ZText>
      <ZDivider variant="brand" class="the-depositions__divider" />
      <ZButton variant="primary" :href="ctaUrl" tag="a" target="_blank">
        Deixe um depoimento
      </ZButton>
    </footer>
  </section>
</template>

<script>
import { ZCarousel, ZText, ZDivider, ZButton } from '@quero/zilla-vue'
import VTestimony from '~/components/VTestimony'
import VTriangle from '~/components/VTriangle'

export default {
  components: {
    ZCarousel,
    VTestimony,
    VTriangle,
    ZText,
    ZDivider,
    ZButton,
  },
  props: {
    depositions: {
      type: Array,
      default: () => [],
    },
  },
  computed: {
    ctaUrl() {
      const base = 'https://docs.google.com/forms'
      const d = 'd/1B0rfc3ZIi0wbMv8UWnnLwi1GyKkSUvu05YDHetmQUeA'
      const format = 'viewform?edit_requested=true'
      return `${base}/${d}/${format}`
    },
  },
}
</script>

<style lang="scss">
$component-name: 'the-depositions';

.#{$component-name} {
  background-color: var(--color-cyan-800);
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  flex-direction: column;

  &__carousel {
    max-width: 500px;
  }

  &__triangle {
    position: absolute;
    bottom: 0;
    right: var(--space-large);
  }

  &__footer {
    align-items: center;
    display: flex;
    margin-top: var(--space-giant);
  }

  &__divider {
    --divider-border-color-brand: var(--color-primary);

    margin: 0 var(--space-medium);
  }
}
</style>
