<template>
    <v-container>
        <h1 class="display-1 font-weight-bold">Welcome, Admin!</h1>
        <h2 class="mt-5 display-1 font-weight-bold" style="color: #B71C1C">Statistik Peminjaman Kendaraan</h2>
        <chart-peminjaman class="mt-3 mb-5" />
        <h2 class="mt-10 mb-3 display-1 font-weight-bold" style="color: #B71C1C">Informasi Data Terkini</h2>
        <v-row class="justify-space-between" align="center">
            <v-col v-for="(item, index) in dataKendaraan" :key="index">
                <v-card class="mx-auto my-auto rounded-lg" color="red-darken-4" style="box-shadow: none">
                    <v-sheet class="d-flex flex-no-wrap pa-2 justify-space-between bg-red-darken-4">
                        <div>
                            <v-card-title class="text-h5 font-weight-bold text-center">{{ item.title }}</v-card-title>
                            <v-card-subtitle class="text-h6 font-weight-bold color-white">{{ item.amount
                            }}</v-card-subtitle>
                            <v-card-actions>
                                <v-btn class="ms-2 mt-3" variant="outlined" size="small"
                                    @click="openDialog(index)">DETAILS</v-btn>
                                <v-dialog v-model="dialog" width="auto">
                                    <v-card class="justify-center" width="380">
                                        <v-card-title class="text-h5" for="">{{ selectedItem.titleDetails
                                        }}</v-card-title>
                                        <v-sheet class="my-custom-border mx-auto justify-center rounded-lg" width="320">
                                            <div class="d-flex justify-center align-center mx-10 my-3">
                                                <v-icon align="center" icon="mdi-bicycle" size="30"></v-icon>
                                                <label class="mx-auto text-h6">{{ selectedItem.unitSepeda }}</label>
                                            </div>
                                            <v-divider :thickness="1" class="border-opacity-100"
                                                color="red-darken-4"></v-divider>
                                            <div class="d-flex justify-center align-center mx-10 my-3">
                                                <v-icon align="center" icon="mdi-scooter" size="30"></v-icon>
                                                <label class="mx-auto text-h6">{{ selectedItem.unitSkuter }}</label>
                                            </div>
                                        </v-sheet>
                                        <v-card-actions>
                                            <v-btn block @click="closeDialog" color="red-darken-4">Close</v-btn>
                                        </v-card-actions>
                                    </v-card>
                                </v-dialog>
                            </v-card-actions>
                        </div>
                        <v-avatar class="my-auto" size="125" rounded="0">
                            <v-img :src="require(`@/assets/${item.imageSource}`)" alt="Item Image" width="100"
                                height="100"></v-img>
                        </v-avatar>
                    </v-sheet>
                </v-card>
            </v-col>
        </v-row>

        <!-- Informasi Shelter -->
        <!-- <h2 class="pl-5 display-1 font-weight-bold" style="color: #B71C1C">Shelter Setel</h2> -->
        <v-row class="my-3 justify-space-between" align="center">
            <v-col v-for="(image, index) in dataShelter" :key="index" :cols="12" :sm="12" :md="6">
                <v-card class="my-custom-border py-2" style="box-shadow: none">
                    <v-row class="px-5 py-3">
                        <v-col cols="6" class="my-auto">
                            <v-sheet class="d-flex">
                                <v-img class="my-custom-border rounded-lg" :src="require(`@/assets/${image.shelter}`)"
                                    :alt="image.alt"></v-img>
                            </v-sheet>
                        </v-col>
                        <v-col cols="6" class="d-flex flex-column">
                            <v-card class="h-100 bg-red-darken-4">
                                <v-card-items class="h-50 d-flex flex-row justify-center align-center pa-5">
                                    <v-icon icon="mdi-bicycle" size="x-large" class="mr-5"></v-icon>
                                    <label class="text-center text-sm-body-1 font-weight-bold">{{ image.unit }}</label>
                                </v-card-items>
                                <v-divider class="justify-center border-opacity-100" :thickness="2"></v-divider>
                                <v-card-items class="h-50 d-flex flex-row justify-center align-center pa-5">
                                    <v-icon icon="mdi-scooter" size="x-large" class="mr-5"></v-icon>
                                    <label class="text-center text-sm-body-1 font-weight-bold">{{ image.unit }}</label>
                                </v-card-items>
                            </v-card>
                        </v-col>
                    </v-row>

                    <v-card-title class="font-weight-bold text-center text-red-darken-4 text-h5" style="box-shadow: none"
                        for="">{{ image.title }}</v-card-title>
                    <v-card-text class="font-weight-bold text-center text-red-darken-4 text-h6" style="box-shadow: none"
                        for="">{{ image.title2 }}</v-card-text>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>

<script setup>
import { ref } from 'vue';

const dialog = ref(false);
const selectedItem = ref(null);

const dataKendaraan = [
    {
        title: "Peminjaman",
        amount: "200 units",
        titleDetails: "Jumlah Peminjaman Kendaraan",
        unitSepeda: "Sepeda 100 units",
        unitSkuter: "Skuter 100 units",
        imageSource: "ride-dbp.png",
    },
    {
        title: "Kendaraan",
        amount: "400 units",
        titleDetails: "Jumlah Kendaraan Tersedia",
        unitSepeda: "Sepeda 200 units",
        unitSkuter: "Skuter 200 units",
        imageSource: "vehicle-dbp.png",
    },
    {
        title: "Maintenance",
        amount: "20 units",
        titleDetails: "Jumlah Kendaraan Diperbaiki",
        unitSepeda: "Sepeda 10 units",
        unitSkuter: "Skuter 10 units",
        imageSource: "maintenance-dbp.png",
    },
];

const openDialog = (index) => {
    selectedItem.value = dataKendaraan[index];
    dialog.value = true;
};

const closeDialog = () => {
    dialog.value = false;
};

const dataShelter = [
    {
        title: "Shelter TULT",
        title2: "Gedung Telkom University Landmark Tower",
        shelter: "tult.jpg",
        alt: "shelter_1",
        unit: "Tersedia 50 units",
    },
    {
        title: "Shelter GKU",
        title2: "Gedung Tokong Nanas",
        shelter: "gku.jpg",
        alt: "shelter_2",
        unit: "Tersedia 50 units",
    },
    {
        title: "Shelter Oplib",
        title2: "Gedung Open Library",
        shelter: "oplib.jpg",
        alt: "shelter 3",
        unit: "Tersedia 50 units",
    },
    {
        title: "Shelter MSU",
        title2: "Masjid Syamsul 'Ulum",
        shelter: "msu.jpg",
        alt: "shelter_4",
        unit: "Tersedia 50 units",
    },
];
</script>

<style>
.my-custom-border {
    border: 1px solid #B71C1C;
}
</style>

<script>
import ChartPeminjaman from "./ChartPeminjaman.vue";

export default {
    components: {
        ChartPeminjaman,
    },
};
</script>