<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12">
        <v-app-bar color="red-darken-4" prominent flat>
          <v-toolbar-title class="font-weight-bold text-left px-8">Setel Admin</v-toolbar-title>
          
          <v-spacer></v-spacer>
        </v-app-bar>
      </v-col>
    </v-row>
    <v-row justify="center" align="center" class="fill-height">
      <v-col cols="12" md="5">
        <h2>Selamat Datang di Setel Admin App</h2>
        <h3>Sistem Pengelolaan Setel</h3>
        <v-img class="mt-8" src="../assets/sepeda.png" max-width="800"></v-img>
      </v-col>

      <v-col cols="12" md="4">
        <v-card class="mx-auto px-6 py-8" max-width="500">
          <h1 class="text-center mb-16">Login</h1>
          <v-form v-model="form" @submit.prevent="onSubmit">
            <v-text-field v-model="username" :readonly="loading" :rules="[required]" class="mb-8" clearable label="Username"></v-text-field>
            <v-text-field v-model="password" :type="showPassword ? 'text' : 'password'"
              :append-inner-icon="showPassword ? 'mdi-eye-off' : 'mdi-eye'"
              @click:append-inner="showPassword = !showPassword" :readonly="loading" :rules="[required]" class="mb-8"
              clearable label="Password" placeholder="Masukkan Password"></v-text-field>
            <v-alert v-if="loginError" type="error" dense>
              Username / Password yang dimasukkan salah
            </v-alert>
            <br />
            <v-btn :disabled="!form" :loading="loading" block color="red-darken-4" size="large" type="submit" variant="elevated">
              Login
            </v-btn>
          </v-form> 
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  data: () => ({
    form: false,
    username: "",
    password: "",
    loading: false,
    loginError: false,
    showPassword: false,
  }),
  methods: {
    async onSubmit() {
      if (!this.form) return;

      try {
        // Mengirim permintaan ke backend untuk memeriksa login
        const response = await axios.post('http://localhost:3000/api/login', {
          username: this.username,
          password: this.password
        });

        // Memeriksa apakah login berhasil atau tidak
        if (response.data.success) {
          // Jika berhasil, redirect ke halaman Dashboard jika berhasil
          this.$router.push("/DashboardPage");
        } else {
          this.loginError = true;
        }
      } catch (error) {
        console.error('Error:', error);
        this.loginError = true;
      } finally {
        this.loading = false;
      }
    },
    required(v) {
      return !!v || "*Field is required";
    },
  },
};
</script>

<style>
.card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.title {
  font-size: 25px;
}

h3 {
  color: #a32929;
}
</style>
