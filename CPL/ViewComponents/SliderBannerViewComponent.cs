﻿using AutoMapper;
using CPL.Common.Enums;
using CPL.Core.Interfaces;
using CPL.Misc.Utils;
using CPL.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CPL.ViewComponents
{
    public class SliderBannerViewComponent : ViewComponent
    {
        private readonly IMapper _mapper;
        private readonly ILotteryService _lotteryService;

        public SliderBannerViewComponent(IMapper mapper,
            ILotteryService lotteryService)
        {
            this._mapper = mapper;
            this._lotteryService = lotteryService;
        }

        public IViewComponentResult Invoke()
        {
            var lotteries = _lotteryService.Query()
                .Include(x => x.LotteryHistories)
                .Where(x => !x.IsDeleted && (x.LotteryHistories.Count() < x.Volume && x.Status == (int)EnumLotteryGameStatus.ACTIVE))
                .OrderByDescending(x => x.CreatedDate);

            var viewModel = new LotteryIndexViewModel();
            viewModel.Lotteries = lotteries
                .Select(x => Mapper.Map<LotteryIndexLotteryViewModel>(x))
                .ToList();

            viewModel.Slides = lotteries
                .Select(x => Mapper.Map<LotteryIndexSlideViewModel>(x))
                .ToList();

            return View(viewModel);
        }
    }
}
