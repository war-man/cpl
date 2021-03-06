﻿using AutoMapper;
using CPL.Common.CurrencyPairRateHelper;
using CPL.Common.Enums;
using CPL.Common.Misc;
using CPL.Core.Interfaces;
using CPL.Domain;
using CPL.Infrastructure;
using CPL.Infrastructure.Interfaces;
using CPL.Misc;
using CPL.Misc.Enums;
using CPL.Misc.Utils;
using CPL.Models;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using static CPL.Common.Enums.CPLConstant;

namespace CPL.Controllers
{
    public class AdminController : Controller
    {
        private readonly ILangService _langService;
        private readonly IMapper _mapper;
        private readonly IViewRenderService _viewRenderService;
        private readonly IUnitOfWorkAsync _unitOfWork;
        private readonly ISettingService _settingService;
        private readonly ITemplateService _templateService;
        private readonly ISysUserService _sysUserService;
        private readonly ILotteryHistoryService _lotteryHistoryService;
        private readonly IPricePredictionHistoryService _pricePredictionHistoryService;
        private readonly IPricePredictionService _pricePredictionService;
        private readonly INewsService _newsService;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ILotteryService _lotteryService;
        private readonly ILotteryPrizeService _lotteryPrizeService;
        private readonly IAgencyTokenService _agencyTokenService;
        private readonly IAffiliateService _affiliateService;
        private readonly ILotteryCategoryService _lotteryCategoryService;
        private readonly ILotteryDetailService _lotteryDetailService;
        private readonly IAnalyticService _analyticService;
        private readonly IIntroducedUsersService _introducedUsersService;
        private readonly IPricePredictionSettingService _pricePredictionSettingService;
        private readonly IPricePredictionSettingDetailService _pricePredictionSettingDetailService;
        private readonly IAgencyService _agencyService;
        private readonly IPaymentService _paymentService;
        private readonly IGroupService _groupService;
        private readonly ISliderService _sliderService;
        private readonly ISliderDetailService _sliderDetailService;
		private readonly IPricePredictionCategoryService _pricePredictionCategoryService;
		private readonly IPricePredictionCategoryDetailService _pricePredictionCategoryDetailService;
        private readonly IDataContextAsync _dataContextAsync;

        public AdminController(
            ILangService langService,
            IMapper mapper,
            IViewRenderService viewRenderService,
            IUnitOfWorkAsync unitOfWork,
            ISettingService settingService,
            ITemplateService templateService,
            ISysUserService sysUserService,
            ILotteryHistoryService lotteryHistoryService,
            IPricePredictionHistoryService pricePredictionHistoryService,
            IPricePredictionService pricePredictionService,
            INewsService newsService,
            IHostingEnvironment hostingEnvironment,
            IAnalyticService analyticService,
            ILotteryService lotteryService,
            IAffiliateService affiliateService,
            ILotteryPrizeService lotteryPrizeService,
            ILotteryCategoryService lotteryCategoryService,
            ILotteryDetailService lotteryDetailService,
            IIntroducedUsersService introducedUsersService,
            IAgencyTokenService agencyTokenService,
            IAgencyService agencyService,
            IPricePredictionSettingService pricePredictionSettingService,
            IPricePredictionSettingDetailService pricePredictionSettingDetailService,
            IPaymentService paymentService,
            IGroupService groupService,
            ISliderService sliderService,
            ISliderDetailService sliderDetailService,
			IPricePredictionCategoryService pricePredictionCategoryService,
			IPricePredictionCategoryDetailService pricePredictionCategoryDetailService,
            IDataContextAsync dataContextAsync)
        {
            this._langService = langService;
            this._mapper = mapper;
            this._viewRenderService = viewRenderService;
            this._settingService = settingService;
            this._unitOfWork = unitOfWork;
            this._templateService = templateService;
            this._sysUserService = sysUserService;
            this._lotteryHistoryService = lotteryHistoryService;
            this._lotteryService = lotteryService;
            this._lotteryPrizeService = lotteryPrizeService;
            this._pricePredictionHistoryService = pricePredictionHistoryService;
            this._pricePredictionService = pricePredictionService;
            this._newsService = newsService;
            this._analyticService = analyticService;
            this._affiliateService = affiliateService;
            this._hostingEnvironment = hostingEnvironment;
            this._agencyTokenService = agencyTokenService;
            this._lotteryDetailService = lotteryDetailService;
            this._lotteryCategoryService = lotteryCategoryService;
            this._introducedUsersService = introducedUsersService;
            this._agencyService = agencyService;
            this._paymentService = paymentService;
            this._groupService = groupService;
            this._sliderService = sliderService;
            this._sliderDetailService = sliderDetailService;
            this._pricePredictionSettingService = pricePredictionSettingService;
            this._pricePredictionSettingDetailService = pricePredictionSettingDetailService;
			this._pricePredictionCategoryService = pricePredictionCategoryService;
            this._pricePredictionCategoryDetailService = pricePredictionCategoryDetailService;
            this._dataContextAsync = dataContextAsync;
        }

