<template>
  <section class="the-signatures">
    <ZTitle
      tag="h2"
      size="extra-large"
      class="the-signatures__title"
      align="center"
    >
      <span v-text="counter">0</span> pessoas já assinaram
    </ZTitle>
    <div class="the-signatures__wrapper">
      <ListSignatures
        v-if="signatures"
        :signatures="signatures"
        class="the-signatures__list"
      />

      <FormSignatures class="the-signatures__form" @success="signIn" />
    </div>
  </section>
</template>

<script>
import * as firebase from 'firebase/app'
import 'firebase/database'
import { ZTitle } from '@quero/zilla-vue'
import ListSignatures from '~/components/ListSignatures'
import FormSignatures from '~/components/FormSignatures'

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
    ZTitle,
  },
  data() {
    return {
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
  }

  &__wrapper {
    display: flex;
    align-items: flex-start;
    justify-content: center;
  }

  &__list {
    max-width: 600px;
    margin: 0 var(--space-medium);
  }

  &__form {
    max-width: 600px;
    margin: 0 var(--space-medium);
  }
}
</style>
