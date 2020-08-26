<template>
  <div class="v-testimony">
    <ZText size="large" color="inverted" tag="p" align="center" weight="bold">
      "É bem cansativo. Acordo de madrugada para estudar porque é o horário que
      a internet está menos pior."
    </ZText>
    <ZDivider variant="brand" class="v-testimony__divider" />
    <ZText
      size="medium"
      color="inverted"
      tag="p"
      align="center"
      class="v-testimony__contact"
    >
      @mayara_cordeiro_
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
