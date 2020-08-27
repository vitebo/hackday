<template>
  <div class="form-signatures">
    <header class="form-signatures__header">
      <ZTitle size="medium" tag="h3" class="form-signatures__title">
        Assine o manifesto
      </ZTitle>
      <ZText color="minor">Todos os campos são obrigatórios</ZText>
    </header>
    <form class="form-signatures__wrapper" @submit.prevent="handleSubmit">
      <div class="form-signatures__group">
        <ZInputField
          label="Nome"
          :has-error="Boolean(firstName.error)"
          class="form-signatures__group-item"
          :error-message="firstName.error"
        >
          <ZInput
            v-model="firstName.value"
            :has-error="Boolean(firstName.error)"
            type="text"
            @input="validateField(firstName)"
          />
        </ZInputField>
        <ZInputField
          label="Sobrenome"
          class="form-signatures__group-item"
          :has-error="Boolean(lastName.error)"
          :error-message="lastName.error"
        >
          <ZInput
            v-model="lastName.value"
            type="text"
            :has-error="Boolean(lastName.error)"
            @input="validateField(lastName)"
          />
        </ZInputField>
      </div>
      <ZInputField
        label="E-mail"
        :has-error="Boolean(email.error)"
        :error-message="email.error"
      >
        <ZInput
          v-model="email.value"
          type="email"
          :has-error="Boolean(email.error)"
          @input="validateField(email)"
        />
      </ZInputField>
      <ZInputField
        label="Profissão"
        :has-error="Boolean(profession.error)"
        :error-message="profession.error"
      >
        <ZInput
          v-model="profession.value"
          type="text"
          :has-error="Boolean(profession.error)"
          @input="validateField(profession)"
        />
      </ZInputField>
      <ZButton type="submit" behavior="block" :is-disabled="isInvalidForm">
        Assinar
      </ZButton>
    </form>
  </div>
</template>

<script>
import { ZInputField, ZInput, ZButton, ZTitle, ZText } from '@quero/zilla-vue'

export default {
  components: {
    ZInputField,
    ZInput,
    ZButton,
    ZTitle,
    ZText,
  },
  data() {
    return {
      firstName: {
        value: '',
        error: null,
      },
      lastName: {
        value: '',
        error: null,
      },
      email: {
        value: '',
        error: null,
      },
      profession: {
        value: '',
        error: null,
      },
    }
  },
  computed: {
    fields() {
      return [this.firstName, this.lastName, this.email, this.profession]
    },
    isValidForm() {
      return this.fields.every((field) => field.error === null)
    },
    isInvalidForm() {
      return !this.isValidForm
    },
  },
  methods: {
    handleSubmit() {
      this.validateForm()
      if (this.isValidForm) {
        this.triggerSuccessEvent()
      }
    },
    triggerSuccessEvent() {
      const { firstName, lastName, email, profession } = this
      this.$emit('success', {
        firstName: firstName.value,
        lastName: lastName.value,
        email: email.value,
        profession: profession.value,
      })
    },
    validateForm() {
      this.fields.forEach((field) => this.validateField(field))
    },
    validateField(field) {
      if (field.value) {
        field.error = null
        return
      }
      field.error = 'Campo obrigatório'
    },
  },
}
</script>

<style lang="scss">
$component-name: 'form-signatures';

.#{$component-name} {
  position: relative;

  &__header {
    margin-bottom: var(--space-large);
  }

  &__title {
    margin-bottom: var(--space-small);
  }

  &__group {
    display: flex;

    &-item {
      flex-grow: 1;

      &:not(:first-child) {
        margin-left: var(--space-medium);
      }
    }
  }

  &__captcha {
    display: none;
  }
}
</style>
