; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136912 () Bool)

(assert start!136912)

(declare-fun res!1078919 () Bool)

(declare-fun e!880796 () Bool)

(assert (=> start!136912 (=> res!1078919 e!880796)))

(declare-datatypes ((B!2588 0))(
  ( (B!2589 (val!19656 Int)) )
))
(declare-datatypes ((tuple2!25482 0))(
  ( (tuple2!25483 (_1!12752 (_ BitVec 64)) (_2!12752 B!2588)) )
))
(declare-datatypes ((List!36817 0))(
  ( (Nil!36814) (Cons!36813 (h!38357 tuple2!25482) (t!51723 List!36817)) )
))
(declare-fun lt!676215 () List!36817)

(declare-fun isStrictlySorted!1035 (List!36817) Bool)

(assert (=> start!136912 (= res!1078919 (not (isStrictlySorted!1035 lt!676215)))))

(declare-datatypes ((ListLongMap!22821 0))(
  ( (ListLongMap!22822 (toList!11426 List!36817)) )
))
(declare-fun thiss!201 () ListLongMap!22821)

(declare-fun keyValue!4 () tuple2!25482)

(declare-fun insertStrictlySorted!609 (List!36817 (_ BitVec 64) B!2588) List!36817)

(assert (=> start!136912 (= lt!676215 (insertStrictlySorted!609 (toList!11426 thiss!201) (_1!12752 keyValue!4) (_2!12752 keyValue!4)))))

(assert (=> start!136912 e!880796))

(declare-fun e!880795 () Bool)

(declare-fun inv!58952 (ListLongMap!22821) Bool)

(assert (=> start!136912 (and (inv!58952 thiss!201) e!880795)))

(declare-fun tp_is_empty!39133 () Bool)

(assert (=> start!136912 tp_is_empty!39133))

(declare-fun b!1579002 () Bool)

(declare-fun res!1078920 () Bool)

(assert (=> b!1579002 (=> res!1078920 e!880796)))

(declare-fun containsKey!881 (List!36817 (_ BitVec 64)) Bool)

(assert (=> b!1579002 (= res!1078920 (not (containsKey!881 lt!676215 (_1!12752 keyValue!4))))))

(declare-fun b!1579003 () Bool)

(declare-fun contains!10403 (List!36817 tuple2!25482) Bool)

(assert (=> b!1579003 (= e!880796 (not (contains!10403 lt!676215 keyValue!4)))))

(declare-fun b!1579004 () Bool)

(declare-fun tp!114325 () Bool)

(assert (=> b!1579004 (= e!880795 tp!114325)))

(assert (= (and start!136912 (not res!1078919)) b!1579002))

(assert (= (and b!1579002 (not res!1078920)) b!1579003))

(assert (= start!136912 b!1579004))

(declare-fun m!1450293 () Bool)

(assert (=> start!136912 m!1450293))

(declare-fun m!1450295 () Bool)

(assert (=> start!136912 m!1450295))

(declare-fun m!1450297 () Bool)

(assert (=> start!136912 m!1450297))

(declare-fun m!1450299 () Bool)

(assert (=> b!1579002 m!1450299))

(declare-fun m!1450301 () Bool)

(assert (=> b!1579003 m!1450301))

(check-sat tp_is_empty!39133 (not b!1579004) (not b!1579003) (not b!1579002) (not start!136912))
(check-sat)
(get-model)

(declare-fun d!166015 () Bool)

(declare-fun res!1078937 () Bool)

(declare-fun e!880813 () Bool)

(assert (=> d!166015 (=> res!1078937 e!880813)))

(get-info :version)

(assert (=> d!166015 (= res!1078937 (or ((_ is Nil!36814) lt!676215) ((_ is Nil!36814) (t!51723 lt!676215))))))

(assert (=> d!166015 (= (isStrictlySorted!1035 lt!676215) e!880813)))

(declare-fun b!1579027 () Bool)

(declare-fun e!880814 () Bool)

(assert (=> b!1579027 (= e!880813 e!880814)))

(declare-fun res!1078938 () Bool)

(assert (=> b!1579027 (=> (not res!1078938) (not e!880814))))

(assert (=> b!1579027 (= res!1078938 (bvslt (_1!12752 (h!38357 lt!676215)) (_1!12752 (h!38357 (t!51723 lt!676215)))))))

(declare-fun b!1579028 () Bool)

(assert (=> b!1579028 (= e!880814 (isStrictlySorted!1035 (t!51723 lt!676215)))))

(assert (= (and d!166015 (not res!1078937)) b!1579027))

(assert (= (and b!1579027 res!1078938) b!1579028))

(declare-fun m!1450323 () Bool)

(assert (=> b!1579028 m!1450323))

(assert (=> start!136912 d!166015))

(declare-fun b!1579099 () Bool)

(declare-fun c!146307 () Bool)

(assert (=> b!1579099 (= c!146307 (and ((_ is Cons!36813) (toList!11426 thiss!201)) (bvsgt (_1!12752 (h!38357 (toList!11426 thiss!201))) (_1!12752 keyValue!4))))))

