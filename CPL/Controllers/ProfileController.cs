﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using CPL.Models;
using CPL.Misc;
using CPL.Misc.Enums;
using CPL.Core.Interfaces;
using AutoMapper;
using CPL.Infrastructure.Interfaces;
using Microsoft.AspNetCore.Http;
using System.Net.Mail;
using System.Net;
using CPL.Misc.Utils;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using Google.Authenticator;
using CPL.Common.Enums;

namespace CPL.Controllers
{
    [Permission(EnumRole.User)]
    public class ProfileController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ILangService _langService;
        private readonly IMapper _mapper;
        private readonly IViewRenderService _viewRenderService;
        private readonly IUnitOfWorkAsync _unitOfWork;
        private readonly ISettingService _settingService;
        private readonly ISysUserService _sysUserService;
        private readonly ICoinTransactionService _coinTransactionService;
        private readonly ITemplateService _templateService;
        private readonly ILotteryHistoryService _lotteryHistoryService;

        public ProfileController(
            IHostingEnvironment hostingEnvironment,
            ILangService langService,
            IMapper mapper,
            IViewRenderService viewRenderService,
            IUnitOfWorkAsync unitOfWork,
            ISettingService settingService,
            ISysUserService sysUserService,
            ICoinTransactionService coinTransactionService,
            ITeamService teamService,
            ILotteryHistoryService lotteryHistoryService,
            ITemplateService templateService)
        {
            this._hostingEnvironment = hostingEnvironment;
            this._langService = langService;
            this._mapper = mapper;
            this._viewRenderService = viewRenderService;
            this._settingService = settingService;
            this._coinTransactionService = coinTransactionService;
            this._sysUserService = sysUserService;
            this._unitOfWork = unitOfWork;
            this._templateService = templateService;
            this._lotteryHistoryService = lotteryHistoryService;
        }

