<template>
  <v-app>
    <v-carousel>
      <v-carousel-item v-for="(image, index) in images" :key="index" cover>
        <div class="carousel-item-content" justify="center">
          <img :src="image.src" :alt="'Image ' + (index + 1)" />
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

      <v-row align="center" justify="center">
        <v-col v-for="(admin, index) in admins" :key="index" cols="12" sm="6" md="4" lg="2">
          <v-card class="ma-2 pa-2" variant="flat">
            <v-img :src="admin.image" class="mx-auto" max-width="125" max-height="125"></v-img>
            <h2 class="text-center">{{ admin.name }}</h2>
          </v-card>
        </v-col>
      </v-row>

      <v-spacer></v-spacer>
      <v-row>
        <v-col cols="12" class="text-center mt-4">
          <h1>Statistik</h1>
          <p>Gambaran umum jumlah kendaraan, jumlah kendaraan dalam masa perbaikan, jumlah pengguna yang terdaftar, dan
            jumlah shelter yang tersedia</p>
        </v-col>
      </v-row>

      <v-row align="center" justify="center">
        <v-col v-for="(statistik, index) in data" :key="index" cols="12" sm="6" md="4" lg="2">
          <v-card class="ma-2 pa-2" variant="flat">
            <v-img :src="statistik.image" class="mx-auto" max-width="125" max-height="125"></v-img>
            <h4 class="text-center mt-3">{{ statistik.subtitle }}</h4>
            <h2 class="text-center">{{ statistik.title }}</h2>
          </v-card>
        </v-col>
      </v-row>

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
      data: [
        { image: require('@/assets/StatistikSepeda.png'), title: 'Sepeda', subtitle: '100 unit' },
        { image: require('@/assets/StatistikSkuter.png'), title: 'Skuter', subtitle: '100 unit' },
        { image: require('@/assets/StatistikMaintenance.png'), title: 'Perbaikan', subtitle: '100 unit' },
        { image: require('@/assets/StatistikPengguna.png'), title: 'Pengguna', subtitle: '9000' },
        { image: require('@/assets/StatistikShelter.png'), title: 'Shelter', subtitle: '10' },
      ],
      images: [
        { src: require('@/assets/Carousel1.jpg') },
        { src: require('@/assets/Carousel3.jpg') },
        { src: require('@/assets/Carousel2.jpg') }
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
  max-width: 100%;
  max-height: 100%;
}

.carousel-item-content img {
  width: 100%;
  transition: transform 0.3s;
  height: 100%;
}

.carousel-item-content:hover img {
  transform: scale(1.05);
}
</style>