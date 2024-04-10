; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134330 () Bool)

(assert start!134330)

(declare-fun b!1568639 () Bool)

(declare-fun res!1072296 () Bool)

(declare-fun e!874465 () Bool)

(assert (=> b!1568639 (=> (not res!1072296) (not e!874465))))

(declare-datatypes ((B!2480 0))(
  ( (B!2481 (val!19602 Int)) )
))
(declare-datatypes ((tuple2!25306 0))(
  ( (tuple2!25307 (_1!12664 (_ BitVec 64)) (_2!12664 B!2480)) )
))
(declare-datatypes ((List!36722 0))(
  ( (Nil!36719) (Cons!36718 (h!38165 tuple2!25306) (t!51630 List!36722)) )
))
(declare-fun l!750 () List!36722)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1568639 (= res!1072296 (and (is-Cons!36718 l!750) (bvslt (_1!12664 (h!38165 l!750)) key1!37) (bvslt (_1!12664 (h!38165 l!750)) key2!21)))))

(declare-fun b!1568640 () Bool)

(declare-fun res!1072299 () Bool)

(assert (=> b!1568640 (=> (not res!1072299) (not e!874465))))

(declare-fun isStrictlySorted!995 (List!36722) Bool)

(assert (=> b!1568640 (= res!1072299 (isStrictlySorted!995 l!750))))

(declare-fun v1!32 () B!2480)

(declare-fun b!1568641 () Bool)

(declare-fun insertStrictlySorted!581 (List!36722 (_ BitVec 64) B!2480) List!36722)

(assert (=> b!1568641 (= e!874465 (not (isStrictlySorted!995 (insertStrictlySorted!581 l!750 key1!37 v1!32))))))

(declare-fun v2!10 () B!2480)

