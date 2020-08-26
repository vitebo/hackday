<template>
  <section class="the-header">
    <div class="the-header__wrapper">
      <div class="the-header__logo">
        <ZLink class="the-header__link" href="/">
          <img src="~/assets/logo.svg"
        /></ZLink>
      </div>
      <nav class="the-header__nav">
        <ZLink class="the-header__nav-item" href="/"
          >Por que é importante?</ZLink
        >
        <ZLink class="the-header__nav-item" href="/">Depoimentos</ZLink>
        <ZLink class="the-header__nav-item" href="/">Manifesto</ZLink>
        <ZLink class="the-header__nav-item" href="/">Quem apoia</ZLink>
      </nav>
      <div class="the-header__cta">
        <ZButton tag="a" variant="secondary" size="medium">
          Assinar agora
        </ZButton>
      </div>
    </div>
  </section>
</template>

<script>
import { ZButton, ZLink } from '@quero/zilla-vue'

export default {
  components: {
    ZButton,
    ZLink,
  },
}
</script>

<style lang="scss">
$component-name: 'the-header';

.#{$component-name} {
  background-color: var(--color-blue-000);
  position: relative;

  &__wrapper {
    align-items: center;
    border-bottom: 2px solid var(--color-neutral-lighter-gray);
    display: flex;
    justify-content: flex-start;
    padding-top: 1.5rem;
    padding-bottom: 1.5rem;
    padding-left: 1.5rem;
    padding-right: 1.5rem;
    max-width: 80rem;
    margin-left: auto;
    margin-right: auto;
  }

  &__logo {
    flex: 1 1 0%;
  }

  &__link {
    display: flex;
  }

  &__nav {
    display: flex;
    margin-right: calc(2.5rem * 0);
    margin-left: calc(2.5rem * (1 - 0));
  }

  &__nav-item {
    color: var(--color-gray-500);
    font-size: var(--size-font-medium);
    margin-left: 1.5rem;
    transition-duration: 0.15s;
    transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
    transition-property: background-color, border-color, color, fill, stroke,
      opacity, box-shadow, transf;

    &:hover {
      color: var(--color-gray-400);
    }
  }

  &__cta {
    margin-left: var(--space-jumbo);
  }
}
</style>