        [Permission(EnumRole.Admin)]
        public IActionResult Index()
        {
            //Example of using Analytic Service
            //var deviceCategories = _analyticService.GetDeviceCategory(CPLConstant.Analytic.HomeViewId, DateTime.Now.AddDays(-7), DateTime.Now);
            //var bounceRates = _analyticService.GetBounceRate(CPLConstant.Analytic.HomeViewId, DateTime.Now.AddDays(-7), DateTime.Now);
            //var pageViews = _analyticService.GetPageViews(CPLConstant.Analytic.HomeViewId, DateTime.Now.AddDays(-7), DateTime.Now);
            //var newViewId = _analyticService.CreateView("LotteryCategory4");
            //var newFilterID = _analyticService.CreateFilter("LotteryCategory_4", @"/Lottery/Index/[0-9]+\?lottery-category-id=3");
            //_analyticService.LinkFilterToView(newViewId, newFilterID);
            var viewModel = new AdminViewModel();

            // User management
            viewModel.TotalKYCPending = _sysUserService.Queryable().Count(x => !x.IsDeleted && x.KYCVerified.HasValue && !x.KYCVerified.Value);
            viewModel.TotalKYCVerified = _sysUserService.Queryable().Count(x => !x.IsDeleted && x.KYCVerified.HasValue && x.KYCVerified.Value);
            viewModel.TotalUser = _sysUserService.Queryable().Count(x => !x.IsDeleted);
            viewModel.TotalUserToday = _sysUserService.Queryable().Count(x => !x.IsDeleted && x.CreatedDate.ToString("dd/MM/yyyy") == DateTime.Now.ToString("dd/MM/yyyy"));
            viewModel.TotalUserYesterday = _sysUserService.Queryable().Count(x => !x.IsDeleted && x.CreatedDate.ToString("dd/MM/yyyy") == DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy"));

            // Game management
            var lotteryGames = _lotteryService.Queryable().Where(x => !x.IsDeleted);
            var pricePredictionStandardGames = _pricePredictionService.Queryable();
            var lotteryHistories = _lotteryHistoryService.Queryable();
            var pricePredictionHistories = _pricePredictionHistoryService.Queryable();

            // lottery game
            var totalLotteryGame = lotteryGames.Count();
            var totalSaleInLotteryGame = _lotteryHistoryService.Query()
                                        .Include(x => x.Lottery)
                                        .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                                        .Select(x => x.Lottery.UnitPrice).Sum();

            var totalSaleInLotteryGameToday = _lotteryHistoryService.Query()
                                        .Include(x => x.Lottery)
                                        .Where(x => x.CreatedDate.Date.Equals(DateTime.Now.Date) && x.Result != EnumGameResult.REFUND.ToString())
                                        .Sum(x => x.Lottery.UnitPrice);
            var totalSaleInLotteryGameYesterday = _lotteryHistoryService.Query()
                                        .Include(x => x.Lottery)
                                        .Where(x => x.CreatedDate.Date.Equals(DateTime.Now.AddDays(-1).Date) && x.Result != EnumGameResult.REFUND.ToString())
                                        .Sum(x => x.Lottery.UnitPrice);
            viewModel.TotalSaleInLotteryGame = totalSaleInLotteryGame;

            // price prediction game
            var totalPricePredictionGame = pricePredictionStandardGames.Count();
            var totalSaleIPricePredictionGame = _pricePredictionHistoryService.Queryable()
                                            .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                                            .Sum(x => x.Amount);
            var totalSaleIPricePredictionGameToday = _pricePredictionHistoryService.Queryable()
                                            .Where(x => x.CreatedDate.Date.Equals(DateTime.Now.Date) && x.Result != EnumGameResult.REFUND.ToString())
                                            .Sum(x => x.Amount);
            var totalSaleIPricePredictionGameYesterday = _pricePredictionHistoryService.Queryable()
                                            .Where(x => x.CreatedDate.Date.Equals(DateTime.Now.AddDays(-1).Date) && x.Result != EnumGameResult.REFUND.ToString())
                                            .Sum(x => x.Amount);
            viewModel.TotalSaleInPricePredictionGame = (int)totalSaleIPricePredictionGame;

            // all game
            viewModel.TotalGame = totalLotteryGame + totalPricePredictionGame;
            viewModel.TotalSaleInGame = totalSaleInLotteryGame + (int)totalSaleIPricePredictionGame;
            viewModel.TotalSaleInGameToday = totalSaleInLotteryGameToday + (int)totalSaleIPricePredictionGameToday;
            viewModel.TotalSaleInGameYesterday = totalSaleInLotteryGameYesterday + (int)totalSaleIPricePredictionGameYesterday;

            // Affiliate
            viewModel.TotalAgencyAffiliate = _sysUserService.Queryable().Count(x => !x.IsDeleted && (x.AffiliateId.HasValue && x.AffiliateId > 0 && x.AgencyId.HasValue && !x.IsIntroducedById.HasValue));
            viewModel.TotalAgencyAffiliateToday = _sysUserService.Queryable()
                                                    .Where(x => !x.IsDeleted && x.AffiliateCreatedDate != null && x.AffiliateCreatedDate.Value.Date == DateTime.Now.Date)
                                                    .Count(x => x.AgencyId != null && x.AgencyId > 0);
            viewModel.TotalAgencyAffiliateYesterday = _sysUserService.Queryable()
                                                    .Where(x => !x.IsDeleted && x.AffiliateCreatedDate != null && x.AffiliateCreatedDate.Value.Date == DateTime.Now.AddDays(-1).Date)
                                                    .Count(x => x.AgencyId != null && x.AgencyId > 0);
            viewModel.TotalStandardAffiliate = _sysUserService.Queryable().Count(x => !x.IsDeleted && (x.AffiliateId.HasValue && x.AffiliateId > 0 &&
                                                                 (!x.AgencyId.HasValue || (x.AgencyId.HasValue && x.IsIntroducedById.HasValue))));
            viewModel.TotalStandardAffiliateToday = _sysUserService.Queryable()
                                                    .Where(x => !x.IsDeleted && x.AffiliateCreatedDate != null && x.AffiliateCreatedDate.Value.Date == DateTime.Now.Date)
                                                    .Count(x => x.AgencyId == null && x.AffiliateId != null && x.AffiliateId > 0);
            viewModel.TotalStandardAffiliateYesterday = _sysUserService.Queryable()
                                                    .Where(x => !x.IsDeleted && x.AffiliateCreatedDate != null && x.AffiliateCreatedDate.Value.Date == DateTime.Now.AddDays(-1).Date)
                                                    .Count(x => x.AgencyId == null && x.AffiliateId != null && x.AffiliateId > 0);

            //Setting
            var settings = _settingService.Queryable();
            viewModel.KYCVerificationActivated = bool.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.IsKYCVerificationActivated).Value) ? LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "On") : LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Off");
            viewModel.AccountActivationEnable = bool.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.IsAccountActivationEnable).Value) ? LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "On") : LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Off");
            viewModel.CookieExpirations = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.CookieExpirations).Value);

            viewModel.StandardAffiliateRate = new StandardAffiliateRateViewModel
            {
                Tier1DirectRate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.StandardAffiliate.Tier1DirectRate).Value),
                Tier2SaleToTier1Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.StandardAffiliate.Tier2SaleToTier1Rate).Value),
                Tier3SaleToTier1Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.StandardAffiliate.Tier3SaleToTier1Rate).Value)
            };

            viewModel.AgencyAffiliateRate = new AgencyAffiliateRateViewModel
            {
                Tier1DirectRate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier1DirectRate).Value),
                Tier2DirectRate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier2DirectRate).Value),
                Tier3DirectRate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier3DirectRate).Value),
                Tier2SaleToTier1Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier2SaleToTier1Rate).Value),
                Tier3SaleToTier1Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier3SaleToTier1Rate).Value),
                Tier3SaleToTier2Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier3SaleToTier2Rate).Value)
            };

            viewModel.TotalAffiliateApplicationApproved = _sysUserService.Queryable().Count(x => !x.IsDeleted && x.AffiliateId.HasValue && x.AffiliateId.Value != (int)EnumAffiliateApplicationStatus.PENDING);
            viewModel.TotalAffiliateApplicationPending = _sysUserService.Queryable().Count(x => !x.IsDeleted && x.AffiliateId.HasValue && x.AffiliateId == (int)EnumAffiliateApplicationStatus.PENDING);

            viewModel.NumberOfAgencyAffiliateExpiredDays = int.Parse(_settingService.Queryable().FirstOrDefault(x => x.Name == CPLConstant.NumberOfAgencyAffiliateExpiredDays).Value);

            return View(viewModel);
        }

        #region Affiliate
        [Permission(EnumRole.Admin)]
        public IActionResult AffiliateApprove()
        {
            var viewModel = new AffiliateApproveViewModel();
            return View(viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoApproveAffiliateApplication(int id)
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == id);

            if (user.AffiliateId > 0)
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AffiliateHasBeenApproved") });

            var affiliate = new Affiliate
            {
                Tier1DirectRate = int.Parse(_settingService.Queryable().FirstOrDefault(x => x.Name == CPLConstant.StandardAffiliate.Tier1DirectRate).Value),
                Tier2SaleToTier1Rate = int.Parse(_settingService.Queryable().FirstOrDefault(x => x.Name == CPLConstant.StandardAffiliate.Tier2SaleToTier1Rate).Value),
                Tier3SaleToTier1Rate = int.Parse(_settingService.Queryable().FirstOrDefault(x => x.Name == CPLConstant.StandardAffiliate.Tier3SaleToTier1Rate).Value)
            };

            _affiliateService.Insert(affiliate);
            _unitOfWork.SaveChanges();

            user.AffiliateId = affiliate.Id;
            user.AffiliateCreatedDate = DateTime.Now;
            _sysUserService.Update(user);
            _unitOfWork.SaveChanges();

            var template = _templateService.Queryable().FirstOrDefault(x => x.Name == EnumTemplate.AffiliateApprove.ToString());
            var affiliateApproveEmailTemplateViewModel = Mapper.Map<AffiliateApproveEmailTemplateViewModel>(user);
            affiliateApproveEmailTemplateViewModel.RootUrl = $"{HttpContext.Request.Scheme}://{HttpContext.Request.Host}";
            // Populate languages
            affiliateApproveEmailTemplateViewModel.AffiliateApplicationText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AffiliateApplication");
            affiliateApproveEmailTemplateViewModel.HiText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Hi");
            affiliateApproveEmailTemplateViewModel.AffiliateApprovedDescriptionText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AffiliateApprovedDescription");
            affiliateApproveEmailTemplateViewModel.CheersText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Cheers");
            affiliateApproveEmailTemplateViewModel.ContactInfoText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ContactInfo");
            affiliateApproveEmailTemplateViewModel.EmailText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Email");
            affiliateApproveEmailTemplateViewModel.WebsiteText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Website");
            affiliateApproveEmailTemplateViewModel.CPLTeamText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "CPLTeam");

            template.Body = _viewRenderService.RenderToStringAsync("/Views/Admin/_AffiliateApproveEmailTemplate.cshtml", affiliateApproveEmailTemplateViewModel).Result;
            EmailHelper.Send(Mapper.Map<TemplateViewModel>(template), user.Email);

            return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AffiliateIsApproved") });
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchAffiliateApplication(DataTableAjaxPostModel viewModel)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchAffiliateApplicationFunc(viewModel, out filteredResultsCount, out totalResultsCount);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<SysUserViewModel> SearchAffiliateApplicationFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            var searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            // search the dbase taking into consideration table sorting and paging
            if (string.IsNullOrEmpty(searchBy))
            {
                filteredResultsCount = totalResultsCount = _sysUserService.Queryable()
                        .Count(x => !x.IsDeleted && x.AffiliateId.HasValue);

                return _sysUserService.Queryable()
                            .Where(x => !x.IsDeleted && x.AffiliateId.HasValue)
                            .OrderBy("AffiliateCreatedDate", false)
                            .Select(x => Mapper.Map<SysUserViewModel>(x))
                            .OrderBy(sortBy, sortDir)
                            .Skip(skip)
                            .Take(take)
                            .ToList();
            }
            else
            {
                filteredResultsCount = _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && x.AffiliateId.HasValue)
                        .Count(x => x.FirstName.Contains(searchBy) || x.LastName.Contains(searchBy)
                        || x.Email.Contains(searchBy));

                totalResultsCount = _sysUserService.Queryable()
                        .Count(x => !x.IsDeleted && x.AffiliateId.HasValue);

                return _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && x.AffiliateId.HasValue)
                        .Where(x => x.FirstName.Contains(searchBy) || x.LastName.Contains(searchBy)
                        || x.Email.Contains(searchBy))
                        .Select(x => Mapper.Map<SysUserViewModel>(x))
                        .OrderBy(sortBy, sortDir)
                        .Skip(skip)
                        .Take(take)
                        .ToList();
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult GenerateAgencyAffiliateUrl(AgencyViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                var agencyToken = new AgencyToken();
                agencyToken.Token = Guid.NewGuid().ToString();
                agencyToken.ExpiredDate = DateTime.Now.AddDays(viewModel.NumberOfAgencyAffiliateExpiredDays);
                _agencyTokenService.Insert(agencyToken);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, url = $"{HttpContext.Request.Scheme}://{HttpContext.Request.Host}{Url.Action("Register", "Authentication", new { token = agencyToken.Token })}", message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AgencyAffiliateURLGenerated") });
            }

            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
        }

        [Permission(EnumRole.Admin)]
        public IActionResult AllStandardAffiliate()
        {
            return View();
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchAllStandardAffiliate(DataTableAjaxPostModel viewModel)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchAllStandardAffiliateFunc(viewModel, out filteredResultsCount, out totalResultsCount);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<AllStandardAffiliateViewModel> SearchAllStandardAffiliateFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            var searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            // search the dbase taking into consideration table sorting and paging
            if (string.IsNullOrEmpty(searchBy))
            {
                filteredResultsCount = totalResultsCount = _sysUserService.Queryable()
                        .Count(x => !x.IsDeleted && (x.AffiliateId.HasValue && x.AffiliateId > 0 &&
                                                                 (!x.AgencyId.HasValue || (x.AgencyId.HasValue && x.IsIntroducedById.HasValue))));

                var standardAffliate =
                            _sysUserService.Query()
                            .Include(x => x.Affiliate)
                            .Include(x => x.IntroducedUsers)
                            .Where(x => !x.IsDeleted && (x.AffiliateId.HasValue && x.AffiliateId > 0 &&
                                                                 (!x.AgencyId.HasValue || (x.AgencyId.HasValue && x.IsIntroducedById.HasValue))))
                            .Select(x => new AllStandardAffiliateViewModel
                            {
                                Id = x.Id,
                                FirstName = x.FirstName,
                                LastName = x.LastName,
                                Email = x.Email,
                                IsLocked = x.IsLocked,
                                TotalIntroducedUsers = x.IntroducedUsers.TotalDirectIntroducedUsers,
                                AffiliateId = x.AffiliateId,
                                TotalSale = Math.Max(x.IntroducedUsers.DirectAffiliateSale + x.IntroducedUsers.Tier2AffiliateSale + x.IntroducedUsers.Tier3AffiliateSale, 0),
                                TotalSaleInString = Math.Max(x.IntroducedUsers.DirectAffiliateSale + x.IntroducedUsers.Tier2AffiliateSale + x.IntroducedUsers.Tier3AffiliateSale, 0).ToString(Format.Amount),
                                AffiliateCreatedDate = x.AffiliateCreatedDate,
                                AffiliateCreatedDateInString = x.AffiliateCreatedDate.GetValueOrDefault().ToString(Format.DateTime),
                                Tier1DirectRate = x.Affiliate.Tier1DirectRate,
                                Tier2SaleToTier1Rate = x.Affiliate.Tier2SaleToTier1Rate,
                                Tier3SaleToTier1Rate = x.Affiliate.Tier3SaleToTier1Rate
                            })
                            .AsQueryable()
                            .OrderBy(sortBy, sortDir)
                            .Skip(skip)
                            .Take(take)
                            .ToList();

                return standardAffliate;
            }
            else
            {
                filteredResultsCount = _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && (x.AffiliateId.HasValue && x.AffiliateId > 0 &&
                                                                 (!x.AgencyId.HasValue || (x.AgencyId.HasValue && x.IsIntroducedById.HasValue))))
                        .Count(x => (x.FirstName ?? "").ToLower().Contains(searchBy) || (x.LastName ?? "").ToLower().Contains(searchBy) || x.Email.ToLower().Contains(searchBy) || x.Email.Contains(searchBy));

                totalResultsCount = _sysUserService.Queryable()
                        .Count(x => x.AffiliateId.HasValue && x.AffiliateId > 0 && !x.AgencyId.HasValue);

                var standardAffliate =
                            _sysUserService.Query()
                            .Include(x => x.Affiliate)
                            .Include(x => x.IntroducedUsers)
                            .Where(x => !x.IsDeleted && (x.AffiliateId.HasValue && x.AffiliateId > 0 &&
                                                                 (!x.AgencyId.HasValue || (x.AgencyId.HasValue && x.IsIntroducedById.HasValue))))
                            .Select(x => new AllStandardAffiliateViewModel
                            {
                                Id = x.Id,
                                FirstName = x.FirstName,
                                LastName = x.LastName,
                                Email = x.Email,
                                IsLocked = x.IsLocked,
                                TotalIntroducedUsers = x.IntroducedUsers.TotalDirectIntroducedUsers,
                                AffiliateId = x.AffiliateId,
                                TotalSale = Math.Max(x.IntroducedUsers.DirectAffiliateSale + x.IntroducedUsers.Tier2AffiliateSale + x.IntroducedUsers.Tier3AffiliateSale, 0),
                                TotalSaleInString = Math.Max(x.IntroducedUsers.DirectAffiliateSale + x.IntroducedUsers.Tier2AffiliateSale + x.IntroducedUsers.Tier3AffiliateSale, 0).ToString(Format.Amount),
                                AffiliateCreatedDate = x.AffiliateCreatedDate,
                                AffiliateCreatedDateInString = x.AffiliateCreatedDate.GetValueOrDefault().ToString(Format.DateTime),
                                Tier1DirectRate = x.Affiliate.Tier1DirectRate,
                                Tier2SaleToTier1Rate = x.Affiliate.Tier2SaleToTier1Rate,
                                Tier3SaleToTier1Rate = x.Affiliate.Tier3SaleToTier1Rate
                            })
                            .Where(x => (x.FirstName ?? "").ToLower().Contains(searchBy) || (x.LastName ?? "").ToLower().Contains(searchBy) || x.Email.ToLower().Contains(searchBy))
                            .AsQueryable()
                            .OrderBy(sortBy, sortDir)
                            .Skip(skip)
                            .Take(take)
                            .ToList();

                return standardAffliate;
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoLockAffiliate(int id)
        {
            try
            {
                var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == id);

                user.IsLocked = !user.IsLocked;

                _sysUserService.Update(user);
                _unitOfWork.SaveChanges();

                if (user.IsLocked)
                    return new JsonResult(new { success = true, isLocked = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "LockSuccessful") });
                else
                    return new JsonResult(new { success = true, isLocked = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UnLockSuccessful") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoUpdateRateOnStandardAffiliate(string name, int value, int affiliateId)
        {
            try
            {
                var standardAffiliate = _affiliateService.Queryable().FirstOrDefault(x => x.Id == affiliateId);
                var property = typeof(Affiliate).GetProperty(name);
                property.SetValue(standardAffiliate, value, null);
                _affiliateService.Update(standardAffiliate);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, isLocked = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoUpdateRatesOnStandardAffiliate(StandardAffiliateRateViewModel viewModel, int? affiliateId)
        {
            try
            {
                var affiliate = _affiliateService
                    .Queryable()
                    .Where(x => x.Id == affiliateId).FirstOrDefault();

                // Update agency affiliate rate commission
                affiliate.Tier1DirectRate = viewModel.Tier1DirectRate;
                affiliate.Tier2SaleToTier1Rate = viewModel.Tier2SaleToTier1Rate;
                affiliate.Tier3SaleToTier1Rate = viewModel.Tier3SaleToTier1Rate;

                _affiliateService.Update(affiliate);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoUpdateRatesOnStandardAffiliates(StandardAffliateDataModel viewModel)
        {
            try
            {
                foreach (var id in viewModel.Ids)
                {
                    var standardAffiliate = _affiliateService.Queryable().FirstOrDefault(x => x.Id == id);

                    if (viewModel.Tier1DirectRate != null)
                        standardAffiliate.Tier1DirectRate = viewModel.Tier1DirectRate.Value;
                    if (viewModel.Tier2SaleToTier1Rate != null)
                        standardAffiliate.Tier2SaleToTier1Rate = viewModel.Tier2SaleToTier1Rate.Value;
                    if (viewModel.Tier3SaleToTier1Rate != null)
                        standardAffiliate.Tier3SaleToTier1Rate = viewModel.Tier3SaleToTier1Rate.Value;

                    _affiliateService.Update(standardAffiliate);
                }

                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoUpdateStandardAffiliateSetting(AffiliateSettingViewModel viewModel, int? affiliateId)
        {
            try
            {
                var affiliate = _affiliateService
                    .Queryable()
                    .Where(x => x.Id == affiliateId).FirstOrDefault();

                // Update top agency setting
                if (viewModel.IsTier2TabVisible.HasValue)
                {
                    affiliate.IsTier2TabVisible = viewModel.IsTier2TabVisible.Value;
                }
                if (viewModel.IsTier3TabVisible.HasValue)
                {
                    affiliate.IsTier3TabVisible = viewModel.IsTier3TabVisible.Value;
                }
                if (viewModel.IsAutoPaymentEnable.HasValue)
                {
                    affiliate.IsAutoPaymentEnable = viewModel.IsAutoPaymentEnable.Value;
                }

                _affiliateService.Update(affiliate);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [Permission(EnumRole.Admin)]
        public IActionResult TopAgencyAffiliate(int id, string tab)
        {
            var user = _sysUserService
                .Query()
                .Include(x => x.Agency)
                .FirstOrDefault(x => x.Id == id && x.AffiliateId.GetValueOrDefault(0) > 0 && x.AgencyId.HasValue);
            var viewModel = Mapper.Map<TopAgencyAffiliateAdminViewModel>(user);

            viewModel.IsKYCVerificationActivated = bool.Parse(_settingService.Queryable().FirstOrDefault(x => x.Name == CPLConstant.IsKYCVerificationActivated).Value);

            // Affiliate url
            viewModel.AffiliateUrl = $"{HttpContext.Request.Scheme}://{HttpContext.Request.Host}" + Url.Action("Register", "Authentication", new { id = viewModel.Id });

            // Total sale
            SqlParameter TotalAffiliateSaleParam = new SqlParameter()
            {
                ParameterName = "@TotalAffiliateSale",
                SqlDbType = SqlDbType.Money,
                Direction = ParameterDirection.Output,
                IsNullable = true
            };
            SqlParameter TodayAffiliateSaleParam = new SqlParameter()
            {
                ParameterName = "@TodayAffiliateSale",
                SqlDbType = SqlDbType.Money,
                Direction = ParameterDirection.Output,
                IsNullable = true
            };
            SqlParameter YesterdayAffiliateSaleParam = new SqlParameter()
            {
                ParameterName = "@YesterdayAffiliateSale",
                SqlDbType = SqlDbType.Money,
                Direction = ParameterDirection.Output,
                IsNullable = true
            };
            SqlParameter[] parameters = {
                new SqlParameter() {
                    ParameterName = "@SysUserId",
                    SqlDbType = SqlDbType.Int,
                    Value = user.Id,
                    Direction = ParameterDirection.Input
                },
                TotalAffiliateSaleParam, TodayAffiliateSaleParam, YesterdayAffiliateSaleParam
            };

            _dataContextAsync.ExecuteSqlCommand("exec dbo.usp_GetAffiliateSale @SysUserId, @TotalAffiliateSale OUTPUT, @TodayAffiliateSale OUTPUT, @YesterdayAffiliateSale OUTPUT", parameters);

            viewModel.TotalAffiliateSale = Convert.ToInt32((TotalAffiliateSaleParam.Value as int?).GetValueOrDefault(0));
            viewModel.TodayAffiliateSale = Convert.ToInt32((TodayAffiliateSaleParam.Value as int?).GetValueOrDefault(0));
            viewModel.YesterdayAffiliateSale = Convert.ToInt32((YesterdayAffiliateSaleParam.Value as int?).GetValueOrDefault(0));

            // Total user register
            viewModel.TotalIntroducedUsers = _sysUserService.Queryable()
                                           .Count(x => x.IsIntroducedById != null && x.IsIntroducedById == user.Id);
            viewModel.TotalIntroducedUsersToday = _sysUserService.Queryable()
                                            .Where(x => x.IsIntroducedById.HasValue && x.IsIntroducedById.Value == user.Id
                                            && x.AffiliateCreatedDate.HasValue && x.AffiliateCreatedDate.Value.Date == DateTime.Now.Date).Count();
            viewModel.TotalIntroducedUsersYesterday = _sysUserService.Queryable()
                                            .Where(x => x.IsIntroducedById.HasValue && x.IsIntroducedById.Value == user.Id
                                            && x.AffiliateCreatedDate.HasValue && x.AffiliateCreatedDate.Value.Date == DateTime.Now.AddDays(-1).Date).Count();

            viewModel.AgencyAffiliateRate = new AgencyAffiliateRateViewModel
            {
                Tier1DirectRate = user.Agency.Tier1DirectRate,
                Tier2DirectRate = user.Agency.Tier2DirectRate,
                Tier3DirectRate = user.Agency.Tier3DirectRate,
                Tier2SaleToTier1Rate = user.Agency.Tier2SaleToTier1Rate,
                Tier3SaleToTier1Rate = user.Agency.Tier3SaleToTier1Rate,
                Tier3SaleToTier2Rate = user.Agency.Tier3SaleToTier2Rate
            };

            viewModel.AgencyAffiliateSetting = new AffiliateSettingViewModel
            {
                IsTier2TabVisible = user.Agency.IsTier2TabVisible,
                IsTier3TabVisible = user.Agency.IsTier3TabVisible,
                IsAutoPaymentEnable = user.Agency.IsAutoPaymentEnable,
            };

            viewModel.CanDoPayment = this.TokenToBePaid(id) > 0 ? true : false;

            viewModel.Tab = tab;

            return View(viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchTopAgencyAffiliate(DataTableAjaxPostModel viewModel, int sysUserId, string kindOfTier, int periodInDay)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchTopAgencyAffiliateFunc(viewModel, out filteredResultsCount, out totalResultsCount, sysUserId, kindOfTier, periodInDay);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<TopAgencyAffiliateIntroducedUsersAdminViewModel> SearchTopAgencyAffiliateFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount, int sysUserId, string kindOfTier, int periodInDay)
        {
            var searchBy = (model.search.value != null) ? model.search.value : string.Empty;
            var pageSize = model.length;
            var pageIndex = model.start + 1;

            string sortBy = string.Empty;
            string sortDir = "KindOfTier";

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower();
            }

            List<SqlParameter> storeParams = new List<SqlParameter>()
            {
                new SqlParameter() {ParameterName = "@SysUserId", SqlDbType = SqlDbType.Int, Value= sysUserId},
                new SqlParameter() {ParameterName = "@PeriodInDay", SqlDbType = SqlDbType.Int, Value = periodInDay},
                new SqlParameter() {ParameterName = "@PageSize", SqlDbType = SqlDbType.Int, Value = pageSize},
                new SqlParameter() {ParameterName = "@PageIndex", SqlDbType = SqlDbType.Int, Value = pageIndex},
                new SqlParameter() {ParameterName = "@OrderColumn", SqlDbType = SqlDbType.NVarChar, Value = sortBy},
                new SqlParameter() {ParameterName = "@OrderDirection", SqlDbType = SqlDbType.NVarChar, Value = sortDir},
                new SqlParameter() {ParameterName = "@SearchValue", SqlDbType = SqlDbType.NVarChar, Value = searchBy},
            };

            var uspName = string.Empty;
            if (kindOfTier == ((int)EnumKindOfTier.TIER1).ToString())
            {
                uspName = "[usp_GetAffiliateInfo_Tier1_IntroducedUsers]";
            }
            else if (kindOfTier == ((int)EnumKindOfTier.TIER2).ToString())
            {
                uspName = "[usp_GetAffiliateInfo_NonTier1_IntroducedUsers]";
                storeParams.Add(new SqlParameter() { ParameterName = "@Tier", SqlDbType = SqlDbType.Int, Value = (int)EnumKindOfTier.TIER2 });
            }
            else if (kindOfTier == ((int)EnumKindOfTier.TIER3).ToString())
            {
                uspName = "[usp_GetAffiliateInfo_NonTier1_IntroducedUsers]";
                storeParams.Add(new SqlParameter() { ParameterName = "@Tier", SqlDbType = SqlDbType.Int, Value = (int)EnumKindOfTier.TIER3 });
            }

            var dataSet = _dataContextAsync.ExecuteStoredProcedure(uspName, storeParams);

            DataTable table = dataSet.Tables[0];
            var rows = new List<DataRow>(table.Rows.OfType<DataRow>()); //  the Rows property of the DataTable object is a collection that implements IEnumerable but not IEnumerable<T>
            var viewModels = Mapper.Map<List<DataRow>, List<TopAgencyAffiliateIntroducedUsersAdminViewModel>>(rows);

            totalResultsCount = Convert.ToInt32((dataSet.Tables[1].Rows[0])["TotalCount"]);
            filteredResultsCount = Convert.ToInt32((dataSet.Tables[2].Rows[0])["FilteredCount"]);

            return viewModels;
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoUpdateRateOnAgencyAffiliate(AgencyAffiliateRateViewModel viewModel, int? agencyId)
        {
            try
            {
                var agency = _agencyService
                    .Queryable()
                    .Where(x => x.Id == agencyId).FirstOrDefault();

                // Update agency affiliate rate commission
                agency.Tier1DirectRate = viewModel.Tier1DirectRate;
                agency.Tier2DirectRate = viewModel.Tier2DirectRate;
                agency.Tier3DirectRate = viewModel.Tier3DirectRate;
                agency.Tier2SaleToTier1Rate = viewModel.Tier2SaleToTier1Rate;
                agency.Tier3SaleToTier1Rate = viewModel.Tier3SaleToTier1Rate;
                agency.Tier3SaleToTier2Rate = viewModel.Tier3SaleToTier2Rate;

                _agencyService.Update(agency);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoUpdatetopAgencySetting(AffiliateSettingViewModel viewModel, int? agencyId)
        {
            try
            {
                var agency = _agencyService
                    .Queryable()
                    .Where(x => x.Id == agencyId).FirstOrDefault();

                // Update top agency setting
                if (viewModel.IsTier2TabVisible.HasValue)
                {
                    agency.IsTier2TabVisible = viewModel.IsTier2TabVisible.Value;
                }
                if (viewModel.IsTier3TabVisible.HasValue)
                {
                    agency.IsTier3TabVisible = viewModel.IsTier3TabVisible.Value;
                }
                if (viewModel.IsAutoPaymentEnable.HasValue)
                {
                    agency.IsAutoPaymentEnable = viewModel.IsAutoPaymentEnable.Value;
                }

                _agencyService.Update(agency);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [Permission(EnumRole.Admin)]
        public IActionResult ConfirmPayment(int sysUserId)
        {
            var payments = _paymentService.Queryable().Where(x => x.SysUserId == sysUserId && !x.UpdatedDate.HasValue);

            var viewModel = new ConfirmPaymentPartialViewViewModel();
            viewModel.Period = payments.Count() > 1 ? $"{payments.FirstOrDefault().CreatedDate.AddMonths(-1).Month.ToString()} ~ {payments.LastOrDefault().CreatedDate.AddMonths(-1).Month.ToString()}"
                                                    : $"{payments.FirstOrDefault()?.CreatedDate.AddMonths(-1).Month.ToString(Format.Amount)}";

            viewModel.CommissionAmount = payments.Sum(x => x.Tier2SaleToTier1Sale * x.Tier1DirectRate / 100 + x.Tier2SaleToTier1Sale * x.Tier2SaleToTier1Rate / 100 + x.Tier3SaleToTier1Sale * x.Tier3SaleToTier1Rate / 100).ToString(Format.Amount);

            return PartialView("_Payment", viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoPayment(int sysUserId)
        {
            try
            {
                var user = _sysUserService
                    .Queryable()
                    .Where(x => x.Id == sysUserId).FirstOrDefault();

                var tokenToBePaid = this.TokenToBePaid(sysUserId);
                if (tokenToBePaid > 0)
                {
                    user.TokenAmount += tokenToBePaid;

                    var payments = _paymentService.Queryable().Where(x => x.SysUserId == sysUserId && !x.UpdatedDate.HasValue);
                    foreach (var payment in payments)
                    {
                        payment.UpdatedDate = DateTime.Now;
                        _paymentService.Update(payment);
                    }
                    _sysUserService.Update(user);
                    _unitOfWork.SaveChanges();
                }
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "PaidSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        private decimal TokenToBePaid(int sysUserId)
        {
            var payments = _paymentService.Queryable().Where(x => x.SysUserId == sysUserId && !x.UpdatedDate.HasValue);
            var tokenToBePaid = payments.Sum(x => x.Tier2SaleToTier1Sale * x.Tier1DirectRate / 100 + x.Tier2SaleToTier1Sale * x.Tier2SaleToTier1Rate / 100 + x.Tier3SaleToTier1Sale * x.Tier3SaleToTier1Rate / 100);
            return tokenToBePaid;
        }

        /// <summary>
        /// Gets the Top agency statistics.
        /// </summary>
        /// <param name="sysUserId">The system user identifier.</param>
        /// <param name="periodInDay">The period in day.</param>
        /// <returns></returns>
        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetTopAgencyStatistics(int sysUserId, int periodInDay, int pageSize = 10, int pageIndex = 1,
                                                    string orderColumn = "UsedCPL", string orderDirection = "desc", string searchValue = "")
        {
            List<SqlParameter> storeParams = new List<SqlParameter>()
            {
                new SqlParameter() {ParameterName = "@SysUserId", SqlDbType = SqlDbType.Int, Value= sysUserId},
                new SqlParameter() {ParameterName = "@PeriodInDay", SqlDbType = SqlDbType.Int, Value = periodInDay},
            };

            var dataSet = _dataContextAsync.ExecuteStoredProcedure("usp_GetAffiliateInfo_Tier1_Statistics", storeParams);

            var totalAffiliateSaleChanges = new List<SummaryChange>();
            var directAffiliateSaleChanges = new List<SummaryChange>();
            var totalIntroducedUsersChanges = new List<SummaryChange>();
            var directIntroducedUsersChanges = new List<SummaryChange>();

            for (int i = 0; i < dataSet.Tables[1].Rows.Count; i++)
            {
                totalAffiliateSaleChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["TotalAffiliateSale"])) });
                directAffiliateSaleChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["DirectAffiliateSale"])) });
                totalIntroducedUsersChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["TotalIntroducedUsers"])) });
                directIntroducedUsersChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["DirectIntroducedUsers"])) });
            }

            //Table[0]//////////////////////////////////////////////////////
            //TotalSale|DirectSale|TotalIntroducedUsers|DirectIntroducedUsers
            //123//////456/////////789//////////////////10//////////////////

            var viewModel = new TopAgencyAffiliateInfoAdminViewModel
            {
                TotalAffiliateSale = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[0]),
                DirectAffiliateSale = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[1]),
                TotalIntroducedUsers = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[2]),
                DirectIntroducedUsers = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[3]),

                TotalAffiliateSaleChangesInJson = JsonConvert.SerializeObject(totalAffiliateSaleChanges),
                DirectAffiliateSaleChangesInJson = JsonConvert.SerializeObject(directAffiliateSaleChanges),
                TotalIntroducedUsersChangesInJson = JsonConvert.SerializeObject(totalIntroducedUsersChanges),
                DirectIntroducedUsersChangesInJson = JsonConvert.SerializeObject(directIntroducedUsersChanges),
            };

            return PartialView("_TopAgencyAffiliateStatistics", viewModel);
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetNonTopAgencyStatistics(int sysUserId, int periodInDay, string kindOfTier, int pageSize = 10, int pageIndex = 1,
                                                    string orderColumn = "UsedCPL", string orderDirection = "desc", string searchValue = "")
        {
            List<SqlParameter> storeParams = new List<SqlParameter>() {
                    new SqlParameter() {ParameterName = "@Tier", SqlDbType = SqlDbType.Int, Value= int.Parse(kindOfTier)},
                    new SqlParameter() {ParameterName = "@SysUserId", SqlDbType = SqlDbType.Int, Value= sysUserId},
                    new SqlParameter() {ParameterName = "@PeriodInDay", SqlDbType = SqlDbType.Int, Value = periodInDay},
                };

            var dataSet = _dataContextAsync.ExecuteStoredProcedure("usp_GetAffiliateInfo_NonTier1_Statistics", storeParams);

            var totalAffiliateSaleChanges = new List<SummaryChange>();

            for (int i = 0; i < dataSet.Tables[1].Rows.Count; i++)
            {
                totalAffiliateSaleChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["TotalAffiliateSale"])) });
            }

            //Table[0]//////////////////////////////////////////////////////
            //TotalSale
            //123//////
            var viewModel = new NonTopAgencyAffiliateInfoAdminViewModel
            {
                TotalAffiliateSale = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[0]),

                TotalAffiliateSaleChangesInJson = JsonConvert.SerializeObject(totalAffiliateSaleChanges),
            };

            return PartialView("_NonTopAgencyAffiliateStatistics", viewModel);
        }

        [Permission(EnumRole.Admin)]
        public IActionResult AllTopAgencyAffiliate()
        {
            return View();
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchAllTopAgencyAffiliate(DataTableAjaxPostModel viewModel)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchAllTopAgencyAffiliateFunc(viewModel, out filteredResultsCount, out totalResultsCount);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<AllTopAgencyAffiliateViewModel> SearchAllTopAgencyAffiliateFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            var searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            filteredResultsCount = totalResultsCount = _sysUserService.Queryable().Count(x => !x.IsDeleted && (x.AffiliateId.HasValue && x.AffiliateId > 0 && x.AgencyId.HasValue && !x.IsIntroducedById.HasValue));
            var topAgencyAffiliates = _sysUserService.Query()
                                        .Include(x => x.Agency)
                                        .Include(x => x.IntroducedUsers)
                                        .Where(x => !x.IsDeleted && (x.AffiliateId.HasValue && x.AffiliateId > 0 && x.AgencyId.HasValue && !x.IsIntroducedById.HasValue))
                                        .Select(x => new AllTopAgencyAffiliateViewModel
                                        {
                                            Id = x.Id,
                                            FirstName = x.FirstName,
                                            LastName = x.LastName,
                                            Email = x.Email,
                                            IsLocked = x.IsLocked,
                                            TotalIntroducedUsers = x.IntroducedUsers.TotalDirectIntroducedUsers,
                                            AgencyId = x.AgencyId,
                                            TotalSale = Math.Max(x.IntroducedUsers.DirectAffiliateSale + x.IntroducedUsers.Tier2AffiliateSale + x.IntroducedUsers.Tier3AffiliateSale, 0),
                                            TotalSaleInString = Math.Max(x.IntroducedUsers.DirectAffiliateSale + x.IntroducedUsers.Tier2AffiliateSale + x.IntroducedUsers.Tier3AffiliateSale, 0).ToString(Format.Amount),
                                            AffiliateCreatedDate = x.AffiliateCreatedDate,
                                            AffiliateCreatedDateInString = x.AffiliateCreatedDate.GetValueOrDefault().ToString(Format.DateTime),
                                            Tier1DirectRate = x.Agency.Tier1DirectRate,
                                            Tier2DirectRate = x.Agency.Tier2DirectRate,
                                            Tier3DirectRate = x.Agency.Tier3DirectRate,
                                            Tier2SaleToTier1Rate = x.Agency.Tier2SaleToTier1Rate,
                                            Tier3SaleToTier1Rate = x.Agency.Tier3SaleToTier1Rate,
                                            Tier3SaleToTier2Rate = x.Agency.Tier3SaleToTier2Rate,
                                        })
                                        .AsQueryable();

            // search the dbase taking into consideration table sorting and paging
            if (!string.IsNullOrEmpty(searchBy))
            {
                filteredResultsCount = _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && (x.AffiliateId.HasValue && x.AffiliateId > 0 && x.AgencyId.HasValue && !x.IsIntroducedById.HasValue))
                        .Count(x => !x.IsDeleted && ((x.FirstName ?? "").ToLower().Contains(searchBy) || (x.LastName ?? "").ToLower().Contains(searchBy) || x.Email.ToLower().Contains(searchBy)));

                topAgencyAffiliates = topAgencyAffiliates.Where(x => (x.FirstName ?? "").ToLower().Contains(searchBy) || (x.LastName ?? "").ToLower().Contains(searchBy) || x.Email.ToLower().Contains(searchBy));
            }

            return topAgencyAffiliates.OrderBy(sortBy, sortDir).Skip(skip).Take(take).ToList();
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoUpdateAllTopAgencyAffiliateRate(string name, int value, int agencyId)
        {
            try
            {
                var agencyAffiliate = _agencyService.Queryable().FirstOrDefault(x => x.Id == agencyId);

                var property = typeof(Agency).GetProperty(name);
                property.SetValue(agencyAffiliate, value, null);
                _agencyService.Update(agencyAffiliate);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, isLocked = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [Permission(EnumRole.Admin)]
        public IActionResult StandardAffiliate(int id, string tab)
        {
            var user = _sysUserService
                .Query()
                .Include(x => x.Affiliate)
                .FirstOrDefault(x => x.Id == id && x.AffiliateId.GetValueOrDefault(0) > 0);
            var viewModel = Mapper.Map<StandardAffiliateAdminViewModel>(user);

            viewModel.IsKYCVerificationActivated = bool.Parse(_settingService.Queryable().FirstOrDefault(x => x.Name == CPLConstant.IsKYCVerificationActivated).Value);

            // Affiliate url
            viewModel.AffiliateUrl = $"{HttpContext.Request.Scheme}://{HttpContext.Request.Host}" + Url.Action("Register", "Authentication", new { id = viewModel.Id });

            // Total sale
            SqlParameter TotalAffiliateSaleParam = new SqlParameter()
            {
                ParameterName = "@TotalSale",
                SqlDbType = SqlDbType.Money,
                Direction = ParameterDirection.Output,
                IsNullable = true
            };
            SqlParameter TodayAffiliateSaleParam = new SqlParameter()
            {
                ParameterName = "@TodaySale",
                SqlDbType = SqlDbType.Money,
                Direction = ParameterDirection.Output,
                IsNullable = true
            };
            SqlParameter YesterdayAffiliateSaleParam = new SqlParameter()
            {
                ParameterName = "@YesterdaySale",
                SqlDbType = SqlDbType.Money,
                Direction = ParameterDirection.Output,
                IsNullable = true
            };
            SqlParameter[] parameters = {
                new SqlParameter() {
                    ParameterName = "@SysUserId",
                    SqlDbType = SqlDbType.Int,
                    Value = user.Id,
                    Direction = ParameterDirection.Input
                },
                TotalAffiliateSaleParam, TodayAffiliateSaleParam, YesterdayAffiliateSaleParam
            };

            _dataContextAsync.ExecuteSqlCommand("exec dbo.usp_GetAffiliateSale @SysUserId, @TotalSale OUTPUT, @TodaySale OUTPUT, @YesterdaySale OUTPUT", parameters);

            viewModel.TotalAffiliateSale = Convert.ToInt32((TotalAffiliateSaleParam.Value as int?).GetValueOrDefault(0));
            viewModel.TodayAffiliateSale = Convert.ToInt32((TodayAffiliateSaleParam.Value as int?).GetValueOrDefault(0));
            viewModel.YesterdayAffiliateSale = Convert.ToInt32((YesterdayAffiliateSaleParam.Value as int?).GetValueOrDefault(0));

            // Total user register
            viewModel.TotalIntroducedUsers = _sysUserService.Queryable()
                                           .Count(x => x.IsIntroducedById != null && x.IsIntroducedById == user.Id);
            viewModel.TotalIntroducedUserToday = _sysUserService.Queryable()
                                            .Where(x => x.IsIntroducedById.HasValue && x.IsIntroducedById.Value == user.Id
                                            && x.AffiliateCreatedDate.HasValue && x.AffiliateCreatedDate.Value.Date == DateTime.Now.Date).Count();
            viewModel.TotalIntroducedUsersYesterday = _sysUserService.Queryable()
                                            .Where(x => x.IsIntroducedById.HasValue && x.IsIntroducedById.Value == user.Id
                                            && x.AffiliateCreatedDate.HasValue && x.AffiliateCreatedDate.Value.Date == DateTime.Now.AddDays(-1).Date).Count();

            viewModel.StandardAffiliateRate = new StandardAffiliateRateViewModel
            {
                Tier1DirectRate = user.Affiliate.Tier1DirectRate,
                Tier2SaleToTier1Rate = user.Affiliate.Tier2SaleToTier1Rate,
                Tier3SaleToTier1Rate = user.Affiliate.Tier3SaleToTier1Rate,
            };

            viewModel.StandardAffiliateSetting = new AffiliateSettingViewModel
            {
                IsTier2TabVisible = user.Affiliate.IsTier2TabVisible,
                IsTier3TabVisible = user.Affiliate.IsTier3TabVisible,
                IsAutoPaymentEnable = user.Affiliate.IsAutoPaymentEnable,
            };

            viewModel.CanDoPayment = this.TokenToBePaid(id) > 0 ? true : false;

            viewModel.Tab = tab;

            return View(viewModel);
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetTier1StandardAffiliateStatistics(int sysUserId, int periodInDay, int pageSize = 10, int pageIndex = 1,
                                                    string orderColumn = "UsedCPL", string orderDirection = "desc", string searchValue = "")
        {
            List<SqlParameter> storeParams = new List<SqlParameter>() {
                    new SqlParameter() {ParameterName = "@SysUserId", SqlDbType = SqlDbType.Int, Value= sysUserId},
                    new SqlParameter() {ParameterName = "@PeriodInDay", SqlDbType = SqlDbType.Int, Value = periodInDay},
                };

            var dataSet = _dataContextAsync.ExecuteStoredProcedure("usp_GetAffiliateInfo_Tier1_Statistics", storeParams);

            var totalAffiliateSaleChanges = new List<SummaryChange>();
            var directAffiliateSaleChanges = new List<SummaryChange>();
            var totalIntroducedUsersChanges = new List<SummaryChange>();
            var directIntroducedUsersChanges = new List<SummaryChange>();

            for (int i = 0; i < dataSet.Tables[1].Rows.Count; i++)
            {
                totalAffiliateSaleChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["TotalAffiliateSale"])) });
                directAffiliateSaleChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["DirectAffiliateSale"])) });
                totalIntroducedUsersChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["TotalIntroducedUsers"])) });
                directIntroducedUsersChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["DirectIntroducedUsers"])) });
            }

            //Table[0]//////////////////////////////////////////////////////
            //TotalSale|DirectSale|TotalIntroducedUsers|DirectIntroducedUsers
            //123//////456/////////789//////////////////10//////////////////
            var viewModel = new Tier1StandardAffiliateInfoAdminViewModel
            {
                TotalAffiliateSale = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[0]),
                DirectAffiliateSale = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[1]),
                TotalIntroducedUsers = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[2]),
                DirectIntroducedUsers = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[3]),

                TotalAffiliateSaleChangesInJson = JsonConvert.SerializeObject(totalAffiliateSaleChanges),
                DirectAffiliateSaleChangesInJson = JsonConvert.SerializeObject(directAffiliateSaleChanges),
                TotalIntroducedUsersChangesInJson = JsonConvert.SerializeObject(totalIntroducedUsersChanges),
                DirectIntroducedUsersChangesInJson = JsonConvert.SerializeObject(directIntroducedUsersChanges),
            };

            return PartialView("_Tier1StandardAffiliateStatistics", viewModel);
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetNonTier1StandardAffiliateStatistics(int sysUserId, int periodInDay, string kindOfTier, int pageSize = 10, int pageIndex = 1,
                                                    string orderColumn = "UsedCPL", string orderDirection = "desc", string searchValue = "")
        {
            List<SqlParameter> storeParams = new List<SqlParameter>() {
                    new SqlParameter() {ParameterName = "@Tier", SqlDbType = SqlDbType.Int, Value= int.Parse(kindOfTier)},
                    new SqlParameter() {ParameterName = "@SysUserId", SqlDbType = SqlDbType.Int, Value= sysUserId},
                    new SqlParameter() {ParameterName = "@PeriodInDay", SqlDbType = SqlDbType.Int, Value = periodInDay},
                };

            var dataSet = _dataContextAsync.ExecuteStoredProcedure("usp_GetAffiliateInfo_NonTier1_Statistics", storeParams);

            var totalAffiliateSaleChanges = new List<SummaryChange>();

            for (int i = 0; i < dataSet.Tables[1].Rows.Count; i++)
            {
                totalAffiliateSaleChanges.Add(new SummaryChange { Date = DateTime.Parse(((dataSet.Tables[1].Rows[i])["Date"]).ToString()), Value = Convert.ToInt32(((dataSet.Tables[1].Rows[i])["TotalAffiliateSale"])) });
            }

            //Table[0]//////////////////////////////////////////////////////
            //TotalSale
            //123//////
            var viewModel = new NonTier1StandardAffiliateInfoAdminViewModel
            {
                TotalAffiliateSale = Convert.ToInt32(dataSet.Tables[0].Rows[0].ItemArray[0]),

                TotalAffiliateSaleChangesInJson = JsonConvert.SerializeObject(totalAffiliateSaleChanges),
            };

            return PartialView("_NonTier1StandardAffiliateStatistics", viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchStandardAffiliateIntroducedUsers(DataTableAjaxPostModel viewModel, int sysUserId, string kindOfTier, int periodInDay)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchStandardAffiliateIntroducedUsersFunc(viewModel, out filteredResultsCount, out totalResultsCount, sysUserId, kindOfTier, periodInDay);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<StandardAffiliateIntroducedUsersAdminViewModel> SearchStandardAffiliateIntroducedUsersFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount, int sysUserId, string kindOfTier, int periodInDay)
        {
            var searchBy = (model.search.value != null) ? model.search.value : string.Empty;
            var pageSize = model.length;
            var pageIndex = model.start + 1;

            string sortBy = string.Empty;
            string sortDir = "UsedCPL";

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower();
            }

            var uspName = string.Empty;

            List<StandardAffiliateIntroducedUsersAdminViewModel> viewModel = new List<StandardAffiliateIntroducedUsersAdminViewModel>();
            List<SqlParameter> storeParams = new List<SqlParameter>();

            if (kindOfTier == ((int)EnumKindOfTier.TIER1).ToString())
            {
                storeParams = new List<SqlParameter>()            {
                    new SqlParameter() { ParameterName = "@SysUserId", SqlDbType = SqlDbType.Int, Value = sysUserId},
                    new SqlParameter() { ParameterName = "@PeriodInDay", SqlDbType = SqlDbType.Int, Value = periodInDay},
                    new SqlParameter() { ParameterName = "@PageSize", SqlDbType = SqlDbType.Int, Value = pageSize},
                    new SqlParameter() { ParameterName = "@PageIndex", SqlDbType = SqlDbType.Int, Value = pageIndex},
                    new SqlParameter() { ParameterName = "@OrderColumn", SqlDbType = SqlDbType.NVarChar, Value = sortBy},
                    new SqlParameter() { ParameterName = "@OrderDirection", SqlDbType = SqlDbType.NVarChar, Value = sortDir},
                    new SqlParameter() { ParameterName = "@SearchValue", SqlDbType = SqlDbType.NVarChar, Value = searchBy},
                };

                uspName = "usp_GetAffiliateInfo_Tier1_IntroducedUsers";

            }
            else
            {
                storeParams = new List<SqlParameter>()            {
                    new SqlParameter() { ParameterName = "@Tier", SqlDbType = SqlDbType.Int, Value = int.Parse(kindOfTier)},
                    new SqlParameter() { ParameterName = "@SysUserId", SqlDbType = SqlDbType.Int, Value = sysUserId},
                    new SqlParameter() { ParameterName = "@PeriodInDay", SqlDbType = SqlDbType.Int, Value = periodInDay},
                    new SqlParameter() { ParameterName = "@PageSize", SqlDbType = SqlDbType.Int, Value = pageSize},
                    new SqlParameter() { ParameterName = "@PageIndex", SqlDbType = SqlDbType.Int, Value = pageIndex},
                    new SqlParameter() { ParameterName = "@OrderColumn", SqlDbType = SqlDbType.NVarChar, Value = sortBy},
                    new SqlParameter() { ParameterName = "@OrderDirection", SqlDbType = SqlDbType.NVarChar, Value = sortDir},
                    new SqlParameter() { ParameterName = "@SearchValue", SqlDbType = SqlDbType.NVarChar, Value = searchBy},
                };

                uspName = "usp_GetAffiliateInfo_NonTier1_IntroducedUsers";
            }

            var dataSet = _dataContextAsync.ExecuteStoredProcedure(uspName, storeParams);
            DataTable table = dataSet.Tables[0];
            var rows = new List<DataRow>(table.Rows.OfType<DataRow>()); //  the Rows property of the DataTable object is a collection that implements IEnumerable but not IEnumerable<T>
            var viewModels = Mapper.Map<List<DataRow>, List<StandardAffiliateIntroducedUsersAdminViewModel>>(rows);

            totalResultsCount = Convert.ToInt32((dataSet.Tables[1].Rows[0])["TotalCount"]);
            filteredResultsCount = Convert.ToInt32((dataSet.Tables[2].Rows[0])["FilteredCount"]);

            return viewModels;
        }

        #endregion

        #region User
        [Permission(EnumRole.Admin)]
        public IActionResult AllUser()
        {
            var viewModel = new AllUserViewModel();
            return View(viewModel);
        }

        [Permission(EnumRole.Admin)]
        public new IActionResult User(int id)
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == id);
            var viewModel = Mapper.Map<UserDashboardAdminViewModel>(user);
            return View(viewModel);
        }

        [Permission(EnumRole.Admin)]
        public IActionResult EditUser(int id)
        {
            var user = _sysUserService.Queryable()
                .FirstOrDefault(x => x.Id == id);

            return PartialView("_EditUser", Mapper.Map<SysUserViewModel>(user));
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoEditUser(SysUserViewModel viewModel)
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == viewModel.Id);
            if (user != null)
            {
                var existingUser = _sysUserService.Queryable().FirstOrDefault(x => x.Email == viewModel.Email);
                if (existingUser != null && existingUser.Id != viewModel.Id)
                    return new JsonResult(new { success = false, name = "email", message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "InvalidOrExistingEmail") });

                user.FirstName = viewModel.FirstName;
                user.LastName = viewModel.LastName;
                user.Mobile = viewModel.Mobile;
                user.Email = viewModel.Email;
                if (!string.IsNullOrEmpty(viewModel.Password))
                    user.Password = viewModel.Password.ToBCrypt();
                //user.StreetAddress = viewModel.StreetAddress.ToLower();
                user.TwoFactorAuthenticationEnable = viewModel.TwoFactorAuthenticationEnable;

                _sysUserService.Update(user);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }

            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "NonExistingAccount") });
        }

        [HttpPost]
        [Permission(EnumRole.Admin, EnumEntity.SysUser, EnumAction.Delete)]
        public IActionResult DoDeleteUser(int id)
        {
            var user = _sysUserService.Queryable()
                .FirstOrDefault(x => x.Id == id);

            if (user != null)
            {
                user.IsDeleted = true;

                _sysUserService.Update(user);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "DeleteSuccessfully") });
            }
            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "NonExistingAccount") });
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchAllUser(DataTableAjaxPostModel viewModel)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchAllUserFunc(viewModel, out filteredResultsCount, out totalResultsCount);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<SysUserViewModel> SearchAllUserFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            var searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            // search the dbase taking into consideration table sorting and paging
            if (string.IsNullOrEmpty(searchBy))
            {
                filteredResultsCount = _sysUserService.Queryable()
                        .Count(x => !x.IsDeleted);

                totalResultsCount = _sysUserService.Queryable()
                        .Count(x => !x.IsDeleted);

                // total CPL used and total CPL awarded in lottery game 
                var lotteryHistories = _lotteryHistoryService.Query()
                                    .Include(x => x.Lottery)
                                    .Include(x => x.LotteryPrize)
                                    .AsQueryable()
                                    .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                                    .GroupBy(x => x.SysUserId)
                                    .Select(y => new SysUserViewModel { Id = y.Key, TotalCPLUsed = y.Sum(x => x.Lottery.UnitPrice), TotalCPLAwarded = (int)y.Sum(x => (x.LotteryPrize != null) ? x.LotteryPrize.Value : 0) });

                // total CPL used and total CPL awarded in priceprediction game 
                var pricePredictionHistories = _pricePredictionHistoryService.Queryable()
                                    .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                                    .GroupBy(x => x.SysUserId)
                                    .Select(y => new SysUserViewModel { Id = y.Key, TotalCPLUsed = (int)y.Sum(x => x.Amount), TotalCPLAwarded = (int)y.Sum(x => x.Award ?? 0) });

                // total CPL used and total CPL awarded in all game 
                var histories = lotteryHistories.Concat(pricePredictionHistories).ToList()
                                    .GroupBy(x => x.Id)
                                    .Select(y => new SysUserViewModel { Id = y.Key, TotalCPLUsed = y.Sum(x => x.TotalCPLUsed), TotalCPLAwarded = y.Sum(x => x.TotalCPLAwarded) });

                var sysUsers = _sysUserService.Queryable().Where(x => !x.IsDeleted)
                            .Skip(skip)
                            .Take(take)
                            .ToList();

                return sysUsers.LeftOuterJoin(histories, user => user.Id,
                                                    history => history.Id,
                                                    (user, history) => new SysUserViewModel()
                                                    {
                                                        Id = user.Id,
                                                        Email = user.Email,
                                                        FirstName = user.FirstName,
                                                        LastName = user.LastName,
                                                        StreetAddress = user.StreetAddress,
                                                        Mobile = user.Mobile,
                                                        CreatedDateInString = user.CreatedDate.ToString("yyyy/MM/dd"),
                                                        Country = user.Country,
                                                        City = user.City,
                                                        IsDeleted = user.IsDeleted,
                                                        TokenAmount = user.TokenAmount,
                                                        TotalCPLUsed = (history != null) ? history.TotalCPLUsed : 0,
                                                        TotalCPLAwarded = (history != null) ? history.TotalCPLAwarded : 0,
                                                        TotalCPLUsedInString = (history != null) ? history.TotalCPLUsed.ToString(CPLConstant.Format.Amount) : "0",
                                                        TotalCPLAwardedInString = (history != null) ? history.TotalCPLAwarded.ToString(CPLConstant.Format.Amount) : "0"
                                                    })
                                                    .AsQueryable()
                                                    .OrderBy(sortBy, sortDir)
                                                    .ToList();
            }
            else
            {
                filteredResultsCount = _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && (x.FirstName.Contains(searchBy) || x.LastName.Contains(searchBy)
                        || x.Email.Contains(searchBy) || x.StreetAddress.Contains(searchBy) || x.Mobile.Contains(searchBy)))
                        .Count();

                totalResultsCount = _sysUserService.Queryable().Where(x => !x.IsDeleted)
                        .Count();

                // total CPL used and total CPL awarded in lottery game 
                var lotteryHistories = _lotteryHistoryService.Query()
                                    .Include(x => x.Lottery)
                                    .Include(x => x.LotteryPrize)
                                    .AsQueryable()
                                    .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                                    .GroupBy(x => x.SysUserId)
                                    .Select(y => new SysUserViewModel { Id = y.Key, TotalCPLUsed = y.Sum(x => x.Lottery.UnitPrice), TotalCPLAwarded = (int)y.Sum(x => (x.LotteryPrize != null) ? x.LotteryPrize.Value : 0) });

                // total CPL used and total CPL awarded in priceprediction game 
                var pricePredictionHistories = _pricePredictionHistoryService.Queryable()
                                    .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                                    .GroupBy(x => x.SysUserId)
                                    .Select(y => new SysUserViewModel { Id = y.Key, TotalCPLUsed = (int)y.Sum(x => x.Amount), TotalCPLAwarded = (int)y.Sum(x => x.Award ?? 0) });

                // total CPL used and total CPL awarded in all game 
                var histories = lotteryHistories.Concat(pricePredictionHistories).ToList()
                                    .GroupBy(x => x.Id)
                                    .Select(y => new SysUserViewModel { Id = y.Key, TotalCPLUsed = y.Sum(x => x.TotalCPLUsed), TotalCPLAwarded = y.Sum(x => x.TotalCPLAwarded) });

                var sysUsers = _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && (x.FirstName.Contains(searchBy) || x.LastName.Contains(searchBy)
                        || x.Email.Contains(searchBy) || x.StreetAddress.Contains(searchBy) || x.Mobile.Contains(searchBy)))
                        .Skip(skip)
                        .Take(take);

                return sysUsers.LeftOuterJoin(histories, user => user.Id,
                                                    history => history.Id,
                                                    (user, history) => new SysUserViewModel()
                                                    {
                                                        Id = user.Id,
                                                        Email = user.Email,
                                                        FirstName = user.FirstName,
                                                        LastName = user.LastName,
                                                        StreetAddress = user.StreetAddress,
                                                        Mobile = user.Mobile,
                                                        CreatedDateInString = user.CreatedDate.ToString("yyyy/MM/dd"),
                                                        Country = user.Country,
                                                        City = user.City,
                                                        IsDeleted = user.IsDeleted,
                                                        TokenAmount = user.TokenAmount,
                                                        TotalCPLUsed = (history != null) ? history.TotalCPLUsed : 0,
                                                        TotalCPLAwarded = (history != null) ? history.TotalCPLAwarded : 0,
                                                        TotalCPLUsedInString = (history != null) ? history.TotalCPLUsed.ToString(CPLConstant.Format.Amount) : "0",
                                                        TotalCPLAwardedInString = (history != null) ? history.TotalCPLAwarded.ToString(CPLConstant.Format.Amount) : "0"
                                                    })
                                                    .AsQueryable()
                                                    .OrderBy(sortBy, sortDir)
                                                    .ToList();
            }
        }
        #endregion

        #region KYC
        [Permission(EnumRole.Admin)]
        public IActionResult KYCVerify()
        {
            var viewModel = new KYCVerifyViewModel();
            return View(viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoAcceptKYCVerify(int id)
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == id);
            user.KYCVerified = true;

            // Save DB
            _sysUserService.Update(user);
            _unitOfWork.SaveChanges();

            // Send email
            var template = _templateService.Queryable().FirstOrDefault(x => x.Name == EnumTemplate.KYCVerify.ToString());
            var kycVerifyEmailTemplateViewModel = Mapper.Map<KYCVerifyEmailTemplateViewModel>(user);
            kycVerifyEmailTemplateViewModel.RootUrl = $"{HttpContext.Request.Scheme}://{HttpContext.Request.Host}";
            kycVerifyEmailTemplateViewModel.KYCVerifiedText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "KYCVerified");
            kycVerifyEmailTemplateViewModel.HiText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Hi");
            kycVerifyEmailTemplateViewModel.KYCVerifiedDescriptionText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "KYCVerifiedDescription");
            kycVerifyEmailTemplateViewModel.CheersText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Cheers");
            kycVerifyEmailTemplateViewModel.ContactInfoText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ContactInfo");
            kycVerifyEmailTemplateViewModel.EmailText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Email");
            kycVerifyEmailTemplateViewModel.WebsiteText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Website");
            kycVerifyEmailTemplateViewModel.CPLTeamText = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "CPLTeam");

            template.Body = _viewRenderService.RenderToStringAsync("/Views/Admin/_KYCVerifyEmailTemplate.cshtml", kycVerifyEmailTemplateViewModel).Result;
            EmailHelper.Send(Mapper.Map<TemplateViewModel>(template), user.Email);

            return new JsonResult(new { success = true, message = user.FirstName + $" {LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "KYCVerifiedEmailSent")}" });
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoCancelKYCVerify(int id)
        {
            var user = _sysUserService.Queryable().FirstOrDefault(x => x.Id == id);
            user.KYCVerified = null;
            user.KYCCreatedDate = null;
            user.FrontSide = null;
            user.BackSide = null;

            _sysUserService.Update(user);
            _unitOfWork.SaveChanges();

            return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "CancelSuccessfully") });
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchKYCVerify(DataTableAjaxPostModel viewModel)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchKYCVerifyFunc(viewModel, out filteredResultsCount, out totalResultsCount);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<SysUserViewModel> SearchKYCVerifyFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            var searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            // search the dbase taking into consideration table sorting and paging
            if (string.IsNullOrEmpty(searchBy))
            {
                filteredResultsCount = _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && x.KYCVerified.HasValue)
                        .Count();

                totalResultsCount = _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && x.KYCVerified.HasValue)
                        .Count();

                return _sysUserService.Queryable()
                            .Where(x => !x.IsDeleted && x.KYCVerified.HasValue)
                            .OrderBy("KYCCreatedDate", false)
                            .Select(x => Mapper.Map<SysUserViewModel>(x))
                            .OrderBy(sortBy, sortDir)
                            .Skip(skip)
                            .Take(take)
                            .ToList();
            }
            else
            {
                filteredResultsCount = _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && x.KYCVerified.HasValue)
                        .Where(x => x.FirstName.Contains(searchBy) || x.LastName.Contains(searchBy)
                        || x.Email.Contains(searchBy))
                        .Count();

                totalResultsCount = _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && x.KYCVerified.HasValue)
                        .Count();

                return _sysUserService.Queryable()
                        .Where(x => !x.IsDeleted && x.KYCVerified.HasValue)
                        .Where(x => x.FirstName.Contains(searchBy) || x.LastName.Contains(searchBy)
                        || x.Email.Contains(searchBy))
                        .Select(x => Mapper.Map<SysUserViewModel>(x))
                        .OrderBy(sortBy, sortDir)
                        .Skip(skip)
                        .Take(take)
                        .ToList();
            }
        }
        #endregion

        #region News
        [Permission(EnumRole.Admin)]
        public IActionResult News()
        {
            var viewModel = new NewsViewModel();
            return View(viewModel);
        }

        [Permission(EnumRole.Admin)]
        public IActionResult EditNews(int id)
        {
            var news = new NewsViewModel();
            if (id > 0)
            {
                news = Mapper.Map<NewsViewModel>(_newsService.Queryable().FirstOrDefault(x => x.Id == id));
            }
            return PartialView("_EditNews", news);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoEditNews(NewsViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                var news = _newsService.Queryable()
                .FirstOrDefault(x => x.Id == viewModel.Id);
                if (viewModel.FileImage != null)
                {
                    string timestamp = DateTime.Now.ToString("yyyyMMddhhmmss");
                    var newsPath = Path.Combine(_hostingEnvironment.WebRootPath, @"images\news");
                    var image = $"News_{timestamp}_{viewModel.FileImage.FileName}";
                    var frontSidePath = Path.Combine(newsPath, image);
                    viewModel.FileImage.CopyTo(new FileStream(frontSidePath, FileMode.Create));
                    news.Image = image;
                }

                news.Title = viewModel.Title;
                news.ShortDescription = viewModel.ShortDescription;
                news.Description = viewModel.Description;
                _newsService.Update(news);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoAddNews(NewsViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                if (viewModel.FileImage != null)
                {
                    string timestamp = DateTime.Now.ToString("yyyyMMddhhmmss");
                    var newsPath = Path.Combine(_hostingEnvironment.WebRootPath, @"images\news");
                    var image = $"News_{timestamp}_{viewModel.FileImage.FileName}";
                    var frontSidePath = Path.Combine(newsPath, image);
                    viewModel.FileImage.CopyTo(new FileStream(frontSidePath, FileMode.Create));

                    _newsService.Insert(new Domain.News { Title = viewModel.Title, CreatedDate = DateTime.Now, Description = viewModel.Description, ShortDescription = viewModel.ShortDescription, Image = image });
                }
                else
                    _newsService.Insert(new Domain.News { Title = viewModel.Title, CreatedDate = DateTime.Now, Description = viewModel.Description, ShortDescription = viewModel.ShortDescription });
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AddSuccessfully") });
            }
            return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoDeleteNews(int id)
        {
            var news = _newsService.Queryable()
            .FirstOrDefault(x => x.Id == id);
            if (news != null)
            {
                _newsService.Delete(news);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "DeleteSuccessfully") });
            }
            else
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchNews(DataTableAjaxPostModel viewModel)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchNewsFunc(viewModel, out filteredResultsCount, out totalResultsCount);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<NewsViewModel> SearchNewsFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            var searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            // search the dbase taking into consideration table sorting and paging
            if (string.IsNullOrEmpty(searchBy))
            {
                filteredResultsCount = _newsService.Queryable()
                        .Count();

                totalResultsCount = _newsService.Queryable()
                        .Count();

                return _newsService.Queryable()
                            .Select(x => Mapper.Map<NewsViewModel>(x))
                            .OrderBy(sortBy, sortDir)
                            .Skip(skip)
                            .Take(take)
                            .ToList();
            }
            else
            {
                filteredResultsCount = _newsService.Queryable()
                        .Where(x => x.Title.Contains(searchBy) || x.ShortDescription.Contains(searchBy))
                        .Count();

                totalResultsCount = _newsService.Queryable()
                        .Count();

                return _newsService.Queryable()
                        .Where(x => x.Title.Contains(searchBy) || x.ShortDescription.Contains(searchBy))
                        .Select(x => Mapper.Map<NewsViewModel>(x))
                        .OrderBy(sortBy, sortDir)
                        .Skip(skip)
                        .Take(take)
                        .ToList();
            }
        }
        #endregion

        #region Game
        [Permission(EnumRole.Admin)]
        public IActionResult Game(string tab)
        {
            var viewModel = new GameManagementIndexViewModel();
            viewModel.Tab = tab;
            viewModel.LotteryCategories = _lotteryCategoryService.Queryable().Select(x => Mapper.Map<LotteryCategoryAdminViewModel>(x)).ToList();
            viewModel.PricePredictionCategories = _pricePredictionCategoryService
                .Queryable()
                .Include(x => x.PricePredictionCategoryDetails)
                .Select(x => new PricePredictionCategoryAdminViewModel
                {
                    Id = x.Id,
                    Name = x.PricePredictionCategoryDetails.FirstOrDefault(y => y.LangId == HttpContext.Session.GetInt32("LangId").Value).Name,
                    Description = x.PricePredictionCategoryDetails.FirstOrDefault(y => y.LangId == HttpContext.Session.GetInt32("LangId").Value).Description,
                }).ToList();

            return View(viewModel);
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetSummaryStatistics(int periodInDay)
        {
            var viewModel = new SummaryStatisticsViewModel();

            // 1.STATISTICAL INFORMATION 
            // 1.STATISTICAL INFORMATION - TOTAL REVENUE
            var lotteryTotalUses = _lotteryHistoryService.Query()
                .Include(x => x.Lottery)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => x.Lottery.UnitPrice);

            var lotteryTotalAward = _lotteryHistoryService.Query()
                .Include(x => x.LotteryPrize)
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => (x.LotteryPrizeId.HasValue ? x.LotteryPrize.Value : 0));

            var lotteryTotalRevenue = lotteryTotalUses - lotteryTotalAward;

            var pricePredictionTotalUse = _pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => x.Amount);

            var pricePredictionTotalAward = _pricePredictionHistoryService.Queryable()
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => x.TotalAward.GetValueOrDefault(0));

            var pricePredictionTotalRevenue = pricePredictionTotalUse - pricePredictionTotalAward;

            viewModel.TotalRevenue = Convert.ToInt32(lotteryTotalRevenue + pricePredictionTotalRevenue);

            // 1.STATISTICAL INFORMATION - TOTAL SALE
            var lotteryTotalSale = _lotteryHistoryService.Query().Include(x => x.Lottery)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => x.Lottery.UnitPrice);
            var pricePredictionTotalSale = _pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => x.Amount);
            viewModel.TotalSale = lotteryTotalSale + (int)pricePredictionTotalSale;

            // 1.STATISTICAL INFORMATION - PAGE VIEWS
            var homeViewId = _settingService.Queryable().FirstOrDefault(x => x.Name == Analytic.HomeViewId).Value;
            var homePageViews = _analyticService.GetPageViews(homeViewId, DateTime.Now.AddDays(-periodInDay), DateTime.Now);
            viewModel.PageView = homePageViews.AsQueryable().Sum(x => x.Count);

            // 1.STATISTICAL INFORMATION - TOTAL PLAYERS
            var lotteryTotalPlayers = _lotteryHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Select(x => x.SysUserId);

            var pricePredictionTotalPlayers = _pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Select(x => x.SysUserId);

            viewModel.TotalPlayers = lotteryTotalPlayers.Concat(pricePredictionTotalPlayers)
                .Distinct()
                .Count();

            // 1.STATISTICAL INFORMATION - TODAY PLAYERS
            viewModel.TodayPlayers = _lotteryHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date == DateTime.Now.Date && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.SysUserId)
                .Count()
                +
                _pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date == DateTime.Now.Date && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.SysUserId)
                .Count();

            // 2.STATISTICAL CHART
            // 2.STATISTICAL CHART - TOTAL SALE CHANGES
            var lotterySale = _lotteryHistoryService.Query().Include(x => x.Lottery)
                        .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new SummaryChange
                        {
                            Date = y.Select(x => x.CreatedDate.Date).FirstOrDefault(),
                            Value = y.Sum(x => x.Lottery.UnitPrice)
                        });

            var pricePredictionSale = _pricePredictionHistoryService.Queryable()
                        .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new SummaryChange
                        {
                            Date = y.Select(x => x.CreatedDate.Date).FirstOrDefault(),
                            Value = y.Sum(x => (int)x.Amount)
                        });

            viewModel.TotalSaleChangesInJson = JsonConvert.SerializeObject((lotterySale ?? Enumerable.Empty<SummaryChange>())
                .Concat(pricePredictionSale ?? Enumerable.Empty<SummaryChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Select(x => x.Date).FirstOrDefault(),
                    Value = y.Sum(x => x.Value)
                })
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL REVENUE CHANGES
            var lotteryUses = _lotteryHistoryService
                .Query()
                .Include(x => x.Lottery)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.CreatedDate.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = y.Sum(x => x.Lottery.UnitPrice)
                }).ToList();

            var lotteryAwards = _lotteryHistoryService
                .Query()
                .Include(x => x.LotteryPrize)
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.UpdatedDate.GetValueOrDefault().Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = -(int)y.Sum(x => x.LotteryPrizeId.HasValue ? x.LotteryPrize.Value : 0) // "-" stand for lost token.
                }).ToList();

            var lotteryRevenue = lotteryUses.Union(lotteryAwards)
                                  .GroupBy(x => x.Date)
                                  .Select(x => new SummaryChange
                                  {
                                      Date = x.Key,
                                      Value = x.Sum(y => y.Value)
                                  })
                                  .ToList();

            var pricePredictionUses = _pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.CreatedDate.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = (int)y.Sum(x => x.Amount)
                })
                .ToList();

            var pricePredictionAwards = _pricePredictionHistoryService.Queryable()
            .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
            .GroupBy(x => x.UpdatedDate.GetValueOrDefault().Date)
            .Select(y => new SummaryChange
            {
                Date = y.Key,
                Value = -(int)y.Sum(x => x.TotalAward.GetValueOrDefault(0)) // "-" stand for lost token.
            })
            .ToList();

            var pricePredictionRevenue = pricePredictionUses.Union(pricePredictionAwards)
                                                            .GroupBy(x => x.Date)
                                                            .Select(x => new SummaryChange
                                                            {
                                                                Date = x.Key,
                                                                Value = x.Sum(y => y.Value)
                                                            })
                                                            .ToList();

            viewModel.TotalRevenueChangesInJson = JsonConvert.SerializeObject((lotteryRevenue ?? Enumerable.Empty<SummaryChange>())
                .Concat(pricePredictionRevenue ?? Enumerable.Empty<SummaryChange>()).GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = y.Sum(x => x.Value)
                }).OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - PAGE VIEW CHANGES
            viewModel.PageViewChangesInJson = JsonConvert.SerializeObject(homePageViews
                .OrderBy(x => x.Date)
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Select(x => x.Date).FirstOrDefault(),
                    Value = y.Sum(x => x.Count)
                })
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL PLAYERS
            var lotteryPlayers = _lotteryHistoryService.Queryable()
                        .Where(x => x.Result != EnumGameResult.REFUND.ToString() && (periodInDay > 0 ? x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) : x.CreatedDate <= DateTime.Now))
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new PlayersChange
                        {
                            Date = y.Select(x => x.CreatedDate.Date).FirstOrDefault(),
                            SysUserIds = y.Select(x => x.SysUserId)
                        }).ToList();

            var pricePredictionPlayers = _pricePredictionHistoryService.Queryable()
                        .Where(x => x.Result != EnumGameResult.REFUND.ToString() && (periodInDay > 0 ? x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) : x.CreatedDate <= DateTime.Now))
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new PlayersChange
                        {
                            Date = y.Select(x => x.CreatedDate.Date).FirstOrDefault(),
                            SysUserIds = y.Select(x => x.SysUserId)
                        })
                        .ToList();

            viewModel.TotalPlayersChangesInJson = JsonConvert.SerializeObject((lotteryPlayers ?? Enumerable.Empty<PlayersChange>())
                .Concat(pricePredictionPlayers ?? Enumerable.Empty<PlayersChange>()).GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Select(x => x.Date).FirstOrDefault(),
                    Value = y.SelectMany(x => x.SysUserIds).Distinct().Count()
                })
                .OrderBy(x => x.Date)
                .ToList());

            return PartialView("_SummaryStatistics", viewModel);
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetSummaryRevenuePieChart()
        {
            var data = new List<PieChartData>();
            var totalSaleLotteryGame = _lotteryHistoryService.Query()
                                .Include(x => x.Lottery)
                                .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                                .Select(x => x.Lottery).Sum(y => y.UnitPrice);
            var totalAwardLotteryGame = _lotteryHistoryService.Query()
                .Include(x => x.LotteryPrize)
                .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                .Select(x => x.LotteryPrize).Sum(y => y.Value);
            var revenueInLotteryGame = totalSaleLotteryGame - totalAwardLotteryGame;

            // price prediction game
            var totalSalePricePrediction = _pricePredictionHistoryService.Queryable()
                                                .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                                                .Sum(x => x.Amount);
            var totalAwardPricePrediction = _pricePredictionHistoryService.Queryable()
                                                .Where(x => x.Result != EnumGameResult.REFUND.ToString())
                                                .Sum(x => x.TotalAward);
            var revenueInPricePredictionGame = totalSalePricePrediction - totalAwardPricePrediction;

            var lotteryChartData = new PieChartData {
                Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Lottery"),
                Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)1),
                Value = revenueInLotteryGame
            };
            var pricePredictionChartData = new PieChartData {
                Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "PricePrediction"),
                Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)2),
                Value = revenueInPricePredictionGame.GetValueOrDefault(0)
            };

            data.Add(lotteryChartData);
            data.Add(pricePredictionChartData);

            return new JsonResult(new
            {
                success = true,
                seriesName = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Revenue"),
                data = JsonConvert.SerializeObject(data)
            });
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetSummaryDeviceCategoryPieChart()
        {
            var data = new List<PieChartData>();

            var homeViewId = _settingService.Queryable().FirstOrDefault(x => x.Name == Analytic.HomeViewId).Value;
            var deviceCategoriesHome = _analyticService.GetDeviceCategory(homeViewId, FirstDeploymentDate, DateTime.Now);
            var totalDesktopHome = deviceCategoriesHome.Where(x => x.DeviceCategory == EnumDeviceCategory.DESKTOP).Sum(x => x.Count);
            var totalMobileHome = deviceCategoriesHome.Where(x => x.DeviceCategory == EnumDeviceCategory.MOBILE).Sum(x => x.Count);
            var totalTabletHome = deviceCategoriesHome.Where(x => x.DeviceCategory == EnumDeviceCategory.TABLET).Sum(x => x.Count);

            var lotteryViewId = _settingService.Queryable().FirstOrDefault(x => x.Name == Analytic.LotteryViewId).Value;
            var deviceCategoriesLottery = _analyticService.GetDeviceCategory(lotteryViewId, FirstDeploymentDate, DateTime.Now);
            var totalDesktopLottery = deviceCategoriesLottery.Where(x => x.DeviceCategory == EnumDeviceCategory.DESKTOP).Sum(x => x.Count);
            var totalMobileLottery = deviceCategoriesLottery.Where(x => x.DeviceCategory == EnumDeviceCategory.MOBILE).Sum(x => x.Count);
            var totalTabletLottery = deviceCategoriesLottery.Where(x => x.DeviceCategory == EnumDeviceCategory.TABLET).Sum(x => x.Count);

            var pricePredictionViewId = _settingService.Queryable().FirstOrDefault(x => x.Name == Analytic.PricePredictionViewId).Value;
            var deviceCategoriesPricePrediction = _analyticService.GetDeviceCategory(pricePredictionViewId, FirstDeploymentDate, DateTime.Now);
            var totalDesktopPricePrediction = deviceCategoriesPricePrediction.Where(x => x.DeviceCategory == EnumDeviceCategory.DESKTOP).Sum(x => x.Count);
            var totalMobilePricePrediction = deviceCategoriesPricePrediction.Where(x => x.DeviceCategory == EnumDeviceCategory.MOBILE).Sum(x => x.Count);
            var totalTabletPricePrediction = deviceCategoriesPricePrediction.Where(x => x.DeviceCategory == EnumDeviceCategory.TABLET).Sum(x => x.Count);

            var desktopChartData = new PieChartData { Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Desktop"), Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)1), Value = totalDesktopHome + totalDesktopLottery + totalDesktopPricePrediction };
            var mobileChartData = new PieChartData { Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Mobile"), Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)2), Value = totalMobileHome + totalMobileLottery + totalMobilePricePrediction };
            var tabletChartData = new PieChartData { Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Tablet"), Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)3), Value = totalTabletHome + totalTabletLottery + totalTabletPricePrediction };

            data.Add(desktopChartData);
            data.Add(mobileChartData);
            data.Add(tabletChartData);

            return new JsonResult(new
            {
                success = true,
                seriesName = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Device"),
                data = JsonConvert.SerializeObject(data)
            });
        }

        #region Lottery Game
        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetLotteryRevenuePieChart()
        {
            var data = new List<PieChartData>();
            var lotteryCategories = _lotteryCategoryService.Queryable().ToList();

            for (int i = 0; i < lotteryCategories.Count(); i++)
            {
                var totalSaleLottery = _lotteryHistoryService.Query()
                                .Include(x => x.Lottery)
                                .Select(x => x.Lottery).Where(x => !x.IsDeleted && x.LotteryCategoryId == lotteryCategories[i].Id).Sum(y => y.UnitPrice);
                var totalAwardLottery = _lotteryHistoryService.Query()
                    .Include(x => x.LotteryPrize)
                    .Where(x => x.Result != EnumGameResult.REFUND.ToString() && x.Lottery.LotteryCategoryId == lotteryCategories[i].Id)
                    .Select(x => x.LotteryPrize).Sum(y => y.Value);
                var revenueInLotteryGame = totalSaleLottery - totalAwardLottery;

                var lotteryChartData = new PieChartData {
                    Label = lotteryCategories[i].Name,
                    Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)i + 1),
                    Value = revenueInLotteryGame
                };
                data.Add(lotteryChartData);
            }

            return new JsonResult(new
            {
                success = true,
                seriesName = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Revenue"),
                data = JsonConvert.SerializeObject(data)
            });
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetLotteryDeviceCategoryPieChart()
        {
            var data = new List<PieChartData>();

            var lotteryViewId = _settingService.Queryable().FirstOrDefault(x => x.Name == Analytic.LotteryViewId).Value;
            var deviceCategoriesLottery = _analyticService.GetDeviceCategory(lotteryViewId, FirstDeploymentDate, DateTime.Now);
            var totalDesktopLottery = deviceCategoriesLottery.Where(x => x.DeviceCategory == EnumDeviceCategory.DESKTOP).Sum(x => x.Count);
            var totalMobileLottery = deviceCategoriesLottery.Where(x => x.DeviceCategory == EnumDeviceCategory.MOBILE).Sum(x => x.Count);
            var totalTabletLottery = deviceCategoriesLottery.Where(x => x.DeviceCategory == EnumDeviceCategory.TABLET).Sum(x => x.Count);

            var desktopChartData = new PieChartData { Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Desktop"), Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)1), Value = totalDesktopLottery };
            var mobileChartData = new PieChartData { Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Mobile"), Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)2), Value = totalMobileLottery };
            var tabletChartData = new PieChartData { Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Tablet"), Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)3), Value = totalTabletLottery };

            data.Add(desktopChartData);
            data.Add(mobileChartData);
            data.Add(tabletChartData);

            return new JsonResult(new
            {
                success = true,
                seriesName = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Device"),
                data = JsonConvert.SerializeObject(data)
            });
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetLotterySummaryStatistics(int periodInDay)
        {
            var viewModel = new LotteryCategoryStatisticsViewModel();

            // 1.STATISTICAL INFORMATION 
            // 1.STATISTICAL INFORMATION - TOTAL REVENUE
            var lotteryTotalUses = _lotteryHistoryService.Query()
                 .Include(x => x.Lottery)
                 .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                 .Sum(x => x.Lottery.UnitPrice);

            var lotteryTotalAward = _lotteryHistoryService.Query()
                .Include(x => x.LotteryPrize)
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => (x.LotteryPrizeId.HasValue ? x.LotteryPrize.Value : 0));

            viewModel.TotalRevenue = lotteryTotalUses - Convert.ToInt32(lotteryTotalAward);

            // 1.STATISTICAL INFORMATION - TOTAL SALE
            viewModel.TotalSale = _lotteryHistoryService.Query().Include(x => x.Lottery)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => x.Lottery.UnitPrice);

            // 1.STATISTICAL INFORMATION - PAGE VIEWS
            var lotteryViewId = _settingService.Queryable().FirstOrDefault(x => x.Name == Analytic.LotteryViewId).Value;
            var lotteryPageViews = _analyticService.GetPageViews(lotteryViewId, DateTime.Now.AddDays(-periodInDay), DateTime.Now);
            viewModel.PageView = lotteryPageViews.AsQueryable().Sum(x => x.Count);

            // 1.STATISTICAL INFORMATION - TOTAL PLAYERS
            viewModel.TotalPlayers = _lotteryHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Select(x => x.SysUserId)
                .Distinct()
                .Count();

            // 1.STATISTICAL INFORMATION - TODAY PLAYERS
            viewModel.TodayPlayers = _lotteryHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date == DateTime.Now.Date && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.SysUserId)
                .Count();

            // 2.STATISTICAL CHART
            // 2.STATISTICAL CHART - TOTAL SALE CHANGES
            var lotterySale = _lotteryHistoryService.Query().Include(x => x.Lottery)
                        .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new SummaryChange
                        {
                            Date = y.Select(x => x.CreatedDate.Date).FirstOrDefault(),
                            Value = y.Sum(x => x.Lottery.UnitPrice)
                        });

            viewModel.TotalSaleChangesInJson = JsonConvert.SerializeObject((lotterySale ?? Enumerable.Empty<SummaryChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Select(x => x.Date).FirstOrDefault(),
                    Value = y.Sum(x => x.Value)
                })
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL REVENUE CHANGES
            var lotteryUses = _lotteryHistoryService
                 .Query()
                 .Include(x => x.Lottery)
                 .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                 .GroupBy(x => x.CreatedDate.Date)
                 .Select(y => new SummaryChange
                 {
                     Date = y.Key,
                     Value = y.Sum(x => x.Lottery.UnitPrice)
                 })
                 .ToList();

            var lotteryAwards = _lotteryHistoryService
                .Query()
                .Include(x => x.LotteryPrize)
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.UpdatedDate.GetValueOrDefault().Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = -(int)y.Sum(x => x.LotteryPrizeId.HasValue ? x.LotteryPrize.Value : 0) // "-" stand for lost token.
                })
                .ToList();

            var lotteryRevenue = lotteryUses.Union(lotteryAwards)
                                  .GroupBy(x => x.Date)
                                  .Select(x => new SummaryChange
                                  {
                                      Date = x.Key,
                                      Value = x.Sum(y => y.Value)
                                  })
                                  .ToList();

            viewModel.TotalRevenueChangesInJson = JsonConvert.SerializeObject((lotteryRevenue ?? Enumerable.Empty<SummaryChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Select(x => x.Date).FirstOrDefault(),
                    Value = y.Sum(x => x.Value)
                }).OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - PAGE VIEW CHANGES
            viewModel.PageViewChangesInJson = JsonConvert.SerializeObject(lotteryPageViews
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL PLAYERS
            var lotteryPlayers = _lotteryHistoryService.Queryable()
                        .Where(x => (periodInDay > 0 ? x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) : x.CreatedDate <= DateTime.Now) && x.Result != EnumGameResult.REFUND.ToString())
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new PlayersChange
                        {
                            Date = y.Select(x => x.CreatedDate.Date).FirstOrDefault(),
                            SysUserIds = y.Select(x => x.SysUserId)
                        }).ToList();

            viewModel.TotalPlayersChangesInJson = JsonConvert.SerializeObject((lotteryPlayers ?? Enumerable.Empty<PlayersChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Select(x => x.Date).FirstOrDefault(),
                    Value = y.SelectMany(x => x.SysUserIds).Distinct().Count()
                })
                .OrderBy(x => x.Date)
                .ToList());

            return PartialView("_LotteryCategoryStatistics", viewModel);
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetLotteryCategoryStatistics(int periodInDay, int lotteryCategoryId)
        {
            var viewModel = new LotteryCategoryStatisticsViewModel();

            // 1.STATISTICAL INFORMATION 
            // 1.STATISTICAL INFORMATION - TOTAL REVENUE
            var lotteryTotalUses = _lotteryHistoryService.Query()
                 .Include(x => x.Lottery)
                 .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString() && x.Lottery.LotteryCategoryId == lotteryCategoryId)
                 .Sum(x => x.Lottery.UnitPrice);

            var lotteryTotalAward = _lotteryHistoryService.Query()
                .Include(x => x.Lottery)
                .Include(x => x.LotteryPrize)
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) 
                            && x.Result != EnumGameResult.REFUND.ToString() && x.Lottery.LotteryCategoryId == lotteryCategoryId)
                .Sum(x => (x.LotteryPrizeId.HasValue ? x.LotteryPrize.Value : 0));

            viewModel.TotalRevenue = lotteryTotalUses - Convert.ToInt32(lotteryTotalAward);

            // 1.STATISTICAL INFORMATION - TOTAL SALE
            viewModel.TotalSale = _lotteryHistoryService.Query().Include(x => x.Lottery)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString() && x.Lottery.LotteryCategoryId == lotteryCategoryId)
                .Sum(x => x.Lottery.UnitPrice);

            // 1.STATISTICAL INFORMATION - PAGE VIEWS
            var lotteryViewId = _lotteryCategoryService.Queryable().FirstOrDefault(x => x.Id == lotteryCategoryId).ViewId;
            var lotteryPageViews = _analyticService.GetPageViews(lotteryViewId, DateTime.Now.AddDays(-periodInDay), DateTime.Now);
            viewModel.PageView = lotteryPageViews.AsQueryable().Sum(x => x.Count);

            // 1.STATISTICAL INFORMATION - TOTAL PLAYERS
            viewModel.TotalPlayers = _lotteryHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Lottery.LotteryCategoryId == lotteryCategoryId && x.Result != EnumGameResult.REFUND.ToString())
                .Select(x => x.SysUserId)
                .Distinct()
                .Count();

            // 1.STATISTICAL INFORMATION - TODAY PLAYERS
            viewModel.TodayPlayers = _lotteryHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date == DateTime.Now.Date && x.Lottery.LotteryCategoryId == lotteryCategoryId && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.SysUserId)
                .Count();

            // 2.STATISTICAL CHART
            // 2.STATISTICAL CHART - TOTAL SALE CHANGES
            var lotterySale = _lotteryHistoryService.Query().Include(x => x.Lottery)
                        .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString() && x.Lottery.LotteryCategoryId == lotteryCategoryId)
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new SummaryChange
                        {
                            Date = y.Select(x => x.CreatedDate.Date).FirstOrDefault(),
                            Value = y.Sum(x => x.Lottery.UnitPrice)
                        });

            viewModel.TotalSaleChangesInJson = JsonConvert.SerializeObject((lotterySale ?? Enumerable.Empty<SummaryChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Select(x => x.Date).FirstOrDefault(),
                    Value = y.Sum(x => x.Value)
                })
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL REVENUE CHANGES
            var lotteryUses = _lotteryHistoryService
                .Query()
                .Include(x => x.Lottery)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.CreatedDate.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = y.Sum(x => x.Lottery.UnitPrice)
                })
                .ToList();

            var lotteryAwards = _lotteryHistoryService
                .Query()
                .Include(x => x.LotteryPrize)
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.UpdatedDate.GetValueOrDefault().Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = -(int)y.Sum(x => x.LotteryPrizeId.HasValue ? x.LotteryPrize.Value : 0) // "-" stand for lost token.
                })
                .ToList();

            var lotteryRevenue = lotteryUses.Union(lotteryAwards)
                                  .GroupBy(x => x.Date)
                                  .Select(x => new SummaryChange
                                  {
                                      Date = x.Key,
                                      Value = x.Sum(y => y.Value)
                                  })
                                  .ToList();

            viewModel.TotalRevenueChangesInJson = JsonConvert.SerializeObject((lotteryRevenue ?? Enumerable.Empty<SummaryChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Select(x => x.Date).FirstOrDefault(),
                    Value = y.Sum(x => x.Value)
                }).OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - PAGE VIEW CHANGES
            viewModel.PageViewChangesInJson = JsonConvert.SerializeObject(lotteryPageViews
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL PLAYERS
            var lotteryPlayers = _lotteryHistoryService.Queryable()
                        .Where(x => periodInDay > 0 ? x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) : x.CreatedDate <= DateTime.Now && x.Lottery.LotteryCategoryId == lotteryCategoryId 
                                                                                                                                                    && x.Result != EnumGameResult.REFUND.ToString())
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new PlayersChange
                        {
                            Date = y.Select(x => x.CreatedDate.Date).FirstOrDefault(),
                            SysUserIds = y.Select(x => x.SysUserId)
                        }).ToList();

            viewModel.TotalPlayersChangesInJson = JsonConvert.SerializeObject((lotteryPlayers ?? Enumerable.Empty<PlayersChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Select(x => x.Date).FirstOrDefault(),
                    Value = y.SelectMany(x => x.SysUserIds).Distinct().Count()
                })
                .OrderBy(x => x.Date)
                .ToList());

            return PartialView("_LotteryCategoryStatistics", viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchPurchasedLotteryHistory(DataTableAjaxPostModel viewModel, int? lotteryCategoryId)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchPurchasedLotteryHistoryFunc(viewModel, out filteredResultsCount, out totalResultsCount, lotteryCategoryId);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<LotteryHistoryViewComponentAdminViewModel> SearchPurchasedLotteryHistoryFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount, int? lotteryCategoryId)
        {
            // TODO: Should be used sp like SearchPurchasedPricePredictionHistoryFunc
            var searchBy = (model.search != null) ? model.search?.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            var purchasedLotteryHistory = _lotteryHistoryService
                    .Query()
                    .Include(x => x.Lottery)
                    .Include(x => x.SysUser)
                    .Where(x => (!lotteryCategoryId.HasValue || x.Lottery.LotteryCategoryId == lotteryCategoryId) && x.Result != EnumGameResult.REFUND.ToString())
                    .GroupBy(x => new { x.CreatedDate.Date, x.LotteryId, x.SysUserId });

            var purchasedLotteryHistoryView = purchasedLotteryHistory
                .Select(y => new LotteryHistoryViewComponentAdminViewModel
                {
                    SysUserId = y.Key.SysUserId,
                    Email = y.FirstOrDefault().SysUser.Email,
                    Status = y.FirstOrDefault().Lottery.Status,
                    NumberOfTicket = y.Count(),
                    TotalPurchasePrice = y.Sum(x => x.Lottery.UnitPrice),
                    Title = y.FirstOrDefault().Lottery.Title,
                    PurchaseDateTime = y.Key.Date,
                });

            filteredResultsCount = totalResultsCount = purchasedLotteryHistory.Count();

            // search the dbase taking into consideration table sorting and paging
            if (!string.IsNullOrEmpty(searchBy))
            {
                searchBy = searchBy.ToLower();
                bool condition(LotteryHistoryViewComponentAdminViewModel x) => x.Email.ToLower().Contains(searchBy) || x.StatusInString.ToLower().Contains(searchBy) || x.PurchaseDateTimeInString.ToLower().Contains(searchBy)
                                    || x.NumberOfTicketInString.ToLower().Contains(searchBy) || x.Title.ToLower().Contains(searchBy);

                purchasedLotteryHistoryView = purchasedLotteryHistoryView
                                        .Where(condition)
                                        .AsQueryable();

                filteredResultsCount = purchasedLotteryHistory
                                       .Count();
            }

            return purchasedLotteryHistoryView
                  .AsQueryable()
                  .OrderBy(sortBy, sortDir)
                  .Skip(skip)
                  .Take(take)
                  .ToList();
        }
        #endregion

        #region PricePrediction Game
        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetPricePredictionSummaryStatistics(int periodInDay)
        {
            var viewModel = new PricePredictionCategoryStatisticsViewModel();

            // 1.STATISTICAL INFORMATION 
            // 1.STATISTICAL INFORMATION - TOTAL REVENUE
            var pricePredictionTotalUse = _pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => x.Amount);

            var pricePredictionTotalAward = _pricePredictionHistoryService.Queryable()
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => x.TotalAward.GetValueOrDefault(0));

            viewModel.TotalRevenue = Convert.ToInt32(pricePredictionTotalUse - pricePredictionTotalAward);

            // 1.STATISTICAL INFORMATION - TOTAL SALE
            viewModel.TotalSale = Convert.ToInt32(_pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Sum(x => x.Amount));

            // 1.STATISTICAL INFORMATION - PAGE VIEWS
            var pricePredictionViewId = _settingService.Queryable().FirstOrDefault(x => x.Name == Analytic.PricePredictionViewId).Value;
            var pricePredictionPageViews = _analyticService.GetPageViews(pricePredictionViewId, DateTime.Now.AddDays(-periodInDay), DateTime.Now);
            viewModel.PageView = pricePredictionPageViews.AsQueryable().Sum(x => x.Count);



            // 1.STATISTICAL INFORMATION - TOTAL PLAYERS
            viewModel.TotalPlayers = _pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .Select(x => x.SysUserId)
                .Distinct()
                .Count();

            // 1.STATISTICAL INFORMATION - TODAY PLAYERS
            viewModel.TodayPlayers = _pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date == DateTime.Now.Date && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.SysUserId)
                .Count();

            // 2.STATISTICAL CHART
            // 2.STATISTICAL CHART - TOTAL SALE CHANGES
            var pricePredictionSale = _pricePredictionHistoryService.Queryable()
                        .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new SummaryChange
                        {
                            Date = y.Key,
                            Value = y.Sum(x => (int)x.Amount)
                        });

            viewModel.TotalSaleChangesInJson = JsonConvert.SerializeObject((pricePredictionSale ?? Enumerable.Empty<SummaryChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = y.Sum(x => x.Value)
                })
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL REVENUE CHANGES
            var pricePredictionUses = _pricePredictionHistoryService.Queryable()
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.CreatedDate.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = (int)y.Sum(x => x.Amount)
                })
                .ToList();

            var pricePredictionAwards = _pricePredictionHistoryService.Queryable()
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.UpdatedDate.GetValueOrDefault().Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = -(int)y.Sum(x => x.TotalAward.GetValueOrDefault(0)) // "-" stand for lost token.
                })
                .ToList();

            var pricePredictionRevenue = pricePredictionUses.Union(pricePredictionAwards)
                                  .GroupBy(x => x.Date)
                                  .Select(x => new SummaryChange
                                  {
                                      Date = x.Key,
                                      Value = x.Sum(y => y.Value)
                                  })
                                  .ToList();

            viewModel.TotalRevenueChangesInJson = JsonConvert.SerializeObject((pricePredictionRevenue ?? Enumerable.Empty<SummaryChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = y.Sum(x => x.Value)
                }).OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - PAGE VIEW CHANGES
            viewModel.PageViewChangesInJson = JsonConvert.SerializeObject(pricePredictionPageViews
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL PLAYERS
            var pricePredictionPlayers = _pricePredictionHistoryService.Queryable()
                        .Where(x => (periodInDay > 0 ? x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) : x.CreatedDate <= DateTime.Now) && x.Result != EnumGameResult.REFUND.ToString())
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new PlayersChange
                        {
                            Date = y.Key,
                            SysUserIds = y.Select(x => x.SysUserId)
                        })
                        .ToList();

            viewModel.TotalPlayersChangesInJson = JsonConvert.SerializeObject((pricePredictionPlayers ?? Enumerable.Empty<PlayersChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = y.SelectMany(x => x.SysUserIds).Distinct().Count()
                })
                .OrderBy(x => x.Date)
                .ToList());

            return PartialView("_PricePredictionCategoryStatistics", viewModel);
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetPricePredictionCategoryStatistics(int periodInDay, int pricePredictionCategoryId)
        {
            var viewModel = new PricePredictionCategoryStatisticsViewModel();

            // 1.STATISTICAL INFORMATION 
            // 1.STATISTICAL INFORMATION - TOTAL REVENUE
            var pricePredictionTotalUse = _pricePredictionHistoryService.Query()
                .Include(x => x.PricePrediction)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString() 
                         && x.PricePrediction.PricePredictionCategoryId == pricePredictionCategoryId)
                .Sum(x => x.Amount);

            var pricePredictionTotalAward = _pricePredictionHistoryService.Query()
                .Include(x => x.PricePrediction)
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString()
                         && x.PricePrediction.PricePredictionCategoryId == pricePredictionCategoryId)
                .Sum(x => x.TotalAward.GetValueOrDefault(0));

            viewModel.TotalRevenue = Convert.ToInt32(pricePredictionTotalUse - pricePredictionTotalAward);

            // 1.STATISTICAL INFORMATION - TOTAL SALE
            viewModel.TotalSale = Convert.ToInt32(_pricePredictionHistoryService.Query()
                 .Include(x => x.PricePrediction)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString() && x.Result != EnumGameResult.REFUND.ToString() && x.PricePrediction.PricePredictionCategoryId == pricePredictionCategoryId)
                .Sum(x => x.Amount));

            // 1.STATISTICAL INFORMATION - PAGE VIEWS
            var pricePredictionViewId = _settingService.Queryable().FirstOrDefault(x => x.Name == Analytic.PricePredictionViewId).Value;
            var pricePredictionPageViews = _analyticService.GetPageViews(pricePredictionViewId, DateTime.Now.AddDays(-periodInDay), DateTime.Now);
            viewModel.PageView = pricePredictionPageViews.AsQueryable().Sum(x => x.Count);

            // 1.STATISTICAL INFORMATION - TOTAL PLAYERS
            viewModel.TotalPlayers = _pricePredictionHistoryService.Query()
                .Include(x => x.PricePrediction)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.PricePrediction.PricePredictionCategoryId == pricePredictionCategoryId
                                                                                          && x.Result != EnumGameResult.REFUND.ToString())
                .Select(x => x.SysUserId)
                .Distinct()
                .Count();

            // 1.STATISTICAL INFORMATION - TODAY PLAYERS
            viewModel.TodayPlayers = _pricePredictionHistoryService.Query()
                 .Include(x => x.PricePrediction)
                .Where(x => x.CreatedDate.Date == DateTime.Now.Date && x.PricePrediction.PricePredictionCategoryId == pricePredictionCategoryId
                                                                    && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.SysUserId)
                .Count();

            // 2.STATISTICAL CHART
            // 2.STATISTICAL CHART - TOTAL SALE CHANGES
            var pricePredictionSale = _pricePredictionHistoryService
                        .Query()
                        .Include(x => x.PricePrediction)
                        .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.Result != EnumGameResult.REFUND.ToString() && x.PricePrediction.PricePredictionCategoryId == pricePredictionCategoryId)
                        .GroupBy(x => x.CreatedDate.Date)
                        .Select(y => new SummaryChange
                        {
                            Date = y.Key,
                            Value = y.Sum(x => (int)x.Amount)
                        });

            viewModel.TotalSaleChangesInJson = JsonConvert.SerializeObject((pricePredictionSale ?? Enumerable.Empty<SummaryChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = y.Sum(x => x.Value)
                })
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL REVENUE CHANGES
            var pricePredictionUses = _pricePredictionHistoryService
                .Query()
                .Include(x => x.PricePrediction)
                .Where(x => x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) && x.PricePrediction.PricePredictionCategoryId == pricePredictionCategoryId
                                                                                          && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.CreatedDate.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = (int)y.Sum(x => x.Amount)
                })
                .ToList();

            var pricePredictionAwards = _pricePredictionHistoryService
                .Query()
                .Include(x => x.PricePrediction)
                .Where(x => x.UpdatedDate.HasValue && x.UpdatedDate.GetValueOrDefault().Date >= DateTime.Now.Date.AddDays(-periodInDay) 
                                                   && x.PricePrediction.PricePredictionCategoryId == pricePredictionCategoryId
                                                   && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.UpdatedDate.GetValueOrDefault().Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = -(int)y.Sum(x => x.TotalAward.GetValueOrDefault(0)) // "-" stand for lost token.
                })
                .ToList();

            var pricePredictionRevenue = pricePredictionUses.Union(pricePredictionAwards)
                                  .GroupBy(x => x.Date)
                                  .Select(x => new SummaryChange
                                  {
                                      Date = x.Key,
                                      Value = x.Sum(y => y.Value)
                                  })
                                  .ToList();

            viewModel.TotalRevenueChangesInJson = JsonConvert.SerializeObject((pricePredictionRevenue ?? Enumerable.Empty<SummaryChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = y.Sum(x => x.Value)
                }).OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - PAGE VIEW CHANGES
            viewModel.PageViewChangesInJson = JsonConvert.SerializeObject(pricePredictionPageViews
                .OrderBy(x => x.Date)
                .ToList());

            // 2.STATISTICAL CHART - TOTAL PLAYERS
            var pricePredictionPlayers = _pricePredictionHistoryService
                .Query()
                .Include(x => x.PricePrediction)
                .Where(x => (periodInDay > 0 ? x.CreatedDate.Date >= DateTime.Now.Date.AddDays(-periodInDay) : x.CreatedDate <= DateTime.Now) 
                                                                   && x.PricePrediction.PricePredictionCategoryId == pricePredictionCategoryId
                                                                   && x.Result != EnumGameResult.REFUND.ToString())
                .GroupBy(x => x.CreatedDate.Date)
                .Select(y => new PlayersChange
                {
                    Date = y.Key,
                    SysUserIds = y.Select(x => x.SysUserId)
                })
                .ToList();

            viewModel.TotalPlayersChangesInJson = JsonConvert.SerializeObject((pricePredictionPlayers ?? Enumerable.Empty<PlayersChange>())
                .GroupBy(x => x.Date)
                .Select(y => new SummaryChange
                {
                    Date = y.Key,
                    Value = y.SelectMany(x => x.SysUserIds).Distinct().Count()
                })
                .OrderBy(x => x.Date)
                .ToList());

            return PartialView("_PricePredictionCategoryStatistics", viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchPurchasedPricePredictionHistory(DataTableAjaxPostModel viewModel, int? pricePredictionCategoryId)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchPurchasedPricePredictionHistoryFunc(viewModel, out filteredResultsCount, out totalResultsCount, pricePredictionCategoryId);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<PricePredictionHistoryViewComponentAdminViewModel> SearchPurchasedPricePredictionHistoryFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount, int? pricePredictionCategoryId)
        {
            var searchBy = (model.search.value != null) ? model.search.value : "";
            var pageSize = model.length;
            var pageIndex = model.start + 1;

            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            string sortDir = "desc";

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower();
            }

            // search the dbase taking into consideration table sorting and paging
            List<SqlParameter> storeParams = new List<SqlParameter>()
            {
                new SqlParameter() {ParameterName = "@PricePredictionCategoryId", SqlDbType = SqlDbType.Int, Value= pricePredictionCategoryId ?? 0},
                new SqlParameter() {ParameterName = "@LangId", SqlDbType = SqlDbType.Int, Value= HttpContext.Session.GetInt32("LangId").Value},
                new SqlParameter() {ParameterName = "@PageSize", SqlDbType = SqlDbType.Int, Value = pageSize},
                new SqlParameter() {ParameterName = "@PageIndex", SqlDbType = SqlDbType.Int, Value = pageIndex},
                new SqlParameter() {ParameterName = "@OrderColumn", SqlDbType = SqlDbType.NVarChar, Value = sortBy},
                new SqlParameter() {ParameterName = "@OrderDirection", SqlDbType = SqlDbType.NVarChar, Value = sortDir},
                new SqlParameter() {ParameterName = "@SearchValue", SqlDbType = SqlDbType.NVarChar, Value = searchBy},
            };

            var dataSet = _dataContextAsync.ExecuteStoredProcedure("[usp_GetPricePredictionHistory]", storeParams);

            DataTable table = dataSet.Tables[0];
            var rows = new List<DataRow>(table.Rows.OfType<DataRow>()); //  the Rows property of the DataTable object is a collection that implements IEnumerable but not IEnumerable<T>

            totalResultsCount = Convert.ToInt32((dataSet.Tables[1].Rows[0])["TotalCount"]);
            filteredResultsCount = Convert.ToInt32((dataSet.Tables[2].Rows[0])["FilteredCount"]);

            var result = Mapper.Map<List<DataRow>, List<PricePredictionHistoryViewComponentAdminViewModel>>(rows);

            return result;
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetPricePredictionRevenuePieChart()
        {
            var data = new List<PieChartData>();
            var pricePredictionCategories = _pricePredictionCategoryService
                                            .Query()
                                            .Include(x => x.PricePredictionCategoryDetails)
                                            .Select(x => new
                                            {
                                                x.Id,
                                                x.PricePredictionCategoryDetails.FirstOrDefault(y => y.LangId == HttpContext.Session.GetInt32("LangId").Value).Name
                                            })
                                            .ToList();

            for (int i = 0; i < pricePredictionCategories.Count(); i++)
            {
                var totalSalePricePrediction = _pricePredictionHistoryService.Query()
                                    .Include(x => x.PricePrediction)
                                    .Where(x => x.PricePrediction.PricePredictionCategoryId == pricePredictionCategories[i].Id && x.Result != EnumGameResult.REFUND.ToString())
                                    .Sum(x => x.Amount);
                var totalAwardPricePrediction = _pricePredictionHistoryService.Query()
                                               .Include(x => x.PricePrediction)
                                                .Where(x => x.PricePrediction.PricePredictionCategoryId == pricePredictionCategories[i].Id && x.Result != EnumGameResult.REFUND.ToString())
                                                .Sum(x => x.TotalAward);
                var revenueInPricePredictionGame = Convert.ToInt32(totalSalePricePrediction - totalAwardPricePrediction);

                var pricePredictionChartData = new PieChartData {
                    Label = pricePredictionCategories[i].Name,
                    Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)i + 1),
                    Value = revenueInPricePredictionGame};
                data.Add(pricePredictionChartData);
            }

            return new JsonResult(new
            {
                success = true,
                seriesName = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Revenue"),
                data = JsonConvert.SerializeObject(data)
            });
        }

        [HttpGet]
        [Permission(EnumRole.Admin)]
        public IActionResult GetPricePreicitonDeviceCategoryPieChart()
        {
            var data = new List<PieChartData>();

            var pricePredictionViewId = _settingService.Queryable().FirstOrDefault(x => x.Name == Analytic.PricePredictionViewId).Value;
            var deviceCategoriesPricePrediction = _analyticService.GetDeviceCategory(pricePredictionViewId, FirstDeploymentDate, DateTime.Now);
            var totalDesktopPricePrediction = deviceCategoriesPricePrediction.Where(x => x.DeviceCategory == EnumDeviceCategory.DESKTOP).Sum(x => x.Count);
            var totalMobilePricePrediction = deviceCategoriesPricePrediction.Where(x => x.DeviceCategory == EnumDeviceCategory.MOBILE).Sum(x => x.Count);
            var totalTabletPricePrediction = deviceCategoriesPricePrediction.Where(x => x.DeviceCategory == EnumDeviceCategory.TABLET).Sum(x => x.Count);

            var desktopChartData = new PieChartData { Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Desktop"), Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)1), Value = totalDesktopPricePrediction };
            var mobileChartData = new PieChartData { Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Mobile"), Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)2), Value = totalMobilePricePrediction };
            var tabletChartData = new PieChartData { Label = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Tablet"), Color = EnumHelper<EnumPieChartColor>.GetDisplayValue((EnumPieChartColor)3), Value = totalTabletPricePrediction };

            data.Add(desktopChartData);
            data.Add(mobileChartData);
            data.Add(tabletChartData);

            return new JsonResult(new
            {
                success = true,
                seriesName = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "Device"),
                data = JsonConvert.SerializeObject(data)
            });
        }

        [Permission(EnumRole.Admin)]
        public IActionResult AddPricePredictionCategory()
        {
            var pricePredictionCategory = new AddPricePredictionCategoryAdminViewModel();
            var langs = _langService.Queryable()
                        .Select(x => new { x.Id, x.Name })
                        .ToList();

            foreach (var lang in langs)
            {
                pricePredictionCategory.PricePredictionCategoryDetailAdminViewModels.Add(new PricePredictionCategoryDetailAdminViewModel
                {
                    LangId = lang.Id,
                    LangName = lang.Name
                });
            }

            return PartialView("_EditPricePredictionCategory", pricePredictionCategory);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoAddPricePredictionCategory(AddPricePredictionCategoryAdminViewModel viewModel)
        {
            try
            {
                // check exist
                foreach (var detail in viewModel.PricePredictionCategoryDetailAdminViewModels)
                {
                    if (_pricePredictionCategoryDetailService.Queryable().Any(x => x.LangId == detail.LangId && x.Name == detail.Name))
                    {
                        return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ExistingCategory") });
                    }
                }

                var pricePredictionCategory = new PricePredictionCategory();

                _pricePredictionCategoryService.Insert(pricePredictionCategory);
                _unitOfWork.SaveChanges();

                foreach (var detail in viewModel.PricePredictionCategoryDetailAdminViewModels)
                {
                    _pricePredictionCategoryDetailService.Insert(new PricePredictionCategoryDetail
                    {
                        PricePredictionCategoryId = pricePredictionCategory.Id,
                        LangId = detail.LangId,
                        Name = detail.Name,
                        Description = detail.Description,
                    });
                }
                _unitOfWork.SaveChanges();
                return new JsonResult(new
                {
                    success = true,
                    message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AddSuccessfully"),
                    id = pricePredictionCategory.Id,
                    name = viewModel.PricePredictionCategoryDetailAdminViewModels.FirstOrDefault(x => x.LangId == HttpContext.Session.GetInt32("LangId").Value).Name
                });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        #endregion

        #endregion

        #region Lottery
        [Permission(EnumRole.Admin)]
        public IActionResult Lottery()
        {
            return View();
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchLottery(DataTableAjaxPostModel viewModel)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchLotteryFunc(viewModel, out filteredResultsCount, out totalResultsCount);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<LotteryAdminViewModel> SearchLotteryFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            var searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            // search the dbase taking into consideration table sorting and paging
            if (string.IsNullOrEmpty(searchBy))
            {
                filteredResultsCount = _lotteryService.Queryable().Where(x => !x.IsDeleted)
                        .Count();

                totalResultsCount = _lotteryService.Queryable().Where(x => !x.IsDeleted)
                        .Count();

                return _lotteryService.Query()
                            .Include(x => x.LotteryDetails)
                            .Where(x => !x.IsDeleted)
                            .Select(x => Mapper.Map<LotteryAdminViewModel>(x))
                            .OrderBy(sortBy, sortDir)
                            .Skip(skip)
                            .Take(take)
                            .ToList();
            }
            else
            {
                filteredResultsCount = _lotteryService.Queryable()
                        .Where(x => !x.IsDeleted && (x.CreatedDate.ToString("yyyy/MM/dd HH:mm:ss").Contains(searchBy) || x.Title.Contains(searchBy)))
                        .Count();

                totalResultsCount = _lotteryService.Queryable()
                        .Count(x => !x.IsDeleted);

                return _lotteryService.Query()
                        .Include(x => x.LotteryDetails)
                        .Where(x => !x.IsDeleted && (x.CreatedDate.ToString("yyyy/MM/dd HH:mm:ss").Contains(searchBy) || x.Title.Contains(searchBy)))
                        .Select(x => Mapper.Map<LotteryAdminViewModel>(x))
                        .OrderBy(sortBy, sortDir)
                        .Skip(skip)
                        .Take(take)
                        .ToList();
            }
        }

        [Permission(EnumRole.Admin)]
        public IActionResult ViewLottery(int id)
        {
            var lottery = new LotteryAdminViewModel();

            lottery = Mapper.Map<LotteryAdminViewModel>(_lotteryService.Query()
                                                        .Include(x => x.LotteryPrizes)
                                                        .Include(x => x.LotteryDetails)
                                                            .ThenInclude(y => y.Lang)
                                                        .FirstOrDefault(x => !x.IsDeleted && x.Id == id));

            lottery.LotteryCategory = _lotteryCategoryService.Queryable().Where(x => x.Id == lottery.LotteryCategoryId).FirstOrDefault().Name;

            return PartialView("_ViewLottery", lottery);
        }

        [Permission(EnumRole.Admin)]
        public IActionResult ViewLotteryPrize(UserLotteryPrizeViewModel viewModel)
        {
            return PartialView("_ViewLotteryPrize", viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchUserLotteryPrize(DataTableAjaxPostModel viewModel, int lotteryId, int lotteryPrizeId)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchUserLotteryPrizeFunc(viewModel, out filteredResultsCount, out totalResultsCount, lotteryId, lotteryPrizeId);
            var result = Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });

            return result;
        }

        [Permission(EnumRole.Admin)]
        public IList<UserLotteryPrizeViewModel> SearchUserLotteryPrizeFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount, int lotteryId, int lotteryPrizeId)
        {
            var searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[1].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            // search the dbase taking into consideration table sorting and paging
            if (string.IsNullOrEmpty(searchBy))
            {
                filteredResultsCount = _lotteryHistoryService
                    .Queryable()
                    .Where(x => x.LotteryId == lotteryId && x.LotteryPrizeId == lotteryPrizeId && x.Result != EnumGameResult.REFUND.ToString())
                    .Count();

                totalResultsCount = filteredResultsCount;

                var result = _lotteryHistoryService.Query()
                    .Include(x => x.SysUser)
                    .Where(x => x.LotteryId == lotteryId && x.LotteryPrizeId == lotteryPrizeId && x.Result != EnumGameResult.REFUND.ToString())
                    .Select(x => Mapper.Map<UserLotteryPrizeViewModel>(x.SysUser))
                    .AsQueryable()
                    .Skip(skip)
                    .Take(take)
                    .ToList();

                return result;
            }
            else
            {
                filteredResultsCount = _lotteryHistoryService.Query()
                    .Include(x => x.SysUser)
                    .Where(x => x.LotteryId == lotteryId && x.LotteryPrizeId == lotteryPrizeId && x.SysUser.Email.Contains(searchBy) && x.Result != EnumGameResult.REFUND.ToString())
                    .Count();

                totalResultsCount = _lotteryService.Queryable()
                        .Count(x => !x.IsDeleted);

                return _lotteryHistoryService.Query()
                        .Include(x => x.SysUser)
                        .Where(x => x.LotteryId == lotteryId && x.LotteryPrizeId == lotteryPrizeId && x.SysUser.Email.Contains(searchBy) && x.Result != EnumGameResult.REFUND.ToString())
                        .Select(x => Mapper.Map<UserLotteryPrizeViewModel>(x.SysUser))
                        .AsQueryable()
                        .Skip(skip)
                        .Take(take)
                        .ToList();
            }
        }

        [Permission(EnumRole.Admin)]
        public IActionResult EditLottery(int id)
        {
            var lotteries = new LotteryAdminViewModel();
            lotteries = Mapper.Map<LotteryAdminViewModel>(_lotteryService.Query()
                                                        .Include(x => x.LotteryPrizes)
                                                        .Include(x => x.LotteryDetails)
                                                            .ThenInclude(y => y.Lang)
                                                        .FirstOrDefault(x => !x.IsDeleted && x.Id == id));

            var langs = _langService.Queryable()
                .Select(x => Mapper.Map<LangViewModel>(x))
                .ToList();

            foreach (var lang in langs)
            {
                if (!lotteries.LotteryDetails.Any(x => x.LangId == lang.Id))
                {
                    lotteries.LotteryDetails.Add(new LotteryDetailAdminViewModel()
                    {
                        Lang = lang
                    });
                }
            }

            lotteries.LotteryCategories = _lotteryCategoryService.Queryable().Select(x => Mapper.Map<LotteryCategoryAdminViewModel>(x)).ToList();

            return PartialView("_EditLottery", lotteries);
        }

        [Permission(EnumRole.Admin)]
        public IActionResult AddLottery()
        {
            var lottery = new LotteryAdminViewModel();

            var langs = _langService.Queryable()
                .Select(x => Mapper.Map<LangViewModel>(x))
                .ToList();

            foreach (var lang in langs)
            {
                lottery.LotteryDetails.Add(new LotteryDetailAdminViewModel()
                {
                    Lang = lang
                });
            }

            lottery.LotteryCategories = _lotteryCategoryService.Queryable().Select(x => Mapper.Map<LotteryCategoryAdminViewModel>(x)).ToList();
            return PartialView("_EditLottery", lottery);
        }

        [Permission(EnumRole.Admin)]
        public IActionResult AddLotteryCategory()
        {
            var lotteryCategory = new LotteryCategoryAdminViewModel();
            return PartialView("_EditLotteryCategory", lotteryCategory);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoAddLotteryCategory(LotteryCategoryAdminViewModel viewModel)
        {
            try
            {
                if (_lotteryCategoryService.Queryable().Any(x => x.Name == viewModel.Name))
                    return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ExistingCategory") });
                else
                {
                    var lotteryCategory = new LotteryCategory()
                    {
                        Name = viewModel.Name,
                        Description = viewModel.Description,
                        ViewId = string.Empty
                    };
                    _lotteryCategoryService.Insert(lotteryCategory);

                    _unitOfWork.SaveChanges();

                    var analyticsViewId = _analyticService.CreateView(Analytic.LotteryCategoryViewName + lotteryCategory.Id);
                    var analyticsFilterId = _analyticService.CreateFilter(Analytic.LotteryCategoryViewName + lotteryCategory.Id, Analytic.LotteryCategoryFilterExpression + lotteryCategory.Id);
                    _analyticService.LinkFilterToView(analyticsViewId, analyticsFilterId);

                    lotteryCategory.ViewId = analyticsViewId;
                    _lotteryCategoryService.Update(lotteryCategory);

                    _unitOfWork.SaveChanges();

                    var newCategory = _lotteryCategoryService.Queryable().FirstOrDefault(x => x.Name == viewModel.Name);
                    return new JsonResult(new { success = true, id = newCategory.Id, name = newCategory.Name, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AddSuccessfully") });
                }



            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoEditLottery(LotteryAdminViewModel viewModel)
        {
            try
            {
                var lottery = _lotteryService.Queryable().FirstOrDefault(x => !x.IsDeleted && x.Id == viewModel.Id);

                // lottery game
                lottery.Title = viewModel.Title;
                lottery.Volume = viewModel.Volume;
                lottery.UnitPrice = viewModel.UnitPrice;
                lottery.LotteryCategoryId = viewModel.LotteryCategoryId;

                if (!viewModel.IsPublished)
                    lottery.Status = (int)EnumLotteryGameStatus.PENDING;
                else
                    lottery.Status = (int)EnumLotteryGameStatus.ACTIVE;

                var pathLottery = Path.Combine(_hostingEnvironment.WebRootPath, @"images\lottery");
                string timestamp = DateTime.Now.ToString("yyyyMMddhhmmss");

                foreach (var detail in viewModel.LotteryDetails)
                {
                    var lotteryDetail = _lotteryDetailService.Queryable().FirstOrDefault(x => x.Id == detail.Id);
                    // Desktop slide image
                    if (detail.DesktopTopImageFile != null)
                    {
                        var desktopTopImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_dt_{timestamp}_{detail.DesktopTopImageFile.FileName}";
                        var desktopTopImagePath = Path.Combine(pathLottery, desktopTopImage);
                        detail.DesktopTopImageFile.CopyTo(new FileStream(desktopTopImagePath, FileMode.Create));
                        lotteryDetail.DesktopTopImage = desktopTopImage;
                    }

                    // Mobile slide image
                    if (detail.MobileTopImageFile != null)
                    {
                        var mobileTopImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_mt_{timestamp}_{detail.MobileTopImageFile.FileName}";
                        var mobileTopImagePath = Path.Combine(pathLottery, mobileTopImage);
                        detail.MobileTopImageFile.CopyTo(new FileStream(mobileTopImagePath, FileMode.Create));
                        lotteryDetail.MobileTopImage = mobileTopImage;
                    }

                    // desktop listing image
                    if (detail.DesktopListingImageFile != null)
                    {
                        var desktopListingImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_dl_{timestamp}_{detail.DesktopListingImageFile.FileName}";
                        var desktopListingImagePath = Path.Combine(pathLottery, desktopListingImage);
                        detail.DesktopListingImageFile.CopyTo(new FileStream(desktopListingImagePath, FileMode.Create));
                        lotteryDetail.DesktopListingImage = desktopListingImage;
                    }

                    // mobile listing image
                    if (detail.MobileListingImageFile != null)
                    {
                        var mobileListingImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_ml_{timestamp}_{detail.MobileListingImageFile.FileName}";
                        var mobileListingImagePath = Path.Combine(pathLottery, mobileListingImage);
                        detail.MobileListingImageFile.CopyTo(new FileStream(mobileListingImagePath, FileMode.Create));
                        lotteryDetail.MobileListingImage = mobileListingImage;
                    }

                    // prize image
                    if (detail.PrizeImageFile != null)
                    {
                        var prizeImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_p_{timestamp}_{detail.PrizeImageFile.FileName}";
                        var prizeImagePath = Path.Combine(pathLottery, prizeImage);
                        detail.PrizeImageFile.CopyTo(new FileStream(prizeImagePath, FileMode.Create));
                        lotteryDetail.PrizeImage = prizeImage;
                    }

                    lotteryDetail.Description = detail.Description;
                    lotteryDetail.ShortDescription = detail.ShortDescription;

                    _lotteryDetailService.Update(lotteryDetail);
                }

                _lotteryService.Update(lottery);

                // lottery prize
                var lotteryPrize = _lotteryPrizeService.Queryable().Where(x => x.LotteryId == viewModel.Id).ToList();
                var numberOfOldPrize = lotteryPrize.Count();

                // Order to set index of the prize
                var orderedLotteryPrizes = viewModel.LotteryPrizes.OrderByDescending(x => x.Value).ToList();
                for (int i = 0; i < orderedLotteryPrizes.Count; i++)
                {
                    orderedLotteryPrizes[i].Index = i + 1;
                }
                var numberOfNewPrize = orderedLotteryPrizes.Count - 1;

                if (numberOfOldPrize >= numberOfNewPrize)
                {
                    for (var i = 0; i < numberOfOldPrize; i++)
                    {
                        if (i < numberOfNewPrize)
                        {
                            var newPrize = lotteryPrize[i];
                            newPrize.Index = orderedLotteryPrizes[i].Index;
                            newPrize.Value = orderedLotteryPrizes[i].Value;
                            newPrize.Volume = orderedLotteryPrizes[i].Volume;
                            _lotteryPrizeService.Update(newPrize);
                        }
                        else
                        {
                            var deletedPrize = lotteryPrize[i];
                            _lotteryPrizeService.Delete(deletedPrize);
                        }
                    }
                }
                else
                {
                    for (var i = 0; i < numberOfNewPrize; i++)
                    {
                        if (i < numberOfOldPrize)
                        {
                            var newPrize = lotteryPrize[i];
                            newPrize.Index = orderedLotteryPrizes[i].Index;
                            newPrize.Value = orderedLotteryPrizes[i].Value;
                            newPrize.Volume = orderedLotteryPrizes[i].Volume;
                            _lotteryPrizeService.Update(newPrize);
                        }
                        else
                        {
                            var prize = orderedLotteryPrizes[i];
                            if (prize.Volume == 0 && prize.Value == 0) continue;
                            _lotteryPrizeService.Insert(new LotteryPrize()
                            {
                                Index = prize.Index,
                                Value = prize.Value,
                                Volume = prize.Volume,
                                LotteryId = viewModel.Id
                            });
                        }
                    }
                }
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoAddLottery(LotteryAdminViewModel viewModel)
        {
            try
            {
                // Lottery game
                var latestLottery = _lotteryService.Queryable().LastOrDefault(x => !x.IsDeleted);
                var currentPhase = latestLottery == null ? 0 : latestLottery.Phase;
                var currentId = latestLottery == null ? 0 : latestLottery.Id;

                var lottery = new Lottery();

                lottery.Title = viewModel.Title;
                lottery.Volume = viewModel.Volume;
                lottery.UnitPrice = viewModel.UnitPrice;
                lottery.Phase = currentPhase + 1;
                lottery.CreatedDate = DateTime.Now;
                lottery.LotteryCategoryId = viewModel.LotteryCategoryId;

                if (!viewModel.IsPublished)
                    lottery.Status = (int)EnumLotteryGameStatus.PENDING;
                else
                    lottery.Status = (int)EnumLotteryGameStatus.ACTIVE;

                var pathLottery = Path.Combine(_hostingEnvironment.WebRootPath, @"images\lottery");
                string timestamp = DateTime.Now.ToString("yyyyMMddhhmmss");

                _lotteryService.Insert(lottery);
                _unitOfWork.SaveChanges();

                foreach (var detail in viewModel.LotteryDetails)
                {
                    var lotteryDetail = new LotteryDetail();
                    // Desktop slide image
                    if (detail.DesktopTopImageFile != null)
                    {
                        var desktopTopImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_dt_{timestamp}_{detail.DesktopTopImageFile.FileName}";
                        var desktopTopImagePath = Path.Combine(pathLottery, desktopTopImage);
                        detail.DesktopTopImageFile.CopyTo(new FileStream(desktopTopImagePath, FileMode.Create));
                        lotteryDetail.DesktopTopImage = desktopTopImage;
                    }

                    // Mobile slide image
                    if (detail.MobileTopImageFile != null)
                    {
                        var mobileTopImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_mt_{timestamp}_{detail.MobileTopImageFile.FileName}";
                        var mobileTopImagePath = Path.Combine(pathLottery, mobileTopImage);
                        detail.MobileTopImageFile.CopyTo(new FileStream(mobileTopImagePath, FileMode.Create));
                        lotteryDetail.MobileTopImage = mobileTopImage;
                    }

                    // desktop listing image
                    if (detail.DesktopListingImageFile != null)
                    {
                        var desktopListingImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_dl_{timestamp}_{detail.DesktopListingImageFile.FileName}";
                        var desktopListingImagePath = Path.Combine(pathLottery, desktopListingImage);
                        detail.DesktopListingImageFile.CopyTo(new FileStream(desktopListingImagePath, FileMode.Create));
                        lotteryDetail.DesktopListingImage = desktopListingImage;
                    }

                    // mobile listing image
                    if (detail.MobileListingImageFile != null)
                    {
                        var mobileListingImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_ml_{timestamp}_{detail.MobileListingImageFile.FileName}";
                        var mobileListingImagePath = Path.Combine(pathLottery, mobileListingImage);
                        detail.MobileListingImageFile.CopyTo(new FileStream(mobileListingImagePath, FileMode.Create));
                        lotteryDetail.MobileListingImage = mobileListingImage;
                    }

                    // prize image
                    if (detail.PrizeImageFile != null)
                    {
                        var prizeImage = $"{lottery.Phase.ToString()}_lang_{detail.LangId}_p_{timestamp}_{detail.PrizeImageFile.FileName}";
                        var prizeImagePath = Path.Combine(pathLottery, prizeImage);
                        detail.PrizeImageFile.CopyTo(new FileStream(prizeImagePath, FileMode.Create));
                        lotteryDetail.PrizeImage = prizeImage;
                    }

                    lotteryDetail.LotteryId = lottery.Id;
                    lotteryDetail.LangId = detail.LangId;
                    lotteryDetail.Description = detail.Description;
                    lotteryDetail.ShortDescription = detail.ShortDescription;

                    _lotteryDetailService.Insert(lotteryDetail);
                }

                _unitOfWork.SaveChanges();

                // Order to set index of the prize
                var orderedLotteryPrizes = viewModel.LotteryPrizes.OrderByDescending(x => x.Value).ToList();
                for (int i = 0; i < orderedLotteryPrizes.Count; i++)
                {
                    orderedLotteryPrizes[i].Index = i + 1;
                }

                // Lottery prize
                foreach (var prize in orderedLotteryPrizes)
                {
                    if (prize.Volume == 0 && prize.Value == 0) continue;
                    _lotteryPrizeService.Insert(new LotteryPrize()
                    {
                        Index = prize.Index,
                        Value = prize.Value,
                        Volume = prize.Volume,
                        LotteryId = lottery.Id
                    });
                }

                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AddSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [Permission(EnumRole.Admin)]
        public IActionResult ConfirmDeleteLottery(int id)
        {
            ViewData["gameId"] = id;
            return PartialView("_ConfirmDeleteLottery");
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoDeleteLottery(int id)
        {
            try
            {
                // udpate status for lottery game
                var lottery = _lotteryService.Queryable().FirstOrDefault(x => !x.IsDeleted && x.Id == id);
                lottery.IsDeleted = true;

                // refund money for user
                var amountToken = lottery.UnitPrice;
                var lotteryHistories = _lotteryHistoryService.Query().Include(x => x.SysUser).Where(x => x.LotteryId == id).ToList();
                foreach (var lotteryHistory in lotteryHistories)
                {
                    lotteryHistory.Result = EnumGameResult.REFUND.ToString();
                    lotteryHistory.SysUser.TokenAmount += amountToken;
                    _sysUserService.Update(lotteryHistory.SysUser);
                }

                _lotteryService.Update(lottery);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "DeleteSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }

        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoActivateLottery(int id)
        {
            try
            {
                var lottery = _lotteryService.Queryable().FirstOrDefault(x => !x.IsDeleted && x.Id == id);
                lottery.Status = (int)EnumLotteryGameStatus.ACTIVE;
                _lotteryService.Update(lottery);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ActivateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [Permission(EnumRole.Admin)]
        public IActionResult ConfirmDeactivateLottery(ConfirmLotteryViewModel viewModel)
        {
            return PartialView("_ConfirmDeactivateLottery", viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoDeactivateLottery(int id)
        {
            try
            {
                var lottery = _lotteryService.Queryable().FirstOrDefault(x => !x.IsDeleted && x.Id == id);
                lottery.Status = (int)EnumLotteryGameStatus.DEACTIVATED;
                _lotteryService.Update(lottery);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "DeactivateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        #endregion

        #region PricePrediction
        [Permission(EnumRole.Admin)]
        public IActionResult AddPricePredictionSetting()
        {
            var pricePredictionSetting = new PricePredictionSettingAdminViewModel();

            var langs = _langService.Queryable()
                .Select(x => new
                {
                    x.Id,
                    x.Name
                })
                .ToList();

            foreach (var lang in langs)
            {
                pricePredictionSetting.PricePredictionSettingDetails.Add(new PricePredictionSettingDetailAdminViewModel()
                {
                    LangId = lang.Id,
                    LangName = lang.Name
                });
            }

            pricePredictionSetting.PricePredictionCategories = _pricePredictionCategoryService
                                                                            .Query()
                                                                            .Include(x => x.PricePredictionCategoryDetails)
                                                                            .Select(x => new PricePredictionCategoryAdminViewModel
                                                                            {
                                                                                Id = x.Id,
                                                                                Name = x.PricePredictionCategoryDetails.FirstOrDefault(y => y.LangId == HttpContext.Session.GetInt32("LangId").Value).Name,
                                                                            })
                                                                            .ToList();

            return PartialView("_EditPricePredictionSetting", pricePredictionSetting);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoAddPricePredictionSetting(PricePredictionSettingAdminViewModel viewModel)
        {
            try
            {
                var pricePredictionSetting = Mapper.Map<PricePredictionSetting>(viewModel);
                pricePredictionSetting.CreatedDate = DateTime.Now;
                _pricePredictionSettingService.Insert(pricePredictionSetting);
                _unitOfWork.SaveChanges();

                var pricePredictionSettingDetails = viewModel.PricePredictionSettingDetails.Select(x => Mapper.Map<PricePredictionSettingDetail>(x)).ToList();
                pricePredictionSettingDetails.ForEach(x => x.PricePredictionSettingId = pricePredictionSetting.Id);
                _pricePredictionSettingDetailService.InsertRange(pricePredictionSettingDetails);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AddSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [Permission(EnumRole.Admin)]
        public IActionResult EditPricePredictionSetting(int id)
        {
            var pricePredictionSetting = _pricePredictionSettingService
                                            .Query()
                                            .Include(x => x.PricePredictionSettingDetails)
                                            .FirstOrDefault(x => x.Id == id);

            var viewModel = Mapper.Map<PricePredictionSettingAdminViewModel>(pricePredictionSetting);

            var langs = _langService.Queryable().ToList();
            viewModel.PricePredictionSettingDetails.ForEach(x => x.LangName = langs.FirstOrDefault(y => y.Id == x.LangId).Name);

            viewModel.PricePredictionCategories = _pricePredictionCategoryService
                                                                            .Query()
                                                                            .Include(x => x.PricePredictionCategoryDetails)
                                                                            .Select(x => new PricePredictionCategoryAdminViewModel
                                                                            {
                                                                                Id = x.Id,
                                                                                Name = x.PricePredictionCategoryDetails.FirstOrDefault(y => y.LangId == HttpContext.Session.GetInt32("LangId").Value).Name,
                                                                            })
                                                                            .ToList();

            return PartialView("_EditPricePredictionSetting", viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoEditPricePredictionSetting(PricePredictionSettingAdminViewModel viewModel)
        {
            try
            {
                var pricePredictionSetting = _pricePredictionSettingService
                                                .Query()
                                                .Include(x => x.PricePredictionSettingDetails)
                                                .FirstOrDefault(x => x.Id == viewModel.Id);
                pricePredictionSetting.PricePredictionCategoryId = viewModel.PricePredictionCategoryId;
                pricePredictionSetting.OpenBettingTime = viewModel.OpenBettingTime;
                pricePredictionSetting.CloseBettingTime = viewModel.CloseBettingTime;
                pricePredictionSetting.HoldingTimeInterval = viewModel.HoldingTimeInterval;
                pricePredictionSetting.ResultTimeInterval = viewModel.ResultTimeInterval;
                pricePredictionSetting.DividendRate = viewModel.DividendRate;
                pricePredictionSetting.UpdatedDate = DateTime.Now;

                _pricePredictionSettingService.Update(pricePredictionSetting);

                foreach (var detail in pricePredictionSetting.PricePredictionSettingDetails)
                {
                    detail.Title = viewModel.PricePredictionSettingDetails.FirstOrDefault(x => x.LangId == detail.LangId).Title;
                    detail.ShortDescription = viewModel.PricePredictionSettingDetails.FirstOrDefault(x => x.LangId == detail.LangId).ShortDescription;
                    _pricePredictionSettingDetailService.Update(detail);
                }

                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [Permission(EnumRole.Admin)]
        public IActionResult PricePredictionSetting()
        {
            return View();
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchPricePredictionSetting(DataTableAjaxPostModel viewModel)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchPricePredictionSettingFunc(viewModel, out filteredResultsCount, out totalResultsCount);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<PricePredictionSettingAdminViewModel> SearchPricePredictionSettingFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount)
        {
            var searchBy = (model.search != null) ? model.search.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            // search the dbase taking into consideration table sorting and paging
            if (string.IsNullOrEmpty(searchBy))
            {
                filteredResultsCount =
                    totalResultsCount =
                        _pricePredictionSettingService.Queryable()
                        .Where(x => x.Status == (int)EnumPricePredictionSettingStatus.ACTIVE && !x.IsDeleted)
                        .Count();

                return _pricePredictionSettingService.Query()
                            .Include(x => x.PricePredictionSettingDetails)
                            .Where(x => x.Status == (int)EnumPricePredictionSettingStatus.ACTIVE && !x.IsDeleted)
                            .Select(x => Mapper.Map<PricePredictionSettingAdminViewModel>(x))
                            .OrderBy(sortBy, sortDir)
                            .Skip(skip)
                            .Take(take)
                            .ToList();
            }
            else
            {
                filteredResultsCount = _pricePredictionSettingService.Query()
                        .Include(x => x.PricePredictionSettingDetails)
                        .Where(x => x.Status == (int)EnumPricePredictionSettingStatus.ACTIVE && !x.IsDeleted &&
                                    (x.CreatedDate.ToString("yyyy/MM/dd HH:mm:ss").Contains(searchBy) || x.PricePredictionSettingDetails.Any(y => y.Title.Contains(searchBy))))
                        .Count();

                totalResultsCount = _pricePredictionSettingService.Queryable()
                        .Where(x => x.Status == (int)EnumPricePredictionSettingStatus.ACTIVE && !x.IsDeleted)
                        .Count();

                return _pricePredictionSettingService.Query()
                        .Include(x => x.PricePredictionSettingDetails)
                        .Where(x => x.Status == (int)EnumPricePredictionSettingStatus.ACTIVE && !x.IsDeleted && 
                                    (x.CreatedDate.ToString("yyyy/MM/dd HH:mm:ss").Contains(searchBy) || x.PricePredictionSettingDetails.Any(y => y.Title.Contains(searchBy))))
                        .Select(x => Mapper.Map<PricePredictionSettingAdminViewModel>(x))
                        .OrderBy(sortBy, sortDir)
                        .Skip(skip)
                        .Take(take)
                        .ToList();
            }
        }

        [Permission(EnumRole.Admin)]
        [HttpPost]
        public IActionResult DoDeletePricePredictionSetting(int id)
        {
            try
            {
                var pricePredictionSetting = _pricePredictionSettingService.Queryable()
                    .FirstOrDefault(x => x.Id == id);

                pricePredictionSetting.IsDeleted = true;
                pricePredictionSetting.UpdatedDate = DateTime.Now;
                _pricePredictionSettingService.Update(pricePredictionSetting);
                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "DeleteSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }
        #endregion

        #region Setting
        [Permission(EnumRole.Admin)]
        public IActionResult Setting()
        {
            var viewModel = new SettingViewModel();
            var settings = _settingService.Queryable();
            viewModel.IsKYCVerificationActivated = bool.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.IsKYCVerificationActivated).Value);
            viewModel.IsAccountActivationEnable = bool.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.IsAccountActivationEnable).Value);
            viewModel.CookieExpirations = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.CookieExpirations).Value);

            viewModel.StandardAffiliateRate = new StandardAffiliateRateViewModel
            {
                Tier1DirectRate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.StandardAffiliate.Tier1DirectRate).Value),
                Tier2SaleToTier1Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.StandardAffiliate.Tier2SaleToTier1Rate).Value),
                Tier3SaleToTier1Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.StandardAffiliate.Tier3SaleToTier1Rate).Value)
            };

            viewModel.AgencyAffiliateRate = new AgencyAffiliateRateViewModel
            {
                Tier1DirectRate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier1DirectRate).Value),
                Tier2DirectRate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier2DirectRate).Value),
                Tier3DirectRate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier3DirectRate).Value),
                Tier2SaleToTier1Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier2SaleToTier1Rate).Value),
                Tier3SaleToTier1Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier3SaleToTier1Rate).Value),
                Tier3SaleToTier2Rate = int.Parse(settings.FirstOrDefault(x => x.Name == CPLConstant.AgencyAffiliate.Tier3SaleToTier2Rate).Value)
            };
            return View(viewModel);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public IActionResult DoUpdateSetting(string data)
        {
            try
            {
                var dataInList = JsonConvert.DeserializeObject<List<SettingDataModel>>(data);
                foreach (var _data in dataInList)
                {
                    var setting = _settingService.Queryable().FirstOrDefault(x => x.Name == _data.Name);
                    setting.Value = _data.Value;
                    _settingService.Update(setting);
                }

                _unitOfWork.SaveChanges();
                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        #endregion

        #region Slider
        [Permission(EnumRole.Admin)]
        public IActionResult Slider()
        {
            var viewModel = new SliderAdminViewModel();

            viewModel.Groups = _groupService.Queryable()
                                .Where(x => x.Filter == EnumGroupFilter.SLIDER.ToString())
                                .Select(x => Mapper.Map<GroupViewModel>(x)).ToList();

            return View(viewModel);
        }

        [Permission(EnumRole.Admin)]
        public IActionResult AddSlider()
        {
            var slider = new SliderAdminViewModel();

            var langs = _langService.Queryable()
                .Select(x => Mapper.Map<LangViewModel>(x))
                .ToList();

            foreach (var lang in langs)
            {
                slider.SliderDetails.Add(new SliderDetailAdminViewModel()
                {
                    Lang = lang
                });
            }

            return PartialView("_EditSlider", slider);
        }

        [Permission(EnumRole.Admin)]
        public IActionResult EditSlider(int id)
        {
            var slider = Mapper.Map<SliderAdminViewModel>(_sliderService.Query()
                                                            .Include(x => x.Group)
                                                            .Include(x => x.SliderDetails)
                                                                .ThenInclude(y => y.Lang)
                                                            .FirstOrDefault(x => x.Id == id));
            var langs = _langService.Queryable()
                .Select(x => Mapper.Map<LangViewModel>(x))
                .ToList();

            foreach (var lang in langs)
            {
                if (!slider.SliderDetails.Any(x => x.LangId == lang.Id))
                {
                    slider.SliderDetails.Add(new SliderDetailAdminViewModel()
                    {
                        Lang = lang
                    });
                }
            }

            return PartialView("_EditSlider", slider);
        }

        [Permission(EnumRole.Admin)]
        public IActionResult ViewSlider(int id)
        {
            var slider = new SliderAdminViewModel();

            slider = Mapper.Map<SliderAdminViewModel>(_sliderService.Query()
                                                        .Include(x => x.SliderDetails)
                                                            .ThenInclude(y => y.Lang)
                                                        .Include(x => x.Group)
                                                        .FirstOrDefault(x => x.Id == id));

            return PartialView("_ViewSlider", slider);
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoEditSlider(SliderAdminViewModel viewModel)
        {
            try
            {
                var slider = _sliderService.Queryable().FirstOrDefault(x => x.Id == viewModel.Id);

                // slider
                slider.Name = viewModel.Name;
                slider.Url = string.IsNullOrEmpty(viewModel.Url) ? "#" : viewModel.Url;

                var pathSlider = Path.Combine(_hostingEnvironment.WebRootPath, @"images\slider");
                string timestamp = DateTime.Now.ToString("yyyyMMddhhmmss");

                foreach (var detail in viewModel.SliderDetails)
                {
                    var sliderDetail = _sliderDetailService.Queryable().FirstOrDefault(x => x.Id == detail.Id);

                    // Desktop image
                    if (detail.DesktopImageFile != null)
                    {
                        var desktopImage = $"{slider.Id.ToString()}_lang_{detail.LangId}_dt_{timestamp}_{detail.DesktopImageFile.FileName}";
                        var desktopImagePath = Path.Combine(pathSlider, desktopImage);
                        detail.DesktopImageFile.CopyTo(new FileStream(desktopImagePath, FileMode.Create));
                        sliderDetail.DesktopImage = desktopImage;
                    }

                    // Mobile ima
                    if (detail.MobileImageFile != null)
                    {
                        var mobileImage = $"{slider.Id.ToString()}_lang_{detail.LangId}_mb_{timestamp}_{detail.MobileImageFile.FileName}";
                        var mobileImagePath = Path.Combine(pathSlider, mobileImage);
                        detail.MobileImageFile.CopyTo(new FileStream(mobileImagePath, FileMode.Create));
                        sliderDetail.MobileImage = mobileImage;
                    }

                    _sliderDetailService.Update(sliderDetail);
                }

                _sliderService.Update(slider);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "UpdateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoAddSlider(SliderAdminViewModel viewModel)
        {
            try
            {
                // Slider
                var slider = new Slider();

                slider.Name = viewModel.Name;
                slider.Url = string.IsNullOrEmpty(viewModel.Url) ? "#" : viewModel.Url;
                slider.GroupId = viewModel.GroupId;
                slider.Status = (int)EnumSliderStatus.ACTIVE;

                var pathSlider = Path.Combine(_hostingEnvironment.WebRootPath, @"images\slider");
                string timestamp = DateTime.Now.ToString("yyyyMMddhhmmss");

                _sliderService.Insert(slider);
                _unitOfWork.SaveChanges();

                foreach (var detail in viewModel.SliderDetails)
                {
                    var sliderDetail = new SliderDetail();
                    // Desktop image
                    if (detail.DesktopImageFile != null)
                    {
                        var desktopImage = $"{slider.Id.ToString()}_lang_{detail.LangId}_dt_{timestamp}_{detail.DesktopImageFile.FileName}";
                        var desktopImagePath = Path.Combine(pathSlider, desktopImage);
                        detail.DesktopImageFile.CopyTo(new FileStream(desktopImagePath, FileMode.Create));
                        sliderDetail.DesktopImage = desktopImage;
                    }

                    // Mobile ima
                    if (detail.MobileImageFile != null)
                    {
                        var mobileImage = $"{slider.Id.ToString()}_lang_{detail.LangId}_mb_{timestamp}_{detail.MobileImageFile.FileName}";
                        var mobileImagePath = Path.Combine(pathSlider, mobileImage);
                        detail.MobileImageFile.CopyTo(new FileStream(mobileImagePath, FileMode.Create));
                        sliderDetail.MobileImage = mobileImage;
                    }

                    sliderDetail.SliderId = slider.Id;
                    sliderDetail.LangId = detail.LangId;

                    _sliderDetailService.Insert(sliderDetail);
                }

                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "AddSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoDeleteSlider(int id)
        {
            try
            {
                var slider = _sliderService.Queryable()
                        .Include(x => x.SliderDetails)
                        .FirstOrDefault(x => x.Id == id);

                if (slider != null && slider.SliderDetails != null)
                {
                    foreach (var detail in slider.SliderDetails)
                        _sliderDetailService.Delete(detail);
                    _sliderService.Delete(slider);

                    _unitOfWork.SaveChanges();
                    return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "DeleteSuccessfully") });
                }
                else
                    return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult SearchSlider(DataTableAjaxPostModel viewModel, int groupId)
        {
            // action inside a standard controller
            int filteredResultsCount;
            int totalResultsCount;
            var res = SearchSliderFunc(viewModel, out filteredResultsCount, out totalResultsCount, groupId);
            return Json(new
            {
                // this is what datatables wants sending back
                draw = viewModel.draw,
                recordsTotal = totalResultsCount,
                recordsFiltered = filteredResultsCount,
                data = res
            });
        }

        [Permission(EnumRole.Admin)]
        public IList<SliderAdminViewModel> SearchSliderFunc(DataTableAjaxPostModel model, out int filteredResultsCount, out int totalResultsCount, int groupId)
        {
            var searchBy = (model.search != null) ? model.search?.value : null;
            var take = model.length;
            var skip = model.start;

            string sortBy = "";
            bool sortDir = true;

            if (model.order != null)
            {
                // in this example we just default sort on the 1st column
                sortBy = model.columns[model.order[0].column].data;
                sortDir = model.order[0].dir.ToLower() == "asc";
            }

            var sliders = _sliderService
                    .Query()
                    .Include(x => x.Group)
                    .Include(x => x.SliderDetails)
                    .Where(x => x.Group.Id == groupId)
                    .Select(x => Mapper.Map<SliderAdminViewModel>(x));

            filteredResultsCount = totalResultsCount = sliders.Count();

            // search the dbase taking into consideration table sorting and paging
            if (!string.IsNullOrEmpty(searchBy))
            {
                searchBy = searchBy.ToLower();
                bool condition(SliderAdminViewModel x) => x.Name.ToLower().Contains(searchBy) || x.Url.ToLower().Contains(searchBy);

                sliders = sliders
                        .Where(condition)
                        .AsQueryable();

                filteredResultsCount = sliders.Count();
            }

            return sliders
                  .AsQueryable()
                  .OrderBy(sortBy, sortDir)
                  .Skip(skip)
                  .Take(take)
                  .ToList();
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoActivateSlider(int id)
        {
            try
            {
                var slider = _sliderService.Queryable().FirstOrDefault(x => x.Id == id);
                slider.Status = (int)EnumSliderStatus.ACTIVE;
                _sliderService.Update(slider);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ActivateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }

        [HttpPost]
        [Permission(EnumRole.Admin)]
        public JsonResult DoDeactivateSlider(int id)
        {
            try
            {
                var slider = _sliderService.Queryable().FirstOrDefault(x => x.Id == id);
                slider.Status = (int)EnumSliderStatus.DEACTIVATED;
                _sliderService.Update(slider);
                _unitOfWork.SaveChanges();

                return new JsonResult(new { success = true, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "DeactivateSuccessfully") });
            }
            catch (Exception ex)
            {
                return new JsonResult(new { success = false, message = LangDetailHelper.Get(HttpContext.Session.GetInt32("LangId").Value, "ErrorOccurs") });
            }
        }
        #endregion

    }
}