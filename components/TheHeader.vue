<template>
  <header class="the-header">
    <div class="the-header__wrapper">
      <div class="the-header__logo">
        <ZLink class="the-header__link" href="/">
          <img class="the-header__logo-image" src="~/assets/logo.svg"
        /></ZLink>
      </div>
      <nav class="the-header__nav" :class="{ 'the-header__nav--open': isOpen }">
        <ZLink class="the-header__nav-item" size="small" href="#depositions"
          >Depoimentos</ZLink
        >
        <ZLink class="the-header__nav-item" size="small" href="#list-signatures"
          >Quem apoia</ZLink
        >
      </nav>
      <div class="the-header__cta">
        <ZButton
          tag="a"
          variant="secondary"
          size="medium"
          href="#form-signatures"
        >
          Assinar agora
        </ZButton>
      </div>
      <button class="the-header__mobile-action" @click="handleMenu">
        <ZIcon icon="bars" color="primary" size="large" />
      </button>
    </div>
    <div v-if="isOpen" class="the-header__overlay" @click="closeMenu" />
  </header>
</template>

<script>
import { ZButton, ZLink, ZIcon } from '@quero/zilla-vue'

export default {
  components: {
    ZButton,
    ZLink,
    ZIcon,
  },
  data() {
    return {
      isOpen: false,
    }
  },
  methods: {
    handleMenu() {
      this.isOpen = !this.isOpen
    },
    closeMenu() {
      this.isOpen = false
    },
  },
}
</script>

<style lang="scss">
@import '@quero/zilla-core/src/utils/_index.scss';

$component-name: 'the-header';

.#{$component-name} {
  background-color: var(--color-blue-000);

  &__wrapper {
    align-items: center;
    border-bottom: 2px solid var(--color-neutral-lighter-gray);
    display: flex;
    justify-content: flex-start;
    padding: 1.5rem;
    max-width: 80rem;
    margin-left: auto;
    margin-right: auto;
  }

  &__logo {
    flex: 1 1 200px;
  }

  &__link {
    display: flex;
  }

  &__nav {
    position: fixed;
    background: white;
    padding: var(--space-medium);
    display: flex;
    flex-direction: column;
    transform: translateX(-100%);
    left: 0;
    z-index: 99999;
    top: 0;
    min-height: 100vh;
    transition: transform 250ms ease;
    min-width: 300px;

    &--open {
      transform: translateX(0);
    }

    @media (min-width: $screen-desktop) {
      position: relative;
      min-height: 0;
      background-color: transparent;
      flex-direction: row;
      transform: translateX(0);
      min-width: 0;
    }
  }

  &__nav-item {
    color: var(--color-gray-500);
    padding: var(--space-medium);
    display: inline-block;

    &:hover {
      color: var(--color-gray-400);
    }

    @media (min-width: $screen-desktop) {
      padding: var(--space-small);
    }
  }

  &__cta {
    display: none;

    @media (min-width: $screen-desktop) {
      display: block;
    }
  }

  &__mobile-action {
    background: none;
    border: none;
    display: block;

    @media (min-width: $screen-desktop) {
      display: none;
    }
  }

  &__overlay {
    min-height: 100vh;
    min-width: 100vw;
    background: black;
    position: fixed;
    z-index: 500;
    top: 0;
    left: 0;
    opacity: 0.5;
  }
}
</style>
