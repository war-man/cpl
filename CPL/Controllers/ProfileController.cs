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

namespace CPL.Controllers
{
    [Permission(EnumRole.Guest)]
    public class ProfileController : Controller
    {
        private readonly ILangService _langService;
        private readonly IMapper _mapper;
        private readonly IViewRenderService _viewRenderService;
        private readonly IUnitOfWorkAsync _unitOfWork;
        private readonly ISettingService _settingService;
        private readonly ISysUserService _sysUserService;
        private readonly ITemplateService _templateService;

        public ProfileController(
            ILangService langService,
            IMapper mapper,
            IViewRenderService viewRenderService,
            IUnitOfWorkAsync unitOfWork,
            ISettingService settingService,
            ISysUserService sysUserService,
            ITeamService teamService,
            ITemplateService templateService)
        {
            this._langService = langService;
            this._mapper = mapper;
            this._viewRenderService = viewRenderService;
            this._settingService = settingService;
            this._sysUserService = sysUserService;
            this._unitOfWork = unitOfWork;
            this._templateService = templateService;
        }

        public IActionResult EditAccount()
        {
            var viewModel = Mapper.Map<EditAccountViewModel>(HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser"));
            return View("EditAccount", viewModel);
        }

        [HttpPost]
        public IActionResult EditAccount(EditAccountViewModel viewModel)
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == HttpContext.Session.GetObjectFromJson<SysUserViewModel>("CurrentUser").Id);
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
                HttpContext.Session.SetObjectAsJson("CurrentUser", Mapper.Map<SysUserViewModel>(user));
                _sysUserService.Update(user);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "PersonalInfoUpdated") });
            }
            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "NonExistingAccount") });
        }
    }
}