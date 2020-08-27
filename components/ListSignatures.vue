<template>
  <ZCard class="list-signatures">
    <ul class="list-signatures__wrapper">
      <li
        v-for="(signature, index) in signatures"
        :key="index"
        class="list-signatures__signature"
      >
        <header class="list-signatures__columns">
          <div class="list-signatures__column">
            <ZIcon
              icon="user-friends"
              class="list-signatures__icon"
              size="medium"
            />
          </div>
          <div class="list-signatures__column">
            <ZText tag="strong">
              {{ signature.firstName }}
            </ZText>
            <ZText tag="p" color="minor">
              {{ signature.profession }}
            </ZText>
          </div>
        </header>
        <div class="list-signatures__date">
          <ZText tag="span" color="major" size="micro"> Assinou em: </ZText>
          <ZBadgeText variant="info" :value="formatDate(signature.createdAt)" />
        </div>
      </li>
    </ul>
  </ZCard>
</template>

<script>
import { ZCard, ZText, ZIcon, ZBadgeText } from '@quero/zilla-vue'
export default {
  components: {
    ZCard,
    ZText,
    ZIcon,
    ZBadgeText,
  },
  // eslint-disable-next-line vue/require-prop-types
  props: ['signatures'],
  methods: {
    formatName({ firstName, lastName }) {
      const firstLetter = lastName.charAt(0).toUppercase()
      return `${firstName} ${firstLetter}`
    },
    formatDate(timestamp) {
      return new Date(timestamp).toLocaleDateString()
    },
  },
}
</script>

<style lang="scss">
$component-name: 'list-signatures';

.#{$component-name} {
  position: relative;
  max-height: 400px;
  overflow-y: auto;

  &__wrapper {
    padding-left: 0;
  }

  &__signature {
    align-items: center;
    display: flex;
    justify-content: space-between;
    padding: var(--space-medium) 0;

    &:not(:first-child) {
      border-top: 1px solid var(--color-gray-050);
    }
  }

  &__columns {
    display: flex;
    align-content: center;
    align-items: center;
  }

  &__column {
    margin-right: var(--space-medium);
  }

  &__icon {
    margin-right: var(--space-small);
  }
}
</style>
