<template>
  <svg
    :width="size"
    :height="size"
    version="1.1"
    xmlns="http://www.w3.org/2000/svg"
    :transform="rotate"
  >
    <rect
      x="0"
      y="0"
      :width="size"
      :height="size"
      :stroke="color"
      fill="transparent"
      stroke-width="2"
    />
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
    deg: {
      type: Number,
      default: 0,
    },
  },
  computed: {
    rotate() {
      return `rotate(${this.deg})`
    },
  },
}
</script>
