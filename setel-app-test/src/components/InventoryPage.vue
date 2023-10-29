<template>
    <v-container>
        <v-container-title style="font-weight: bold; align: center;">Inventory Kendaraan</v-container-title>
        <v-btn color="#B11116" fab dark right @click="showAddModal" style="position: fixed; top: 10px; right: 10px;">
            + Add Data
        </v-btn>
        
        <v-table fixed-header style="padding-top: 15px;">
            <thead>
                <tr class="text-center">
                    <th>Nomor Unit</th>
                    <th>Jenis Kendaraan</th>
                    <th>Status</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item, index) in items" :key="index">
                    <td>{{ item.nomorUnit }}</td>
                    <td>{{ item.jenisKendaraan }}</td>
                    <td>{{ item.status }}</td>
                    <td>
                        <button @click="editItem(index)" style="padding-right: 10%;">
                            <v-icon>mdi-pencil</v-icon>
                        </button>
                        <button @click="confirmDelete(index)">
                            <v-icon>mdi-delete</v-icon>
                        </button>
                    </td>
                </tr>
            </tbody>
        </v-table>

        <v-dialog v-model="showAdd" max-width="500">
            <v-card>
                <v-card-title>Enter New Data</v-card-title>
                <v-card-text>
                    <v-text-field v-model="newItem.nomorUnit" label="Nomor Unit"></v-text-field>
                    <v-select v-model="newItem.jenisKendaraan" :items="['Sepeda', 'Skuter']" label="Jenis Kendaraan"></v-select>
                    <v-select v-model="newItem.status" :items="['Available', 'Unavailable']" label="Status"></v-select>
                </v-card-text>
                <v-card-actions>
                    <v-btn @click="addItem" color="primary">Simpan</v-btn>
                    <v-btn @click="showAdd = false" color="error">Batal</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        
        <v-dialog v-model="showEdit" max-width="500">
            <v-card>
                <v-card-title>
                    Edit Data
                </v-card-title>
                <v-card-text>
                    <v-text-field v-model="editItemData.nomorUnit" label="Nomor Unit"></v-text-field>
                    <v-select v-model="editItemData.jenisKendaraan" :items="['Sepeda', 'Skuter']" label="Jenis Kendaraan"></v-select>
                    <v-select v-model="editItemData.status" :items="['Available', 'Unavailable']" label="Status"></v-select>
                </v-card-text>
                <v-card-actions>
                    <v-btn @click="saveEdit" color="primary">Simpan Perubahan</v-btn>
                    <v-btn @click="showEdit = false" color="error">Batal</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>

        <v-dialog v-model="showDelete" class="d-flex align-center">
            <v-card width="500px" class="mx-auto">
                <v-card-title>
                    Konfirmasi Hapus Data
                </v-card-title>
                <v-card-text>
                    Apakah Anda yakin ingin menghapus data ini?
                </v-card-text>
                <v-card-actions>
                    <v-btn @click="deleteItem" color="error">Ya</v-btn>
                    <v-btn @click="cancelDelete" color="primary">Tidak</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-container>
</template>

<script>
    export default {
        data() {
            return {
                items: [
                { nomorUnit: '001', jenisKendaraan: 'Sepeda', status: 'Available' },
                { nomorUnit: '002', jenisKendaraan: 'Skuter', status: 'Unavailable' }
            ],
            showAdd: false,
            showEdit: false,
            showDelete: false,
            newItem: {
                nomorUnit: '',
                jenisKendaraan: 'Sepeda',
                status: 'Available'
            },
            editItemIndex: -1,
            editItemData: {
                nomorUnit: '',
                jenisKendaraan: 'Sepeda',
                status: 'Available'
            },
            deleteItemIndex: -1
            }
        },
        methods: {
            showAddModal() {
                this.showAdd = true;
            },
            addItem() {
                this.items.push({ ...this.newItem });
                this.showAdd = false;
            },
            editItem(index) {
                this.editItemIndex = index;
                this.editItemData = { ...this.items[index] };
                this.showEdit = true;
            },
            saveEdit() {
                this.items[this.editItemIndex] = { ...this.editItemData };
                this.showEdit = false;
            },
            confirmDelete(index) {
                this.deleteItemIndex = index;
                this.showDelete = true;
            },
            deleteItem() {
                this.items.splice(this.deleteItemIndex, 1);
                this.showDelete = false;
            },
            cancelDelete() {
                this.showDelete = false;
            }
        }
    }
</script>