<template>
    <div>
        <canvas ref="myChart"></canvas>
    </div>
</template>

<script>
import axios from "axios";
import Chart from "chart.js/auto";

export default {
    data() {
        return {
            peminjamanData: [],
        };
    },
    mounted() {
        this.getDataFromAPI();
    },
    methods: {
        async getDataFromAPI() {
            try {
                const response = await axios.get("http://localhost:3000/api/report");
                this.peminjamanData = response.data;
                this.generateChart();
            } catch (error) {
                console.error("Error fetching data:", error);
            }
        },
        generateChart() {
            const sepedaCount = this.peminjamanData.filter(
                (item) => item.jenisKendaraan === "Sepeda"
            ).length;

            const skuterCount = this.peminjamanData.filter(
                (item) => item.jenisKendaraan === "Sekuter"
            ).length;

            const ctx = this.$refs.myChart.getContext("2d");
            new Chart(ctx, {
                type: "bar",
                data: {
                    labels: ["Kendaraan"],
                    datasets: [
                        {
                            label: "Sepeda",
                            data: [sepedaCount],
                            backgroundColor: "rgba(183,	28,	28)",
                            borderWidth: 1,
                        },
                        {
                            label: "Skuter",
                            data: [skuterCount],
                            backgroundColor: "rgba(66, 66, 66)",
                            borderWidth: 1,
                        },
                    ],
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 10,
                            precision: 0,
                        },
                    },
                },
            });
        },
    },
};
</script>