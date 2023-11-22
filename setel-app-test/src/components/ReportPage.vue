<template>
  <v-container>
        <h1 class="mb-5 display-1 font-weight-bold;">Report</h1>
        
        <v-row align="center" justify="center">
            <v-text-field
                v-model="search"
                label="Search..."
                @input="searchItems"
                solo-inverted
                class="mx-4"
                prepend-icon="mdi-magnify"
            >
            </v-text-field>
        </v-row>
        <v-data-table
            :headers="headers"
            :items="items"
            :search="search"
            :loading="loading"
            :pagination="pagination"
            :items-per-page="itemsPerPage"
            hide-default-footer
        >
        <template v-slot:item="{ item }">
            <tr class="text-center">
                <td>{{ item.idPeminjaman }}</td>
                <td>{{ item.username }}</td>
                <td>{{ item.tanggalWaktu }}</td>
                <td>{{ item.nomorUnit }}</td>
                <td>{{ item.jenisKendaraan }}</td>
            </tr>
        </template>
        </v-data-table>
  </v-container>
</template>
  
<script>
  export default {
    data() {
      return {
          items: [
          {
            idPeminjaman: 1,
            username: 'aishueo',
            tanggalWaktu: '2023-10-26 15:45:30',
            nomorUnit: 'A001',
            jenisKendaraan: 'Sepeda',
          },
          {
            idPeminjaman: 2,
            username: 'jenarikha',
            tanggalWaktu: '2023-11-26 15:45:30',
            nomorUnit: 'A002',
            jenisKendaraan: 'Sepeda',
          },
          {
            idPeminjaman: 3,
            username: 'jannatinurrohmah',
            tanggalWaktu: '2023-12-26 11:45:30',
            nomorUnit: 'A003',
            jenisKendaraan: 'Sepeda',
          },
          {
            idPeminjaman: 4,
            username: 'novitasabila',
            tanggalWaktu: '2023-13-26 10:45:30',
            nomorUnit: 'A004',
            jenisKendaraan: 'Sepeda',
          },
          {
            idPeminjaman: 5,
            username: 'trianimumpuni',
            tanggalWaktu: '2023-15-26 09:45:30',
            nomorUnit: 'A005',
            jenisKendaraan: 'Sepeda',
          },
          {
            idPeminjaman: 6,
            username: 'arlecchino',
            tanggalWaktu: '2023-20-26 15:45:30',
            nomorUnit: 'B001',
            jenisKendaraan: 'Sekuter',
          },
          {
            idPeminjaman: 7,
            username: 'argenti',
            tanggalWaktu: '2023-21-26 15:50:30',
            nomorUnit: 'B002',
            jenisKendaraan: 'Sekuter',
          },
          {
            idPeminjaman: 8,
            username: 'archivistenoe',
            tanggalWaktu: '2023-21-26 14:50:30',
            nomorUnit: 'B003',
            jenisKendaraan: 'Sekuter',
          },
          {
            idPeminjaman: 9,
            username: 'uchinagaeri',
            tanggalWaktu: '2023-22-26 18:50:30',
            nomorUnit: 'B004',
            jenisKendaraan: 'Sekuter',
          },
          {
            idPeminjaman: 10,
            username: 'notningning',
            tanggalWaktu: '2023-25-26 15:50:30',
            nomorUnit: 'B005',
            jenisKendaraan: 'Sekuter',
          }
      ],
      headers: [
          { title: 'ID Peminjaman', key: 'idPeminjaman', align: 'center' },
          { title: 'Username', key: 'username', align: 'center'},
          { title: 'Tanggal&Waktu', key: 'tanggalWaktu', align: 'center' },
          { title: 'Nomor Unit', key: 'nomorUnit', align: 'center' },
          { title: 'Jenis Kendaraan', key: 'jenisKendaraan', align: 'center' }
      ],
      search: '',
      loading: false,
      pagination: {
          page: 1,
          rowsPerPage: 5,
      },
      itemsPerPage: 5,
    };
  },
};
</script>