        public IActionResult Index()
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id && x.IsDeleted == false);
            var viewModel = Mapper.Map<ProfileViewModel>(user);

            viewModel.NumberOfGameHistories = _lotteryHistoryService.Queryable().Count(x => x.SysUserId == viewModel.Id);
            viewModel.NumberOfTransactions = _coinTransactionService.Queryable().Count(x => x.SysUserId == viewModel.Id);

            // Mapping KYC status
            if (!user.KYCVerified.HasValue)
            {
                viewModel.KYCStatus = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "NotVerifiedYet");
            }
            else if (user.KYCVerified == true)
            {
                viewModel.KYCStatus = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Verified");
            }
            else // viewModel.KYCVerified == false
            {
                viewModel.KYCStatus = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Pending");
            }

            // Mapping TwoFactorAuthenticationEnable status
            if (user.TwoFactorAuthenticationEnable)
            {
                viewModel.TwoFactorAuthenticationEnableStatus = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "IsEnabled");
            }
            else // viewModel.TwoFactorAuthenticationEnable == false
            {
                viewModel.TwoFactorAuthenticationEnableStatus = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "IsNotEnabled");
            }

            return View(viewModel);
        }

        [HttpPost]
        public IActionResult Update(ProfileViewModel viewModel)
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id && x.IsDeleted == false);
            if (user != null)
            {
                user.FirstName = viewModel.FirstName;
                user.LastName = viewModel.LastName;
                user.Gender = viewModel.Gender;
                user.DOB = viewModel.DOB;
                user.PostalCode = viewModel.PostalCode;
                user.Country = viewModel.Country;
                user.City = viewModel.City;
                user.StreetAddress = viewModel.StreetAddress;
                user.Mobile = viewModel.Mobile;

                // KYC
                if (viewModel.FrontSideImage != null && viewModel.BackSideImage != null)
                {
                    user.KYCCreatedDate = DateTime.Now;
                    user.KYCVerified = false;
                    var kyc = Path.Combine(_hostingEnvironment.WebRootPath, @"images\kyc");
                    string timestamp = DateTime.Now.ToString("yyyyMMddhhmmss");

                    // Front Size
                    var frontSide = $"{viewModel.Id.ToString()}_FS_{timestamp}_{viewModel.FrontSideImage.FileName}";
                    var frontSidePath = Path.Combine(kyc, frontSide);
                    viewModel.FrontSideImage.CopyTo(new FileStream(frontSidePath, FileMode.Create));
                    user.FrontSide = frontSide;

                    // Back Size
                    var backSide = $"{viewModel.Id.ToString()}_BS_{timestamp}_{viewModel.BackSideImage.FileName}";
                    var backSidePath = Path.Combine(kyc, backSide);
                    viewModel.BackSideImage.CopyTo(new FileStream(backSidePath, FileMode.Create));
                    user.BackSide = backSide;
                }

                HttpContext.Session.SetObjectAsJson("CurrentUser", Mapper.Map<SysUserViewModel>(user));
                _sysUserService.Update(user);
                _unitOfWork.SaveChanges();

                if (viewModel.FrontSideImage != null && viewModel.BackSideImage != null)
                {
                    return new JsonResult(new
                    {
                        success = true,
                        message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "PersonalInfoUpdated"),
                        kycconfirm = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "KYCReceived"),
                        kycverify = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Pending")
                    });
                }

                return new JsonResult(new
                {
                    success = true,
                    message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "PersonalInfoUpdated"),
                    gender = viewModel.Gender == true ? LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Male") : LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Female")
                });
            }
            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "NonExistingAccount") });
        }

        public IActionResult Edit()
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id && x.IsDeleted == false);
            var viewModel = Mapper.Map<ProfileViewModel>(user);
            viewModel.NumberOfGameHistories = _lotteryHistoryService.Queryable().Count(x => x.SysUserId == viewModel.Id);
            viewModel.NumberOfTransactions = _coinTransactionService.Queryable().Count(x => x.SysUserId == viewModel.Id);

            return PartialView("_Edit", viewModel);
        }

        public IActionResult Security()
        {
            var user = HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser");
            var viewModel = Mapper.Map<SecurityViewModel>(user);
            var tfa = new TwoFactorAuthenticator();
            var setupInfo = tfa.GenerateSetupCode(CPLConstant.AppName, user.Email, CPLConstant.TwoFactorAuthenticationSecretKey, 300, 300);
            viewModel.QrCodeSetupImageUrl = setupInfo.QrCodeSetupImageUrl;
            return View(viewModel);
        }

        [HttpPost]
        public IActionResult UpdateEmail(UpdateEmailViewModel viewModel)
        {
            var isEmailExisting = _sysUserService.Queryable().Any(x => x.Email == viewModel.NewEmail && x.IsDeleted == false);
            if (isEmailExisting)
                return new JsonResult(new { success = false, name = "new-email", message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ExistingEmail") });

            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id && x.IsDeleted == false);
            if (user != null)
            {
                user.Email = viewModel.NewEmail;
                HttpContext.Session.SetObjectAsJson("CurrentUser", Mapper.Map<SysUserViewModel>(user));
                _sysUserService.Update(user);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "EmailUpdated") });
            }
            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "NonExistingAccount") });
        }

        [HttpPost]
        public IActionResult UpdatePassword(UpdatePasswordViewModel viewModel)
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id && x.IsDeleted == false);
            if (user != null)
            {
                if (!BCrypt.Net.BCrypt.Verify(viewModel.CurrentPassword, user.Password))
                    return new JsonResult(new { success = false, name = "current-password", message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "InvalidCurrentPassword") });

                user.Password = viewModel.NewPassword.ToBCrypt();
                HttpContext.Session.SetObjectAsJson("CurrentUser", Mapper.Map<SysUserViewModel>(user));
                _sysUserService.Update(user);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "PasswordUpdated") });
            }
            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "NonExistingAccount") });
        }

        public IActionResult KYC()
        {
            var user = _sysUserService.Queryable().Where(x => x.Id == HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id).FirstOrDefault();
            var viewModel = Mapper.Map<KYCViewModel>(user);
            return View(viewModel);
        }

        [HttpPost]
        public IActionResult UpdateTwoFactorAuthentication(bool value, string pin)
        {
            if (value)
            {
                var tfa = new TwoFactorAuthenticator();
                bool isCorrectPIN = tfa.ValidateTwoFactorPIN(CPLConstant.TwoFactorAuthenticationSecretKey, pin);

                if (isCorrectPIN)
                {
                    var userId = HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id;
                    var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == userId);
                    user.TwoFactorAuthenticationEnable = value;
                    HttpContext.Session.SetObjectAsJson("CurrentUser", Mapper.Map<SysUserViewModel>(user));
                    _sysUserService.Update(user);
                    _unitOfWork.SaveChanges();
                    return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "TwoFactorAuthenticationUpdated") });
                }
                else
                    return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "InvalidPIN") });
            }
            else
            {
                var userId = HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id;
                var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == userId);
                user.TwoFactorAuthenticationEnable = value;
                HttpContext.Session.SetObjectAsJson("CurrentUser", Mapper.Map<SysUserViewModel>(user));
                _sysUserService.Update(user);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "TwoFactorAuthenticationUpdated") });
            }
        }

        [HttpPost]
        public IActionResult UpdateKYC(KYCViewModel viewModel)
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id && x.IsDeleted == false);
            if (user != null)
            {
                if (viewModel.FrontSideImage != null && viewModel.BackSideImage != null)
                {
                    user.KYCCreatedDate = DateTime.Now;
                    user.KYCVerified = false;
                    var kyc = Path.Combine(_hostingEnvironment.WebRootPath, @"images\kyc");
                    string timestamp = DateTime.Now.ToString("yyyyMMddhhmmss");

                    // Front Size
                    var frontSide = $"{viewModel.Id.ToString()}_FS_{timestamp}_{viewModel.FrontSideImage.FileName}";
                    var frontSidePath = Path.Combine(kyc, frontSide);
                    viewModel.FrontSideImage.CopyTo(new FileStream(frontSidePath, FileMode.Create));
                    user.FrontSide = frontSide;

                    // Back Size
                    var backSide = $"{viewModel.Id.ToString()}_BS_{timestamp}_{viewModel.BackSideImage.FileName}";
                    var backSidePath = Path.Combine(kyc, backSide);
                    viewModel.BackSideImage.CopyTo(new FileStream(backSidePath, FileMode.Create));
                    user.BackSide = backSide;
                }

                HttpContext.Session.SetObjectAsJson("CurrentUser", Mapper.Map<SysUserViewModel>(user));
                _sysUserService.Update(user);
                _unitOfWork.SaveChanges();

                return new JsonResult(new
                {
                    success = true,
                    message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "PersonalInfoUpdated")
                });
            }
            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "NonExistingAccount") });
        }
    }
}
