<template>
  <ZCard class="list-signatures-skeleton">
    <ul class="list-signatures-skeleton__wrapper">
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
      <li class="list-signatures-skeleton__signature">
        <SkeletonBox />
      </li>
    </ul>
  </ZCard>
</template>

<script>
import { ZCard } from '@quero/zilla-vue'
import SkeletonBox from '~/components/SkeletonBox'

export default {
  components: {
    SkeletonBox,
    ZCard,
  },
  // eslint-disable-next-line vue/require-prop-types
  methods: {},
}
</script>

<style lang="scss">
$component-name: 'list-signatures-skeleton';

.#{$component-name} {
  position: relative;
  height: 500px;
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
