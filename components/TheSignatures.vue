<template>
  <section class="the-signatures">
    <ZTitle
      tag="h2"
      size="extra-large"
      class="the-signatures__title"
      align="center"
    >
      <span class="the-signatures__counter" v-text="counter">0</span> pessoas já
      assinaram
    </ZTitle>
    <div class="the-signatures__wrapper">
      <ListSignaturesSkeleton
        v-if="loading"
        class="the-signatures__list__skeleton"
      />

      <ListSignatures
        v-else
        :signatures="signatures"
        class="the-signatures__list"
      />

      <FormSignaturesSuccess v-if="signed" class="the-signatures__form" />
      <FormSignatures v-else class="the-signatures__form" @success="signIn" />
    </div>
  </section>
</template>

<script>
import * as firebase from 'firebase/app'
import 'firebase/database'
import { ZTitle } from '@quero/zilla-vue'
import ListSignatures from '~/components/ListSignatures'
import ListSignaturesSkeleton from '~/components/ListSignaturesSkeleton'

import FormSignatures from '~/components/FormSignatures'
import FormSignaturesSuccess from '~/components/FormSignaturesSuccess'

const firebaseConfig = {
  apiKey: 'AIzaSyBtZq3SCUN62PHJDWcplzrboRvbY-OpTtE',
  authDomain: 'hackday-dev-a437b.firebaseapp.com',
  databaseURL: 'https://hackday-dev-a437b.firebaseio.com',
  projectId: 'hackday-dev-a437b',
  storageBucket: 'hackday-dev-a437b.appspot.com',
  messagingSenderId: '222438946315',
  appId: '1:222438946315:web:10fbf2f4606a2e4dbe790e',
  measurementId: 'G-M1K9904JYD',
}

if (!firebase.apps.length) {
  firebase.initializeApp(firebaseConfig)
}

const database = firebase.database()

export default {
  components: {
    ListSignatures,
    FormSignatures,
    ListSignaturesSkeleton,
    ZTitle,
    FormSignaturesSuccess,
  },
  data() {
    return {
      loading: true,
      counter: 0,
      signed: false,
      signatures: null,
    }
  },
  created() {
    database.ref('signatures/counter').on('value', (snapshot) => {
      this.counter = snapshot.val()
    })

    database
      .ref('signatures/records')
      .orderByChild('createdAt')
      .limitToLast(10)
      .on('value', (snapshot) => {
        this.signatures = []
        snapshot.forEach((child) => {
          this.signatures.push(child.val())
          this.loading = false
        })
        this.signatures.reverse()
      })
  },
  methods: {
    signIn(props) {
      const data = { ...props }
      // trim all fields
      Object.keys(data).forEach((k, v) => {
        if (typeof data === 'string') {
          data[k] = data[k].trim()
        }
      })
      // add createdAt field
      Object.assign(data, {
        createdAt: firebase.database.ServerValue.TIMESTAMP,
      })

      const id = data.email.replace('.', '').replace('@', '')
      this.createSignature(id, data)
      this.signed = true
    },
    createSignature(id, data) {
      const ref = database.ref('signatures/records/' + id)
      ref.once('value', (snapshot) => {
        if (snapshot.exists()) {
          return
        }

        ref
          .set(data)
          .then(() => {
            this.incrementSignatureCounter()
          })
          .catch((error) => {
            console.log('sign failed', error)
          })
      })
    },
    incrementSignatureCounter() {
      database
        .ref('signatures/counter')
        .set(firebase.database.ServerValue.increment(1))
    },
  },
}
</script>

<style lang="scss">
$component-name: 'the-signatures';

.#{$component-name} {
  position: relative;
  min-height: 100vh;

  &__title {
    margin-bottom: var(--space-extra-colossal);
    margin-top: var(--space-extra-colossal);
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  }

  &__counter {
    font-size: var(--size-font-extra-colossal);
    border-bottom: 10px solid var(--color-support-danger-pure);
  }

  &__wrapper {
    display: flex;
    justify-content: center;
    flex-direction: column;
    max-width: 900px;
    margin: 0 auto;
  }

  &__list {
    margin: 0;
  }

  &__list__skeleton {
    width: 100;
    margin: 0 var(--space-medium);
  }

  &__form {
    margin-top: var(--space-colossal);
    margin-bottom: var(--space-jumbo);
  }
}
</style>
