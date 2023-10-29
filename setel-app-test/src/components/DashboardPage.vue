<template>
    <v-container>
        <h1 class="mb-5 display-1 font-weight-bold;">Welcome, Admin!</h1>

        <v-row class="mt-5 justify-space-between" align="center">
            <v-col v-for="(item, index) in data" :key="index" cols="auto">
                <v-card class="mx-auto elevation-10 rounded-lg" color="red-lighten-3" width="330" height="180">
                    <v-card-item>
                        <v-card-title class="text-h5 font-weight-bold text-center mb-6">{{ item.title }}</v-card-title>
                        <v-row class="mx-auto justify-space-between" align="center">
                            <v-col>
                                <v-img :src="require(`@/assets/${item.imageSource}`)" alt="Item Image" max-width="100"
                                    max-height="100"></v-img>
                            </v-col>
                            <v-col>
                                <v-card class="pa-1 bg-white rounded-lg">
                                    <h2 class="text-center">123<br />UNIT</h2>
                                </v-card>
                            </v-col>
                        </v-row>
                    </v-card-item>
                </v-card>
            </v-col>
        </v-row>

        <!-- Informasi Shelter -->
        <v-row class="mt-8 justify-space-between" align="center">
            <v-col v-for="(image, index) in images" :key="index" cols="auto">
                <v-card class="my-custom-border">
                    <div class="d-flex flex-column justify-center my-3">
                        <v-card class="d-flex mx-auto justify-center" width="500" height="220" style="box-shadow: none">
                            <img class="rounded-lg" :src="require(`@/assets/${image.url}`)" :alt="image.alt"
                                :width="image.width" style="margin-top: 10px; margin-bottom: 10px">
                            <div class="d-flex justify-space-between align-center flex-column my-5 ml-8">
                                <div class="px-8 py-4 bg-red-lighten-4 d-flex flex-column align-center"
                                    style="position: relative; margin-top: 10px; border-radius: 5px;">
                                    <img :src="require(`@/assets/${image.logoUrl}`)" :alt="image.logoAlt"
                                        style="position: absolute; top: -30px; width: 50px">
                                    <label class="mt-2" for="">{{ image.unit }}</label>
                                </div>
                                <div class="px-8 py-4 bg-red-lighten-4 d-flex flex-column align-center"
                                    style="position: relative; margin-top: 10px; border-radius: 5px;">
                                    <img :src="require(`@/assets/${image.logoUrl2}`)" :alt="image.logoAlt"
                                        style="position: absolute; top: -30px; width: 50px">
                                    <label class="mt-2" for="">{{ image.unit }}</label>
                                </div>
                            </div>
                        </v-card>
                        <v-card class="font-weight-bold border-0 my-1 text-center text-h6" width="500"
                            style="box-shadow: none" for="">{{ image.title }}</v-card>
                    </div>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>
  
<script setup>
const data = [
    {
        title: "Jumlah Peminjaman",
        imageSource: "user-bicycle.png",
    },
    {
        title: "Kendaraan Tersedia",
        imageSource: "available.png",
    },
    {
        title: "Kendaraan Diperbaiki",
        imageSource: "maintenance.png",
    },
];

const images = [
    {
        title: "Telkom University Landmark Tower",
        url: "tult.jpg",
        alt: "shelter_1",
        width: 300,
        logoUrl: "bicycle.png",
        logoUrl2: "scooter.png",
        logoAlt: "Logo 1",
        unit: "200 Unit",
    },
    {
        title: "Gedung Kuliah Umum / Gedung Tokong Nanas",
        url: "gku.jpg",
        alt: "shelter_2",
        width: 300,
        logoUrl: "bicycle.png",
        logoUrl2: "scooter.png",
        logoAlt: "Logo 2",
        unit: "200 Unit",
    },
    {
        title: "Open Library",
        url: "oplib.jpg",
        alt: "shelter 3",
        width: 300,
        logoUrl: "bicycle.png",
        logoUrl2: "scooter.png",
        logoAlt: "Logo 3",
        unit: "200 Unit",
    },
    {
        title: "Masjid Syamsul 'Ulum",
        url: "msu.jpg",
        alt: "shelter_4",
        width: 300,
        logoUrl: "bicycle.png",
        logoUrl2: "scooter.png",
        logoAlt: "Logo 4",
        unit: "200 Unit",
    },
];
</script>

<style scoped>
.my-custom-border {
    border: 1px solid #b71c1c;
}
</style>