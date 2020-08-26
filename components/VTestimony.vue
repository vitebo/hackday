<template>
  <div class="v-testimony">
    <ZText size="large" color="inverted" tag="p" align="center">
      "{{ description }}"
    </ZText>
    <ZDivider variant="brand" class="v-testimony__divider" />
    <ZText
      size="medium"
      color="inverted"
      tag="p"
      align="center"
      class="v-testimony__contact"
    >
      {{ contact }}
    </ZText>
  </div>
</template>

<script>
import { ZText, ZDivider } from '@quero/zilla-vue'

export default {
  components: {
    ZText,
    ZDivider,
  },
  props: {
    description: {
      type: String,
      required: true,
    },
    contact: {
      type: String,
      required: true,
    },
  },
}
</script>

<style lang="scss">
$component-name: 'v-testimony';

.#{$component-name} {
  position: relative;

  &__divider {
    --divider-border-color-brand: var(--color-primary);

    margin-top: var(--space-large);
  }

  &__contact {
    margin-top: var(--space-large);
  }
}
</style>
