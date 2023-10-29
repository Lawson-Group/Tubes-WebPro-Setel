<template>
    <v-card
      style="height: 100vh; width: 100%; color: #A32929;"
      title="REPORTS"
      align="center"
    >
      <v-data-table-virtual
        :headers="headers"
        :items="report"
        fixed-header
        class="elevation-1;"
        style="height: 100%;"
        item-value="name">
      </v-data-table-virtual>
    </v-card>
  </template>
  
<script>
  export default {
    data: () => ({
      headers: [
        {
          title: 'ID Peminjaman',
          align: 'start',
          sortable: false,
          key: 'idPeminjaman',
        },
        { title: 'Username', align: 'end', key: 'username'},
        { title: 'Tanggal & Waktu', align: 'end', key: 'tanggalWaktu' },
        { title: 'Nomor Unit', align: 'end', key: 'nomorUnit' },
        { title: 'Jenis Kendaraan', align: 'end', key: 'jenisKendaraan' },
      ],
      reports: [
        {
          idPeminjaman: '',
          username: 'aishueo',
          tanggalWaktu: '2023-10-26 15:45:30',
          nomorUnit: 'A001',
          jenisKendaraan: 'Sepeda',
        },
        {
          idPeminjaman: '',
          username: 'jenarikha',
          tanggalWaktu: '2023-11-26 15:45:30',
          nomorUnit: 'A002',
          jenisKendaraan: 'Sepeda',
        },
        {
          idPeminjaman: '',
          username: 'jannatinurrohmah',
          tanggalWaktu: '2023-12-26 11:45:30',
          nomorUnit: 'A003',
          jenisKendaraan: 'Sepeda',
        },
        {
          idPeminjaman: '',
          username: 'novitasabila',
          tanggalWaktu: '2023-13-26 10:45:30',
          nomorUnit: 'A004',
          jenisKendaraan: 'Sepeda',
        },
        {
          idPeminjaman: '',
          username: 'trianimumpuni',
          tanggalWaktu: '2023-15-26 09:45:30',
          nomorUnit: 'A005',
          jenisKendaraan: 'Sepeda',
        },
        {
          idPeminjaman: '',
          username: 'arlecchino',
          tanggalWaktu: '2023-20-26 15:45:30',
          nomorUnit: 'B001',
          jenisKendaraan: 'Sekuter',
        },
        {
          idPeminjaman: '',
          username: 'argenti',
          tanggalWaktu: '2023-21-26 15:50:30',
          nomorUnit: 'B002',
          jenisKendaraan: 'Sekuter',
        },
        {
          idPeminjaman: '',
          username: 'archivistenoe',
          tanggalWaktu: '2023-21-26 14:50:30',
          nomorUnit: 'B003',
          jenisKendaraan: 'Sekuter',
        },
        {
          idPeminjaman: '',
          username: 'uchinagaeri',
          tanggalWaktu: '2023-22-26 18:50:30',
          nomorUnit: 'B004',
          jenisKendaraan: 'Sekuter',
        },
        {
          idPeminjaman: '',
          username: 'notningning',
          tanggalWaktu: '2023-25-26 15:50:30',
          nomorUnit: 'B005',
          jenisKendaraan: 'Sekuter',
        },
      ],
    }),
    computed: {
      report () {
        return [...Array(50).keys()].map(i => {
          const setel = { ...this.reports[i % 10] }
          setel.idPeminjaman = `${setel.idPeminjaman} ${i+1}`

          return setel
        })
      },
    },
  }
</script>