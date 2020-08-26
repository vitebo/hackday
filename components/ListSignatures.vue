<template>
  <ZCard class="list-signatures">
    <ul class="list-signatures__wrapper">
      <li
        v-for="(signature, index) in signatures"
        :key="index"
        class="list-signatures__signature"
      >
        <header>
          <ZText tag="strong">
            {{ signature.firstName }}
          </ZText>
          <ZText tag="p" color="minor">
            <ZIcon
              icon="user-friends"
              class="list-signatures__icon"
              size="medium"
            />
            {{ signature.profession }}
          </ZText>
        </header>
        <ZBadgeText
          variant="success"
          :value="formatDate(signature.createdAt)"
        />
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
  max-height: 600px;
  overflow-y: hidden;

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

  &__icon {
    margin-right: var(--space-small);
  }
}
</style>
