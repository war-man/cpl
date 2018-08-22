﻿var LotteryHistoryViewComponent = {
    historyDataTable: null,
    init: function () {
        LotteryHistoryViewComponent.historyDataTable = LotteryHistoryViewComponent.loadLotteryHistoryDataTable();
    },
    resizeOnMobile: function () {
        if ($(window).width() < 767 && $("#lottery-history-view-component .card-header").length > 0) {
            $('#lottery-history-view-component .card-content').removeClass('show');
            $('#lottery-history-view-component .card-header i').removeClass('ft-minus');
            $('#lottery-history-view-component .card-header i').addClass('ft-plus');
        } else {
            $('#lottery-history-view-component .card-content').addClass('show');
            $('#lottery-history-view-component .card-header i').removeClass('ft-plus');
            $('#lottery-history-view-component .card-header i').addClass('ft-minus');
        }
    },
    loadLotteryHistoryDataTable: function () {
        if ($("#lottery-history-view-component").hasClass("d-none"))
            return false;
        var _this = this;
        return $("#dt-lottery-history").DataTable({
            "processing": true,
            "serverSide": true,
            "autoWidth": false,
            "ajax": {
                url: "/History/SearchLotteryHistory",
                type: 'POST',
                data: {
                    lotteryId: $("#lottery-history-view-component #LotteryId").val(),
                    createdDate: $("#lottery-history-view-component #CreatedDate").val(),
                    sysUserId: $("#lottery-history-view-component #SysUserId").val()
                }
            },
            "language": DTLang.getLang(),
            "columns": [
                {
                    "data": "CreatedDate",
                    "render": function (data, type, full, meta) {
                        return full.createdDateInString;
                    }
                },
                {
                    "data": "LotteryPhase",
                    "render": function (data, type, full, meta) {
                        return full.lotteryPhaseInString;
                    }
                },
                {
                    "data": "LotteryStartDate",
                    "render": function (data, type, full, meta) {
                        return full.lotteryStartDateInString;
                    }
                },
                {
                    "data": "TicketNumber",
                    "render": function (data, type, full, meta) {
                        return full.ticketNumber;
                    }
                },
                {
                    "data": "Result",
                    "render": function (data, type, full, meta) {
                        if (full.result == "Win")
                            return "<div class='badge badge-success'>Win</div>";
                        else if (full.result == "Lose")
                            return "<div class='badge badge-danger'>Lose</div>";
                        else if (full.result == "KYC Pending")
                            return "<div class='badge badge-info'>KYC Pending</div>";
                        else
                            return "";
                    }
                },
                {
                    "data": "Award",
                    "render": function (data, type, full, meta) {
                        return full.awardInString;
                    }
                },
                {
                    "data": "UpdatedDateInString",
                    "render": function (data, type, full, meta) {
                        return full.updatedDateInString;
                    }
                },
            ],
        });
    },
};

$(document).ready(function () {
    LotteryHistoryViewComponent.init();
});

$(window).bind('resize load', function () {
    LotteryHistoryViewComponent.resizeOnMobile();
});