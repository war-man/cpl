﻿var KYC = {
    init: function () {
        KYC.bindDoEdit();
    },
    bindDoEdit: function () {
        $("#btn-do-edit-kyc").on("click", function () {
            var isFormValid = $('#form-edit-kyc')[0].checkValidity();
            $("#form-edit-kyc").addClass('was-validated');

            if (isFormValid) {
                var formData = new FormData();
                var fsFileUpload = $("#FrontSideImage").get(0);
                if (fsFileUpload !== undefined && fsFileUpload.files.length > 0) {
                    formData.append('FrontSideImage', fsFileUpload.files[0]);
                }
                var bsFileUpload = $("#BackSideImage").get(0);
                if (bsFileUpload !== undefined && bsFileUpload.files.length > 0) {
                    formData.append('BackSideImage', bsFileUpload.files[0]);
                }

                $.ajax({
                    url: "/Profile/DoEditKYC/",
                    type: "POST",
                    processData: false,
                    contentType: false,
                    beforeSend: function () {
                        $("#btn-do-edit-kyc").attr("disabled", true);
                        $("#btn-do-edit-kyc").html("<i class='fa fa-spinner fa-spin'></i> <i class='far fa-save'></i> " + $("#btn-do-edit-kyc").text());
                    },
                    data: formData,
                    success: function (data) {
                        if (data.success) {
                            toastr.success(data.message, 'Success!');
                            $("#form-edit-kyc").hide();
                            $("#kyc-response").show();
                        } else {
                            toastr.error(data.message, 'Error!');
                        }
                    },
                    complete: function (data) {
                        $("#btn-do-edit-kyc").attr("disabled", false);
                        $("#btn-do-edit-kyc").html("<i class='far fa-save'></i> " + $("#btn-do-edit-kyc").text());
                    }
                });
            }
            return false;
        });
    },
};

$(document).ready(function () {
    KYC.init();
});