; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134536 () Bool)

(assert start!134536)

(declare-fun b!1570680 () Bool)

(declare-fun e!875693 () Bool)

(declare-fun tp_is_empty!39105 () Bool)

(declare-fun tp!114234 () Bool)

(assert (=> b!1570680 (= e!875693 (and tp_is_empty!39105 tp!114234))))

(declare-datatypes ((B!2554 0))(
  ( (B!2555 (val!19639 Int)) )
))
(declare-fun v1!32 () B!2554)

(declare-fun v2!10 () B!2554)

(declare-fun e!875692 () Bool)

(declare-datatypes ((tuple2!25380 0))(
  ( (tuple2!25381 (_1!12701 (_ BitVec 64)) (_2!12701 B!2554)) )
))
(declare-datatypes ((List!36759 0))(
  ( (Nil!36756) (Cons!36755 (h!38202 tuple2!25380) (t!51670 List!36759)) )
))
(declare-fun l!750 () List!36759)

(declare-fun b!1570679 () Bool)

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun insertStrictlySorted!600 (List!36759 (_ BitVec 64) B!2554) List!36759)

(assert (=> b!1570679 (= e!875692 (not (= (insertStrictlySorted!600 (insertStrictlySorted!600 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!600 (insertStrictlySorted!600 l!750 key2!21 v2!10) key1!37 v1!32))))))

(declare-fun res!1073195 () Bool)

(assert (=> start!134536 (=> (not res!1073195) (not e!875692))))

(assert (=> start!134536 (= res!1073195 (not (= key1!37 key2!21)))))

(assert (=> start!134536 e!875692))

(assert (=> start!134536 tp_is_empty!39105))

(assert (=> start!134536 e!875693))

(assert (=> start!134536 true))

(declare-fun b!1570678 () Bool)

(declare-fun res!1073194 () Bool)

(assert (=> b!1570678 (=> (not res!1073194) (not e!875692))))

(get-info :version)

(assert (=> b!1570678 (= res!1073194 (or (not ((_ is Cons!36755) l!750)) (bvsge (_1!12701 (h!38202 l!750)) key1!37) (bvsge (_1!12701 (h!38202 l!750)) key2!21)))))

(declare-fun b!1570677 () Bool)

(declare-fun res!1073196 () Bool)

(assert (=> b!1570677 (=> (not res!1073196) (not e!875692))))

(declare-fun isStrictlySorted!1023 (List!36759) Bool)

(assert (=> b!1570677 (= res!1073196 (isStrictlySorted!1023 l!750))))

(assert (= (and start!134536 res!1073195) b!1570677))

(assert (= (and b!1570677 res!1073196) b!1570678))

(assert (= (and b!1570678 res!1073194) b!1570679))

(assert (= (and start!134536 ((_ is Cons!36755) l!750)) b!1570680))

(declare-fun m!1444727 () Bool)

(assert (=> b!1570679 m!1444727))

(assert (=> b!1570679 m!1444727))

(declare-fun m!1444729 () Bool)

(assert (=> b!1570679 m!1444729))

(declare-fun m!1444731 () Bool)

(assert (=> b!1570679 m!1444731))

(assert (=> b!1570679 m!1444731))

(declare-fun m!1444733 () Bool)

(assert (=> b!1570679 m!1444733))

(declare-fun m!1444735 () Bool)

(assert (=> b!1570677 m!1444735))

(check-sat (not b!1570677) (not b!1570679) (not b!1570680) tp_is_empty!39105)
(check-sat)
(get-model)

(declare-fun d!164307 () Bool)

(declare-fun res!1073214 () Bool)

(declare-fun e!875708 () Bool)

(assert (=> d!164307 (=> res!1073214 e!875708)))

(assert (=> d!164307 (= res!1073214 (or ((_ is Nil!36756) l!750) ((_ is Nil!36756) (t!51670 l!750))))))

(assert (=> d!164307 (= (isStrictlySorted!1023 l!750) e!875708)))

(declare-fun b!1570701 () Bool)

(declare-fun e!875709 () Bool)

(assert (=> b!1570701 (= e!875708 e!875709)))

(declare-fun res!1073215 () Bool)

(assert (=> b!1570701 (=> (not res!1073215) (not e!875709))))

(assert (=> b!1570701 (= res!1073215 (bvslt (_1!12701 (h!38202 l!750)) (_1!12701 (h!38202 (t!51670 l!750)))))))

(declare-fun b!1570702 () Bool)

(assert (=> b!1570702 (= e!875709 (isStrictlySorted!1023 (t!51670 l!750)))))

(assert (= (and d!164307 (not res!1073214)) b!1570701))

(assert (= (and b!1570701 res!1073215) b!1570702))

(declare-fun m!1444749 () Bool)

(assert (=> b!1570702 m!1444749))

(assert (=> b!1570677 d!164307))

(declare-fun b!1570771 () Bool)

(declare-fun e!875752 () List!36759)

(declare-fun call!72283 () List!36759)

(assert (=> b!1570771 (= e!875752 call!72283)))

(declare-fun b!1570772 () Bool)

(declare-fun lt!673439 () List!36759)

(declare-fun e!875749 () Bool)

(declare-fun contains!10430 (List!36759 tuple2!25380) Bool)

(assert (=> b!1570772 (= e!875749 (contains!10430 lt!673439 (tuple2!25381 key2!21 v2!10)))))

(declare-fun b!1570773 () Bool)

(declare-fun e!875750 () List!36759)

(declare-fun call!72284 () List!36759)

(assert (=> b!1570773 (= e!875750 call!72284)))

(declare-fun b!1570774 () Bool)

(assert (=> b!1570774 (= e!875752 e!875750)))

(declare-fun c!145012 () Bool)

(assert (=> b!1570774 (= c!145012 (and ((_ is Cons!36755) (insertStrictlySorted!600 l!750 key1!37 v1!32)) (= (_1!12701 (h!38202 (insertStrictlySorted!600 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun d!164313 () Bool)

(assert (=> d!164313 e!875749))

(declare-fun res!1073237 () Bool)

(assert (=> d!164313 (=> (not res!1073237) (not e!875749))))

(assert (=> d!164313 (= res!1073237 (isStrictlySorted!1023 lt!673439))))

(assert (=> d!164313 (= lt!673439 e!875752)))

(declare-fun c!145014 () Bool)

(assert (=> d!164313 (= c!145014 (and ((_ is Cons!36755) (insertStrictlySorted!600 l!750 key1!37 v1!32)) (bvslt (_1!12701 (h!38202 (insertStrictlySorted!600 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!164313 (isStrictlySorted!1023 (insertStrictlySorted!600 l!750 key1!37 v1!32))))

(assert (=> d!164313 (= (insertStrictlySorted!600 (insertStrictlySorted!600 l!750 key1!37 v1!32) key2!21 v2!10) lt!673439)))

(declare-fun b!1570775 () Bool)

(declare-fun e!875751 () List!36759)

(declare-fun call!72282 () List!36759)

(assert (=> b!1570775 (= e!875751 call!72282)))

(declare-fun bm!72279 () Bool)

(assert (=> bm!72279 (= call!72284 call!72283)))

(declare-fun b!1570776 () Bool)

(declare-fun res!1073236 () Bool)

(assert (=> b!1570776 (=> (not res!1073236) (not e!875749))))

(declare-fun containsKey!872 (List!36759 (_ BitVec 64)) Bool)

(assert (=> b!1570776 (= res!1073236 (containsKey!872 lt!673439 key2!21))))

(declare-fun bm!72280 () Bool)

(declare-fun e!875748 () List!36759)

(declare-fun $colon$colon!1002 (List!36759 tuple2!25380) List!36759)

(assert (=> bm!72280 (= call!72283 ($colon$colon!1002 e!875748 (ite c!145014 (h!38202 (insertStrictlySorted!600 l!750 key1!37 v1!32)) (tuple2!25381 key2!21 v2!10))))))

(declare-fun c!145013 () Bool)

(assert (=> bm!72280 (= c!145013 c!145014)))

(declare-fun b!1570777 () Bool)

(assert (=> b!1570777 (= e!875748 (insertStrictlySorted!600 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun c!145015 () Bool)

(declare-fun b!1570778 () Bool)

(assert (=> b!1570778 (= c!145015 (and ((_ is Cons!36755) (insertStrictlySorted!600 l!750 key1!37 v1!32)) (bvsgt (_1!12701 (h!38202 (insertStrictlySorted!600 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> b!1570778 (= e!875750 e!875751)))

(declare-fun b!1570779 () Bool)

(assert (=> b!1570779 (= e!875748 (ite c!145012 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32)) (ite c!145015 (Cons!36755 (h!38202 (insertStrictlySorted!600 l!750 key1!37 v1!32)) (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))) Nil!36756)))))

(declare-fun b!1570780 () Bool)

(assert (=> b!1570780 (= e!875751 call!72282)))

(declare-fun bm!72281 () Bool)

(assert (=> bm!72281 (= call!72282 call!72284)))

(assert (= (and d!164313 c!145014) b!1570771))

(assert (= (and d!164313 (not c!145014)) b!1570774))

(assert (= (and b!1570774 c!145012) b!1570773))

(assert (= (and b!1570774 (not c!145012)) b!1570778))

(assert (= (and b!1570778 c!145015) b!1570780))

(assert (= (and b!1570778 (not c!145015)) b!1570775))

(assert (= (or b!1570780 b!1570775) bm!72281))

(assert (= (or b!1570773 bm!72281) bm!72279))

(assert (= (or b!1570771 bm!72279) bm!72280))

(assert (= (and bm!72280 c!145013) b!1570777))

(assert (= (and bm!72280 (not c!145013)) b!1570779))

(assert (= (and d!164313 res!1073237) b!1570776))

(assert (= (and b!1570776 res!1073236) b!1570772))

(declare-fun m!1444753 () Bool)

(assert (=> b!1570772 m!1444753))

(declare-fun m!1444755 () Bool)

(assert (=> b!1570776 m!1444755))

(declare-fun m!1444759 () Bool)

(assert (=> d!164313 m!1444759))

(assert (=> d!164313 m!1444727))

(declare-fun m!1444763 () Bool)

(assert (=> d!164313 m!1444763))

(declare-fun m!1444765 () Bool)

(assert (=> b!1570777 m!1444765))

(declare-fun m!1444771 () Bool)

(assert (=> bm!72280 m!1444771))

(assert (=> b!1570679 d!164313))

(declare-fun b!1570801 () Bool)

(declare-fun e!875767 () List!36759)

(declare-fun call!72292 () List!36759)

(assert (=> b!1570801 (= e!875767 call!72292)))

(declare-fun lt!673442 () List!36759)

(declare-fun b!1570802 () Bool)

(declare-fun e!875764 () Bool)

(assert (=> b!1570802 (= e!875764 (contains!10430 lt!673442 (tuple2!25381 key1!37 v1!32)))))

(declare-fun b!1570803 () Bool)

(declare-fun e!875765 () List!36759)

(declare-fun call!72293 () List!36759)

(assert (=> b!1570803 (= e!875765 call!72293)))

(declare-fun b!1570804 () Bool)

(assert (=> b!1570804 (= e!875767 e!875765)))

(declare-fun c!145024 () Bool)

(assert (=> b!1570804 (= c!145024 (and ((_ is Cons!36755) l!750) (= (_1!12701 (h!38202 l!750)) key1!37)))))

(declare-fun d!164317 () Bool)

(assert (=> d!164317 e!875764))

(declare-fun res!1073243 () Bool)

(assert (=> d!164317 (=> (not res!1073243) (not e!875764))))

(assert (=> d!164317 (= res!1073243 (isStrictlySorted!1023 lt!673442))))

(assert (=> d!164317 (= lt!673442 e!875767)))

(declare-fun c!145026 () Bool)

(assert (=> d!164317 (= c!145026 (and ((_ is Cons!36755) l!750) (bvslt (_1!12701 (h!38202 l!750)) key1!37)))))

(assert (=> d!164317 (isStrictlySorted!1023 l!750)))

(assert (=> d!164317 (= (insertStrictlySorted!600 l!750 key1!37 v1!32) lt!673442)))

(declare-fun b!1570805 () Bool)

(declare-fun e!875766 () List!36759)

(declare-fun call!72291 () List!36759)

(assert (=> b!1570805 (= e!875766 call!72291)))

(declare-fun bm!72288 () Bool)

(assert (=> bm!72288 (= call!72293 call!72292)))

(declare-fun b!1570806 () Bool)

(declare-fun res!1073242 () Bool)

(assert (=> b!1570806 (=> (not res!1073242) (not e!875764))))

(assert (=> b!1570806 (= res!1073242 (containsKey!872 lt!673442 key1!37))))

(declare-fun e!875763 () List!36759)

(declare-fun bm!72289 () Bool)

(assert (=> bm!72289 (= call!72292 ($colon$colon!1002 e!875763 (ite c!145026 (h!38202 l!750) (tuple2!25381 key1!37 v1!32))))))

(declare-fun c!145025 () Bool)

(assert (=> bm!72289 (= c!145025 c!145026)))

(declare-fun b!1570807 () Bool)

(assert (=> b!1570807 (= e!875763 (insertStrictlySorted!600 (t!51670 l!750) key1!37 v1!32))))

(declare-fun b!1570808 () Bool)

(declare-fun c!145027 () Bool)

(assert (=> b!1570808 (= c!145027 (and ((_ is Cons!36755) l!750) (bvsgt (_1!12701 (h!38202 l!750)) key1!37)))))

(assert (=> b!1570808 (= e!875765 e!875766)))

(declare-fun b!1570809 () Bool)

(assert (=> b!1570809 (= e!875763 (ite c!145024 (t!51670 l!750) (ite c!145027 (Cons!36755 (h!38202 l!750) (t!51670 l!750)) Nil!36756)))))

(declare-fun b!1570810 () Bool)

(assert (=> b!1570810 (= e!875766 call!72291)))

(declare-fun bm!72290 () Bool)

(assert (=> bm!72290 (= call!72291 call!72293)))

(assert (= (and d!164317 c!145026) b!1570801))

(assert (= (and d!164317 (not c!145026)) b!1570804))

(assert (= (and b!1570804 c!145024) b!1570803))

(assert (= (and b!1570804 (not c!145024)) b!1570808))

(assert (= (and b!1570808 c!145027) b!1570810))

(assert (= (and b!1570808 (not c!145027)) b!1570805))

(assert (= (or b!1570810 b!1570805) bm!72290))

(assert (= (or b!1570803 bm!72290) bm!72288))

(assert (= (or b!1570801 bm!72288) bm!72289))

(assert (= (and bm!72289 c!145025) b!1570807))

(assert (= (and bm!72289 (not c!145025)) b!1570809))

(assert (= (and d!164317 res!1073243) b!1570806))

(assert (= (and b!1570806 res!1073242) b!1570802))

(declare-fun m!1444789 () Bool)

(assert (=> b!1570802 m!1444789))

(declare-fun m!1444791 () Bool)

(assert (=> b!1570806 m!1444791))

(declare-fun m!1444795 () Bool)

(assert (=> d!164317 m!1444795))

(assert (=> d!164317 m!1444735))

(declare-fun m!1444799 () Bool)

(assert (=> b!1570807 m!1444799))

(declare-fun m!1444803 () Bool)

(assert (=> bm!72289 m!1444803))

(assert (=> b!1570679 d!164317))

(declare-fun b!1570831 () Bool)

(declare-fun e!875782 () List!36759)

(declare-fun call!72301 () List!36759)

(assert (=> b!1570831 (= e!875782 call!72301)))

(declare-fun e!875779 () Bool)

(declare-fun b!1570832 () Bool)

(declare-fun lt!673445 () List!36759)

(assert (=> b!1570832 (= e!875779 (contains!10430 lt!673445 (tuple2!25381 key1!37 v1!32)))))

(declare-fun b!1570833 () Bool)

(declare-fun e!875780 () List!36759)

(declare-fun call!72302 () List!36759)

(assert (=> b!1570833 (= e!875780 call!72302)))

(declare-fun b!1570834 () Bool)

(assert (=> b!1570834 (= e!875782 e!875780)))

(declare-fun c!145036 () Bool)

(assert (=> b!1570834 (= c!145036 (and ((_ is Cons!36755) (insertStrictlySorted!600 l!750 key2!21 v2!10)) (= (_1!12701 (h!38202 (insertStrictlySorted!600 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun d!164323 () Bool)

(assert (=> d!164323 e!875779))

(declare-fun res!1073249 () Bool)

(assert (=> d!164323 (=> (not res!1073249) (not e!875779))))

(assert (=> d!164323 (= res!1073249 (isStrictlySorted!1023 lt!673445))))

(assert (=> d!164323 (= lt!673445 e!875782)))

(declare-fun c!145038 () Bool)

(assert (=> d!164323 (= c!145038 (and ((_ is Cons!36755) (insertStrictlySorted!600 l!750 key2!21 v2!10)) (bvslt (_1!12701 (h!38202 (insertStrictlySorted!600 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!164323 (isStrictlySorted!1023 (insertStrictlySorted!600 l!750 key2!21 v2!10))))

(assert (=> d!164323 (= (insertStrictlySorted!600 (insertStrictlySorted!600 l!750 key2!21 v2!10) key1!37 v1!32) lt!673445)))

(declare-fun b!1570835 () Bool)

(declare-fun e!875781 () List!36759)

(declare-fun call!72300 () List!36759)

(assert (=> b!1570835 (= e!875781 call!72300)))

(declare-fun bm!72297 () Bool)

(assert (=> bm!72297 (= call!72302 call!72301)))

(declare-fun b!1570836 () Bool)

(declare-fun res!1073248 () Bool)

(assert (=> b!1570836 (=> (not res!1073248) (not e!875779))))

(assert (=> b!1570836 (= res!1073248 (containsKey!872 lt!673445 key1!37))))

(declare-fun bm!72298 () Bool)

(declare-fun e!875778 () List!36759)

(assert (=> bm!72298 (= call!72301 ($colon$colon!1002 e!875778 (ite c!145038 (h!38202 (insertStrictlySorted!600 l!750 key2!21 v2!10)) (tuple2!25381 key1!37 v1!32))))))

(declare-fun c!145037 () Bool)

(assert (=> bm!72298 (= c!145037 c!145038)))

(declare-fun b!1570837 () Bool)

(assert (=> b!1570837 (= e!875778 (insertStrictlySorted!600 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun c!145039 () Bool)

(declare-fun b!1570838 () Bool)

(assert (=> b!1570838 (= c!145039 (and ((_ is Cons!36755) (insertStrictlySorted!600 l!750 key2!21 v2!10)) (bvsgt (_1!12701 (h!38202 (insertStrictlySorted!600 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> b!1570838 (= e!875780 e!875781)))

(declare-fun b!1570839 () Bool)

(assert (=> b!1570839 (= e!875778 (ite c!145036 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10)) (ite c!145039 (Cons!36755 (h!38202 (insertStrictlySorted!600 l!750 key2!21 v2!10)) (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))) Nil!36756)))))

(declare-fun b!1570840 () Bool)

(assert (=> b!1570840 (= e!875781 call!72300)))

(declare-fun bm!72299 () Bool)

(assert (=> bm!72299 (= call!72300 call!72302)))

(assert (= (and d!164323 c!145038) b!1570831))

(assert (= (and d!164323 (not c!145038)) b!1570834))

(assert (= (and b!1570834 c!145036) b!1570833))

(assert (= (and b!1570834 (not c!145036)) b!1570838))

(assert (= (and b!1570838 c!145039) b!1570840))

(assert (= (and b!1570838 (not c!145039)) b!1570835))

(assert (= (or b!1570840 b!1570835) bm!72299))

(assert (= (or b!1570833 bm!72299) bm!72297))

(assert (= (or b!1570831 bm!72297) bm!72298))

(assert (= (and bm!72298 c!145037) b!1570837))

(assert (= (and bm!72298 (not c!145037)) b!1570839))

(assert (= (and d!164323 res!1073249) b!1570836))

(assert (= (and b!1570836 res!1073248) b!1570832))

(declare-fun m!1444819 () Bool)

(assert (=> b!1570832 m!1444819))

(declare-fun m!1444821 () Bool)

(assert (=> b!1570836 m!1444821))

(declare-fun m!1444825 () Bool)

(assert (=> d!164323 m!1444825))

(assert (=> d!164323 m!1444731))

(declare-fun m!1444827 () Bool)

(assert (=> d!164323 m!1444827))

(declare-fun m!1444831 () Bool)

(assert (=> b!1570837 m!1444831))

(declare-fun m!1444837 () Bool)

(assert (=> bm!72298 m!1444837))

(assert (=> b!1570679 d!164323))

(declare-fun b!1570861 () Bool)

(declare-fun e!875797 () List!36759)

(declare-fun call!72310 () List!36759)

(assert (=> b!1570861 (= e!875797 call!72310)))

(declare-fun lt!673448 () List!36759)

(declare-fun e!875794 () Bool)

(declare-fun b!1570862 () Bool)

(assert (=> b!1570862 (= e!875794 (contains!10430 lt!673448 (tuple2!25381 key2!21 v2!10)))))

(declare-fun b!1570863 () Bool)

(declare-fun e!875795 () List!36759)

(declare-fun call!72311 () List!36759)

(assert (=> b!1570863 (= e!875795 call!72311)))

(declare-fun b!1570864 () Bool)

(assert (=> b!1570864 (= e!875797 e!875795)))

(declare-fun c!145048 () Bool)

(assert (=> b!1570864 (= c!145048 (and ((_ is Cons!36755) l!750) (= (_1!12701 (h!38202 l!750)) key2!21)))))

(declare-fun d!164329 () Bool)

(assert (=> d!164329 e!875794))

(declare-fun res!1073255 () Bool)

(assert (=> d!164329 (=> (not res!1073255) (not e!875794))))

(assert (=> d!164329 (= res!1073255 (isStrictlySorted!1023 lt!673448))))

(assert (=> d!164329 (= lt!673448 e!875797)))

(declare-fun c!145050 () Bool)

(assert (=> d!164329 (= c!145050 (and ((_ is Cons!36755) l!750) (bvslt (_1!12701 (h!38202 l!750)) key2!21)))))

(assert (=> d!164329 (isStrictlySorted!1023 l!750)))

(assert (=> d!164329 (= (insertStrictlySorted!600 l!750 key2!21 v2!10) lt!673448)))

(declare-fun b!1570865 () Bool)

(declare-fun e!875796 () List!36759)

(declare-fun call!72309 () List!36759)

(assert (=> b!1570865 (= e!875796 call!72309)))

(declare-fun bm!72306 () Bool)

(assert (=> bm!72306 (= call!72311 call!72310)))

(declare-fun b!1570866 () Bool)

(declare-fun res!1073254 () Bool)

(assert (=> b!1570866 (=> (not res!1073254) (not e!875794))))

(assert (=> b!1570866 (= res!1073254 (containsKey!872 lt!673448 key2!21))))

(declare-fun e!875793 () List!36759)

(declare-fun bm!72307 () Bool)

(assert (=> bm!72307 (= call!72310 ($colon$colon!1002 e!875793 (ite c!145050 (h!38202 l!750) (tuple2!25381 key2!21 v2!10))))))

(declare-fun c!145049 () Bool)

(assert (=> bm!72307 (= c!145049 c!145050)))

(declare-fun b!1570867 () Bool)

(assert (=> b!1570867 (= e!875793 (insertStrictlySorted!600 (t!51670 l!750) key2!21 v2!10))))

(declare-fun b!1570868 () Bool)

(declare-fun c!145051 () Bool)

(assert (=> b!1570868 (= c!145051 (and ((_ is Cons!36755) l!750) (bvsgt (_1!12701 (h!38202 l!750)) key2!21)))))

(assert (=> b!1570868 (= e!875795 e!875796)))

(declare-fun b!1570869 () Bool)

(assert (=> b!1570869 (= e!875793 (ite c!145048 (t!51670 l!750) (ite c!145051 (Cons!36755 (h!38202 l!750) (t!51670 l!750)) Nil!36756)))))

(declare-fun b!1570870 () Bool)

(assert (=> b!1570870 (= e!875796 call!72309)))

(declare-fun bm!72308 () Bool)

(assert (=> bm!72308 (= call!72309 call!72311)))

(assert (= (and d!164329 c!145050) b!1570861))

(assert (= (and d!164329 (not c!145050)) b!1570864))

(assert (= (and b!1570864 c!145048) b!1570863))

(assert (= (and b!1570864 (not c!145048)) b!1570868))

(assert (= (and b!1570868 c!145051) b!1570870))

(assert (= (and b!1570868 (not c!145051)) b!1570865))

(assert (= (or b!1570870 b!1570865) bm!72308))

(assert (= (or b!1570863 bm!72308) bm!72306))

(assert (= (or b!1570861 bm!72306) bm!72307))

(assert (= (and bm!72307 c!145049) b!1570867))

(assert (= (and bm!72307 (not c!145049)) b!1570869))

(assert (= (and d!164329 res!1073255) b!1570866))

(assert (= (and b!1570866 res!1073254) b!1570862))

(declare-fun m!1444855 () Bool)

(assert (=> b!1570862 m!1444855))

(declare-fun m!1444857 () Bool)

(assert (=> b!1570866 m!1444857))

(declare-fun m!1444860 () Bool)

(assert (=> d!164329 m!1444860))

(assert (=> d!164329 m!1444735))

(declare-fun m!1444865 () Bool)

(assert (=> b!1570867 m!1444865))

(declare-fun m!1444869 () Bool)

(assert (=> bm!72307 m!1444869))

(assert (=> b!1570679 d!164329))

(declare-fun b!1570900 () Bool)

(declare-fun e!875813 () Bool)

(declare-fun tp!114243 () Bool)

(assert (=> b!1570900 (= e!875813 (and tp_is_empty!39105 tp!114243))))

(assert (=> b!1570680 (= tp!114234 e!875813)))

(assert (= (and b!1570680 ((_ is Cons!36755) (t!51670 l!750))) b!1570900))

(check-sat (not b!1570776) (not b!1570777) (not d!164323) (not b!1570772) (not b!1570807) (not b!1570837) (not d!164329) (not b!1570862) (not bm!72289) (not b!1570702) (not bm!72280) (not bm!72307) (not b!1570867) (not b!1570802) (not b!1570832) (not d!164313) (not b!1570900) tp_is_empty!39105 (not b!1570836) (not bm!72298) (not b!1570866) (not b!1570806) (not d!164317))
(check-sat)
(get-model)

(declare-fun b!1570976 () Bool)

(declare-fun e!875871 () List!36759)

(declare-fun call!72331 () List!36759)

(assert (=> b!1570976 (= e!875871 call!72331)))

(declare-fun e!875868 () Bool)

(declare-fun b!1570977 () Bool)

(declare-fun lt!673460 () List!36759)

(assert (=> b!1570977 (= e!875868 (contains!10430 lt!673460 (tuple2!25381 key1!37 v1!32)))))

(declare-fun b!1570978 () Bool)

(declare-fun e!875869 () List!36759)

(declare-fun call!72332 () List!36759)

(assert (=> b!1570978 (= e!875869 call!72332)))

(declare-fun b!1570979 () Bool)

(assert (=> b!1570979 (= e!875871 e!875869)))

(declare-fun c!145076 () Bool)

(assert (=> b!1570979 (= c!145076 (and ((_ is Cons!36755) (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))) (= (_1!12701 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun d!164371 () Bool)

(assert (=> d!164371 e!875868))

(declare-fun res!1073299 () Bool)

(assert (=> d!164371 (=> (not res!1073299) (not e!875868))))

(assert (=> d!164371 (= res!1073299 (isStrictlySorted!1023 lt!673460))))

(assert (=> d!164371 (= lt!673460 e!875871)))

(declare-fun c!145078 () Bool)

(assert (=> d!164371 (= c!145078 (and ((_ is Cons!36755) (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))) (bvslt (_1!12701 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!164371 (isStrictlySorted!1023 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10)))))

(assert (=> d!164371 (= (insertStrictlySorted!600 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10)) key1!37 v1!32) lt!673460)))

(declare-fun b!1570980 () Bool)

(declare-fun e!875870 () List!36759)

(declare-fun call!72330 () List!36759)

(assert (=> b!1570980 (= e!875870 call!72330)))

(declare-fun bm!72327 () Bool)

(assert (=> bm!72327 (= call!72332 call!72331)))

(declare-fun b!1570981 () Bool)

(declare-fun res!1073298 () Bool)

(assert (=> b!1570981 (=> (not res!1073298) (not e!875868))))

(assert (=> b!1570981 (= res!1073298 (containsKey!872 lt!673460 key1!37))))

(declare-fun e!875867 () List!36759)

(declare-fun bm!72328 () Bool)

(assert (=> bm!72328 (= call!72331 ($colon$colon!1002 e!875867 (ite c!145078 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))) (tuple2!25381 key1!37 v1!32))))))

(declare-fun c!145077 () Bool)

(assert (=> bm!72328 (= c!145077 c!145078)))

(declare-fun b!1570982 () Bool)

(assert (=> b!1570982 (= e!875867 (insertStrictlySorted!600 (t!51670 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun c!145079 () Bool)

(declare-fun b!1570983 () Bool)

(assert (=> b!1570983 (= c!145079 (and ((_ is Cons!36755) (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))) (bvsgt (_1!12701 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> b!1570983 (= e!875869 e!875870)))

(declare-fun b!1570984 () Bool)

(assert (=> b!1570984 (= e!875867 (ite c!145076 (t!51670 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))) (ite c!145079 (Cons!36755 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))) (t!51670 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10)))) Nil!36756)))))

(declare-fun b!1570985 () Bool)

(assert (=> b!1570985 (= e!875870 call!72330)))

(declare-fun bm!72329 () Bool)

(assert (=> bm!72329 (= call!72330 call!72332)))

(assert (= (and d!164371 c!145078) b!1570976))

(assert (= (and d!164371 (not c!145078)) b!1570979))

(assert (= (and b!1570979 c!145076) b!1570978))

(assert (= (and b!1570979 (not c!145076)) b!1570983))

(assert (= (and b!1570983 c!145079) b!1570985))

(assert (= (and b!1570983 (not c!145079)) b!1570980))

(assert (= (or b!1570985 b!1570980) bm!72329))

(assert (= (or b!1570978 bm!72329) bm!72327))

(assert (= (or b!1570976 bm!72327) bm!72328))

(assert (= (and bm!72328 c!145077) b!1570982))

(assert (= (and bm!72328 (not c!145077)) b!1570984))

(assert (= (and d!164371 res!1073299) b!1570981))

(assert (= (and b!1570981 res!1073298) b!1570977))

(declare-fun m!1444963 () Bool)

(assert (=> b!1570977 m!1444963))

(declare-fun m!1444965 () Bool)

(assert (=> b!1570981 m!1444965))

(declare-fun m!1444967 () Bool)

(assert (=> d!164371 m!1444967))

(declare-fun m!1444969 () Bool)

(assert (=> d!164371 m!1444969))

(declare-fun m!1444971 () Bool)

(assert (=> b!1570982 m!1444971))

(declare-fun m!1444973 () Bool)

(assert (=> bm!72328 m!1444973))

(assert (=> b!1570837 d!164371))

(declare-fun d!164381 () Bool)

(declare-fun res!1073306 () Bool)

(declare-fun e!875878 () Bool)

(assert (=> d!164381 (=> res!1073306 e!875878)))

(assert (=> d!164381 (= res!1073306 (or ((_ is Nil!36756) lt!673448) ((_ is Nil!36756) (t!51670 lt!673448))))))

(assert (=> d!164381 (= (isStrictlySorted!1023 lt!673448) e!875878)))

(declare-fun b!1570992 () Bool)

(declare-fun e!875879 () Bool)

(assert (=> b!1570992 (= e!875878 e!875879)))

(declare-fun res!1073307 () Bool)

(assert (=> b!1570992 (=> (not res!1073307) (not e!875879))))

(assert (=> b!1570992 (= res!1073307 (bvslt (_1!12701 (h!38202 lt!673448)) (_1!12701 (h!38202 (t!51670 lt!673448)))))))

(declare-fun b!1570993 () Bool)

(assert (=> b!1570993 (= e!875879 (isStrictlySorted!1023 (t!51670 lt!673448)))))

(assert (= (and d!164381 (not res!1073306)) b!1570992))

(assert (= (and b!1570992 res!1073307) b!1570993))

(declare-fun m!1444977 () Bool)

(assert (=> b!1570993 m!1444977))

(assert (=> d!164329 d!164381))

(assert (=> d!164329 d!164307))

(declare-fun d!164385 () Bool)

(assert (=> d!164385 (= ($colon$colon!1002 e!875748 (ite c!145014 (h!38202 (insertStrictlySorted!600 l!750 key1!37 v1!32)) (tuple2!25381 key2!21 v2!10))) (Cons!36755 (ite c!145014 (h!38202 (insertStrictlySorted!600 l!750 key1!37 v1!32)) (tuple2!25381 key2!21 v2!10)) e!875748))))

(assert (=> bm!72280 d!164385))

(declare-fun d!164387 () Bool)

(declare-fun lt!673464 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!822 (List!36759) (InoxSet tuple2!25380))

(assert (=> d!164387 (= lt!673464 (select (content!822 lt!673448) (tuple2!25381 key2!21 v2!10)))))

(declare-fun e!875887 () Bool)

(assert (=> d!164387 (= lt!673464 e!875887)))

(declare-fun res!1073314 () Bool)

(assert (=> d!164387 (=> (not res!1073314) (not e!875887))))

(assert (=> d!164387 (= res!1073314 ((_ is Cons!36755) lt!673448))))

(assert (=> d!164387 (= (contains!10430 lt!673448 (tuple2!25381 key2!21 v2!10)) lt!673464)))

(declare-fun b!1571001 () Bool)

(declare-fun e!875888 () Bool)

(assert (=> b!1571001 (= e!875887 e!875888)))

(declare-fun res!1073315 () Bool)

(assert (=> b!1571001 (=> res!1073315 e!875888)))

(assert (=> b!1571001 (= res!1073315 (= (h!38202 lt!673448) (tuple2!25381 key2!21 v2!10)))))

(declare-fun b!1571002 () Bool)

(assert (=> b!1571002 (= e!875888 (contains!10430 (t!51670 lt!673448) (tuple2!25381 key2!21 v2!10)))))

(assert (= (and d!164387 res!1073314) b!1571001))

(assert (= (and b!1571001 (not res!1073315)) b!1571002))

(declare-fun m!1444985 () Bool)

(assert (=> d!164387 m!1444985))

(declare-fun m!1444987 () Bool)

(assert (=> d!164387 m!1444987))

(declare-fun m!1444989 () Bool)

(assert (=> b!1571002 m!1444989))

(assert (=> b!1570862 d!164387))

(declare-fun b!1571003 () Bool)

(declare-fun e!875893 () List!36759)

(declare-fun call!72334 () List!36759)

(assert (=> b!1571003 (= e!875893 call!72334)))

(declare-fun b!1571004 () Bool)

(declare-fun lt!673465 () List!36759)

(declare-fun e!875890 () Bool)

(assert (=> b!1571004 (= e!875890 (contains!10430 lt!673465 (tuple2!25381 key2!21 v2!10)))))

(declare-fun b!1571005 () Bool)

(declare-fun e!875891 () List!36759)

(declare-fun call!72335 () List!36759)

(assert (=> b!1571005 (= e!875891 call!72335)))

(declare-fun b!1571006 () Bool)

(assert (=> b!1571006 (= e!875893 e!875891)))

(declare-fun c!145080 () Bool)

(assert (=> b!1571006 (= c!145080 (and ((_ is Cons!36755) (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))) (= (_1!12701 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun d!164389 () Bool)

(assert (=> d!164389 e!875890))

(declare-fun res!1073317 () Bool)

(assert (=> d!164389 (=> (not res!1073317) (not e!875890))))

(assert (=> d!164389 (= res!1073317 (isStrictlySorted!1023 lt!673465))))

(assert (=> d!164389 (= lt!673465 e!875893)))

(declare-fun c!145082 () Bool)

(assert (=> d!164389 (= c!145082 (and ((_ is Cons!36755) (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))) (bvslt (_1!12701 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!164389 (isStrictlySorted!1023 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32)))))

(assert (=> d!164389 (= (insertStrictlySorted!600 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32)) key2!21 v2!10) lt!673465)))

(declare-fun b!1571007 () Bool)

(declare-fun e!875892 () List!36759)

(declare-fun call!72333 () List!36759)

(assert (=> b!1571007 (= e!875892 call!72333)))

(declare-fun bm!72330 () Bool)

(assert (=> bm!72330 (= call!72335 call!72334)))

(declare-fun b!1571008 () Bool)

(declare-fun res!1073316 () Bool)

(assert (=> b!1571008 (=> (not res!1073316) (not e!875890))))

(assert (=> b!1571008 (= res!1073316 (containsKey!872 lt!673465 key2!21))))

(declare-fun e!875889 () List!36759)

(declare-fun bm!72331 () Bool)

(assert (=> bm!72331 (= call!72334 ($colon$colon!1002 e!875889 (ite c!145082 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))) (tuple2!25381 key2!21 v2!10))))))

(declare-fun c!145081 () Bool)

(assert (=> bm!72331 (= c!145081 c!145082)))

(declare-fun b!1571009 () Bool)

(assert (=> b!1571009 (= e!875889 (insertStrictlySorted!600 (t!51670 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun b!1571010 () Bool)

(declare-fun c!145083 () Bool)

(assert (=> b!1571010 (= c!145083 (and ((_ is Cons!36755) (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))) (bvsgt (_1!12701 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> b!1571010 (= e!875891 e!875892)))

(declare-fun b!1571011 () Bool)

(assert (=> b!1571011 (= e!875889 (ite c!145080 (t!51670 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))) (ite c!145083 (Cons!36755 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))) (t!51670 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32)))) Nil!36756)))))

(declare-fun b!1571012 () Bool)

(assert (=> b!1571012 (= e!875892 call!72333)))

(declare-fun bm!72332 () Bool)

(assert (=> bm!72332 (= call!72333 call!72335)))

(assert (= (and d!164389 c!145082) b!1571003))

(assert (= (and d!164389 (not c!145082)) b!1571006))

(assert (= (and b!1571006 c!145080) b!1571005))

(assert (= (and b!1571006 (not c!145080)) b!1571010))

(assert (= (and b!1571010 c!145083) b!1571012))

(assert (= (and b!1571010 (not c!145083)) b!1571007))

(assert (= (or b!1571012 b!1571007) bm!72332))

(assert (= (or b!1571005 bm!72332) bm!72330))

(assert (= (or b!1571003 bm!72330) bm!72331))

(assert (= (and bm!72331 c!145081) b!1571009))

(assert (= (and bm!72331 (not c!145081)) b!1571011))

(assert (= (and d!164389 res!1073317) b!1571008))

(assert (= (and b!1571008 res!1073316) b!1571004))

(declare-fun m!1444991 () Bool)

(assert (=> b!1571004 m!1444991))

(declare-fun m!1444993 () Bool)

(assert (=> b!1571008 m!1444993))

(declare-fun m!1444995 () Bool)

(assert (=> d!164389 m!1444995))

(declare-fun m!1444997 () Bool)

(assert (=> d!164389 m!1444997))

(declare-fun m!1444999 () Bool)

(assert (=> b!1571009 m!1444999))

(declare-fun m!1445001 () Bool)

(assert (=> bm!72331 m!1445001))

(assert (=> b!1570777 d!164389))

(declare-fun d!164391 () Bool)

(declare-fun res!1073318 () Bool)

(declare-fun e!875894 () Bool)

(assert (=> d!164391 (=> res!1073318 e!875894)))

(assert (=> d!164391 (= res!1073318 (or ((_ is Nil!36756) (t!51670 l!750)) ((_ is Nil!36756) (t!51670 (t!51670 l!750)))))))

(assert (=> d!164391 (= (isStrictlySorted!1023 (t!51670 l!750)) e!875894)))

(declare-fun b!1571013 () Bool)

(declare-fun e!875895 () Bool)

(assert (=> b!1571013 (= e!875894 e!875895)))

(declare-fun res!1073319 () Bool)

(assert (=> b!1571013 (=> (not res!1073319) (not e!875895))))

(assert (=> b!1571013 (= res!1073319 (bvslt (_1!12701 (h!38202 (t!51670 l!750))) (_1!12701 (h!38202 (t!51670 (t!51670 l!750))))))))

(declare-fun b!1571014 () Bool)

(assert (=> b!1571014 (= e!875895 (isStrictlySorted!1023 (t!51670 (t!51670 l!750))))))

(assert (= (and d!164391 (not res!1073318)) b!1571013))

(assert (= (and b!1571013 res!1073319) b!1571014))

(declare-fun m!1445003 () Bool)

(assert (=> b!1571014 m!1445003))

(assert (=> b!1570702 d!164391))

(declare-fun d!164393 () Bool)

(declare-fun res!1073320 () Bool)

(declare-fun e!875896 () Bool)

(assert (=> d!164393 (=> res!1073320 e!875896)))

(assert (=> d!164393 (= res!1073320 (or ((_ is Nil!36756) lt!673439) ((_ is Nil!36756) (t!51670 lt!673439))))))

(assert (=> d!164393 (= (isStrictlySorted!1023 lt!673439) e!875896)))

(declare-fun b!1571015 () Bool)

(declare-fun e!875897 () Bool)

(assert (=> b!1571015 (= e!875896 e!875897)))

(declare-fun res!1073321 () Bool)

(assert (=> b!1571015 (=> (not res!1073321) (not e!875897))))

(assert (=> b!1571015 (= res!1073321 (bvslt (_1!12701 (h!38202 lt!673439)) (_1!12701 (h!38202 (t!51670 lt!673439)))))))

(declare-fun b!1571016 () Bool)

(assert (=> b!1571016 (= e!875897 (isStrictlySorted!1023 (t!51670 lt!673439)))))

(assert (= (and d!164393 (not res!1073320)) b!1571015))

(assert (= (and b!1571015 res!1073321) b!1571016))

(declare-fun m!1445005 () Bool)

(assert (=> b!1571016 m!1445005))

(assert (=> d!164313 d!164393))

(declare-fun d!164395 () Bool)

(declare-fun res!1073322 () Bool)

(declare-fun e!875898 () Bool)

(assert (=> d!164395 (=> res!1073322 e!875898)))

(assert (=> d!164395 (= res!1073322 (or ((_ is Nil!36756) (insertStrictlySorted!600 l!750 key1!37 v1!32)) ((_ is Nil!36756) (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32)))))))

(assert (=> d!164395 (= (isStrictlySorted!1023 (insertStrictlySorted!600 l!750 key1!37 v1!32)) e!875898)))

(declare-fun b!1571017 () Bool)

(declare-fun e!875899 () Bool)

(assert (=> b!1571017 (= e!875898 e!875899)))

(declare-fun res!1073323 () Bool)

(assert (=> b!1571017 (=> (not res!1073323) (not e!875899))))

(assert (=> b!1571017 (= res!1073323 (bvslt (_1!12701 (h!38202 (insertStrictlySorted!600 l!750 key1!37 v1!32))) (_1!12701 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))))))))

(declare-fun b!1571018 () Bool)

(assert (=> b!1571018 (= e!875899 (isStrictlySorted!1023 (t!51670 (insertStrictlySorted!600 l!750 key1!37 v1!32))))))

(assert (= (and d!164395 (not res!1073322)) b!1571017))

(assert (= (and b!1571017 res!1073323) b!1571018))

(assert (=> b!1571018 m!1444997))

(assert (=> d!164313 d!164395))

(declare-fun d!164397 () Bool)

(declare-fun res!1073328 () Bool)

(declare-fun e!875904 () Bool)

(assert (=> d!164397 (=> res!1073328 e!875904)))

(assert (=> d!164397 (= res!1073328 (and ((_ is Cons!36755) lt!673445) (= (_1!12701 (h!38202 lt!673445)) key1!37)))))

(assert (=> d!164397 (= (containsKey!872 lt!673445 key1!37) e!875904)))

(declare-fun b!1571023 () Bool)

(declare-fun e!875905 () Bool)

(assert (=> b!1571023 (= e!875904 e!875905)))

(declare-fun res!1073329 () Bool)

(assert (=> b!1571023 (=> (not res!1073329) (not e!875905))))

(assert (=> b!1571023 (= res!1073329 (and (or (not ((_ is Cons!36755) lt!673445)) (bvsle (_1!12701 (h!38202 lt!673445)) key1!37)) ((_ is Cons!36755) lt!673445) (bvslt (_1!12701 (h!38202 lt!673445)) key1!37)))))

(declare-fun b!1571024 () Bool)

(assert (=> b!1571024 (= e!875905 (containsKey!872 (t!51670 lt!673445) key1!37))))

(assert (= (and d!164397 (not res!1073328)) b!1571023))

(assert (= (and b!1571023 res!1073329) b!1571024))

(declare-fun m!1445007 () Bool)

(assert (=> b!1571024 m!1445007))

(assert (=> b!1570836 d!164397))

(declare-fun d!164399 () Bool)

(declare-fun res!1073330 () Bool)

(declare-fun e!875906 () Bool)

(assert (=> d!164399 (=> res!1073330 e!875906)))

(assert (=> d!164399 (= res!1073330 (and ((_ is Cons!36755) lt!673439) (= (_1!12701 (h!38202 lt!673439)) key2!21)))))

(assert (=> d!164399 (= (containsKey!872 lt!673439 key2!21) e!875906)))

(declare-fun b!1571025 () Bool)

(declare-fun e!875907 () Bool)

(assert (=> b!1571025 (= e!875906 e!875907)))

(declare-fun res!1073331 () Bool)

(assert (=> b!1571025 (=> (not res!1073331) (not e!875907))))

(assert (=> b!1571025 (= res!1073331 (and (or (not ((_ is Cons!36755) lt!673439)) (bvsle (_1!12701 (h!38202 lt!673439)) key2!21)) ((_ is Cons!36755) lt!673439) (bvslt (_1!12701 (h!38202 lt!673439)) key2!21)))))

(declare-fun b!1571026 () Bool)

(assert (=> b!1571026 (= e!875907 (containsKey!872 (t!51670 lt!673439) key2!21))))

(assert (= (and d!164399 (not res!1073330)) b!1571025))

(assert (= (and b!1571025 res!1073331) b!1571026))

(declare-fun m!1445009 () Bool)

(assert (=> b!1571026 m!1445009))

(assert (=> b!1570776 d!164399))

(declare-fun d!164401 () Bool)

(declare-fun res!1073332 () Bool)

(declare-fun e!875908 () Bool)

(assert (=> d!164401 (=> res!1073332 e!875908)))

(assert (=> d!164401 (= res!1073332 (or ((_ is Nil!36756) lt!673442) ((_ is Nil!36756) (t!51670 lt!673442))))))

(assert (=> d!164401 (= (isStrictlySorted!1023 lt!673442) e!875908)))

(declare-fun b!1571027 () Bool)

(declare-fun e!875909 () Bool)

(assert (=> b!1571027 (= e!875908 e!875909)))

(declare-fun res!1073333 () Bool)

(assert (=> b!1571027 (=> (not res!1073333) (not e!875909))))

(assert (=> b!1571027 (= res!1073333 (bvslt (_1!12701 (h!38202 lt!673442)) (_1!12701 (h!38202 (t!51670 lt!673442)))))))

(declare-fun b!1571028 () Bool)

(assert (=> b!1571028 (= e!875909 (isStrictlySorted!1023 (t!51670 lt!673442)))))

(assert (= (and d!164401 (not res!1073332)) b!1571027))

(assert (= (and b!1571027 res!1073333) b!1571028))

(declare-fun m!1445011 () Bool)

(assert (=> b!1571028 m!1445011))

(assert (=> d!164317 d!164401))

(assert (=> d!164317 d!164307))

(declare-fun d!164403 () Bool)

(declare-fun lt!673466 () Bool)

(assert (=> d!164403 (= lt!673466 (select (content!822 lt!673442) (tuple2!25381 key1!37 v1!32)))))

(declare-fun e!875910 () Bool)

(assert (=> d!164403 (= lt!673466 e!875910)))

(declare-fun res!1073334 () Bool)

(assert (=> d!164403 (=> (not res!1073334) (not e!875910))))

(assert (=> d!164403 (= res!1073334 ((_ is Cons!36755) lt!673442))))

(assert (=> d!164403 (= (contains!10430 lt!673442 (tuple2!25381 key1!37 v1!32)) lt!673466)))

(declare-fun b!1571029 () Bool)

(declare-fun e!875911 () Bool)

(assert (=> b!1571029 (= e!875910 e!875911)))

(declare-fun res!1073335 () Bool)

(assert (=> b!1571029 (=> res!1073335 e!875911)))

(assert (=> b!1571029 (= res!1073335 (= (h!38202 lt!673442) (tuple2!25381 key1!37 v1!32)))))

(declare-fun b!1571030 () Bool)

(assert (=> b!1571030 (= e!875911 (contains!10430 (t!51670 lt!673442) (tuple2!25381 key1!37 v1!32)))))

(assert (= (and d!164403 res!1073334) b!1571029))

(assert (= (and b!1571029 (not res!1073335)) b!1571030))

(declare-fun m!1445013 () Bool)

(assert (=> d!164403 m!1445013))

(declare-fun m!1445015 () Bool)

(assert (=> d!164403 m!1445015))

(declare-fun m!1445017 () Bool)

(assert (=> b!1571030 m!1445017))

(assert (=> b!1570802 d!164403))

(declare-fun d!164405 () Bool)

(assert (=> d!164405 (= ($colon$colon!1002 e!875778 (ite c!145038 (h!38202 (insertStrictlySorted!600 l!750 key2!21 v2!10)) (tuple2!25381 key1!37 v1!32))) (Cons!36755 (ite c!145038 (h!38202 (insertStrictlySorted!600 l!750 key2!21 v2!10)) (tuple2!25381 key1!37 v1!32)) e!875778))))

(assert (=> bm!72298 d!164405))

(declare-fun d!164407 () Bool)

(assert (=> d!164407 (= ($colon$colon!1002 e!875763 (ite c!145026 (h!38202 l!750) (tuple2!25381 key1!37 v1!32))) (Cons!36755 (ite c!145026 (h!38202 l!750) (tuple2!25381 key1!37 v1!32)) e!875763))))

(assert (=> bm!72289 d!164407))

(declare-fun b!1571031 () Bool)

(declare-fun e!875916 () List!36759)

(declare-fun call!72337 () List!36759)

(assert (=> b!1571031 (= e!875916 call!72337)))

(declare-fun e!875913 () Bool)

(declare-fun b!1571032 () Bool)

(declare-fun lt!673467 () List!36759)

(assert (=> b!1571032 (= e!875913 (contains!10430 lt!673467 (tuple2!25381 key1!37 v1!32)))))

(declare-fun b!1571033 () Bool)

(declare-fun e!875914 () List!36759)

(declare-fun call!72338 () List!36759)

(assert (=> b!1571033 (= e!875914 call!72338)))

(declare-fun b!1571034 () Bool)

(assert (=> b!1571034 (= e!875916 e!875914)))

(declare-fun c!145084 () Bool)

(assert (=> b!1571034 (= c!145084 (and ((_ is Cons!36755) (t!51670 l!750)) (= (_1!12701 (h!38202 (t!51670 l!750))) key1!37)))))

(declare-fun d!164409 () Bool)

(assert (=> d!164409 e!875913))

(declare-fun res!1073337 () Bool)

(assert (=> d!164409 (=> (not res!1073337) (not e!875913))))

(assert (=> d!164409 (= res!1073337 (isStrictlySorted!1023 lt!673467))))

(assert (=> d!164409 (= lt!673467 e!875916)))

(declare-fun c!145086 () Bool)

(assert (=> d!164409 (= c!145086 (and ((_ is Cons!36755) (t!51670 l!750)) (bvslt (_1!12701 (h!38202 (t!51670 l!750))) key1!37)))))

(assert (=> d!164409 (isStrictlySorted!1023 (t!51670 l!750))))

(assert (=> d!164409 (= (insertStrictlySorted!600 (t!51670 l!750) key1!37 v1!32) lt!673467)))

(declare-fun b!1571035 () Bool)

(declare-fun e!875915 () List!36759)

(declare-fun call!72336 () List!36759)

(assert (=> b!1571035 (= e!875915 call!72336)))

(declare-fun bm!72333 () Bool)

(assert (=> bm!72333 (= call!72338 call!72337)))

(declare-fun b!1571036 () Bool)

(declare-fun res!1073336 () Bool)

(assert (=> b!1571036 (=> (not res!1073336) (not e!875913))))

(assert (=> b!1571036 (= res!1073336 (containsKey!872 lt!673467 key1!37))))

(declare-fun e!875912 () List!36759)

(declare-fun bm!72334 () Bool)

(assert (=> bm!72334 (= call!72337 ($colon$colon!1002 e!875912 (ite c!145086 (h!38202 (t!51670 l!750)) (tuple2!25381 key1!37 v1!32))))))

(declare-fun c!145085 () Bool)

(assert (=> bm!72334 (= c!145085 c!145086)))

(declare-fun b!1571037 () Bool)

(assert (=> b!1571037 (= e!875912 (insertStrictlySorted!600 (t!51670 (t!51670 l!750)) key1!37 v1!32))))

(declare-fun b!1571038 () Bool)

(declare-fun c!145087 () Bool)

(assert (=> b!1571038 (= c!145087 (and ((_ is Cons!36755) (t!51670 l!750)) (bvsgt (_1!12701 (h!38202 (t!51670 l!750))) key1!37)))))

(assert (=> b!1571038 (= e!875914 e!875915)))

(declare-fun b!1571039 () Bool)

(assert (=> b!1571039 (= e!875912 (ite c!145084 (t!51670 (t!51670 l!750)) (ite c!145087 (Cons!36755 (h!38202 (t!51670 l!750)) (t!51670 (t!51670 l!750))) Nil!36756)))))

(declare-fun b!1571040 () Bool)

(assert (=> b!1571040 (= e!875915 call!72336)))

(declare-fun bm!72335 () Bool)

(assert (=> bm!72335 (= call!72336 call!72338)))

(assert (= (and d!164409 c!145086) b!1571031))

(assert (= (and d!164409 (not c!145086)) b!1571034))

(assert (= (and b!1571034 c!145084) b!1571033))

(assert (= (and b!1571034 (not c!145084)) b!1571038))

(assert (= (and b!1571038 c!145087) b!1571040))

(assert (= (and b!1571038 (not c!145087)) b!1571035))

(assert (= (or b!1571040 b!1571035) bm!72335))

(assert (= (or b!1571033 bm!72335) bm!72333))

(assert (= (or b!1571031 bm!72333) bm!72334))

(assert (= (and bm!72334 c!145085) b!1571037))

(assert (= (and bm!72334 (not c!145085)) b!1571039))

(assert (= (and d!164409 res!1073337) b!1571036))

(assert (= (and b!1571036 res!1073336) b!1571032))

(declare-fun m!1445019 () Bool)

(assert (=> b!1571032 m!1445019))

(declare-fun m!1445021 () Bool)

(assert (=> b!1571036 m!1445021))

(declare-fun m!1445023 () Bool)

(assert (=> d!164409 m!1445023))

(assert (=> d!164409 m!1444749))

(declare-fun m!1445025 () Bool)

(assert (=> b!1571037 m!1445025))

(declare-fun m!1445027 () Bool)

(assert (=> bm!72334 m!1445027))

(assert (=> b!1570807 d!164409))

(declare-fun d!164411 () Bool)

(assert (=> d!164411 (= ($colon$colon!1002 e!875793 (ite c!145050 (h!38202 l!750) (tuple2!25381 key2!21 v2!10))) (Cons!36755 (ite c!145050 (h!38202 l!750) (tuple2!25381 key2!21 v2!10)) e!875793))))

(assert (=> bm!72307 d!164411))

(declare-fun b!1571041 () Bool)

(declare-fun e!875921 () List!36759)

(declare-fun call!72340 () List!36759)

(assert (=> b!1571041 (= e!875921 call!72340)))

(declare-fun lt!673468 () List!36759)

(declare-fun b!1571042 () Bool)

(declare-fun e!875918 () Bool)

(assert (=> b!1571042 (= e!875918 (contains!10430 lt!673468 (tuple2!25381 key2!21 v2!10)))))

(declare-fun b!1571043 () Bool)

(declare-fun e!875919 () List!36759)

(declare-fun call!72341 () List!36759)

(assert (=> b!1571043 (= e!875919 call!72341)))

(declare-fun b!1571044 () Bool)

(assert (=> b!1571044 (= e!875921 e!875919)))

(declare-fun c!145088 () Bool)

(assert (=> b!1571044 (= c!145088 (and ((_ is Cons!36755) (t!51670 l!750)) (= (_1!12701 (h!38202 (t!51670 l!750))) key2!21)))))

(declare-fun d!164413 () Bool)

(assert (=> d!164413 e!875918))

(declare-fun res!1073339 () Bool)

(assert (=> d!164413 (=> (not res!1073339) (not e!875918))))

(assert (=> d!164413 (= res!1073339 (isStrictlySorted!1023 lt!673468))))

(assert (=> d!164413 (= lt!673468 e!875921)))

(declare-fun c!145090 () Bool)

(assert (=> d!164413 (= c!145090 (and ((_ is Cons!36755) (t!51670 l!750)) (bvslt (_1!12701 (h!38202 (t!51670 l!750))) key2!21)))))

(assert (=> d!164413 (isStrictlySorted!1023 (t!51670 l!750))))

(assert (=> d!164413 (= (insertStrictlySorted!600 (t!51670 l!750) key2!21 v2!10) lt!673468)))

(declare-fun b!1571045 () Bool)

(declare-fun e!875920 () List!36759)

(declare-fun call!72339 () List!36759)

(assert (=> b!1571045 (= e!875920 call!72339)))

(declare-fun bm!72336 () Bool)

(assert (=> bm!72336 (= call!72341 call!72340)))

(declare-fun b!1571046 () Bool)

(declare-fun res!1073338 () Bool)

(assert (=> b!1571046 (=> (not res!1073338) (not e!875918))))

(assert (=> b!1571046 (= res!1073338 (containsKey!872 lt!673468 key2!21))))

(declare-fun e!875917 () List!36759)

(declare-fun bm!72337 () Bool)

(assert (=> bm!72337 (= call!72340 ($colon$colon!1002 e!875917 (ite c!145090 (h!38202 (t!51670 l!750)) (tuple2!25381 key2!21 v2!10))))))

(declare-fun c!145089 () Bool)

(assert (=> bm!72337 (= c!145089 c!145090)))

(declare-fun b!1571047 () Bool)

(assert (=> b!1571047 (= e!875917 (insertStrictlySorted!600 (t!51670 (t!51670 l!750)) key2!21 v2!10))))

(declare-fun b!1571048 () Bool)

(declare-fun c!145091 () Bool)

(assert (=> b!1571048 (= c!145091 (and ((_ is Cons!36755) (t!51670 l!750)) (bvsgt (_1!12701 (h!38202 (t!51670 l!750))) key2!21)))))

(assert (=> b!1571048 (= e!875919 e!875920)))

(declare-fun b!1571049 () Bool)

(assert (=> b!1571049 (= e!875917 (ite c!145088 (t!51670 (t!51670 l!750)) (ite c!145091 (Cons!36755 (h!38202 (t!51670 l!750)) (t!51670 (t!51670 l!750))) Nil!36756)))))

(declare-fun b!1571050 () Bool)

(assert (=> b!1571050 (= e!875920 call!72339)))

(declare-fun bm!72338 () Bool)

(assert (=> bm!72338 (= call!72339 call!72341)))

(assert (= (and d!164413 c!145090) b!1571041))

(assert (= (and d!164413 (not c!145090)) b!1571044))

(assert (= (and b!1571044 c!145088) b!1571043))

(assert (= (and b!1571044 (not c!145088)) b!1571048))

(assert (= (and b!1571048 c!145091) b!1571050))

(assert (= (and b!1571048 (not c!145091)) b!1571045))

(assert (= (or b!1571050 b!1571045) bm!72338))

(assert (= (or b!1571043 bm!72338) bm!72336))

(assert (= (or b!1571041 bm!72336) bm!72337))

(assert (= (and bm!72337 c!145089) b!1571047))

(assert (= (and bm!72337 (not c!145089)) b!1571049))

(assert (= (and d!164413 res!1073339) b!1571046))

(assert (= (and b!1571046 res!1073338) b!1571042))

(declare-fun m!1445029 () Bool)

(assert (=> b!1571042 m!1445029))

(declare-fun m!1445031 () Bool)

(assert (=> b!1571046 m!1445031))

(declare-fun m!1445033 () Bool)

(assert (=> d!164413 m!1445033))

(assert (=> d!164413 m!1444749))

(declare-fun m!1445035 () Bool)

(assert (=> b!1571047 m!1445035))

(declare-fun m!1445037 () Bool)

(assert (=> bm!72337 m!1445037))

(assert (=> b!1570867 d!164413))

(declare-fun d!164415 () Bool)

(declare-fun res!1073340 () Bool)

(declare-fun e!875922 () Bool)

(assert (=> d!164415 (=> res!1073340 e!875922)))

(assert (=> d!164415 (= res!1073340 (and ((_ is Cons!36755) lt!673442) (= (_1!12701 (h!38202 lt!673442)) key1!37)))))

(assert (=> d!164415 (= (containsKey!872 lt!673442 key1!37) e!875922)))

(declare-fun b!1571051 () Bool)

(declare-fun e!875923 () Bool)

(assert (=> b!1571051 (= e!875922 e!875923)))

(declare-fun res!1073341 () Bool)

(assert (=> b!1571051 (=> (not res!1073341) (not e!875923))))

(assert (=> b!1571051 (= res!1073341 (and (or (not ((_ is Cons!36755) lt!673442)) (bvsle (_1!12701 (h!38202 lt!673442)) key1!37)) ((_ is Cons!36755) lt!673442) (bvslt (_1!12701 (h!38202 lt!673442)) key1!37)))))

(declare-fun b!1571052 () Bool)

(assert (=> b!1571052 (= e!875923 (containsKey!872 (t!51670 lt!673442) key1!37))))

(assert (= (and d!164415 (not res!1073340)) b!1571051))

(assert (= (and b!1571051 res!1073341) b!1571052))

(declare-fun m!1445039 () Bool)

(assert (=> b!1571052 m!1445039))

(assert (=> b!1570806 d!164415))

(declare-fun d!164417 () Bool)

(declare-fun res!1073342 () Bool)

(declare-fun e!875924 () Bool)

(assert (=> d!164417 (=> res!1073342 e!875924)))

(assert (=> d!164417 (= res!1073342 (or ((_ is Nil!36756) lt!673445) ((_ is Nil!36756) (t!51670 lt!673445))))))

(assert (=> d!164417 (= (isStrictlySorted!1023 lt!673445) e!875924)))

(declare-fun b!1571053 () Bool)

(declare-fun e!875925 () Bool)

(assert (=> b!1571053 (= e!875924 e!875925)))

(declare-fun res!1073343 () Bool)

(assert (=> b!1571053 (=> (not res!1073343) (not e!875925))))

(assert (=> b!1571053 (= res!1073343 (bvslt (_1!12701 (h!38202 lt!673445)) (_1!12701 (h!38202 (t!51670 lt!673445)))))))

(declare-fun b!1571054 () Bool)

(assert (=> b!1571054 (= e!875925 (isStrictlySorted!1023 (t!51670 lt!673445)))))

(assert (= (and d!164417 (not res!1073342)) b!1571053))

(assert (= (and b!1571053 res!1073343) b!1571054))

(declare-fun m!1445041 () Bool)

(assert (=> b!1571054 m!1445041))

(assert (=> d!164323 d!164417))

(declare-fun d!164419 () Bool)

(declare-fun res!1073344 () Bool)

(declare-fun e!875926 () Bool)

(assert (=> d!164419 (=> res!1073344 e!875926)))

(assert (=> d!164419 (= res!1073344 (or ((_ is Nil!36756) (insertStrictlySorted!600 l!750 key2!21 v2!10)) ((_ is Nil!36756) (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10)))))))

(assert (=> d!164419 (= (isStrictlySorted!1023 (insertStrictlySorted!600 l!750 key2!21 v2!10)) e!875926)))

(declare-fun b!1571055 () Bool)

(declare-fun e!875927 () Bool)

(assert (=> b!1571055 (= e!875926 e!875927)))

(declare-fun res!1073345 () Bool)

(assert (=> b!1571055 (=> (not res!1073345) (not e!875927))))

(assert (=> b!1571055 (= res!1073345 (bvslt (_1!12701 (h!38202 (insertStrictlySorted!600 l!750 key2!21 v2!10))) (_1!12701 (h!38202 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))))))))

(declare-fun b!1571056 () Bool)

(assert (=> b!1571056 (= e!875927 (isStrictlySorted!1023 (t!51670 (insertStrictlySorted!600 l!750 key2!21 v2!10))))))

(assert (= (and d!164419 (not res!1073344)) b!1571055))

(assert (= (and b!1571055 res!1073345) b!1571056))

(assert (=> b!1571056 m!1444969))

(assert (=> d!164323 d!164419))

(declare-fun lt!673469 () Bool)

(declare-fun d!164421 () Bool)

(assert (=> d!164421 (= lt!673469 (select (content!822 lt!673445) (tuple2!25381 key1!37 v1!32)))))

(declare-fun e!875928 () Bool)

(assert (=> d!164421 (= lt!673469 e!875928)))

(declare-fun res!1073346 () Bool)

(assert (=> d!164421 (=> (not res!1073346) (not e!875928))))

(assert (=> d!164421 (= res!1073346 ((_ is Cons!36755) lt!673445))))

(assert (=> d!164421 (= (contains!10430 lt!673445 (tuple2!25381 key1!37 v1!32)) lt!673469)))

(declare-fun b!1571057 () Bool)

(declare-fun e!875929 () Bool)

(assert (=> b!1571057 (= e!875928 e!875929)))

(declare-fun res!1073347 () Bool)

(assert (=> b!1571057 (=> res!1073347 e!875929)))

(assert (=> b!1571057 (= res!1073347 (= (h!38202 lt!673445) (tuple2!25381 key1!37 v1!32)))))

(declare-fun b!1571058 () Bool)

(assert (=> b!1571058 (= e!875929 (contains!10430 (t!51670 lt!673445) (tuple2!25381 key1!37 v1!32)))))

(assert (= (and d!164421 res!1073346) b!1571057))

(assert (= (and b!1571057 (not res!1073347)) b!1571058))

(declare-fun m!1445043 () Bool)

(assert (=> d!164421 m!1445043))

(declare-fun m!1445045 () Bool)

(assert (=> d!164421 m!1445045))

(declare-fun m!1445047 () Bool)

(assert (=> b!1571058 m!1445047))

(assert (=> b!1570832 d!164421))

(declare-fun d!164423 () Bool)

(declare-fun res!1073348 () Bool)

(declare-fun e!875930 () Bool)

(assert (=> d!164423 (=> res!1073348 e!875930)))

(assert (=> d!164423 (= res!1073348 (and ((_ is Cons!36755) lt!673448) (= (_1!12701 (h!38202 lt!673448)) key2!21)))))

(assert (=> d!164423 (= (containsKey!872 lt!673448 key2!21) e!875930)))

(declare-fun b!1571059 () Bool)

(declare-fun e!875931 () Bool)

(assert (=> b!1571059 (= e!875930 e!875931)))

(declare-fun res!1073349 () Bool)

(assert (=> b!1571059 (=> (not res!1073349) (not e!875931))))

(assert (=> b!1571059 (= res!1073349 (and (or (not ((_ is Cons!36755) lt!673448)) (bvsle (_1!12701 (h!38202 lt!673448)) key2!21)) ((_ is Cons!36755) lt!673448) (bvslt (_1!12701 (h!38202 lt!673448)) key2!21)))))

(declare-fun b!1571060 () Bool)

(assert (=> b!1571060 (= e!875931 (containsKey!872 (t!51670 lt!673448) key2!21))))

(assert (= (and d!164423 (not res!1073348)) b!1571059))

(assert (= (and b!1571059 res!1073349) b!1571060))

(declare-fun m!1445049 () Bool)

(assert (=> b!1571060 m!1445049))

(assert (=> b!1570866 d!164423))

(declare-fun lt!673470 () Bool)

(declare-fun d!164425 () Bool)

(assert (=> d!164425 (= lt!673470 (select (content!822 lt!673439) (tuple2!25381 key2!21 v2!10)))))

(declare-fun e!875932 () Bool)

(assert (=> d!164425 (= lt!673470 e!875932)))

(declare-fun res!1073350 () Bool)

(assert (=> d!164425 (=> (not res!1073350) (not e!875932))))

(assert (=> d!164425 (= res!1073350 ((_ is Cons!36755) lt!673439))))

(assert (=> d!164425 (= (contains!10430 lt!673439 (tuple2!25381 key2!21 v2!10)) lt!673470)))

(declare-fun b!1571061 () Bool)

(declare-fun e!875933 () Bool)

(assert (=> b!1571061 (= e!875932 e!875933)))

(declare-fun res!1073351 () Bool)

(assert (=> b!1571061 (=> res!1073351 e!875933)))

(assert (=> b!1571061 (= res!1073351 (= (h!38202 lt!673439) (tuple2!25381 key2!21 v2!10)))))

(declare-fun b!1571062 () Bool)

(assert (=> b!1571062 (= e!875933 (contains!10430 (t!51670 lt!673439) (tuple2!25381 key2!21 v2!10)))))

(assert (= (and d!164425 res!1073350) b!1571061))

(assert (= (and b!1571061 (not res!1073351)) b!1571062))

(declare-fun m!1445051 () Bool)

(assert (=> d!164425 m!1445051))

(declare-fun m!1445053 () Bool)

(assert (=> d!164425 m!1445053))

(declare-fun m!1445055 () Bool)

(assert (=> b!1571062 m!1445055))

(assert (=> b!1570772 d!164425))

(declare-fun b!1571063 () Bool)

(declare-fun e!875934 () Bool)

(declare-fun tp!114248 () Bool)

(assert (=> b!1571063 (= e!875934 (and tp_is_empty!39105 tp!114248))))

(assert (=> b!1570900 (= tp!114243 e!875934)))

(assert (= (and b!1570900 ((_ is Cons!36755) (t!51670 (t!51670 l!750)))) b!1571063))

(check-sat (not d!164403) (not b!1570981) (not d!164421) (not d!164371) (not b!1571008) (not b!1571009) (not b!1570977) (not b!1571026) (not b!1571052) (not b!1571002) (not b!1571054) (not bm!72328) (not b!1571024) (not b!1571042) (not b!1571032) (not b!1571058) (not b!1571046) (not b!1571056) (not b!1571062) (not b!1571030) (not b!1571036) tp_is_empty!39105 (not b!1570993) (not b!1571047) (not b!1570982) (not d!164389) (not b!1571037) (not b!1571014) (not d!164425) (not b!1571016) (not b!1571063) (not b!1571018) (not bm!72337) (not bm!72331) (not b!1571060) (not b!1571004) (not d!164387) (not d!164413) (not bm!72334) (not d!164409) (not b!1571028))
(check-sat)
