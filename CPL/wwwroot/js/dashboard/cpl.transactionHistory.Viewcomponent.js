﻿var TransactionHistory = {
    historyDatatable: null,
    init: function () {
        TransactionHistory.historyDatatable = TransactionHistory.loadLotteryHistoryTable();
    },
    loadLotteryHistoryTable: function () {
        return $("#dt-transaction-history").DataTable({
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": {
                url: "/History/SearchTransactionHistory",
                type: 'POST'
            },
            "language": DTLang.getLang(),
            "columns": [
                {
                    "data": "CreatedDate",
                    "render": function (data, type, full, meta) {
                        return full.createdDateInString;
                    },
                    "className": "text-center",
                },
                {
                    "data": "ToWalletAddress",
                    "render": function (data, type, full, meta) {
                        return full.toWalletAddress;
                    },
                    "orderable": false
                },
                {
                    "data": "CoinAmount",
                    "render": function (data, type, full, meta) {
                        return full.coinAmountInString;
                    },
                    "className": "text-center",
                },
                {
                    "data": "CurrencyInString",
                    "render": function (data, type, full, meta) {
                        return full.currencyInString;
                    },
                    "className": "text-center",
                },
                {
                    "data": "TypeInString",
                    "render": function (data, type, full, meta) {
                        return full.typeInString;
                    },
                    "className": "text-center",
                },
                {
                    "data": "StatusInString",
                    "render": function (data, type, full, meta) {
                        if (full.statusInString == "PENDING")
                            return "<div class='badge badge-info w-100'>Pending</div>";
                        else if (full.statusInString == "FAIL")
                            return "<div class='badge badge-danger w-100'>Fail</div>";
                        else if (full.statusInString == "SUCCESS")
                            return "<div class='badge badge-success w-100'>Success</div>";
                        else
                            return "";
                    },
                    "className": "text-center",
                },
                {
                    "data": "Action",
                    "render": function (data, type, full, meta) {
                        return "<a style='line-height:12px;' href='/History/TransactionDetail/" + full.id + "' target='_blank'  data-id='" + full.id + "' class='btn btn-sm btn-info btn-view'>View</a>";
                    },
                    "orderable": false
                }
            ],
        });
    },
};

$(document).ready(function () {
    TransactionHistory.init();
});