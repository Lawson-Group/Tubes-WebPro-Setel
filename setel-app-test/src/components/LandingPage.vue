<template>
  <v-app>
    <v-carousel>
      <v-carousel-item v-for="(image, index) in images" :key="index" cover>
        <div class="carousel-item-content">
          <img :src="image.src" :alt="'Image ' + (index + 1)" />
          <div class="caption">{{ image.caption }}</div>
        </div>
      </v-carousel-item>
    </v-carousel>

    <v-container>
      <v-row>
        <v-col cols="12" class="text-center">
          <h1>Selamat Datang di Setel, Admin</h1>
          <p>Nikmati kenyamanan dan kemudahan berkeliling
            kampus dengan menggunakan layanan peminjaman
            berkendara yang tersedia di Telkom University!</p>
        </v-col>
      </v-row>
      <div class="d-flex justify-center mt-4">
        <v-sheet v-for="(admin, index) in admins" :key="index" class="ma-2 pa-2">
          <v-img :width="125" :src="admin.image"></v-img>
          <h2 class="text-center">{{ admin.name }}</h2>
        </v-sheet>
      </div>

      <div class="text-center mt-4">
        <router-link to="/LoginPage">
          <v-btn append-icon="mdi-login" class="text-none" color="red-darken-4" variant="elevated">
            Login
            <template v-slot:append>
              <v-icon></v-icon>
            </template>
          </v-btn>
        </router-link>
      </div>

    </v-container>
  </v-app>
</template>

<script>
export default {
  name: 'LandingPage',
  data() {
    return {
      admins: [
        { image: require('@/assets/admin.png'), name: 'Aisha' },
        { image: require('@/assets/admin.png'), name: 'Jannah' },
        { image: require('@/assets/admin.png'), name: 'Jean' },
        { image: require('@/assets/admin.png'), name: 'Novi' },
        { image: require('@/assets/admin.png'), name: 'Triani' },
      ],
      images: [
        { src: require('@/assets/LP_GKU.jpg'), caption: 'Setel Apps' },
        { src: require('@/assets/OPLIB-MSU.jpg'), caption: 'How To Use Setel' },
        { src: require('@/assets/LP_TULT.jpg'), caption: 'Why Setel?' }
      ]
    }
  }
};
</script>

<style>
.carousel-item-content {
  position: relative;
  overflow: hidden;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.carousel-item-content img {
  width: 100%;
  transition: transform 0.3s;
}

/* Efek untuk zoom img saat hover*/
.carousel-item-content:hover img {
  transform: scale(1.05);
}

/* Caption atau teks overlay */
.carousel-item-content .caption {
  position: absolute;
  bottom: 10px;
  left: 10px;
  color: white;
  background-color: rgba(0, 0, 0, 0.5);
  padding: 5px 10px;
  border-radius: 5px;
}
</style>