(assert (=> b!1568641 (= (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52078 0))(
  ( (Unit!52079) )
))
(declare-fun lt!673213 () Unit!52078)

(declare-fun lemmaInsertStrictlySortedCommutative!7 (List!36722 (_ BitVec 64) B!2480 (_ BitVec 64) B!2480) Unit!52078)

(assert (=> b!1568641 (= lt!673213 (lemmaInsertStrictlySortedCommutative!7 (t!51630 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun res!1072297 () Bool)

(assert (=> start!134330 (=> (not res!1072297) (not e!874465))))

(assert (=> start!134330 (= res!1072297 (not (= key1!37 key2!21)))))

(assert (=> start!134330 e!874465))

(declare-fun tp_is_empty!39031 () Bool)

(assert (=> start!134330 tp_is_empty!39031))

(declare-fun e!874466 () Bool)

(assert (=> start!134330 e!874466))

(assert (=> start!134330 true))

(declare-fun b!1568642 () Bool)

(declare-fun tp!114048 () Bool)

(assert (=> b!1568642 (= e!874466 (and tp_is_empty!39031 tp!114048))))

(declare-fun b!1568643 () Bool)

(declare-fun res!1072298 () Bool)

(assert (=> b!1568643 (=> (not res!1072298) (not e!874465))))

(assert (=> b!1568643 (= res!1072298 (isStrictlySorted!995 (t!51630 l!750)))))

(assert (= (and start!134330 res!1072297) b!1568640))

(assert (= (and b!1568640 res!1072299) b!1568639))

(assert (= (and b!1568639 res!1072296) b!1568643))

(assert (= (and b!1568643 res!1072298) b!1568641))

(assert (= (and start!134330 (is-Cons!36718 l!750)) b!1568642))

(declare-fun m!1443241 () Bool)

(assert (=> b!1568640 m!1443241))

(declare-fun m!1443243 () Bool)

(assert (=> b!1568641 m!1443243))

(assert (=> b!1568641 m!1443243))

(declare-fun m!1443245 () Bool)

(assert (=> b!1568641 m!1443245))

(declare-fun m!1443247 () Bool)

(assert (=> b!1568641 m!1443247))

(declare-fun m!1443249 () Bool)

(assert (=> b!1568641 m!1443249))

(assert (=> b!1568641 m!1443247))

(declare-fun m!1443251 () Bool)

(assert (=> b!1568641 m!1443251))

(declare-fun m!1443253 () Bool)

(assert (=> b!1568641 m!1443253))

(assert (=> b!1568641 m!1443253))

(declare-fun m!1443255 () Bool)

(assert (=> b!1568641 m!1443255))

(declare-fun m!1443257 () Bool)

(assert (=> b!1568643 m!1443257))

(push 1)

(assert tp_is_empty!39031)

(assert (not b!1568643))

(assert (not b!1568640))

(assert (not b!1568642))

(assert (not b!1568641))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163765 () Bool)

(declare-fun res!1072338 () Bool)

(declare-fun e!874493 () Bool)

(assert (=> d!163765 (=> res!1072338 e!874493)))

(assert (=> d!163765 (= res!1072338 (or (is-Nil!36719 (t!51630 l!750)) (is-Nil!36719 (t!51630 (t!51630 l!750)))))))

(assert (=> d!163765 (= (isStrictlySorted!995 (t!51630 l!750)) e!874493)))

(declare-fun b!1568688 () Bool)

(declare-fun e!874494 () Bool)

(assert (=> b!1568688 (= e!874493 e!874494)))

(declare-fun res!1072339 () Bool)

(assert (=> b!1568688 (=> (not res!1072339) (not e!874494))))

(assert (=> b!1568688 (= res!1072339 (bvslt (_1!12664 (h!38165 (t!51630 l!750))) (_1!12664 (h!38165 (t!51630 (t!51630 l!750))))))))

(declare-fun b!1568689 () Bool)

(assert (=> b!1568689 (= e!874494 (isStrictlySorted!995 (t!51630 (t!51630 l!750))))))

(assert (= (and d!163765 (not res!1072338)) b!1568688))

(assert (= (and b!1568688 res!1072339) b!1568689))

(declare-fun m!1443301 () Bool)

(assert (=> b!1568689 m!1443301))

(assert (=> b!1568643 d!163765))

(declare-fun d!163771 () Bool)

(declare-fun res!1072340 () Bool)

(declare-fun e!874495 () Bool)

(assert (=> d!163771 (=> res!1072340 e!874495)))

(assert (=> d!163771 (= res!1072340 (or (is-Nil!36719 l!750) (is-Nil!36719 (t!51630 l!750))))))

(assert (=> d!163771 (= (isStrictlySorted!995 l!750) e!874495)))

(declare-fun b!1568690 () Bool)

(declare-fun e!874496 () Bool)

(assert (=> b!1568690 (= e!874495 e!874496)))

(declare-fun res!1072341 () Bool)

(assert (=> b!1568690 (=> (not res!1072341) (not e!874496))))

(assert (=> b!1568690 (= res!1072341 (bvslt (_1!12664 (h!38165 l!750)) (_1!12664 (h!38165 (t!51630 l!750)))))))

(declare-fun b!1568691 () Bool)

(assert (=> b!1568691 (= e!874496 (isStrictlySorted!995 (t!51630 l!750)))))

(assert (= (and d!163771 (not res!1072340)) b!1568690))

(assert (= (and b!1568690 res!1072341) b!1568691))

(assert (=> b!1568691 m!1443257))

(assert (=> b!1568640 d!163771))

(declare-fun d!163773 () Bool)

(assert (=> d!163773 (= (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673225 () Unit!52078)

(declare-fun choose!2078 (List!36722 (_ BitVec 64) B!2480 (_ BitVec 64) B!2480) Unit!52078)

(assert (=> d!163773 (= lt!673225 (choose!2078 (t!51630 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163773 (not (= key1!37 key2!21))))

(assert (=> d!163773 (= (lemmaInsertStrictlySortedCommutative!7 (t!51630 l!750) key1!37 v1!32 key2!21 v2!10) lt!673225)))

(declare-fun bs!45188 () Bool)

(assert (= bs!45188 d!163773))

(assert (=> bs!45188 m!1443243))

(assert (=> bs!45188 m!1443245))

(declare-fun m!1443303 () Bool)

(assert (=> bs!45188 m!1443303))

(assert (=> bs!45188 m!1443247))

(assert (=> bs!45188 m!1443249))

(assert (=> bs!45188 m!1443247))

(assert (=> bs!45188 m!1443243))

(assert (=> b!1568641 d!163773))

(declare-fun d!163777 () Bool)

(declare-fun res!1072342 () Bool)

(declare-fun e!874497 () Bool)

(assert (=> d!163777 (=> res!1072342 e!874497)))

(assert (=> d!163777 (= res!1072342 (or (is-Nil!36719 (insertStrictlySorted!581 l!750 key1!37 v1!32)) (is-Nil!36719 (t!51630 (insertStrictlySorted!581 l!750 key1!37 v1!32)))))))

(assert (=> d!163777 (= (isStrictlySorted!995 (insertStrictlySorted!581 l!750 key1!37 v1!32)) e!874497)))

(declare-fun b!1568692 () Bool)

(declare-fun e!874498 () Bool)

(assert (=> b!1568692 (= e!874497 e!874498)))

(declare-fun res!1072343 () Bool)

(assert (=> b!1568692 (=> (not res!1072343) (not e!874498))))

(assert (=> b!1568692 (= res!1072343 (bvslt (_1!12664 (h!38165 (insertStrictlySorted!581 l!750 key1!37 v1!32))) (_1!12664 (h!38165 (t!51630 (insertStrictlySorted!581 l!750 key1!37 v1!32))))))))

(declare-fun b!1568693 () Bool)

(assert (=> b!1568693 (= e!874498 (isStrictlySorted!995 (t!51630 (insertStrictlySorted!581 l!750 key1!37 v1!32))))))

(assert (= (and d!163777 (not res!1072342)) b!1568692))

(assert (= (and b!1568692 res!1072343) b!1568693))

(declare-fun m!1443305 () Bool)

(assert (=> b!1568693 m!1443305))

(assert (=> b!1568641 d!163777))

(declare-fun d!163779 () Bool)

(declare-fun e!874532 () Bool)

(assert (=> d!163779 e!874532))

(declare-fun res!1072360 () Bool)

(assert (=> d!163779 (=> (not res!1072360) (not e!874532))))

(declare-fun lt!673234 () List!36722)

(assert (=> d!163779 (= res!1072360 (isStrictlySorted!995 lt!673234))))

(declare-fun e!874531 () List!36722)

(assert (=> d!163779 (= lt!673234 e!874531)))

(declare-fun c!144557 () Bool)

(assert (=> d!163779 (= c!144557 (and (is-Cons!36718 l!750) (bvslt (_1!12664 (h!38165 l!750)) key1!37)))))

(assert (=> d!163779 (isStrictlySorted!995 l!750)))

(assert (=> d!163779 (= (insertStrictlySorted!581 l!750 key1!37 v1!32) lt!673234)))

(declare-fun b!1568750 () Bool)

(declare-fun e!874533 () List!36722)

(declare-fun call!71956 () List!36722)

(assert (=> b!1568750 (= e!874533 call!71956)))

(declare-fun bm!71952 () Bool)

(declare-fun call!71955 () List!36722)

(declare-fun call!71957 () List!36722)

(assert (=> bm!71952 (= call!71955 call!71957)))

(declare-fun b!1568751 () Bool)

(declare-fun e!874530 () List!36722)

(assert (=> b!1568751 (= e!874530 call!71955)))

(declare-fun e!874534 () List!36722)

(declare-fun bm!71953 () Bool)

(declare-fun $colon$colon!988 (List!36722 tuple2!25306) List!36722)

(assert (=> bm!71953 (= call!71957 ($colon$colon!988 e!874534 (ite c!144557 (h!38165 l!750) (tuple2!25307 key1!37 v1!32))))))

(declare-fun c!144558 () Bool)

(assert (=> bm!71953 (= c!144558 c!144557)))

(declare-fun bm!71954 () Bool)

(assert (=> bm!71954 (= call!71956 call!71955)))

(declare-fun c!144556 () Bool)

(declare-fun b!1568752 () Bool)

(declare-fun c!144555 () Bool)

(assert (=> b!1568752 (= e!874534 (ite c!144555 (t!51630 l!750) (ite c!144556 (Cons!36718 (h!38165 l!750) (t!51630 l!750)) Nil!36719)))))

(declare-fun b!1568753 () Bool)

(assert (=> b!1568753 (= e!874531 call!71957)))

(declare-fun b!1568754 () Bool)

(declare-fun contains!10415 (List!36722 tuple2!25306) Bool)

(assert (=> b!1568754 (= e!874532 (contains!10415 lt!673234 (tuple2!25307 key1!37 v1!32)))))

(declare-fun b!1568755 () Bool)

(assert (=> b!1568755 (= e!874531 e!874530)))

(assert (=> b!1568755 (= c!144555 (and (is-Cons!36718 l!750) (= (_1!12664 (h!38165 l!750)) key1!37)))))

(declare-fun b!1568756 () Bool)

(assert (=> b!1568756 (= e!874533 call!71956)))

(declare-fun b!1568757 () Bool)

(assert (=> b!1568757 (= c!144556 (and (is-Cons!36718 l!750) (bvsgt (_1!12664 (h!38165 l!750)) key1!37)))))

(assert (=> b!1568757 (= e!874530 e!874533)))

(declare-fun b!1568758 () Bool)

(declare-fun res!1072361 () Bool)

(assert (=> b!1568758 (=> (not res!1072361) (not e!874532))))

(declare-fun containsKey!857 (List!36722 (_ BitVec 64)) Bool)

(assert (=> b!1568758 (= res!1072361 (containsKey!857 lt!673234 key1!37))))

(declare-fun b!1568759 () Bool)

(assert (=> b!1568759 (= e!874534 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32))))

(assert (= (and d!163779 c!144557) b!1568753))

(assert (= (and d!163779 (not c!144557)) b!1568755))

(assert (= (and b!1568755 c!144555) b!1568751))

(assert (= (and b!1568755 (not c!144555)) b!1568757))

(assert (= (and b!1568757 c!144556) b!1568750))

(assert (= (and b!1568757 (not c!144556)) b!1568756))

(assert (= (or b!1568750 b!1568756) bm!71954))

(assert (= (or b!1568751 bm!71954) bm!71952))

(assert (= (or b!1568753 bm!71952) bm!71953))

(assert (= (and bm!71953 c!144558) b!1568759))

(assert (= (and bm!71953 (not c!144558)) b!1568752))

(assert (= (and d!163779 res!1072360) b!1568758))

(assert (= (and b!1568758 res!1072361) b!1568754))

(assert (=> b!1568759 m!1443247))

(declare-fun m!1443311 () Bool)

(assert (=> b!1568758 m!1443311))

(declare-fun m!1443313 () Bool)

(assert (=> d!163779 m!1443313))

(assert (=> d!163779 m!1443241))

(declare-fun m!1443315 () Bool)

(assert (=> b!1568754 m!1443315))

(declare-fun m!1443317 () Bool)

(assert (=> bm!71953 m!1443317))

(assert (=> b!1568641 d!163779))

(declare-fun d!163785 () Bool)

(declare-fun e!874537 () Bool)

(assert (=> d!163785 e!874537))

(declare-fun res!1072362 () Bool)

(assert (=> d!163785 (=> (not res!1072362) (not e!874537))))

(declare-fun lt!673235 () List!36722)

(assert (=> d!163785 (= res!1072362 (isStrictlySorted!995 lt!673235))))

(declare-fun e!874536 () List!36722)

(assert (=> d!163785 (= lt!673235 e!874536)))

(declare-fun c!144561 () Bool)

(assert (=> d!163785 (= c!144561 (and (is-Cons!36718 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32)) (bvslt (_1!12664 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163785 (isStrictlySorted!995 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32))))

(assert (=> d!163785 (= (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32) key2!21 v2!10) lt!673235)))

(declare-fun b!1568760 () Bool)

(declare-fun e!874538 () List!36722)

(declare-fun call!71959 () List!36722)

(assert (=> b!1568760 (= e!874538 call!71959)))

(declare-fun bm!71955 () Bool)

(declare-fun call!71958 () List!36722)

(declare-fun call!71960 () List!36722)

(assert (=> bm!71955 (= call!71958 call!71960)))

(declare-fun b!1568761 () Bool)

(declare-fun e!874535 () List!36722)

(assert (=> b!1568761 (= e!874535 call!71958)))

(declare-fun bm!71956 () Bool)

(declare-fun e!874539 () List!36722)

(assert (=> bm!71956 (= call!71960 ($colon$colon!988 e!874539 (ite c!144561 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32)) (tuple2!25307 key2!21 v2!10))))))

(declare-fun c!144562 () Bool)

(assert (=> bm!71956 (= c!144562 c!144561)))

(declare-fun bm!71957 () Bool)

(assert (=> bm!71957 (= call!71959 call!71958)))

(declare-fun c!144559 () Bool)

(declare-fun c!144560 () Bool)

(declare-fun b!1568762 () Bool)

(assert (=> b!1568762 (= e!874539 (ite c!144559 (t!51630 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32)) (ite c!144560 (Cons!36718 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32)) (t!51630 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32))) Nil!36719)))))

(declare-fun b!1568763 () Bool)

(assert (=> b!1568763 (= e!874536 call!71960)))

(declare-fun b!1568764 () Bool)

(assert (=> b!1568764 (= e!874537 (contains!10415 lt!673235 (tuple2!25307 key2!21 v2!10)))))

(declare-fun b!1568765 () Bool)

(assert (=> b!1568765 (= e!874536 e!874535)))

(assert (=> b!1568765 (= c!144559 (and (is-Cons!36718 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32)) (= (_1!12664 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun b!1568766 () Bool)

(assert (=> b!1568766 (= e!874538 call!71959)))

(declare-fun b!1568767 () Bool)

(assert (=> b!1568767 (= c!144560 (and (is-Cons!36718 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32)) (bvsgt (_1!12664 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> b!1568767 (= e!874535 e!874538)))

(declare-fun b!1568768 () Bool)

(declare-fun res!1072363 () Bool)

(assert (=> b!1568768 (=> (not res!1072363) (not e!874537))))

(assert (=> b!1568768 (= res!1072363 (containsKey!857 lt!673235 key2!21))))

(declare-fun b!1568769 () Bool)

(assert (=> b!1568769 (= e!874539 (insertStrictlySorted!581 (t!51630 (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32)) key2!21 v2!10))))

(assert (= (and d!163785 c!144561) b!1568763))

(assert (= (and d!163785 (not c!144561)) b!1568765))

(assert (= (and b!1568765 c!144559) b!1568761))

(assert (= (and b!1568765 (not c!144559)) b!1568767))

(assert (= (and b!1568767 c!144560) b!1568760))

(assert (= (and b!1568767 (not c!144560)) b!1568766))

(assert (= (or b!1568760 b!1568766) bm!71957))

(assert (= (or b!1568761 bm!71957) bm!71955))

(assert (= (or b!1568763 bm!71955) bm!71956))

(assert (= (and bm!71956 c!144562) b!1568769))

(assert (= (and bm!71956 (not c!144562)) b!1568762))

(assert (= (and d!163785 res!1072362) b!1568768))

(assert (= (and b!1568768 res!1072363) b!1568764))

(declare-fun m!1443327 () Bool)

(assert (=> b!1568769 m!1443327))

(declare-fun m!1443329 () Bool)

(assert (=> b!1568768 m!1443329))

(declare-fun m!1443331 () Bool)

(assert (=> d!163785 m!1443331))

(assert (=> d!163785 m!1443247))

(declare-fun m!1443333 () Bool)

(assert (=> d!163785 m!1443333))

(declare-fun m!1443335 () Bool)

(assert (=> b!1568764 m!1443335))

(declare-fun m!1443337 () Bool)

(assert (=> bm!71956 m!1443337))

(assert (=> b!1568641 d!163785))

(declare-fun d!163789 () Bool)

(declare-fun e!874547 () Bool)

(assert (=> d!163789 e!874547))

(declare-fun res!1072366 () Bool)

(assert (=> d!163789 (=> (not res!1072366) (not e!874547))))

(declare-fun lt!673237 () List!36722)

(assert (=> d!163789 (= res!1072366 (isStrictlySorted!995 lt!673237))))

(declare-fun e!874546 () List!36722)

(assert (=> d!163789 (= lt!673237 e!874546)))

(declare-fun c!144569 () Bool)

(assert (=> d!163789 (= c!144569 (and (is-Cons!36718 (t!51630 l!750)) (bvslt (_1!12664 (h!38165 (t!51630 l!750))) key2!21)))))

(assert (=> d!163789 (isStrictlySorted!995 (t!51630 l!750))))

(assert (=> d!163789 (= (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10) lt!673237)))

(declare-fun b!1568780 () Bool)

(declare-fun e!874548 () List!36722)

(declare-fun call!71965 () List!36722)

(assert (=> b!1568780 (= e!874548 call!71965)))

(declare-fun bm!71961 () Bool)

(declare-fun call!71964 () List!36722)

(declare-fun call!71966 () List!36722)

(assert (=> bm!71961 (= call!71964 call!71966)))

(declare-fun b!1568781 () Bool)

(declare-fun e!874545 () List!36722)

(assert (=> b!1568781 (= e!874545 call!71964)))

(declare-fun e!874549 () List!36722)

(declare-fun bm!71962 () Bool)

(assert (=> bm!71962 (= call!71966 ($colon$colon!988 e!874549 (ite c!144569 (h!38165 (t!51630 l!750)) (tuple2!25307 key2!21 v2!10))))))

(declare-fun c!144570 () Bool)

(assert (=> bm!71962 (= c!144570 c!144569)))

(declare-fun bm!71963 () Bool)

(assert (=> bm!71963 (= call!71965 call!71964)))

(declare-fun c!144568 () Bool)

(declare-fun b!1568782 () Bool)

(declare-fun c!144567 () Bool)

(assert (=> b!1568782 (= e!874549 (ite c!144567 (t!51630 (t!51630 l!750)) (ite c!144568 (Cons!36718 (h!38165 (t!51630 l!750)) (t!51630 (t!51630 l!750))) Nil!36719)))))

(declare-fun b!1568783 () Bool)

(assert (=> b!1568783 (= e!874546 call!71966)))

(declare-fun b!1568784 () Bool)

(assert (=> b!1568784 (= e!874547 (contains!10415 lt!673237 (tuple2!25307 key2!21 v2!10)))))

(declare-fun b!1568785 () Bool)

(assert (=> b!1568785 (= e!874546 e!874545)))

(assert (=> b!1568785 (= c!144567 (and (is-Cons!36718 (t!51630 l!750)) (= (_1!12664 (h!38165 (t!51630 l!750))) key2!21)))))

(declare-fun b!1568786 () Bool)

(assert (=> b!1568786 (= e!874548 call!71965)))

(declare-fun b!1568787 () Bool)

(assert (=> b!1568787 (= c!144568 (and (is-Cons!36718 (t!51630 l!750)) (bvsgt (_1!12664 (h!38165 (t!51630 l!750))) key2!21)))))

(assert (=> b!1568787 (= e!874545 e!874548)))

(declare-fun b!1568788 () Bool)

(declare-fun res!1072367 () Bool)

(assert (=> b!1568788 (=> (not res!1072367) (not e!874547))))

(assert (=> b!1568788 (= res!1072367 (containsKey!857 lt!673237 key2!21))))

(declare-fun b!1568789 () Bool)

(assert (=> b!1568789 (= e!874549 (insertStrictlySorted!581 (t!51630 (t!51630 l!750)) key2!21 v2!10))))

(assert (= (and d!163789 c!144569) b!1568783))

(assert (= (and d!163789 (not c!144569)) b!1568785))

(assert (= (and b!1568785 c!144567) b!1568781))

(assert (= (and b!1568785 (not c!144567)) b!1568787))

(assert (= (and b!1568787 c!144568) b!1568780))

(assert (= (and b!1568787 (not c!144568)) b!1568786))

(assert (= (or b!1568780 b!1568786) bm!71963))

(assert (= (or b!1568781 bm!71963) bm!71961))

(assert (= (or b!1568783 bm!71961) bm!71962))

(assert (= (and bm!71962 c!144570) b!1568789))

(assert (= (and bm!71962 (not c!144570)) b!1568782))

(assert (= (and d!163789 res!1072366) b!1568788))

(assert (= (and b!1568788 res!1072367) b!1568784))

(declare-fun m!1443339 () Bool)

(assert (=> b!1568789 m!1443339))

(declare-fun m!1443341 () Bool)

(assert (=> b!1568788 m!1443341))

(declare-fun m!1443343 () Bool)

(assert (=> d!163789 m!1443343))

(assert (=> d!163789 m!1443257))

(declare-fun m!1443345 () Bool)

(assert (=> b!1568784 m!1443345))

(declare-fun m!1443347 () Bool)

(assert (=> bm!71962 m!1443347))

(assert (=> b!1568641 d!163789))

(declare-fun d!163791 () Bool)

(declare-fun e!874552 () Bool)

(assert (=> d!163791 e!874552))

(declare-fun res!1072368 () Bool)

(assert (=> d!163791 (=> (not res!1072368) (not e!874552))))

(declare-fun lt!673238 () List!36722)

(assert (=> d!163791 (= res!1072368 (isStrictlySorted!995 lt!673238))))

(declare-fun e!874551 () List!36722)

(assert (=> d!163791 (= lt!673238 e!874551)))

(declare-fun c!144573 () Bool)

(assert (=> d!163791 (= c!144573 (and (is-Cons!36718 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10)) (bvslt (_1!12664 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!163791 (isStrictlySorted!995 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10))))

(assert (=> d!163791 (= (insertStrictlySorted!581 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10) key1!37 v1!32) lt!673238)))

(declare-fun b!1568790 () Bool)

(declare-fun e!874553 () List!36722)

(declare-fun call!71968 () List!36722)

(assert (=> b!1568790 (= e!874553 call!71968)))

(declare-fun bm!71964 () Bool)

(declare-fun call!71967 () List!36722)

(declare-fun call!71969 () List!36722)

(assert (=> bm!71964 (= call!71967 call!71969)))

(declare-fun b!1568791 () Bool)

(declare-fun e!874550 () List!36722)

(assert (=> b!1568791 (= e!874550 call!71967)))

(declare-fun e!874554 () List!36722)

(declare-fun bm!71965 () Bool)

(assert (=> bm!71965 (= call!71969 ($colon$colon!988 e!874554 (ite c!144573 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10)) (tuple2!25307 key1!37 v1!32))))))

(declare-fun c!144574 () Bool)

(assert (=> bm!71965 (= c!144574 c!144573)))

(declare-fun bm!71966 () Bool)

(assert (=> bm!71966 (= call!71968 call!71967)))

(declare-fun b!1568792 () Bool)

(declare-fun c!144572 () Bool)

(declare-fun c!144571 () Bool)

(assert (=> b!1568792 (= e!874554 (ite c!144571 (t!51630 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10)) (ite c!144572 (Cons!36718 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10)) (t!51630 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10))) Nil!36719)))))

(declare-fun b!1568793 () Bool)

(assert (=> b!1568793 (= e!874551 call!71969)))

(declare-fun b!1568794 () Bool)

(assert (=> b!1568794 (= e!874552 (contains!10415 lt!673238 (tuple2!25307 key1!37 v1!32)))))

(declare-fun b!1568795 () Bool)

(assert (=> b!1568795 (= e!874551 e!874550)))

(assert (=> b!1568795 (= c!144571 (and (is-Cons!36718 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10)) (= (_1!12664 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun b!1568796 () Bool)

(assert (=> b!1568796 (= e!874553 call!71968)))

(declare-fun b!1568797 () Bool)

(assert (=> b!1568797 (= c!144572 (and (is-Cons!36718 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10)) (bvsgt (_1!12664 (h!38165 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> b!1568797 (= e!874550 e!874553)))

(declare-fun b!1568798 () Bool)

(declare-fun res!1072369 () Bool)

(assert (=> b!1568798 (=> (not res!1072369) (not e!874552))))

(assert (=> b!1568798 (= res!1072369 (containsKey!857 lt!673238 key1!37))))

(declare-fun b!1568799 () Bool)

(assert (=> b!1568799 (= e!874554 (insertStrictlySorted!581 (t!51630 (insertStrictlySorted!581 (t!51630 l!750) key2!21 v2!10)) key1!37 v1!32))))

(assert (= (and d!163791 c!144573) b!1568793))

(assert (= (and d!163791 (not c!144573)) b!1568795))

(assert (= (and b!1568795 c!144571) b!1568791))

(assert (= (and b!1568795 (not c!144571)) b!1568797))

(assert (= (and b!1568797 c!144572) b!1568790))

(assert (= (and b!1568797 (not c!144572)) b!1568796))

(assert (= (or b!1568790 b!1568796) bm!71966))

(assert (= (or b!1568791 bm!71966) bm!71964))

(assert (= (or b!1568793 bm!71964) bm!71965))

(assert (= (and bm!71965 c!144574) b!1568799))

(assert (= (and bm!71965 (not c!144574)) b!1568792))

(assert (= (and d!163791 res!1072368) b!1568798))

(assert (= (and b!1568798 res!1072369) b!1568794))

(declare-fun m!1443361 () Bool)

(assert (=> b!1568799 m!1443361))

(declare-fun m!1443363 () Bool)

(assert (=> b!1568798 m!1443363))

(declare-fun m!1443365 () Bool)

(assert (=> d!163791 m!1443365))

(assert (=> d!163791 m!1443243))

(declare-fun m!1443367 () Bool)

(assert (=> d!163791 m!1443367))

(declare-fun m!1443369 () Bool)

(assert (=> b!1568794 m!1443369))

(declare-fun m!1443371 () Bool)

(assert (=> bm!71965 m!1443371))

(assert (=> b!1568641 d!163791))

(declare-fun d!163795 () Bool)

(declare-fun e!874562 () Bool)

(assert (=> d!163795 e!874562))

(declare-fun res!1072372 () Bool)

(assert (=> d!163795 (=> (not res!1072372) (not e!874562))))

(declare-fun lt!673240 () List!36722)

(assert (=> d!163795 (= res!1072372 (isStrictlySorted!995 lt!673240))))

(declare-fun e!874561 () List!36722)

(assert (=> d!163795 (= lt!673240 e!874561)))

(declare-fun c!144581 () Bool)

(assert (=> d!163795 (= c!144581 (and (is-Cons!36718 (t!51630 l!750)) (bvslt (_1!12664 (h!38165 (t!51630 l!750))) key1!37)))))

(assert (=> d!163795 (isStrictlySorted!995 (t!51630 l!750))))

(assert (=> d!163795 (= (insertStrictlySorted!581 (t!51630 l!750) key1!37 v1!32) lt!673240)))

(declare-fun b!1568810 () Bool)

(declare-fun e!874563 () List!36722)

(declare-fun call!71974 () List!36722)

(assert (=> b!1568810 (= e!874563 call!71974)))

(declare-fun bm!71970 () Bool)

(declare-fun call!71973 () List!36722)

(declare-fun call!71975 () List!36722)

(assert (=> bm!71970 (= call!71973 call!71975)))

(declare-fun b!1568811 () Bool)

(declare-fun e!874560 () List!36722)

(assert (=> b!1568811 (= e!874560 call!71973)))

(declare-fun e!874564 () List!36722)

(declare-fun bm!71971 () Bool)

(assert (=> bm!71971 (= call!71975 ($colon$colon!988 e!874564 (ite c!144581 (h!38165 (t!51630 l!750)) (tuple2!25307 key1!37 v1!32))))))

(declare-fun c!144582 () Bool)

(assert (=> bm!71971 (= c!144582 c!144581)))

(declare-fun bm!71972 () Bool)

(assert (=> bm!71972 (= call!71974 call!71973)))

(declare-fun b!1568812 () Bool)

(declare-fun c!144579 () Bool)

(declare-fun c!144580 () Bool)

(assert (=> b!1568812 (= e!874564 (ite c!144579 (t!51630 (t!51630 l!750)) (ite c!144580 (Cons!36718 (h!38165 (t!51630 l!750)) (t!51630 (t!51630 l!750))) Nil!36719)))))

(declare-fun b!1568813 () Bool)

(assert (=> b!1568813 (= e!874561 call!71975)))

(declare-fun b!1568814 () Bool)

(assert (=> b!1568814 (= e!874562 (contains!10415 lt!673240 (tuple2!25307 key1!37 v1!32)))))

(declare-fun b!1568815 () Bool)

(assert (=> b!1568815 (= e!874561 e!874560)))

(assert (=> b!1568815 (= c!144579 (and (is-Cons!36718 (t!51630 l!750)) (= (_1!12664 (h!38165 (t!51630 l!750))) key1!37)))))

(declare-fun b!1568816 () Bool)

(assert (=> b!1568816 (= e!874563 call!71974)))

(declare-fun b!1568817 () Bool)

(assert (=> b!1568817 (= c!144580 (and (is-Cons!36718 (t!51630 l!750)) (bvsgt (_1!12664 (h!38165 (t!51630 l!750))) key1!37)))))

(assert (=> b!1568817 (= e!874560 e!874563)))

(declare-fun b!1568818 () Bool)

(declare-fun res!1072373 () Bool)

(assert (=> b!1568818 (=> (not res!1072373) (not e!874562))))

(assert (=> b!1568818 (= res!1072373 (containsKey!857 lt!673240 key1!37))))

(declare-fun b!1568819 () Bool)

(assert (=> b!1568819 (= e!874564 (insertStrictlySorted!581 (t!51630 (t!51630 l!750)) key1!37 v1!32))))

(assert (= (and d!163795 c!144581) b!1568813))

(assert (= (and d!163795 (not c!144581)) b!1568815))

(assert (= (and b!1568815 c!144579) b!1568811))

(assert (= (and b!1568815 (not c!144579)) b!1568817))

(assert (= (and b!1568817 c!144580) b!1568810))

(assert (= (and b!1568817 (not c!144580)) b!1568816))

(assert (= (or b!1568810 b!1568816) bm!71972))

(assert (= (or b!1568811 bm!71972) bm!71970))

(assert (= (or b!1568813 bm!71970) bm!71971))

(assert (= (and bm!71971 c!144582) b!1568819))

(assert (= (and bm!71971 (not c!144582)) b!1568812))

(assert (= (and d!163795 res!1072372) b!1568818))

(assert (= (and b!1568818 res!1072373) b!1568814))

(declare-fun m!1443375 () Bool)

(assert (=> b!1568819 m!1443375))

(declare-fun m!1443379 () Bool)

(assert (=> b!1568818 m!1443379))

(declare-fun m!1443381 () Bool)

(assert (=> d!163795 m!1443381))

(assert (=> d!163795 m!1443257))

(declare-fun m!1443385 () Bool)

(assert (=> b!1568814 m!1443385))

(declare-fun m!1443389 () Bool)

(assert (=> bm!71971 m!1443389))

(assert (=> b!1568641 d!163795))

(declare-fun b!1568834 () Bool)

(declare-fun e!874572 () Bool)

(declare-fun tp!114057 () Bool)

(assert (=> b!1568834 (= e!874572 (and tp_is_empty!39031 tp!114057))))

(assert (=> b!1568642 (= tp!114048 e!874572)))

(assert (= (and b!1568642 (is-Cons!36718 (t!51630 l!750))) b!1568834))

(push 1)

