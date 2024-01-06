<template>
  <v-app>
    <v-carousel>
      <v-carousel-item v-for="(image, index) in images" :key="index" cover>
        <div class="carousel-item-content" justify="center">
          <img :src="image.src" :alt="'Image ' + (index + 1)" />
        </div>
      </v-carousel-item>
    </v-carousel>

    <v-container-fluid class="pr-3 pb-3" style="background-color: #FFEBEE;">
      <v-row>
        <v-col cols="12" class="text-center mt-4">
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
          <h1 class="red-text">Statistik</h1>
          <p>Gambaran umum jumlah kendaraan, jumlah kendaraan dalam masa perbaikan, jumlah pengguna yang terdaftar, dan
            jumlah shelter yang tersedia</p>
        </v-col>
      </v-row>

      <v-row align="center" justify="center">
        <v-col v-for="(statistik, index) in data" :key="index" cols="12" sm="6" md="4" lg="2">
          <v-card class="ma-2 pa-2" variant="flat">
            <v-img :src="statistik.image" class="mx-auto" max-width="100" max-height="100"></v-img>
            <h4 class="text-center mt-3">{{ statistik.subtitle }}</h4>
            <h2 class="text-center">{{ statistik.title }}</h2>
          </v-card>
        </v-col>
      </v-row>

      <v-spacer></v-spacer>
      <v-row>
        <v-col cols="12" class="text-center mt-4">
          <h1>Shelter</h1>
          <p>Dengan lokasi shelter yang strategis dan fasilitas yang nyaman. Nikmati layanan terbaik 
            dengan akses mudah ke berbagai tempat di Telkom University.</p>
        </v-col>
      </v-row>

      <v-row align="center" justify="center">
        <v-col v-for="(shelter, index) in dataShelter" :key="index" cols="12" sm="6" md="4" lg="2">
          <v-card class="ma-2 pa-2" variant="flat">
            <v-img :src="require(`@/assets/${shelter.shelter}`)" class="mx-auto" max-width="150" max-height="150"></v-img>
            <h4 class="text-center">{{ shelter.title }}</h4>
          </v-card>
        </v-col>
      </v-row>

      <v-row align="center" justify="center">
        <div class="text-center my-4">
          <router-link to="/LoginPage">
            <v-btn append-icon="mdi-login" class="text-none" color="red-darken-4" variant="elevated">
              Login
              <template v-slot:append>
                <v-icon></v-icon>
              </template>
            </v-btn>
          </router-link>
        </div>
      </v-row>
    </v-container-fluid>
  </v-app>
</template>

<script>
import axios from 'axios';
import { ref, onMounted } from 'vue';

export default {  
  name: 'LandingPage',
  setup() {
    const dataShelter = ref([]);

    onMounted(async () => {
      try {
        const responseShelter = await axios.get('http://localhost:3000/api/dataShelter');
        dataShelter.value = responseShelter.data;
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    });
    return {
      dataShelter,
    };
  },
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
        { image: require('@/assets/StatistikSepeda.png'), title: 'Sepeda', subtitle: '8 unit' },
        { image: require('@/assets/StatistikSkuter.png'), title: 'Skuter', subtitle: '7 unit' },
        { image: require('@/assets/StatistikMaintenance.png'), title: 'Perbaikan', subtitle: '3 unit' },
        { image: require('@/assets/StatistikPengguna.png'), title: 'Pengguna', subtitle: '900' },
        { image: require('@/assets/StatistikShelter.png'), title: 'Shelter', subtitle: '4' },
      ],
      images: [
        { src: require('@/assets/Carousel1.jpg') },
        { src: require('@/assets/Carousel3.jpg') },
        { src: require('@/assets/Carousel2.jpg') }
      ]
    }
  },
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

.custom-background {
    background-color: #FFEBEE;
  }
</style>