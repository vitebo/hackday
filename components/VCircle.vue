<template>
  <svg
    :width="size"
    :height="size"
    version="1.1"
    xmlns="http://www.w3.org/2000/svg"
  >
    <circle cx="50%" cy="50%" :r="r" :stroke="color" stroke-width="1" />
  </svg>
</template>

<script>
export default {
  props: {
    size: {
      type: Number,
      default: 30,
    },
    color: {
      type: String,
      default: '#DA1E28',
    },
  },
  computed: {
    r() {
      return this.size / 2 - 1
    },
  },
}
</script>
