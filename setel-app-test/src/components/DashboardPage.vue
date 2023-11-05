<template>
    <v-container>
        <h1 class="pl-5 my-auto display-1 font-weight-bold;">Welcome, Admin!</h1>
        <v-row class="justify-space-between pa-5" align="center">
            <v-col v-for="(item, index) in dataKendaraan" :key="index" cols="auto">
                <v-card class="mx-auto my-auto rounded-lg" color="red-darken-4" width="300" height="150"
                    style="box-shadow: none">
                    <div class="d-flex flex-no-wrap pa-2 justify-space-between">
                        <div>
                            <v-card-title class="text-h5 font-weight-bold text-center">{{ item.title }}</v-card-title>
                            <v-card-subtitle class="text-h6 font-weight-bold color-white">{{ item.amount
                            }}</v-card-subtitle>
                            <v-card-actions>
                                <v-btn class="ms-2 mt-4" variant="outlined" size="small"
                                    @click="openDialog(index)">DETAILS</v-btn>
                                <v-dialog v-model="dialog" width="auto">
                                    <v-card class="my-custom-border-details my-auto justify-center" width="350"
                                        height="240">
                                        <v-card-title class="my-auto text-h6" for="">{{ selectedItem.titleDetails
                                        }}</v-card-title>
                                        <v-sheet class="my-custom-border mx-auto my-auto justify-center rounded-lg"
                                            width="300" height="115">
                                            <div class="d-flex justify-center align-center mx-10 my-3">
                                                <v-icon align="center" icon="mdi-bicycle" size="30"></v-icon>
                                                <label class="mx-auto text-h6" for="">{{ selectedItem.unitSepeda }}</label>
                                            </div>
                                            <v-divider :thickness="1" class="border-opacity-100"
                                                color="red-darken-4"></v-divider>
                                            <div class="d-flex justify-center align-center mx-10 my-3">
                                                <v-icon align="center" icon="mdi-scooter" size="30"></v-icon>
                                                <label class="mx-auto text-h6" for="">{{ selectedItem.unitSkuter }}</label>
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
                            <v-img :src="require(`@/assets/${item.imageSource}`)" alt="Item Image" width="80"
                                height="80"></v-img>
                        </v-avatar>
                    </div>
                </v-card>
            </v-col>
        </v-row>

        <!-- Informasi Shelter -->
        <v-row class="px-5 my-auto justify-space-between" align="center">
            <v-col v-for="(image, index) in dataShelter" :key="index" cols="auto">
                <v-card class="my-custom-border d-flex justify-space-between" width="450" height="160"
                    style="box-shadow: none">
                    <div class="d-flex mx-auto flex-column justify-center">
                        <v-sheet class="d-flex mx-auto justify-center mt-4">
                            <v-img class="my-custom-border mx-3 my-auto rounded-lg"
                                :src="require(`@/assets/${image.shelter}`)" width="95" :alt="image.alt">
                            </v-img>
                            <v-sheet class="mx-3 my-auto justify-center bg-red-darken-4 rounded-lg" width="230" height="95">
                                <div class="d-flex justify-center align-center mx-7 my-3">
                                    <v-icon icon="mdi-bicycle"></v-icon>
                                    <label class="mx-auto" for="">{{ image.unit }}</label>
                                </div>
                                <v-divider class="justify-center border-opacity-100" :thickness="1"></v-divider>
                                <div class="d-flex justify-center align-center mx-7 my-3">
                                    <v-icon icon="mdi-scooter"></v-icon>
                                    <label class="mx-auto" for="">{{ image.unit }}</label>
                                </div>
                            </v-sheet>
                        </v-sheet>
                        <v-card-title class="font-weight-bold text-center text-red-darken-4 text-h6" width="500"
                            style="box-shadow: none" for="">{{ image.title }}</v-card-title>
                    </div>
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
        title: "Telkom University Landmark Tower",
        shelter: "tult.jpg",
        alt: "shelter_1",
        unit: "Tersedia 50 units",
    },
    {
        title: "Gedung Tokong Nanas",
        shelter: "gku.jpg",
        alt: "shelter_2",
        unit: "Tersedia 50 units",
    },
    {
        title: "Open Library",
        shelter: "oplib.jpg",
        alt: "shelter 3",
        unit: "Tersedia 50 units",
    },
    {
        title: "Masjid Syamsul 'Ulum",
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