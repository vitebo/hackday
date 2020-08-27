<template>
  <h2 class="v-title">
    {{ text }} <span class="v-title__feature">{{ featureText }}</span>
  </h2>
</template>

<script>
export default {
  props: {
    text: {
      type: String,
      required: true,
    },
    featureText: {
      type: String,
      required: true,
    },
  },
}
</script>

<style lang="scss">
$component-name: 'v-title';

.#{$component-name} {
  color: var(--color-font-primary);
  display: flex;
  justify-content: center;
  font-size: var(--size-font-giant);
  position: relative;
  text-align: center;

  &__feature {
    border-bottom: 10px solid var(--color-support-danger-pure);
    margin-left: 8px;
  }
}
</style>
