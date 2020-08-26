<template>
  <svg
    :width="size"
    :height="size"
    version="1.1"
    xmlns="http://www.w3.org/2000/svg"
    :transform="rotate"
  >
    <polygon
      :points="points"
      stroke-width="2"
      fill="transparent"
      :stroke="color"
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
      default: '#304ffe',
    },
    deg: {
      type: Number,
      default: 0,
    },
  },
  computed: {
    points() {
      const size = this.size - 1
      const mid = size / 2
      return `${mid},0 0,${size} ${size},${size}`
    },
    rotate() {
      return `rotate(${this.deg})`
    },
  },
}
</script>