(declare-fun e!880860 () List!36817)

(declare-fun e!880861 () List!36817)

(assert (=> b!1579099 (= e!880860 e!880861)))

(declare-fun d!166021 () Bool)

(declare-fun e!880863 () Bool)

(assert (=> d!166021 e!880863))

(declare-fun res!1078966 () Bool)

(assert (=> d!166021 (=> (not res!1078966) (not e!880863))))

(declare-fun lt!676231 () List!36817)

(assert (=> d!166021 (= res!1078966 (isStrictlySorted!1035 lt!676231))))

(declare-fun e!880862 () List!36817)

(assert (=> d!166021 (= lt!676231 e!880862)))

(declare-fun c!146305 () Bool)

(assert (=> d!166021 (= c!146305 (and ((_ is Cons!36813) (toList!11426 thiss!201)) (bvslt (_1!12752 (h!38357 (toList!11426 thiss!201))) (_1!12752 keyValue!4))))))

(assert (=> d!166021 (isStrictlySorted!1035 (toList!11426 thiss!201))))

(assert (=> d!166021 (= (insertStrictlySorted!609 (toList!11426 thiss!201) (_1!12752 keyValue!4) (_2!12752 keyValue!4)) lt!676231)))

(declare-fun b!1579100 () Bool)

(declare-fun call!72382 () List!36817)

(assert (=> b!1579100 (= e!880861 call!72382)))

(declare-fun bm!72375 () Bool)

(declare-fun call!72380 () List!36817)

(declare-fun call!72381 () List!36817)

(assert (=> bm!72375 (= call!72380 call!72381)))

(declare-fun bm!72376 () Bool)

(declare-fun e!880859 () List!36817)

(declare-fun $colon$colon!1011 (List!36817 tuple2!25482) List!36817)

(assert (=> bm!72376 (= call!72381 ($colon$colon!1011 e!880859 (ite c!146305 (h!38357 (toList!11426 thiss!201)) (tuple2!25483 (_1!12752 keyValue!4) (_2!12752 keyValue!4)))))))

(declare-fun c!146306 () Bool)

(assert (=> bm!72376 (= c!146306 c!146305)))

(declare-fun b!1579101 () Bool)

(declare-fun res!1078965 () Bool)

(assert (=> b!1579101 (=> (not res!1078965) (not e!880863))))

(assert (=> b!1579101 (= res!1078965 (containsKey!881 lt!676231 (_1!12752 keyValue!4)))))

(declare-fun b!1579102 () Bool)

(assert (=> b!1579102 (= e!880862 call!72381)))

(declare-fun bm!72377 () Bool)

(assert (=> bm!72377 (= call!72382 call!72380)))

(declare-fun b!1579103 () Bool)

(assert (=> b!1579103 (= e!880859 (insertStrictlySorted!609 (t!51723 (toList!11426 thiss!201)) (_1!12752 keyValue!4) (_2!12752 keyValue!4)))))

(declare-fun b!1579104 () Bool)

(assert (=> b!1579104 (= e!880861 call!72382)))

(declare-fun b!1579105 () Bool)

(assert (=> b!1579105 (= e!880860 call!72380)))

(declare-fun c!146304 () Bool)

(declare-fun b!1579106 () Bool)

(assert (=> b!1579106 (= e!880859 (ite c!146304 (t!51723 (toList!11426 thiss!201)) (ite c!146307 (Cons!36813 (h!38357 (toList!11426 thiss!201)) (t!51723 (toList!11426 thiss!201))) Nil!36814)))))

(declare-fun b!1579107 () Bool)

(assert (=> b!1579107 (= e!880863 (contains!10403 lt!676231 (tuple2!25483 (_1!12752 keyValue!4) (_2!12752 keyValue!4))))))

(declare-fun b!1579108 () Bool)

(assert (=> b!1579108 (= e!880862 e!880860)))

(assert (=> b!1579108 (= c!146304 (and ((_ is Cons!36813) (toList!11426 thiss!201)) (= (_1!12752 (h!38357 (toList!11426 thiss!201))) (_1!12752 keyValue!4))))))

(assert (= (and d!166021 c!146305) b!1579102))

(assert (= (and d!166021 (not c!146305)) b!1579108))

(assert (= (and b!1579108 c!146304) b!1579105))

(assert (= (and b!1579108 (not c!146304)) b!1579099))

(assert (= (and b!1579099 c!146307) b!1579100))

(assert (= (and b!1579099 (not c!146307)) b!1579104))

(assert (= (or b!1579100 b!1579104) bm!72377))

(assert (= (or b!1579105 bm!72377) bm!72375))

(assert (= (or b!1579102 bm!72375) bm!72376))

(assert (= (and bm!72376 c!146306) b!1579103))

(assert (= (and bm!72376 (not c!146306)) b!1579106))

(assert (= (and d!166021 res!1078966) b!1579101))

