<template>
  <section class="the-presentation">
    <ZTitle tag="h2" size="extra-large" class="the-presentation__title">
      Já pensou se
      <span class="the-presentation__underline">você</span>
      passa-se pelos mesmos
      <span class="the-presentation__highlight">problemas</span>
      que eles?
    </ZTitle>
    <VCircle :size="240" fill="transparent" class="the-presentation__circle" />
    <VSquare :size="240" :deg="60" class="the-presentation__square" />
  </section>
</template>

<script>
import { ZTitle } from '@quero/zilla-vue'
import VSquare from '~/components/VSquare'
import VCircle from '~/components/VCircle'

export default {
  components: {
    ZTitle,
    VSquare,
    VCircle,
  },
}
</script>

<style lang="scss">
$component-name: 'the-presentation';

.#{$component-name} {
  align-items: center;
  background-color: var(--color-blue-000);
  display: flex;
  justify-content: center;
  min-height: 100vh;
  padding: var(--space-large);
  position: relative;

  &__title {
    color: var(--color-primary);
    max-width: 472px;
  }

  &__underline {
    display: inline-block;
    position: relative;

    &::before {
      background-color: var(--color-support-danger-pure);
      bottom: 0;
      content: '';
      height: 2px;
      height: var(--size-extra-small);
      position: absolute;
      width: 100%;
    }
  }

  &__highlight {
    color: var(--color-support-danger-pure);
  }

  &__circle {
    position: absolute;
    left: calc(var(--space-giant) * -1);
    top: var(--space-extra-colossal);
  }

  &__square {
    position: absolute;
    right: calc(var(--space-giant) * -1);
    bottom: var(--space-extra-colossal);
  }
}
</style>
