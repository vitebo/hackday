<template>
  <section class="the-signatures">
    <h2><span v-text="counter">0</span> pessoas já assinaram</h2>
    <form @submit.prevent="signIn">
      <p>
        <label>Nome</label>
        <input v-model="form.firstName" type="text" required="required" />
      </p>
      <p>
        <label>Sobrenome</label>
        <input v-model="form.lastName" type="text" required="required" />
      </p>
      <p>
        <label>E-mail</label>
        <input v-model="form.email" type="email" required="required" />
      </p>
      <p>
        <label>Profissão</label>
        <input v-model="form.profession" type="text" required="required" />
      </p>
      <p>
        <input
          v-model="form.areyouhuman"
          class="the-signatures__captcha"
          type="text"
        />
        <button type="submit" :disabled="signed">Assinar</button>
      </p>
      <p v-show="signed">Obrigado por participar!</p>
    </form>

    <ListSignatures
      v-if="signatures"
      :signatures="signatures"
      class="the-signatures__list"
    />
  </section>
</template>

<script>
import * as firebase from 'firebase/app'
import 'firebase/database'
import ListSignatures from '~/components/ListSignatures'

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
  },
  data() {
    return {
      form: {
        firstName: null,
        lastname: null,
        email: null,
        profession: null,
        areyouhuman: null,
      },
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
    signIn(event) {
      // honeypot captcha
      if (this.form.areyouhuman !== null) {
        return
      }

      const data = Object.assign({}, this.form)
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

  &__captcha {
    display: none;
  }

  &__list {
    max-width: 600px;
    margin: 0 auto;
  }
}
</style>
