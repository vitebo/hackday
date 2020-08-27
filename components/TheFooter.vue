<template>
  <section class="the-footer">
    <TheFooterHeart />
  </section>
</template>

<script>
import TheFooterHeart from '~/components/TheFooterHeart'

export default {
  components: {
    TheFooterHeart,
  },
}
</script>

<style lang="scss">
$component-name: 'the-footer';

.#{$component-name} {
  background-color: var(--color-primary);
  align-items: center;
  justify-content: center;
  display: flex;
  min-height: 100px;

  &__wrapper {
    padding: 1.5rem;
  }
}
</style>
