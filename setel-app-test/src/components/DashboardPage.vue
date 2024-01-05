<template>
    <v-container>
        <h1 class="display-1 font-weight-bold">Welcome, Admin!</h1>
        <h2 class="mt-5 display-1 font-weight-bold" style="color: #b71c1c">
            Statistik Peminjaman Kendaraan
        </h2>
        <div class="text-center mt-5">
            <v-select v-model="month" :items="months" label="Month"></v-select>
            <v-menu :month="month">
            </v-menu>
        </div>
        <chart-peminjaman class="mt-3 mb-5" />
        <h2 class="mt-10 mb-3 display-1 font-weight-bold" style="color: #b71c1c">
            Informasi Data Terkini
        </h2>
        <v-row class="justify-space-between" align="center">
            <v-col v-for="(item, index) in dataKendaraan" :key="index">
                <v-card class="mx-auto my-auto rounded-lg" color="red-darken-4" style="box-shadow: none">
                    <v-sheet class="d-flex flex-no-wrap pa-2 justify-space-between bg-red-darken-4">
                        <div>
                            <v-card-title class="text-h5 font-weight-bold text-center">{{
                                item.title
                            }}</v-card-title>
                            <v-card-subtitle class="text-h6 font-weight-bold color-white">
                                {{ item.amount }} units
                            </v-card-subtitle>
                            <v-card-actions>
                                <v-btn class="ms-2 mt-3" variant="outlined" size="small"
                                    @click="openDialog(index)">DETAILS</v-btn>
                                <v-dialog v-model="dialog" width="auto">
                                    <v-card class="justify-center" width="380">
                                        <v-card-title class="text-h5" for="">{{
                                            selectedItem.titleDetails
                                        }}</v-card-title>
                                        <v-sheet class="my-custom-border mx-auto justify-center rounded-lg" width="320">
                                            <div class="d-flex justify-center align-center mx-10 my-3">
                                                <v-icon align="center" icon="mdi-bicycle" size="30"></v-icon>
                                                <label class="mx-auto text-h6">Sepeda {{ selectedItem.unitSepeda }}
                                                    units</label>
                                            </div>
                                            <v-divider :thickness="1" class="border-opacity-100"
                                                color="red-darken-4"></v-divider>
                                            <div class="d-flex justify-center align-center mx-10 my-3">
                                                <v-icon align="center" icon="mdi-scooter" size="30"></v-icon>
                                                <label class="mx-auto text-h6">Skuter {{ selectedItem.unitSkuter }}
                                                    units</label>
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
                                    <label class="text-center text-sm-body-1 font-weight-bold">Tersedia {{ image.unit.Sepeda
                                    }}
                                        units</label>
                                </v-card-items>
                                <v-divider class="justify-center border-opacity-100" :thickness="2"></v-divider>
                                <v-card-items class="h-50 d-flex flex-row justify-center align-center pa-5">
                                    <v-icon icon="mdi-scooter" size="x-large" class="mr-5"></v-icon>
                                    <label class="text-center text-sm-body-1 font-weight-bold">Tersedia {{ image.unit.Skuter
                                    }}
                                        units</label>
                                </v-card-items>
                            </v-card>
                        </v-col>
                    </v-row>

                    <v-card-title class="font-weight-bold text-center text-red-darken-4 text-h5" style="box-shadow: none"
                        for="">{{
                            image.title }}</v-card-title>
                    <v-card-text class="font-weight-bold text-center text-red-darken-4 text-h6" style="box-shadow: none"
                        for="">{{
                            image.title2 }}</v-card-text>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>
  
<script setup>
import axios from "axios";
import { onMounted, ref } from "vue";

const dialog = ref(false);
const selectedItem = ref(null);
const dataKendaraan = ref([]);
const dataShelter = ref([]);
const dataPeminjaman = ref([]);
const dataPeminjamanSepeda = ref([]);
const dataPeminjamanSkuter = ref([]);
const inventorySepedaAvailable = ref([]);
const inventorySkuterAvailable = ref([]);
const inventorySepedaUnavailable = ref([]);
const inventorySkuterUnavailable = ref([]);

const openDialog = (index) => {
    selectedItem.value = dataKendaraan.value[index];
    dialog.value = true;
};

const closeDialog = () => {
    dialog.value = false;
};

