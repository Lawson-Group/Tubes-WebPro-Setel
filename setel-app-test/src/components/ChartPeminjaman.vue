<template>
    <div>
        <v-select v-model="selectedMonth" :items="months" label="Select Month" @change="updateChartData"></v-select>
        <Bar :data="chartData" />
    </div>
</template>
    
<script>
import {
BarElement,
CategoryScale,
Chart as ChartJS,
Legend,
LinearScale,
Title,
Tooltip,
} from "chart.js";
import { Bar } from "vue-chartjs";

ChartJS.register(
    Title,
    Tooltip,
    Legend,
    BarElement,
    CategoryScale,
    LinearScale
);

export default {
    name: "ChartPeminjaman",
    components: { Bar },
    data() {
        return {
            selectedMonth: "January",
            months: [
                "January",
                "February",
                "March",
                "April",
                "May",
                "June",
                "July",
                "August",
                "September",
                "October",
                "November",
                "December",
            ],
            chartData: {
                labels: ["Week 1", "Week 2", "Week 3", "Week 4"],
                datasets: [
                    {
                        label: "Sepeda",
                        backgroundColor: "#B71C1C",
                        data: this.generateRandomData(),
                    },
                    {
                        label: "Skuter",
                        backgroundColor: "#424242",
                        data: this.generateRandomData(),
                    },
                ],
            },
        };
    },
    methods: {
        generateRandomData() {
            return [
                Math.random() * 30,
                Math.random() * 30,
                Math.random() * 30,
                Math.random() * 30,
            ];
        },
        updateChartData() {
            // Call generateRandomData to get new random data
            const newData = {
                labels: ["Week 1", "Week 2", "Week 3", "Week 4"],
                datasets: [
                    {
                        label: "Sepeda",
                        backgroundColor: "#B71C1C",
                        data: this.generateRandomData(),
                    },
                    {
                        label: "Skuter",
                        backgroundColor: "#424242",
                        data: this.generateRandomData(),
                    },
                ],
            };

            // Update chartData
            this.chartData = newData;
        },
    },
};
</script>