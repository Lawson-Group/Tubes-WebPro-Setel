<template>
    <v-container>
        <h1 class="mb-5" style="font-size: 40px; font-weight: bold;">Welcome, Admin!</h1>
        <v-row class="mt-10" align="" justify="space-between">
            <v-col v-for="(item, index) in data" :key="index" cols="auto">
                <v-card class="mx-5 my-custom-background" width="300" height="150">
                    <v-card-item>
                        <div class="">
                            <div class="text-overline mb-1 text-center">
                                <span style="font-size: 18px; font-weight: bold;">{{ item.title }}</span>
                            </div>
                            <div class="w-100 align-center d-flex justify-space-between px-6">
                                <div class="">
                                    foto
                                </div>
                                <div class="">
                                    <div class="bg-white pa-2">
                                        <h2 class="text-center">123 <br> UNIT</h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </v-card-item>
                </v-card>
            </v-col>
        </v-row>

        <!-- Tambahkan dua kotak di bawah tiga kotak yang sudah ada -->
        <v-row align="center" justify="space-between" class="mt-10">
            <v-col cols="auto">
                <v-card class="mx-5 my-custom-border d-flex justify-center" width="500" height="180">
                    <img src="" alt="shelter" style="" class="bg-amber-accent-1 my-6 mr-3" width="280">
                    <div class="d-flex justify-space-between align-center flex-column my-6 ml-3">
                        <div class="px-8 py-4 bg-blue d-flex flex-column align-center" style="position: relative">
                            <label class="text-brown" style="position: absolute; margin-top: -30px" for="">logo</label>
                            <label class="" for="">200 Unit</label>
                        </div>
                        <div class="px-8 py-4 bg-blue d-flex flex-column align-center " style="position: relative">
                            <label class="text-brown" style="position: absolute; margin-top: -30px" for="">logo</label>
                            <label class="" for="">200 Unit</label>
                        </div>
                    </div>
                </v-card>
            </v-col>
            <v-col cols="auto">
                <v-card class="mx-5 my-custom-border d-flex justify-center" width="500" height="180">
                    <img src="" alt="shelter" style="" class="bg-amber-accent-1 my-6 mr-3" width="280">
                    <div class="d-flex justify-space-between align-center flex-column my-6 ml-3">
                        <div class="px-8 py-4 bg-blue d-flex flex-column align-center" style="position: relative">
                            <label class="text-brown" style="position: absolute; margin-top: -30px" for="">logo</label>
                            <label class="" for="">200 Unit</label>
                        </div>
                        <div class="px-8 py-4 bg-blue d-flex flex-column align-center " style="position: relative">
                            <label class="text-brown" style="position: absolute; margin-top: -30px" for="">logo</label>
                            <label class="" for="">200 Unit</label>
                        </div>
                    </div>
                </v-card>
            </v-col>
        </v-row>
        <!-- Tambahkan dua kotak di bawah tiga kotak yang sudah ada -->
        <v-row align="center" justify="space-between" class="mt-10">
            <v-col cols="auto">
                <v-card class="mx-5 my-custom-border d-flex justify-center" width="500" height="180">
                    <img src="" alt="shelter" style="" class="bg-amber-accent-1 my-6 mr-3" width="280">
                    <div class="d-flex justify-space-between align-center flex-column my-6 ml-3">
                        <div class="px-8 py-4 bg-blue d-flex flex-column align-center" style="position: relative">
                            <label class="text-brown" style="position: absolute; margin-top: -30px" for="">logo</label>
                            <label class="" for="">200 Unit</label>
                        </div>
                        <div class="px-8 py-4 bg-blue d-flex flex-column align-center " style="position: relative">
                            <label class="text-brown" style="position: absolute; margin-top: -30px" for="">logo</label>
                            <label class="" for="">200 Unit</label>
                        </div>
                    </div>
                </v-card>
            </v-col>
            <v-col cols="auto">
                <v-card class="mx-5 my-custom-border d-flex justify-center" width="500" height="180">
                    <img src="" alt="shelter" style="" class="bg-amber-accent-1 my-6 mr-3" width="280">
                    <div class="d-flex justify-space-between align-center flex-column my-6 ml-3">
                        <div class="px-8 py-4 bg-blue d-flex flex-column align-center" style="position: relative">
                            <label class="text-brown" style="position: absolute; margin-top: -30px" for="">logo</label>
                            <label class="" for="">200 Unit</label>
                        </div>
                        <div class="px-8 py-4 bg-blue d-flex flex-column align-center " style="position: relative">
                            <label class="text-brown" style="position: absolute; margin-top: -30px" for="">logo</label>
                            <label class="" for="">200 Unit</label>
                        </div>
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
        // value: "100", // Ganti dengan data yang sesuai
    },
    {
        title: "Kendaraan Tersedia",
        // value: "50", // Ganti dengan data yang sesuai
    },
    {
        title: "Kendaraan Diperbaiki",
        // value: "10", // Ganti dengan data yang sesuai
    }
];
</script>
  
<style scoped>
.my-custom-background {
    background-color: #EF9A9A;
}

.my-custom-border {
    border: 1px solid #B71C1C;
}

.text-h4 {
    font-size: 20px;
    font-weight: bold;
}
</style>
  