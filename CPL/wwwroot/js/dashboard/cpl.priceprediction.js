﻿var PricePrediction = {
    init: function () {
        PricePrediction.bindLoadPredictionResult();
        PricePrediction.loadBTCPriceChart();
    },
    bindLoadPredictionResult: function () {
        var progressConnection = new signalR.HubConnection("/predictedUserProgress");
        progressConnection
            .start()
            .catch(() => {
                console.log("Error while establishing connection");
            });

        progressConnection.on("predictedUserProgress", (up, down) => {
            if (up !== undefined && down !== undefined) 
                this.setUserProgress(up, down);
        });
    },
    setUserProgress: function (up, down) {
        $("#up-bar").css({ "width": up + "%" })
            .attr("aria-valuenow", up)
            .html("<i class='fas fa-arrow-up'></i>" + up + "%");
        $("#down-bar").css({ "width": down + "%" })
            .attr("aria-valuenow", down)
            .html("<i class='fas fa-arrow-down'></i>" + down + "%");
    },
    loadBTCPriceChart: function () {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });

        var btcPriceChart = Highcharts.chart('btc-price-chart', {
            chart: {
                type: 'area',
                zoomType: 'x',
                panning: true,
                panKey: 'shift',
                events: {
                    load: function () {
                        // set up the updating of the chart each second
                        var series = this.series[0];
                        setInterval(function () {
                            var x = (new Date()).getTime(), // current time
                                y = Math.random();
                            series.addPoint([x, y], true, true);
                        }, 1000);
                    }
                }
            },
            plotOptions: {
                area: {
                    marker: {
                        enabled: false,
                    }
                },
                series: {
                    shadow: false,
                    lineWidth: 0.01,
                    turboThreshold: 50000
                }
            },
            title: {
                text: 'Live BTC/USD rate'
            },
            xAxis: {
                type: 'datetime',
                tickPixelInterval: 150
            },
            yAxis: {
                title: {
                    text: 'Price'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                enable: false
            },
            legend: {
                enabled: false
            },
            exporting: {
                enabled: false
            },
            series: [{
                name: 'BTC/USD rate',
                fillOpacity: 0.5,
                states: { hover: { enabled: false } },
                dataGrouping: { enabled: false },
                data: (function () {
                    // generate an array of random data
                    var data = [],
                        time = (new Date()).getTime(),
                        i;

                    for (i = -43200; i <= 0; i += 1) {
                        data.push({
                            x: time + i * 1000,
                            y: Math.random() + 3
                        });
                    }

                    for (i = 0; i <= 3600; i += 1) {
                        data.push({
                            x: time + i * 1000,
                            y: 0
                        });
                    }
                    return data;
                }())
            }]
        });
    }
}

$(document).ready(function () {
    PricePrediction.init();
});