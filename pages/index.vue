<template>
  <ul>
    <li v-for="post of posts" :key="post.slug">
      <NuxtLink :to="post.slug">{{ post.title }}</NuxtLink>
      <ZButton>Primary</ZButton>
      <ZButton variant="secondary">Secondary</ZButton>
    </li>
  </ul>
</template>

<script>
import { ZButton } from '@quero/zilla-vue'

export default {
  components: {
    ZButton,
  },
  async asyncData({ $content }) {
    const posts = await $content('blog').fetch()
    return { posts }
  },
  head() {
    return {
      script: [
        { src: 'https://identity.netlify.com/v1/netlify-identity-widget.js' },
      ],
    }
  },
}
</script>