onMounted(async () => {
    try {
        const responseKendaraan = await axios.get(
            "http://localhost:3000/api/dataKendaraan"
        );
        dataKendaraan.value = responseKendaraan.data;

        const responseShelter = await axios.get(
            "http://localhost:3000/api/dataShelter"
        );
        dataShelter.value = responseShelter.data;

        const responsePeminjaman = await axios.get(
            "http://localhost:3000/api/report"
        );

        const responseInventory = await axios.get(
            "http://localhost:3000/api/kendaraan"
        );

        dataPeminjaman.value = responsePeminjaman.data;

        dataPeminjamanSepeda.value = responsePeminjaman.data.filter(
            (peminjaman) => peminjaman.jenisKendaraan === "Sepeda"
        );

        dataPeminjamanSkuter.value = responsePeminjaman.data.filter(
            (peminjaman) => peminjaman.jenisKendaraan === "Sekuter"
        );

        dataKendaraan.value[0].amount = responsePeminjaman.data.length;
        dataKendaraan.value[0].unitSkuter = dataPeminjamanSkuter.value.length;
        dataKendaraan.value[0].unitSepeda = dataPeminjamanSepeda.value.length;
        inventorySepedaAvailable.value = responseInventory.data.filter(
            (kendaraan) =>
                kendaraan.jenisKendaraan === "Sepeda" &&
                kendaraan.status === "Available"
        );

        inventorySkuterAvailable.value = responseInventory.data.filter(
            (kendaraan) =>
                kendaraan.jenisKendaraan === "Skuter" &&
                kendaraan.status === "Available"
        );

        dataKendaraan.value[1].amount =
            inventorySepedaAvailable.value.length +
            inventorySkuterAvailable.value.length;
        dataKendaraan.value[1].unitSepeda = inventorySepedaAvailable.value.length;
        dataKendaraan.value[1].unitSkuter = inventorySkuterAvailable.value.length;

        inventorySepedaUnavailable.value = responseInventory.data.filter(
            (kendaraan) =>
                kendaraan.jenisKendaraan === "Sepeda" &&
                kendaraan.status === "Unavailable"
        );

        inventorySkuterUnavailable.value = responseInventory.data.filter(
            (kendaraan) =>
                kendaraan.jenisKendaraan === "Skuter" &&
                kendaraan.status === "Unavailable"
        );

        dataKendaraan.value[2].amount =
            inventorySepedaUnavailable.value.length +
            inventorySkuterUnavailable.value.length;
        dataKendaraan.value[2].unitSepeda = inventorySepedaUnavailable.value.length;
        dataKendaraan.value[2].unitSkuter = inventorySkuterUnavailable.value.length;

        dataShelter.value[0].unit = {
            Sepeda: responseInventory.data.filter(
                (kendaraan) =>
                    kendaraan.jenisKendaraan === "Sepeda" &&
                    kendaraan.status === "Available" &&
                    kendaraan.shelter === "TULT"
            ).length,
            Skuter: responseInventory.data.filter(
                (kendaraan) =>
                    kendaraan.jenisKendaraan === "Skuter" &&
                    kendaraan.status === "Available" &&
                    kendaraan.shelter === "TULT"
            ).length,
        };

        dataShelter.value[1].unit = {
            Sepeda: responseInventory.data.filter(
                (kendaraan) =>
                    kendaraan.jenisKendaraan === "Sepeda" &&
                    kendaraan.status === "Available" &&
                    kendaraan.shelter === "GKU"
            ).length,
            Skuter: responseInventory.data.filter(
                (kendaraan) =>
                    kendaraan.jenisKendaraan === "Skuter" &&
                    kendaraan.status === "Available" &&
                    kendaraan.shelter === "GKU"
            ).length,
        };

        dataShelter.value[2].unit = {
            Sepeda: responseInventory.data.filter(
                (kendaraan) =>
                    kendaraan.jenisKendaraan === "Sepeda" &&
                    kendaraan.status === "Available" &&
                    kendaraan.shelter === "Open Library"
            ).length,
            Skuter: responseInventory.data.filter(
                (kendaraan) =>
                    kendaraan.jenisKendaraan === "Skuter" &&
                    kendaraan.status === "Available" &&
                    kendaraan.shelter === "Open Library"
            ).length,
        };

        dataShelter.value[3].unit = {
            Sepeda: responseInventory.data.filter(
                (kendaraan) =>
                    kendaraan.jenisKendaraan === "Sepeda" &&
                    kendaraan.status === "Available" &&
                    kendaraan.shelter === "MSU"
            ).length,
            Skuter: responseInventory.data.filter(
                (kendaraan) =>
                    kendaraan.jenisKendaraan === "Skuter" &&
                    kendaraan.status === "Available" &&
                    kendaraan.shelter === "MSU"
            ).length,
        };
    } catch (err) {
        console.error("Error fetching data:", err);
    }
});
</script>

<script>
import ChartPeminjaman from "@/components/ChartPeminjaman.vue";

export default {
    components: {
        ChartPeminjaman,
    },
    data: () => ({
        months: [
            'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember'
        ],
        month: [
            'Select a month',
        ]
    }),
}
</script>

<style>.my-custom-border {
    border: 1px solid #b71c1c;
}</style>