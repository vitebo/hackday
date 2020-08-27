<template>
  <ZCard class="form-signatures-success">
    <ZIcon icon="check-circle" color="success" size="giant" />
    <ZText>Muito obrigado por assinar!</ZText>
  </ZCard>
</template>

<script>
import { ZText, ZCard, ZIcon } from '@quero/zilla-vue'

export default {
  components: {
    ZText,
    ZCard,
    ZIcon,
  },
}
</script>

<style lang="scss">
$component-name: 'form-signatures-success';

.#{$component-name} {
  position: relative;
  justify-content: center;
  align-items: center;
  display: flex;
  flex-direction: column;
}
</style>