(assert (= (and b!1579101 res!1078965) b!1579107))

(declare-fun m!1450335 () Bool)

(assert (=> d!166021 m!1450335))

(declare-fun m!1450337 () Bool)

(assert (=> d!166021 m!1450337))

(declare-fun m!1450339 () Bool)

(assert (=> b!1579103 m!1450339))

(declare-fun m!1450341 () Bool)

(assert (=> bm!72376 m!1450341))

(declare-fun m!1450343 () Bool)

(assert (=> b!1579107 m!1450343))

(declare-fun m!1450345 () Bool)

(assert (=> b!1579101 m!1450345))

(assert (=> start!136912 d!166021))

(declare-fun d!166029 () Bool)

(assert (=> d!166029 (= (inv!58952 thiss!201) (isStrictlySorted!1035 (toList!11426 thiss!201)))))

(declare-fun bs!45696 () Bool)

(assert (= bs!45696 d!166029))

(assert (=> bs!45696 m!1450337))

(assert (=> start!136912 d!166029))

(declare-fun d!166031 () Bool)

(declare-fun res!1078979 () Bool)

(declare-fun e!880882 () Bool)

(assert (=> d!166031 (=> res!1078979 e!880882)))

(assert (=> d!166031 (= res!1078979 (and ((_ is Cons!36813) lt!676215) (= (_1!12752 (h!38357 lt!676215)) (_1!12752 keyValue!4))))))

(assert (=> d!166031 (= (containsKey!881 lt!676215 (_1!12752 keyValue!4)) e!880882)))

(declare-fun b!1579141 () Bool)

(declare-fun e!880883 () Bool)

(assert (=> b!1579141 (= e!880882 e!880883)))

(declare-fun res!1078980 () Bool)

(assert (=> b!1579141 (=> (not res!1078980) (not e!880883))))

(assert (=> b!1579141 (= res!1078980 (and (or (not ((_ is Cons!36813) lt!676215)) (bvsle (_1!12752 (h!38357 lt!676215)) (_1!12752 keyValue!4))) ((_ is Cons!36813) lt!676215) (bvslt (_1!12752 (h!38357 lt!676215)) (_1!12752 keyValue!4))))))

(declare-fun b!1579142 () Bool)

(assert (=> b!1579142 (= e!880883 (containsKey!881 (t!51723 lt!676215) (_1!12752 keyValue!4)))))

(assert (= (and d!166031 (not res!1078979)) b!1579141))

(assert (= (and b!1579141 res!1078980) b!1579142))

(declare-fun m!1450359 () Bool)

(assert (=> b!1579142 m!1450359))

(assert (=> b!1579002 d!166031))

(declare-fun d!166037 () Bool)

(declare-fun lt!676236 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!813 (List!36817) (InoxSet tuple2!25482))

(assert (=> d!166037 (= lt!676236 (select (content!813 lt!676215) keyValue!4))))

(declare-fun e!880896 () Bool)

(assert (=> d!166037 (= lt!676236 e!880896)))

(declare-fun res!1078994 () Bool)

(assert (=> d!166037 (=> (not res!1078994) (not e!880896))))

(assert (=> d!166037 (= res!1078994 ((_ is Cons!36813) lt!676215))))

(assert (=> d!166037 (= (contains!10403 lt!676215 keyValue!4) lt!676236)))

(declare-fun b!1579155 () Bool)

(declare-fun e!880897 () Bool)

(assert (=> b!1579155 (= e!880896 e!880897)))

(declare-fun res!1078993 () Bool)

(assert (=> b!1579155 (=> res!1078993 e!880897)))

(assert (=> b!1579155 (= res!1078993 (= (h!38357 lt!676215) keyValue!4))))

(declare-fun b!1579156 () Bool)

(assert (=> b!1579156 (= e!880897 (contains!10403 (t!51723 lt!676215) keyValue!4))))

(assert (= (and d!166037 res!1078994) b!1579155))

(assert (= (and b!1579155 (not res!1078993)) b!1579156))

(declare-fun m!1450375 () Bool)

(assert (=> d!166037 m!1450375))

(declare-fun m!1450377 () Bool)

(assert (=> d!166037 m!1450377))

(declare-fun m!1450379 () Bool)

(assert (=> b!1579156 m!1450379))

(assert (=> b!1579003 d!166037))

(declare-fun b!1579167 () Bool)

(declare-fun e!880906 () Bool)

(declare-fun tp!114334 () Bool)

(assert (=> b!1579167 (= e!880906 (and tp_is_empty!39133 tp!114334))))

(assert (=> b!1579004 (= tp!114325 e!880906)))

(assert (= (and b!1579004 ((_ is Cons!36813) (toList!11426 thiss!201))) b!1579167))

(check-sat (not bm!72376) tp_is_empty!39133 (not b!1579028) (not b!1579167) (not d!166021) (not d!166029) (not d!166037) (not b!1579156) (not b!1579103) (not b!1579107) (not b!1579142) (not b!1579101))
(check-sat)
