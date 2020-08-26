<template>
  <div>
    <h2>{{ post.title }}</h2>
    <NuxtContent :document="post" />
  </div>
</template>

<script>
export default {
  async asyncData({ $content, params, error }) {
    try {
      const post = await $content('blog', params.slug).fetch()
      return { post }
    } catch (e) {
      error({ message: 'Blog Post not found' })
      return { post: null }
    }
  },
}
</script>
