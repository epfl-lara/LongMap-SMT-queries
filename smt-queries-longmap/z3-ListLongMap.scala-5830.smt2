; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75370 () Bool)

(assert start!75370)

(declare-fun b!886909 () Bool)

(declare-fun res!601940 () Bool)

(declare-fun e!493736 () Bool)

(assert (=> b!886909 (=> (not res!601940) (not e!493736))))

(declare-datatypes ((B!1298 0))(
  ( (B!1299 (val!8955 Int)) )
))
(declare-datatypes ((tuple2!11834 0))(
  ( (tuple2!11835 (_1!5928 (_ BitVec 64)) (_2!5928 B!1298)) )
))
(declare-datatypes ((List!17626 0))(
  ( (Nil!17623) (Cons!17622 (h!18759 tuple2!11834) (t!24895 List!17626)) )
))
(declare-fun l!906 () List!17626)

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!886909 (= res!601940 (and ((_ is Cons!17622) l!906) (bvslt (_1!5928 (h!18759 l!906)) key1!49)))))

(declare-fun b!886912 () Bool)

(declare-fun e!493737 () Bool)

(declare-fun tp_is_empty!17809 () Bool)

(declare-fun tp!54366 () Bool)

(assert (=> b!886912 (= e!493737 (and tp_is_empty!17809 tp!54366))))

(declare-fun v2!16 () B!1298)

(declare-fun v1!38 () B!1298)

(declare-fun b!886911 () Bool)

(declare-fun insertStrictlySorted!298 (List!17626 (_ BitVec 64) B!1298) List!17626)

(assert (=> b!886911 (= e!493736 (not (= (insertStrictlySorted!298 (insertStrictlySorted!298 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 l!906 key1!49 v2!16))))))

(assert (=> b!886911 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 (t!24895 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30220 0))(
  ( (Unit!30221) )
))
(declare-fun lt!401429 () Unit!30220)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!13 (List!17626 (_ BitVec 64) B!1298 B!1298) Unit!30220)

(assert (=> b!886911 (= lt!401429 (lemmaInsertStrictlySortedErasesIfSameKey!13 (t!24895 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!886910 () Bool)

(declare-fun res!601941 () Bool)

(assert (=> b!886910 (=> (not res!601941) (not e!493736))))

(declare-fun isStrictlySorted!477 (List!17626) Bool)

(assert (=> b!886910 (= res!601941 (isStrictlySorted!477 (t!24895 l!906)))))

(declare-fun res!601939 () Bool)

(assert (=> start!75370 (=> (not res!601939) (not e!493736))))

(assert (=> start!75370 (= res!601939 (isStrictlySorted!477 l!906))))

(assert (=> start!75370 e!493736))

(assert (=> start!75370 e!493737))

(assert (=> start!75370 true))

(assert (=> start!75370 tp_is_empty!17809))

(assert (= (and start!75370 res!601939) b!886909))

(assert (= (and b!886909 res!601940) b!886910))

(assert (= (and b!886910 res!601941) b!886911))

(assert (= (and start!75370 ((_ is Cons!17622) l!906)) b!886912))

(declare-fun m!827213 () Bool)

(assert (=> b!886911 m!827213))

(declare-fun m!827215 () Bool)

(assert (=> b!886911 m!827215))

(declare-fun m!827217 () Bool)

(assert (=> b!886911 m!827217))

(declare-fun m!827219 () Bool)

(assert (=> b!886911 m!827219))

(declare-fun m!827221 () Bool)

(assert (=> b!886911 m!827221))

(assert (=> b!886911 m!827219))

(declare-fun m!827223 () Bool)

(assert (=> b!886911 m!827223))

(assert (=> b!886911 m!827213))

(declare-fun m!827225 () Bool)

(assert (=> b!886911 m!827225))

(declare-fun m!827227 () Bool)

(assert (=> b!886910 m!827227))

(declare-fun m!827229 () Bool)

(assert (=> start!75370 m!827229))

(check-sat tp_is_empty!17809 (not b!886911) (not b!886912) (not start!75370) (not b!886910))
(check-sat)
(get-model)

(declare-fun d!109819 () Bool)

(assert (=> d!109819 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 (t!24895 l!906) key1!49 v2!16))))

(declare-fun lt!401438 () Unit!30220)

(declare-fun choose!1456 (List!17626 (_ BitVec 64) B!1298 B!1298) Unit!30220)

(assert (=> d!109819 (= lt!401438 (choose!1456 (t!24895 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109819 (isStrictlySorted!477 (t!24895 l!906))))

(assert (=> d!109819 (= (lemmaInsertStrictlySortedErasesIfSameKey!13 (t!24895 l!906) key1!49 v1!38 v2!16) lt!401438)))

(declare-fun bs!24862 () Bool)

(assert (= bs!24862 d!109819))

(declare-fun m!827267 () Bool)

(assert (=> bs!24862 m!827267))

(assert (=> bs!24862 m!827223))

(assert (=> bs!24862 m!827213))

(assert (=> bs!24862 m!827227))

(assert (=> bs!24862 m!827213))

(assert (=> bs!24862 m!827215))

(assert (=> b!886911 d!109819))

(declare-fun b!886989 () Bool)

(declare-fun e!493776 () List!17626)

(declare-fun call!39210 () List!17626)

(assert (=> b!886989 (= e!493776 call!39210)))

(declare-fun b!886990 () Bool)

(declare-fun lt!401451 () List!17626)

(declare-fun e!493778 () Bool)

(declare-fun contains!4275 (List!17626 tuple2!11834) Bool)

(assert (=> b!886990 (= e!493778 (contains!4275 lt!401451 (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!886991 () Bool)

(declare-fun e!493780 () List!17626)

(declare-fun call!39209 () List!17626)

(assert (=> b!886991 (= e!493780 call!39209)))

(declare-fun e!493779 () List!17626)

(declare-fun b!886992 () Bool)

(assert (=> b!886992 (= e!493779 (insertStrictlySorted!298 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun b!886994 () Bool)

(declare-fun c!93679 () Bool)

(declare-fun c!93682 () Bool)

(assert (=> b!886994 (= e!493779 (ite c!93679 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) (ite c!93682 (Cons!17622 (h!18759 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) Nil!17623)))))

(declare-fun b!886995 () Bool)

(declare-fun e!493777 () List!17626)

(assert (=> b!886995 (= e!493780 e!493777)))

(assert (=> b!886995 (= c!93679 (and ((_ is Cons!17622) (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) (= (_1!5928 (h!18759 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun bm!39205 () Bool)

(declare-fun call!39208 () List!17626)

(assert (=> bm!39205 (= call!39210 call!39208)))

(declare-fun bm!39206 () Bool)

(assert (=> bm!39206 (= call!39208 call!39209)))

(declare-fun b!886996 () Bool)

(assert (=> b!886996 (= e!493777 call!39208)))

(declare-fun b!886997 () Bool)

(declare-fun res!601968 () Bool)

(assert (=> b!886997 (=> (not res!601968) (not e!493778))))

(declare-fun containsKey!413 (List!17626 (_ BitVec 64)) Bool)

(assert (=> b!886997 (= res!601968 (containsKey!413 lt!401451 key1!49))))

(declare-fun b!886993 () Bool)

(assert (=> b!886993 (= e!493776 call!39210)))

(declare-fun d!109823 () Bool)

(assert (=> d!109823 e!493778))

(declare-fun res!601969 () Bool)

(assert (=> d!109823 (=> (not res!601969) (not e!493778))))

(assert (=> d!109823 (= res!601969 (isStrictlySorted!477 lt!401451))))

(assert (=> d!109823 (= lt!401451 e!493780)))

(declare-fun c!93681 () Bool)

(assert (=> d!109823 (= c!93681 (and ((_ is Cons!17622) (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) (bvslt (_1!5928 (h!18759 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109823 (isStrictlySorted!477 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))))

(assert (=> d!109823 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38) key1!49 v2!16) lt!401451)))

(declare-fun bm!39207 () Bool)

(declare-fun $colon$colon!546 (List!17626 tuple2!11834) List!17626)

(assert (=> bm!39207 (= call!39209 ($colon$colon!546 e!493779 (ite c!93681 (h!18759 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) (tuple2!11835 key1!49 v2!16))))))

(declare-fun c!93680 () Bool)

(assert (=> bm!39207 (= c!93680 c!93681)))

(declare-fun b!886998 () Bool)

(assert (=> b!886998 (= c!93682 (and ((_ is Cons!17622) (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) (bvsgt (_1!5928 (h!18759 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> b!886998 (= e!493777 e!493776)))

(assert (= (and d!109823 c!93681) b!886991))

(assert (= (and d!109823 (not c!93681)) b!886995))

(assert (= (and b!886995 c!93679) b!886996))

(assert (= (and b!886995 (not c!93679)) b!886998))

(assert (= (and b!886998 c!93682) b!886989))

(assert (= (and b!886998 (not c!93682)) b!886993))

(assert (= (or b!886989 b!886993) bm!39205))

(assert (= (or b!886996 bm!39205) bm!39206))

(assert (= (or b!886991 bm!39206) bm!39207))

(assert (= (and bm!39207 c!93680) b!886992))

(assert (= (and bm!39207 (not c!93680)) b!886994))

(assert (= (and d!109823 res!601969) b!886997))

(assert (= (and b!886997 res!601968) b!886990))

(declare-fun m!827273 () Bool)

(assert (=> b!886992 m!827273))

(declare-fun m!827275 () Bool)

(assert (=> d!109823 m!827275))

(assert (=> d!109823 m!827213))

(declare-fun m!827277 () Bool)

(assert (=> d!109823 m!827277))

(declare-fun m!827279 () Bool)

(assert (=> b!886997 m!827279))

(declare-fun m!827281 () Bool)

(assert (=> bm!39207 m!827281))

(declare-fun m!827283 () Bool)

(assert (=> b!886990 m!827283))

(assert (=> b!886911 d!109823))

(declare-fun b!886999 () Bool)

(declare-fun e!493781 () List!17626)

(declare-fun call!39217 () List!17626)

(assert (=> b!886999 (= e!493781 call!39217)))

(declare-fun b!887000 () Bool)

(declare-fun e!493783 () Bool)

(declare-fun lt!401452 () List!17626)

(assert (=> b!887000 (= e!493783 (contains!4275 lt!401452 (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887001 () Bool)

(declare-fun e!493785 () List!17626)

(declare-fun call!39216 () List!17626)

(assert (=> b!887001 (= e!493785 call!39216)))

(declare-fun b!887002 () Bool)

(declare-fun e!493784 () List!17626)

(assert (=> b!887002 (= e!493784 (insertStrictlySorted!298 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun c!93683 () Bool)

(declare-fun c!93686 () Bool)

(declare-fun b!887004 () Bool)

(assert (=> b!887004 (= e!493784 (ite c!93683 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (ite c!93686 (Cons!17622 (h!18759 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))) Nil!17623)))))

(declare-fun b!887005 () Bool)

(declare-fun e!493782 () List!17626)

(assert (=> b!887005 (= e!493785 e!493782)))

(assert (=> b!887005 (= c!93683 (and ((_ is Cons!17622) (insertStrictlySorted!298 l!906 key1!49 v1!38)) (= (_1!5928 (h!18759 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun bm!39212 () Bool)

(declare-fun call!39215 () List!17626)

(assert (=> bm!39212 (= call!39217 call!39215)))

(declare-fun bm!39213 () Bool)

(assert (=> bm!39213 (= call!39215 call!39216)))

(declare-fun b!887006 () Bool)

(assert (=> b!887006 (= e!493782 call!39215)))

(declare-fun b!887007 () Bool)

(declare-fun res!601970 () Bool)

(assert (=> b!887007 (=> (not res!601970) (not e!493783))))

(assert (=> b!887007 (= res!601970 (containsKey!413 lt!401452 key1!49))))

(declare-fun b!887003 () Bool)

(assert (=> b!887003 (= e!493781 call!39217)))

(declare-fun d!109831 () Bool)

(assert (=> d!109831 e!493783))

(declare-fun res!601971 () Bool)

(assert (=> d!109831 (=> (not res!601971) (not e!493783))))

(assert (=> d!109831 (= res!601971 (isStrictlySorted!477 lt!401452))))

(assert (=> d!109831 (= lt!401452 e!493785)))

(declare-fun c!93685 () Bool)

(assert (=> d!109831 (= c!93685 (and ((_ is Cons!17622) (insertStrictlySorted!298 l!906 key1!49 v1!38)) (bvslt (_1!5928 (h!18759 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!109831 (isStrictlySorted!477 (insertStrictlySorted!298 l!906 key1!49 v1!38))))

(assert (=> d!109831 (= (insertStrictlySorted!298 (insertStrictlySorted!298 l!906 key1!49 v1!38) key1!49 v2!16) lt!401452)))

(declare-fun bm!39214 () Bool)

(assert (=> bm!39214 (= call!39216 ($colon$colon!546 e!493784 (ite c!93685 (h!18759 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (tuple2!11835 key1!49 v2!16))))))

(declare-fun c!93684 () Bool)

(assert (=> bm!39214 (= c!93684 c!93685)))

(declare-fun b!887008 () Bool)

(assert (=> b!887008 (= c!93686 (and ((_ is Cons!17622) (insertStrictlySorted!298 l!906 key1!49 v1!38)) (bvsgt (_1!5928 (h!18759 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> b!887008 (= e!493782 e!493781)))

(assert (= (and d!109831 c!93685) b!887001))

(assert (= (and d!109831 (not c!93685)) b!887005))

(assert (= (and b!887005 c!93683) b!887006))

(assert (= (and b!887005 (not c!93683)) b!887008))

(assert (= (and b!887008 c!93686) b!886999))

(assert (= (and b!887008 (not c!93686)) b!887003))

(assert (= (or b!886999 b!887003) bm!39212))

(assert (= (or b!887006 bm!39212) bm!39213))

(assert (= (or b!887001 bm!39213) bm!39214))

(assert (= (and bm!39214 c!93684) b!887002))

(assert (= (and bm!39214 (not c!93684)) b!887004))

(assert (= (and d!109831 res!601971) b!887007))

(assert (= (and b!887007 res!601970) b!887000))

(declare-fun m!827285 () Bool)

(assert (=> b!887002 m!827285))

(declare-fun m!827287 () Bool)

(assert (=> d!109831 m!827287))

(assert (=> d!109831 m!827219))

(declare-fun m!827289 () Bool)

(assert (=> d!109831 m!827289))

(declare-fun m!827291 () Bool)

(assert (=> b!887007 m!827291))

(declare-fun m!827293 () Bool)

(assert (=> bm!39214 m!827293))

(declare-fun m!827295 () Bool)

(assert (=> b!887000 m!827295))

(assert (=> b!886911 d!109831))

(declare-fun b!887027 () Bool)

(declare-fun e!493795 () List!17626)

(declare-fun call!39223 () List!17626)

(assert (=> b!887027 (= e!493795 call!39223)))

(declare-fun b!887028 () Bool)

(declare-fun e!493797 () Bool)

(declare-fun lt!401454 () List!17626)

(assert (=> b!887028 (= e!493797 (contains!4275 lt!401454 (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887029 () Bool)

(declare-fun e!493799 () List!17626)

(declare-fun call!39222 () List!17626)

(assert (=> b!887029 (= e!493799 call!39222)))

(declare-fun b!887030 () Bool)

(declare-fun e!493798 () List!17626)

(assert (=> b!887030 (= e!493798 (insertStrictlySorted!298 (t!24895 (t!24895 l!906)) key1!49 v2!16))))

(declare-fun b!887032 () Bool)

(declare-fun c!93693 () Bool)

(declare-fun c!93696 () Bool)

(assert (=> b!887032 (= e!493798 (ite c!93693 (t!24895 (t!24895 l!906)) (ite c!93696 (Cons!17622 (h!18759 (t!24895 l!906)) (t!24895 (t!24895 l!906))) Nil!17623)))))

(declare-fun b!887033 () Bool)

(declare-fun e!493796 () List!17626)

(assert (=> b!887033 (= e!493799 e!493796)))

(assert (=> b!887033 (= c!93693 (and ((_ is Cons!17622) (t!24895 l!906)) (= (_1!5928 (h!18759 (t!24895 l!906))) key1!49)))))

(declare-fun bm!39218 () Bool)

(declare-fun call!39221 () List!17626)

(assert (=> bm!39218 (= call!39223 call!39221)))

(declare-fun bm!39219 () Bool)

(assert (=> bm!39219 (= call!39221 call!39222)))

(declare-fun b!887034 () Bool)

(assert (=> b!887034 (= e!493796 call!39221)))

(declare-fun b!887035 () Bool)

(declare-fun res!601978 () Bool)

(assert (=> b!887035 (=> (not res!601978) (not e!493797))))

(assert (=> b!887035 (= res!601978 (containsKey!413 lt!401454 key1!49))))

(declare-fun b!887031 () Bool)

(assert (=> b!887031 (= e!493795 call!39223)))

(declare-fun d!109833 () Bool)

(assert (=> d!109833 e!493797))

(declare-fun res!601979 () Bool)

(assert (=> d!109833 (=> (not res!601979) (not e!493797))))

(assert (=> d!109833 (= res!601979 (isStrictlySorted!477 lt!401454))))

(assert (=> d!109833 (= lt!401454 e!493799)))

(declare-fun c!93695 () Bool)

(assert (=> d!109833 (= c!93695 (and ((_ is Cons!17622) (t!24895 l!906)) (bvslt (_1!5928 (h!18759 (t!24895 l!906))) key1!49)))))

(assert (=> d!109833 (isStrictlySorted!477 (t!24895 l!906))))

(assert (=> d!109833 (= (insertStrictlySorted!298 (t!24895 l!906) key1!49 v2!16) lt!401454)))

(declare-fun bm!39220 () Bool)

(assert (=> bm!39220 (= call!39222 ($colon$colon!546 e!493798 (ite c!93695 (h!18759 (t!24895 l!906)) (tuple2!11835 key1!49 v2!16))))))

(declare-fun c!93694 () Bool)

(assert (=> bm!39220 (= c!93694 c!93695)))

(declare-fun b!887036 () Bool)

(assert (=> b!887036 (= c!93696 (and ((_ is Cons!17622) (t!24895 l!906)) (bvsgt (_1!5928 (h!18759 (t!24895 l!906))) key1!49)))))

(assert (=> b!887036 (= e!493796 e!493795)))

(assert (= (and d!109833 c!93695) b!887029))

(assert (= (and d!109833 (not c!93695)) b!887033))

(assert (= (and b!887033 c!93693) b!887034))

(assert (= (and b!887033 (not c!93693)) b!887036))

(assert (= (and b!887036 c!93696) b!887027))

(assert (= (and b!887036 (not c!93696)) b!887031))

(assert (= (or b!887027 b!887031) bm!39218))

(assert (= (or b!887034 bm!39218) bm!39219))

(assert (= (or b!887029 bm!39219) bm!39220))

(assert (= (and bm!39220 c!93694) b!887030))

(assert (= (and bm!39220 (not c!93694)) b!887032))

(assert (= (and d!109833 res!601979) b!887035))

(assert (= (and b!887035 res!601978) b!887028))

(declare-fun m!827307 () Bool)

(assert (=> b!887030 m!827307))

(declare-fun m!827311 () Bool)

(assert (=> d!109833 m!827311))

(assert (=> d!109833 m!827227))

(declare-fun m!827313 () Bool)

(assert (=> b!887035 m!827313))

(declare-fun m!827315 () Bool)

(assert (=> bm!39220 m!827315))

(declare-fun m!827317 () Bool)

(assert (=> b!887028 m!827317))

(assert (=> b!886911 d!109833))

(declare-fun b!887047 () Bool)

(declare-fun e!493805 () List!17626)

(declare-fun call!39229 () List!17626)

(assert (=> b!887047 (= e!493805 call!39229)))

(declare-fun b!887048 () Bool)

(declare-fun e!493807 () Bool)

(declare-fun lt!401456 () List!17626)

(assert (=> b!887048 (= e!493807 (contains!4275 lt!401456 (tuple2!11835 key1!49 v1!38)))))

(declare-fun b!887049 () Bool)

(declare-fun e!493809 () List!17626)

(declare-fun call!39228 () List!17626)

(assert (=> b!887049 (= e!493809 call!39228)))

(declare-fun b!887050 () Bool)

(declare-fun e!493808 () List!17626)

(assert (=> b!887050 (= e!493808 (insertStrictlySorted!298 (t!24895 (t!24895 l!906)) key1!49 v1!38))))

(declare-fun c!93701 () Bool)

(declare-fun c!93704 () Bool)

(declare-fun b!887052 () Bool)

(assert (=> b!887052 (= e!493808 (ite c!93701 (t!24895 (t!24895 l!906)) (ite c!93704 (Cons!17622 (h!18759 (t!24895 l!906)) (t!24895 (t!24895 l!906))) Nil!17623)))))

(declare-fun b!887053 () Bool)

(declare-fun e!493806 () List!17626)

(assert (=> b!887053 (= e!493809 e!493806)))

(assert (=> b!887053 (= c!93701 (and ((_ is Cons!17622) (t!24895 l!906)) (= (_1!5928 (h!18759 (t!24895 l!906))) key1!49)))))

(declare-fun bm!39224 () Bool)

(declare-fun call!39227 () List!17626)

(assert (=> bm!39224 (= call!39229 call!39227)))

(declare-fun bm!39225 () Bool)

(assert (=> bm!39225 (= call!39227 call!39228)))

(declare-fun b!887054 () Bool)

(assert (=> b!887054 (= e!493806 call!39227)))

(declare-fun b!887055 () Bool)

(declare-fun res!601982 () Bool)

(assert (=> b!887055 (=> (not res!601982) (not e!493807))))

(assert (=> b!887055 (= res!601982 (containsKey!413 lt!401456 key1!49))))

(declare-fun b!887051 () Bool)

(assert (=> b!887051 (= e!493805 call!39229)))

(declare-fun d!109837 () Bool)

(assert (=> d!109837 e!493807))

(declare-fun res!601983 () Bool)

(assert (=> d!109837 (=> (not res!601983) (not e!493807))))

(assert (=> d!109837 (= res!601983 (isStrictlySorted!477 lt!401456))))

(assert (=> d!109837 (= lt!401456 e!493809)))

(declare-fun c!93703 () Bool)

(assert (=> d!109837 (= c!93703 (and ((_ is Cons!17622) (t!24895 l!906)) (bvslt (_1!5928 (h!18759 (t!24895 l!906))) key1!49)))))

(assert (=> d!109837 (isStrictlySorted!477 (t!24895 l!906))))

(assert (=> d!109837 (= (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38) lt!401456)))

(declare-fun bm!39226 () Bool)

(assert (=> bm!39226 (= call!39228 ($colon$colon!546 e!493808 (ite c!93703 (h!18759 (t!24895 l!906)) (tuple2!11835 key1!49 v1!38))))))

(declare-fun c!93702 () Bool)

(assert (=> bm!39226 (= c!93702 c!93703)))

(declare-fun b!887056 () Bool)

(assert (=> b!887056 (= c!93704 (and ((_ is Cons!17622) (t!24895 l!906)) (bvsgt (_1!5928 (h!18759 (t!24895 l!906))) key1!49)))))

(assert (=> b!887056 (= e!493806 e!493805)))

(assert (= (and d!109837 c!93703) b!887049))

(assert (= (and d!109837 (not c!93703)) b!887053))

(assert (= (and b!887053 c!93701) b!887054))

(assert (= (and b!887053 (not c!93701)) b!887056))

(assert (= (and b!887056 c!93704) b!887047))

(assert (= (and b!887056 (not c!93704)) b!887051))

(assert (= (or b!887047 b!887051) bm!39224))

(assert (= (or b!887054 bm!39224) bm!39225))

(assert (= (or b!887049 bm!39225) bm!39226))

(assert (= (and bm!39226 c!93702) b!887050))

(assert (= (and bm!39226 (not c!93702)) b!887052))

(assert (= (and d!109837 res!601983) b!887055))

(assert (= (and b!887055 res!601982) b!887048))

(declare-fun m!827327 () Bool)

(assert (=> b!887050 m!827327))

(declare-fun m!827329 () Bool)

(assert (=> d!109837 m!827329))

(assert (=> d!109837 m!827227))

(declare-fun m!827333 () Bool)

(assert (=> b!887055 m!827333))

(declare-fun m!827337 () Bool)

(assert (=> bm!39226 m!827337))

(declare-fun m!827339 () Bool)

(assert (=> b!887048 m!827339))

(assert (=> b!886911 d!109837))

(declare-fun b!887067 () Bool)

(declare-fun e!493815 () List!17626)

(declare-fun call!39235 () List!17626)

(assert (=> b!887067 (= e!493815 call!39235)))

(declare-fun b!887068 () Bool)

(declare-fun lt!401458 () List!17626)

(declare-fun e!493817 () Bool)

(assert (=> b!887068 (= e!493817 (contains!4275 lt!401458 (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887069 () Bool)

(declare-fun e!493819 () List!17626)

(declare-fun call!39234 () List!17626)

(assert (=> b!887069 (= e!493819 call!39234)))

(declare-fun e!493818 () List!17626)

(declare-fun b!887070 () Bool)

(assert (=> b!887070 (= e!493818 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v2!16))))

(declare-fun c!93712 () Bool)

(declare-fun c!93709 () Bool)

(declare-fun b!887072 () Bool)

(assert (=> b!887072 (= e!493818 (ite c!93709 (t!24895 l!906) (ite c!93712 (Cons!17622 (h!18759 l!906) (t!24895 l!906)) Nil!17623)))))

(declare-fun b!887073 () Bool)

(declare-fun e!493816 () List!17626)

(assert (=> b!887073 (= e!493819 e!493816)))

(assert (=> b!887073 (= c!93709 (and ((_ is Cons!17622) l!906) (= (_1!5928 (h!18759 l!906)) key1!49)))))

(declare-fun bm!39230 () Bool)

(declare-fun call!39233 () List!17626)

(assert (=> bm!39230 (= call!39235 call!39233)))

(declare-fun bm!39231 () Bool)

(assert (=> bm!39231 (= call!39233 call!39234)))

(declare-fun b!887074 () Bool)

(assert (=> b!887074 (= e!493816 call!39233)))

(declare-fun b!887075 () Bool)

(declare-fun res!601986 () Bool)

(assert (=> b!887075 (=> (not res!601986) (not e!493817))))

(assert (=> b!887075 (= res!601986 (containsKey!413 lt!401458 key1!49))))

(declare-fun b!887071 () Bool)

(assert (=> b!887071 (= e!493815 call!39235)))

(declare-fun d!109841 () Bool)

(assert (=> d!109841 e!493817))

(declare-fun res!601987 () Bool)

(assert (=> d!109841 (=> (not res!601987) (not e!493817))))

(assert (=> d!109841 (= res!601987 (isStrictlySorted!477 lt!401458))))

(assert (=> d!109841 (= lt!401458 e!493819)))

(declare-fun c!93711 () Bool)

(assert (=> d!109841 (= c!93711 (and ((_ is Cons!17622) l!906) (bvslt (_1!5928 (h!18759 l!906)) key1!49)))))

(assert (=> d!109841 (isStrictlySorted!477 l!906)))

(assert (=> d!109841 (= (insertStrictlySorted!298 l!906 key1!49 v2!16) lt!401458)))

(declare-fun bm!39232 () Bool)

(assert (=> bm!39232 (= call!39234 ($colon$colon!546 e!493818 (ite c!93711 (h!18759 l!906) (tuple2!11835 key1!49 v2!16))))))

(declare-fun c!93710 () Bool)

(assert (=> bm!39232 (= c!93710 c!93711)))

(declare-fun b!887076 () Bool)

(assert (=> b!887076 (= c!93712 (and ((_ is Cons!17622) l!906) (bvsgt (_1!5928 (h!18759 l!906)) key1!49)))))

(assert (=> b!887076 (= e!493816 e!493815)))

(assert (= (and d!109841 c!93711) b!887069))

(assert (= (and d!109841 (not c!93711)) b!887073))

(assert (= (and b!887073 c!93709) b!887074))

(assert (= (and b!887073 (not c!93709)) b!887076))

(assert (= (and b!887076 c!93712) b!887067))

(assert (= (and b!887076 (not c!93712)) b!887071))

(assert (= (or b!887067 b!887071) bm!39230))

(assert (= (or b!887074 bm!39230) bm!39231))

(assert (= (or b!887069 bm!39231) bm!39232))

(assert (= (and bm!39232 c!93710) b!887070))

(assert (= (and bm!39232 (not c!93710)) b!887072))

(assert (= (and d!109841 res!601987) b!887075))

(assert (= (and b!887075 res!601986) b!887068))

(assert (=> b!887070 m!827223))

(declare-fun m!827345 () Bool)

(assert (=> d!109841 m!827345))

(assert (=> d!109841 m!827229))

(declare-fun m!827349 () Bool)

(assert (=> b!887075 m!827349))

(declare-fun m!827353 () Bool)

(assert (=> bm!39232 m!827353))

(declare-fun m!827357 () Bool)

(assert (=> b!887068 m!827357))

(assert (=> b!886911 d!109841))

(declare-fun b!887094 () Bool)

(declare-fun e!493829 () List!17626)

(declare-fun call!39244 () List!17626)

(assert (=> b!887094 (= e!493829 call!39244)))

(declare-fun e!493832 () Bool)

(declare-fun b!887095 () Bool)

(declare-fun lt!401461 () List!17626)

(assert (=> b!887095 (= e!493832 (contains!4275 lt!401461 (tuple2!11835 key1!49 v1!38)))))

(declare-fun b!887097 () Bool)

(declare-fun e!493834 () List!17626)

(declare-fun call!39242 () List!17626)

(assert (=> b!887097 (= e!493834 call!39242)))

(declare-fun e!493833 () List!17626)

(declare-fun b!887099 () Bool)

(assert (=> b!887099 (= e!493833 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))))

(declare-fun b!887102 () Bool)

(declare-fun c!93720 () Bool)

(declare-fun c!93724 () Bool)

(assert (=> b!887102 (= e!493833 (ite c!93720 (t!24895 l!906) (ite c!93724 (Cons!17622 (h!18759 l!906) (t!24895 l!906)) Nil!17623)))))

(declare-fun b!887103 () Bool)

(declare-fun e!493830 () List!17626)

(assert (=> b!887103 (= e!493834 e!493830)))

(assert (=> b!887103 (= c!93720 (and ((_ is Cons!17622) l!906) (= (_1!5928 (h!18759 l!906)) key1!49)))))

(declare-fun bm!39239 () Bool)

(declare-fun call!39241 () List!17626)

(assert (=> bm!39239 (= call!39244 call!39241)))

(declare-fun bm!39240 () Bool)

(assert (=> bm!39240 (= call!39241 call!39242)))

(declare-fun b!887104 () Bool)

(assert (=> b!887104 (= e!493830 call!39241)))

(declare-fun b!887105 () Bool)

(declare-fun res!601991 () Bool)

(assert (=> b!887105 (=> (not res!601991) (not e!493832))))

(assert (=> b!887105 (= res!601991 (containsKey!413 lt!401461 key1!49))))

(declare-fun b!887100 () Bool)

(assert (=> b!887100 (= e!493829 call!39244)))

(declare-fun d!109845 () Bool)

(assert (=> d!109845 e!493832))

(declare-fun res!601992 () Bool)

(assert (=> d!109845 (=> (not res!601992) (not e!493832))))

(assert (=> d!109845 (= res!601992 (isStrictlySorted!477 lt!401461))))

(assert (=> d!109845 (= lt!401461 e!493834)))

(declare-fun c!93723 () Bool)

(assert (=> d!109845 (= c!93723 (and ((_ is Cons!17622) l!906) (bvslt (_1!5928 (h!18759 l!906)) key1!49)))))

(assert (=> d!109845 (isStrictlySorted!477 l!906)))

(assert (=> d!109845 (= (insertStrictlySorted!298 l!906 key1!49 v1!38) lt!401461)))

(declare-fun bm!39241 () Bool)

(assert (=> bm!39241 (= call!39242 ($colon$colon!546 e!493833 (ite c!93723 (h!18759 l!906) (tuple2!11835 key1!49 v1!38))))))

(declare-fun c!93722 () Bool)

(assert (=> bm!39241 (= c!93722 c!93723)))

(declare-fun b!887106 () Bool)

(assert (=> b!887106 (= c!93724 (and ((_ is Cons!17622) l!906) (bvsgt (_1!5928 (h!18759 l!906)) key1!49)))))

(assert (=> b!887106 (= e!493830 e!493829)))

(assert (= (and d!109845 c!93723) b!887097))

(assert (= (and d!109845 (not c!93723)) b!887103))

(assert (= (and b!887103 c!93720) b!887104))

(assert (= (and b!887103 (not c!93720)) b!887106))

(assert (= (and b!887106 c!93724) b!887094))

(assert (= (and b!887106 (not c!93724)) b!887100))

(assert (= (or b!887094 b!887100) bm!39239))

(assert (= (or b!887104 bm!39239) bm!39240))

(assert (= (or b!887097 bm!39240) bm!39241))

(assert (= (and bm!39241 c!93722) b!887099))

(assert (= (and bm!39241 (not c!93722)) b!887102))

(assert (= (and d!109845 res!601992) b!887105))

(assert (= (and b!887105 res!601991) b!887095))

(assert (=> b!887099 m!827213))

(declare-fun m!827372 () Bool)

(assert (=> d!109845 m!827372))

(assert (=> d!109845 m!827229))

(declare-fun m!827377 () Bool)

(assert (=> b!887105 m!827377))

(declare-fun m!827381 () Bool)

(assert (=> bm!39241 m!827381))

(declare-fun m!827385 () Bool)

(assert (=> b!887095 m!827385))

(assert (=> b!886911 d!109845))

(declare-fun d!109849 () Bool)

(declare-fun res!602008 () Bool)

(declare-fun e!493864 () Bool)

(assert (=> d!109849 (=> res!602008 e!493864)))

(assert (=> d!109849 (= res!602008 (or ((_ is Nil!17623) (t!24895 l!906)) ((_ is Nil!17623) (t!24895 (t!24895 l!906)))))))

(assert (=> d!109849 (= (isStrictlySorted!477 (t!24895 l!906)) e!493864)))

(declare-fun b!887161 () Bool)

(declare-fun e!493865 () Bool)

(assert (=> b!887161 (= e!493864 e!493865)))

(declare-fun res!602009 () Bool)

(assert (=> b!887161 (=> (not res!602009) (not e!493865))))

(assert (=> b!887161 (= res!602009 (bvslt (_1!5928 (h!18759 (t!24895 l!906))) (_1!5928 (h!18759 (t!24895 (t!24895 l!906))))))))

(declare-fun b!887162 () Bool)

(assert (=> b!887162 (= e!493865 (isStrictlySorted!477 (t!24895 (t!24895 l!906))))))

(assert (= (and d!109849 (not res!602008)) b!887161))

(assert (= (and b!887161 res!602009) b!887162))

(declare-fun m!827435 () Bool)

(assert (=> b!887162 m!827435))

(assert (=> b!886910 d!109849))

(declare-fun d!109861 () Bool)

(declare-fun res!602010 () Bool)

(declare-fun e!493866 () Bool)

(assert (=> d!109861 (=> res!602010 e!493866)))

(assert (=> d!109861 (= res!602010 (or ((_ is Nil!17623) l!906) ((_ is Nil!17623) (t!24895 l!906))))))

(assert (=> d!109861 (= (isStrictlySorted!477 l!906) e!493866)))

(declare-fun b!887163 () Bool)

(declare-fun e!493867 () Bool)

(assert (=> b!887163 (= e!493866 e!493867)))

(declare-fun res!602011 () Bool)

(assert (=> b!887163 (=> (not res!602011) (not e!493867))))

(assert (=> b!887163 (= res!602011 (bvslt (_1!5928 (h!18759 l!906)) (_1!5928 (h!18759 (t!24895 l!906)))))))

(declare-fun b!887164 () Bool)

(assert (=> b!887164 (= e!493867 (isStrictlySorted!477 (t!24895 l!906)))))

(assert (= (and d!109861 (not res!602010)) b!887163))

(assert (= (and b!887163 res!602011) b!887164))

(assert (=> b!887164 m!827227))

(assert (=> start!75370 d!109861))

(declare-fun b!887183 () Bool)

(declare-fun e!493879 () Bool)

(declare-fun tp!54375 () Bool)

(assert (=> b!887183 (= e!493879 (and tp_is_empty!17809 tp!54375))))

(assert (=> b!886912 (= tp!54366 e!493879)))

(assert (= (and b!886912 ((_ is Cons!17622) (t!24895 l!906))) b!887183))

(check-sat (not bm!39226) (not b!887070) (not bm!39232) (not b!887007) (not b!887105) (not b!887028) (not b!887099) (not b!887055) (not b!887162) (not b!887002) (not bm!39220) (not b!887164) tp_is_empty!17809 (not b!887000) (not b!886990) (not d!109841) (not b!887035) (not b!886992) (not d!109831) (not d!109845) (not b!887068) (not b!887183) (not b!887030) (not bm!39207) (not d!109819) (not bm!39214) (not b!887048) (not b!887075) (not d!109837) (not d!109833) (not d!109823) (not b!887095) (not bm!39241) (not b!887050) (not b!886997))
(check-sat)
(get-model)

(declare-fun lt!401471 () Bool)

(declare-fun d!109873 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!394 (List!17626) (InoxSet tuple2!11834))

(assert (=> d!109873 (= lt!401471 (select (content!394 lt!401451) (tuple2!11835 key1!49 v2!16)))))

(declare-fun e!493908 () Bool)

(assert (=> d!109873 (= lt!401471 e!493908)))

(declare-fun res!602037 () Bool)

(assert (=> d!109873 (=> (not res!602037) (not e!493908))))

(assert (=> d!109873 (= res!602037 ((_ is Cons!17622) lt!401451))))

(assert (=> d!109873 (= (contains!4275 lt!401451 (tuple2!11835 key1!49 v2!16)) lt!401471)))

(declare-fun b!887220 () Bool)

(declare-fun e!493907 () Bool)

(assert (=> b!887220 (= e!493908 e!493907)))

(declare-fun res!602036 () Bool)

(assert (=> b!887220 (=> res!602036 e!493907)))

(assert (=> b!887220 (= res!602036 (= (h!18759 lt!401451) (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887221 () Bool)

(assert (=> b!887221 (= e!493907 (contains!4275 (t!24895 lt!401451) (tuple2!11835 key1!49 v2!16)))))

(assert (= (and d!109873 res!602037) b!887220))

(assert (= (and b!887220 (not res!602036)) b!887221))

(declare-fun m!827459 () Bool)

(assert (=> d!109873 m!827459))

(declare-fun m!827461 () Bool)

(assert (=> d!109873 m!827461))

(declare-fun m!827463 () Bool)

(assert (=> b!887221 m!827463))

(assert (=> b!886990 d!109873))

(declare-fun d!109875 () Bool)

(declare-fun res!602038 () Bool)

(declare-fun e!493909 () Bool)

(assert (=> d!109875 (=> res!602038 e!493909)))

(assert (=> d!109875 (= res!602038 (or ((_ is Nil!17623) lt!401458) ((_ is Nil!17623) (t!24895 lt!401458))))))

(assert (=> d!109875 (= (isStrictlySorted!477 lt!401458) e!493909)))

(declare-fun b!887222 () Bool)

(declare-fun e!493910 () Bool)

(assert (=> b!887222 (= e!493909 e!493910)))

(declare-fun res!602039 () Bool)

(assert (=> b!887222 (=> (not res!602039) (not e!493910))))

(assert (=> b!887222 (= res!602039 (bvslt (_1!5928 (h!18759 lt!401458)) (_1!5928 (h!18759 (t!24895 lt!401458)))))))

(declare-fun b!887223 () Bool)

(assert (=> b!887223 (= e!493910 (isStrictlySorted!477 (t!24895 lt!401458)))))

(assert (= (and d!109875 (not res!602038)) b!887222))

(assert (= (and b!887222 res!602039) b!887223))

(declare-fun m!827465 () Bool)

(assert (=> b!887223 m!827465))

(assert (=> d!109841 d!109875))

(assert (=> d!109841 d!109861))

(declare-fun d!109877 () Bool)

(declare-fun res!602040 () Bool)

(declare-fun e!493911 () Bool)

(assert (=> d!109877 (=> res!602040 e!493911)))

(assert (=> d!109877 (= res!602040 (or ((_ is Nil!17623) (t!24895 (t!24895 l!906))) ((_ is Nil!17623) (t!24895 (t!24895 (t!24895 l!906))))))))

(assert (=> d!109877 (= (isStrictlySorted!477 (t!24895 (t!24895 l!906))) e!493911)))

(declare-fun b!887224 () Bool)

(declare-fun e!493912 () Bool)

(assert (=> b!887224 (= e!493911 e!493912)))

(declare-fun res!602041 () Bool)

(assert (=> b!887224 (=> (not res!602041) (not e!493912))))

(assert (=> b!887224 (= res!602041 (bvslt (_1!5928 (h!18759 (t!24895 (t!24895 l!906)))) (_1!5928 (h!18759 (t!24895 (t!24895 (t!24895 l!906)))))))))

(declare-fun b!887225 () Bool)

(assert (=> b!887225 (= e!493912 (isStrictlySorted!477 (t!24895 (t!24895 (t!24895 l!906)))))))

(assert (= (and d!109877 (not res!602040)) b!887224))

(assert (= (and b!887224 res!602041) b!887225))

(declare-fun m!827467 () Bool)

(assert (=> b!887225 m!827467))

(assert (=> b!887162 d!109877))

(declare-fun d!109879 () Bool)

(declare-fun res!602042 () Bool)

(declare-fun e!493913 () Bool)

(assert (=> d!109879 (=> res!602042 e!493913)))

(assert (=> d!109879 (= res!602042 (or ((_ is Nil!17623) lt!401461) ((_ is Nil!17623) (t!24895 lt!401461))))))

(assert (=> d!109879 (= (isStrictlySorted!477 lt!401461) e!493913)))

(declare-fun b!887226 () Bool)

(declare-fun e!493914 () Bool)

(assert (=> b!887226 (= e!493913 e!493914)))

(declare-fun res!602043 () Bool)

(assert (=> b!887226 (=> (not res!602043) (not e!493914))))

(assert (=> b!887226 (= res!602043 (bvslt (_1!5928 (h!18759 lt!401461)) (_1!5928 (h!18759 (t!24895 lt!401461)))))))

(declare-fun b!887227 () Bool)

(assert (=> b!887227 (= e!493914 (isStrictlySorted!477 (t!24895 lt!401461)))))

(assert (= (and d!109879 (not res!602042)) b!887226))

(assert (= (and b!887226 res!602043) b!887227))

(declare-fun m!827469 () Bool)

(assert (=> b!887227 m!827469))

(assert (=> d!109845 d!109879))

(assert (=> d!109845 d!109861))

(declare-fun d!109881 () Bool)

(declare-fun lt!401472 () Bool)

(assert (=> d!109881 (= lt!401472 (select (content!394 lt!401461) (tuple2!11835 key1!49 v1!38)))))

(declare-fun e!493916 () Bool)

(assert (=> d!109881 (= lt!401472 e!493916)))

(declare-fun res!602045 () Bool)

(assert (=> d!109881 (=> (not res!602045) (not e!493916))))

(assert (=> d!109881 (= res!602045 ((_ is Cons!17622) lt!401461))))

(assert (=> d!109881 (= (contains!4275 lt!401461 (tuple2!11835 key1!49 v1!38)) lt!401472)))

(declare-fun b!887228 () Bool)

(declare-fun e!493915 () Bool)

(assert (=> b!887228 (= e!493916 e!493915)))

(declare-fun res!602044 () Bool)

(assert (=> b!887228 (=> res!602044 e!493915)))

(assert (=> b!887228 (= res!602044 (= (h!18759 lt!401461) (tuple2!11835 key1!49 v1!38)))))

(declare-fun b!887229 () Bool)

(assert (=> b!887229 (= e!493915 (contains!4275 (t!24895 lt!401461) (tuple2!11835 key1!49 v1!38)))))

(assert (= (and d!109881 res!602045) b!887228))

(assert (= (and b!887228 (not res!602044)) b!887229))

(declare-fun m!827471 () Bool)

(assert (=> d!109881 m!827471))

(declare-fun m!827473 () Bool)

(assert (=> d!109881 m!827473))

(declare-fun m!827475 () Bool)

(assert (=> b!887229 m!827475))

(assert (=> b!887095 d!109881))

(declare-fun d!109883 () Bool)

(assert (=> d!109883 (= ($colon$colon!546 e!493798 (ite c!93695 (h!18759 (t!24895 l!906)) (tuple2!11835 key1!49 v2!16))) (Cons!17622 (ite c!93695 (h!18759 (t!24895 l!906)) (tuple2!11835 key1!49 v2!16)) e!493798))))

(assert (=> bm!39220 d!109883))

(declare-fun d!109885 () Bool)

(declare-fun res!602050 () Bool)

(declare-fun e!493921 () Bool)

(assert (=> d!109885 (=> res!602050 e!493921)))

(assert (=> d!109885 (= res!602050 (and ((_ is Cons!17622) lt!401454) (= (_1!5928 (h!18759 lt!401454)) key1!49)))))

(assert (=> d!109885 (= (containsKey!413 lt!401454 key1!49) e!493921)))

(declare-fun b!887234 () Bool)

(declare-fun e!493922 () Bool)

(assert (=> b!887234 (= e!493921 e!493922)))

(declare-fun res!602051 () Bool)

(assert (=> b!887234 (=> (not res!602051) (not e!493922))))

(assert (=> b!887234 (= res!602051 (and (or (not ((_ is Cons!17622) lt!401454)) (bvsle (_1!5928 (h!18759 lt!401454)) key1!49)) ((_ is Cons!17622) lt!401454) (bvslt (_1!5928 (h!18759 lt!401454)) key1!49)))))

(declare-fun b!887235 () Bool)

(assert (=> b!887235 (= e!493922 (containsKey!413 (t!24895 lt!401454) key1!49))))

(assert (= (and d!109885 (not res!602050)) b!887234))

(assert (= (and b!887234 res!602051) b!887235))

(declare-fun m!827477 () Bool)

(assert (=> b!887235 m!827477))

(assert (=> b!887035 d!109885))

(declare-fun d!109887 () Bool)

(assert (=> d!109887 (= ($colon$colon!546 e!493784 (ite c!93685 (h!18759 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (tuple2!11835 key1!49 v2!16))) (Cons!17622 (ite c!93685 (h!18759 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (tuple2!11835 key1!49 v2!16)) e!493784))))

(assert (=> bm!39214 d!109887))

(assert (=> b!887070 d!109833))

(assert (=> b!887099 d!109837))

(declare-fun d!109889 () Bool)

(declare-fun lt!401473 () Bool)

(assert (=> d!109889 (= lt!401473 (select (content!394 lt!401458) (tuple2!11835 key1!49 v2!16)))))

(declare-fun e!493924 () Bool)

(assert (=> d!109889 (= lt!401473 e!493924)))

(declare-fun res!602053 () Bool)

(assert (=> d!109889 (=> (not res!602053) (not e!493924))))

(assert (=> d!109889 (= res!602053 ((_ is Cons!17622) lt!401458))))

(assert (=> d!109889 (= (contains!4275 lt!401458 (tuple2!11835 key1!49 v2!16)) lt!401473)))

(declare-fun b!887236 () Bool)

(declare-fun e!493923 () Bool)

(assert (=> b!887236 (= e!493924 e!493923)))

(declare-fun res!602052 () Bool)

(assert (=> b!887236 (=> res!602052 e!493923)))

(assert (=> b!887236 (= res!602052 (= (h!18759 lt!401458) (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887237 () Bool)

(assert (=> b!887237 (= e!493923 (contains!4275 (t!24895 lt!401458) (tuple2!11835 key1!49 v2!16)))))

(assert (= (and d!109889 res!602053) b!887236))

(assert (= (and b!887236 (not res!602052)) b!887237))

(declare-fun m!827479 () Bool)

(assert (=> d!109889 m!827479))

(declare-fun m!827481 () Bool)

(assert (=> d!109889 m!827481))

(declare-fun m!827483 () Bool)

(assert (=> b!887237 m!827483))

(assert (=> b!887068 d!109889))

(assert (=> b!887164 d!109849))

(declare-fun b!887238 () Bool)

(declare-fun e!493925 () List!17626)

(declare-fun call!39268 () List!17626)

(assert (=> b!887238 (= e!493925 call!39268)))

(declare-fun lt!401474 () List!17626)

(declare-fun b!887239 () Bool)

(declare-fun e!493927 () Bool)

(assert (=> b!887239 (= e!493927 (contains!4275 lt!401474 (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887240 () Bool)

(declare-fun e!493929 () List!17626)

(declare-fun call!39267 () List!17626)

(assert (=> b!887240 (= e!493929 call!39267)))

(declare-fun b!887241 () Bool)

(declare-fun e!493928 () List!17626)

(assert (=> b!887241 (= e!493928 (insertStrictlySorted!298 (t!24895 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) key1!49 v2!16))))

(declare-fun c!93753 () Bool)

(declare-fun b!887243 () Bool)

(declare-fun c!93756 () Bool)

(assert (=> b!887243 (= e!493928 (ite c!93753 (t!24895 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) (ite c!93756 (Cons!17622 (h!18759 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) (t!24895 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)))) Nil!17623)))))

(declare-fun b!887244 () Bool)

(declare-fun e!493926 () List!17626)

(assert (=> b!887244 (= e!493929 e!493926)))

(assert (=> b!887244 (= c!93753 (and ((_ is Cons!17622) (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) (= (_1!5928 (h!18759 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)))) key1!49)))))

(declare-fun bm!39263 () Bool)

(declare-fun call!39266 () List!17626)

(assert (=> bm!39263 (= call!39268 call!39266)))

(declare-fun bm!39264 () Bool)

(assert (=> bm!39264 (= call!39266 call!39267)))

(declare-fun b!887245 () Bool)

(assert (=> b!887245 (= e!493926 call!39266)))

(declare-fun b!887246 () Bool)

(declare-fun res!602054 () Bool)

(assert (=> b!887246 (=> (not res!602054) (not e!493927))))

(assert (=> b!887246 (= res!602054 (containsKey!413 lt!401474 key1!49))))

(declare-fun b!887242 () Bool)

(assert (=> b!887242 (= e!493925 call!39268)))

(declare-fun d!109891 () Bool)

(assert (=> d!109891 e!493927))

(declare-fun res!602055 () Bool)

(assert (=> d!109891 (=> (not res!602055) (not e!493927))))

(assert (=> d!109891 (= res!602055 (isStrictlySorted!477 lt!401474))))

(assert (=> d!109891 (= lt!401474 e!493929)))

(declare-fun c!93755 () Bool)

(assert (=> d!109891 (= c!93755 (and ((_ is Cons!17622) (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) (bvslt (_1!5928 (h!18759 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)))) key1!49)))))

(assert (=> d!109891 (isStrictlySorted!477 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)))))

(assert (=> d!109891 (= (insertStrictlySorted!298 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) key1!49 v2!16) lt!401474)))

(declare-fun bm!39265 () Bool)

(assert (=> bm!39265 (= call!39267 ($colon$colon!546 e!493928 (ite c!93755 (h!18759 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) (tuple2!11835 key1!49 v2!16))))))

(declare-fun c!93754 () Bool)

(assert (=> bm!39265 (= c!93754 c!93755)))

(declare-fun b!887247 () Bool)

(assert (=> b!887247 (= c!93756 (and ((_ is Cons!17622) (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) (bvsgt (_1!5928 (h!18759 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)))) key1!49)))))

(assert (=> b!887247 (= e!493926 e!493925)))

(assert (= (and d!109891 c!93755) b!887240))

(assert (= (and d!109891 (not c!93755)) b!887244))

(assert (= (and b!887244 c!93753) b!887245))

(assert (= (and b!887244 (not c!93753)) b!887247))

(assert (= (and b!887247 c!93756) b!887238))

(assert (= (and b!887247 (not c!93756)) b!887242))

(assert (= (or b!887238 b!887242) bm!39263))

(assert (= (or b!887245 bm!39263) bm!39264))

(assert (= (or b!887240 bm!39264) bm!39265))

(assert (= (and bm!39265 c!93754) b!887241))

(assert (= (and bm!39265 (not c!93754)) b!887243))

(assert (= (and d!109891 res!602055) b!887246))

(assert (= (and b!887246 res!602054) b!887239))

(declare-fun m!827485 () Bool)

(assert (=> b!887241 m!827485))

(declare-fun m!827487 () Bool)

(assert (=> d!109891 m!827487))

(declare-fun m!827489 () Bool)

(assert (=> d!109891 m!827489))

(declare-fun m!827491 () Bool)

(assert (=> b!887246 m!827491))

(declare-fun m!827493 () Bool)

(assert (=> bm!39265 m!827493))

(declare-fun m!827495 () Bool)

(assert (=> b!887239 m!827495))

(assert (=> b!886992 d!109891))

(declare-fun d!109893 () Bool)

(declare-fun res!602056 () Bool)

(declare-fun e!493930 () Bool)

(assert (=> d!109893 (=> res!602056 e!493930)))

(assert (=> d!109893 (= res!602056 (or ((_ is Nil!17623) lt!401456) ((_ is Nil!17623) (t!24895 lt!401456))))))

(assert (=> d!109893 (= (isStrictlySorted!477 lt!401456) e!493930)))

(declare-fun b!887248 () Bool)

(declare-fun e!493931 () Bool)

(assert (=> b!887248 (= e!493930 e!493931)))

(declare-fun res!602057 () Bool)

(assert (=> b!887248 (=> (not res!602057) (not e!493931))))

(assert (=> b!887248 (= res!602057 (bvslt (_1!5928 (h!18759 lt!401456)) (_1!5928 (h!18759 (t!24895 lt!401456)))))))

(declare-fun b!887249 () Bool)

(assert (=> b!887249 (= e!493931 (isStrictlySorted!477 (t!24895 lt!401456)))))

(assert (= (and d!109893 (not res!602056)) b!887248))

(assert (= (and b!887248 res!602057) b!887249))

(declare-fun m!827497 () Bool)

(assert (=> b!887249 m!827497))

(assert (=> d!109837 d!109893))

(assert (=> d!109837 d!109849))

(declare-fun b!887250 () Bool)

(declare-fun e!493932 () List!17626)

(declare-fun call!39271 () List!17626)

(assert (=> b!887250 (= e!493932 call!39271)))

(declare-fun b!887251 () Bool)

(declare-fun e!493934 () Bool)

(declare-fun lt!401475 () List!17626)

(assert (=> b!887251 (= e!493934 (contains!4275 lt!401475 (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887252 () Bool)

(declare-fun e!493936 () List!17626)

(declare-fun call!39270 () List!17626)

(assert (=> b!887252 (= e!493936 call!39270)))

(declare-fun b!887253 () Bool)

(declare-fun e!493935 () List!17626)

(assert (=> b!887253 (= e!493935 (insertStrictlySorted!298 (t!24895 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun b!887255 () Bool)

(declare-fun c!93760 () Bool)

(declare-fun c!93757 () Bool)

(assert (=> b!887255 (= e!493935 (ite c!93757 (t!24895 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (ite c!93760 (Cons!17622 (h!18759 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (t!24895 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) Nil!17623)))))

(declare-fun b!887256 () Bool)

(declare-fun e!493933 () List!17626)

(assert (=> b!887256 (= e!493936 e!493933)))

(assert (=> b!887256 (= c!93757 (and ((_ is Cons!17622) (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (= (_1!5928 (h!18759 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun bm!39266 () Bool)

(declare-fun call!39269 () List!17626)

(assert (=> bm!39266 (= call!39271 call!39269)))

(declare-fun bm!39267 () Bool)

(assert (=> bm!39267 (= call!39269 call!39270)))

(declare-fun b!887257 () Bool)

(assert (=> b!887257 (= e!493933 call!39269)))

(declare-fun b!887258 () Bool)

(declare-fun res!602058 () Bool)

(assert (=> b!887258 (=> (not res!602058) (not e!493934))))

(assert (=> b!887258 (= res!602058 (containsKey!413 lt!401475 key1!49))))

(declare-fun b!887254 () Bool)

(assert (=> b!887254 (= e!493932 call!39271)))

(declare-fun d!109895 () Bool)

(assert (=> d!109895 e!493934))

(declare-fun res!602059 () Bool)

(assert (=> d!109895 (=> (not res!602059) (not e!493934))))

(assert (=> d!109895 (= res!602059 (isStrictlySorted!477 lt!401475))))

(assert (=> d!109895 (= lt!401475 e!493936)))

(declare-fun c!93759 () Bool)

(assert (=> d!109895 (= c!93759 (and ((_ is Cons!17622) (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (bvslt (_1!5928 (h!18759 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!109895 (isStrictlySorted!477 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38)))))

(assert (=> d!109895 (= (insertStrictlySorted!298 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38)) key1!49 v2!16) lt!401475)))

(declare-fun bm!39268 () Bool)

(assert (=> bm!39268 (= call!39270 ($colon$colon!546 e!493935 (ite c!93759 (h!18759 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (tuple2!11835 key1!49 v2!16))))))

(declare-fun c!93758 () Bool)

(assert (=> bm!39268 (= c!93758 c!93759)))

(declare-fun b!887259 () Bool)

(assert (=> b!887259 (= c!93760 (and ((_ is Cons!17622) (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (bvsgt (_1!5928 (h!18759 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> b!887259 (= e!493933 e!493932)))

(assert (= (and d!109895 c!93759) b!887252))

(assert (= (and d!109895 (not c!93759)) b!887256))

(assert (= (and b!887256 c!93757) b!887257))

(assert (= (and b!887256 (not c!93757)) b!887259))

(assert (= (and b!887259 c!93760) b!887250))

(assert (= (and b!887259 (not c!93760)) b!887254))

(assert (= (or b!887250 b!887254) bm!39266))

(assert (= (or b!887257 bm!39266) bm!39267))

(assert (= (or b!887252 bm!39267) bm!39268))

(assert (= (and bm!39268 c!93758) b!887253))

(assert (= (and bm!39268 (not c!93758)) b!887255))

(assert (= (and d!109895 res!602059) b!887258))

(assert (= (and b!887258 res!602058) b!887251))

(declare-fun m!827499 () Bool)

(assert (=> b!887253 m!827499))

(declare-fun m!827501 () Bool)

(assert (=> d!109895 m!827501))

(declare-fun m!827503 () Bool)

(assert (=> d!109895 m!827503))

(declare-fun m!827505 () Bool)

(assert (=> b!887258 m!827505))

(declare-fun m!827507 () Bool)

(assert (=> bm!39268 m!827507))

(declare-fun m!827509 () Bool)

(assert (=> b!887251 m!827509))

(assert (=> b!887002 d!109895))

(declare-fun d!109897 () Bool)

(declare-fun res!602060 () Bool)

(declare-fun e!493937 () Bool)

(assert (=> d!109897 (=> res!602060 e!493937)))

(assert (=> d!109897 (= res!602060 (and ((_ is Cons!17622) lt!401451) (= (_1!5928 (h!18759 lt!401451)) key1!49)))))

(assert (=> d!109897 (= (containsKey!413 lt!401451 key1!49) e!493937)))

(declare-fun b!887260 () Bool)

(declare-fun e!493938 () Bool)

(assert (=> b!887260 (= e!493937 e!493938)))

(declare-fun res!602061 () Bool)

(assert (=> b!887260 (=> (not res!602061) (not e!493938))))

(assert (=> b!887260 (= res!602061 (and (or (not ((_ is Cons!17622) lt!401451)) (bvsle (_1!5928 (h!18759 lt!401451)) key1!49)) ((_ is Cons!17622) lt!401451) (bvslt (_1!5928 (h!18759 lt!401451)) key1!49)))))

(declare-fun b!887261 () Bool)

(assert (=> b!887261 (= e!493938 (containsKey!413 (t!24895 lt!401451) key1!49))))

(assert (= (and d!109897 (not res!602060)) b!887260))

(assert (= (and b!887260 res!602061) b!887261))

(declare-fun m!827511 () Bool)

(assert (=> b!887261 m!827511))

(assert (=> b!886997 d!109897))

(declare-fun d!109899 () Bool)

(declare-fun lt!401476 () Bool)

(assert (=> d!109899 (= lt!401476 (select (content!394 lt!401454) (tuple2!11835 key1!49 v2!16)))))

(declare-fun e!493940 () Bool)

(assert (=> d!109899 (= lt!401476 e!493940)))

(declare-fun res!602063 () Bool)

(assert (=> d!109899 (=> (not res!602063) (not e!493940))))

(assert (=> d!109899 (= res!602063 ((_ is Cons!17622) lt!401454))))

(assert (=> d!109899 (= (contains!4275 lt!401454 (tuple2!11835 key1!49 v2!16)) lt!401476)))

(declare-fun b!887262 () Bool)

(declare-fun e!493939 () Bool)

(assert (=> b!887262 (= e!493940 e!493939)))

(declare-fun res!602062 () Bool)

(assert (=> b!887262 (=> res!602062 e!493939)))

(assert (=> b!887262 (= res!602062 (= (h!18759 lt!401454) (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887263 () Bool)

(assert (=> b!887263 (= e!493939 (contains!4275 (t!24895 lt!401454) (tuple2!11835 key1!49 v2!16)))))

(assert (= (and d!109899 res!602063) b!887262))

(assert (= (and b!887262 (not res!602062)) b!887263))

(declare-fun m!827513 () Bool)

(assert (=> d!109899 m!827513))

(declare-fun m!827515 () Bool)

(assert (=> d!109899 m!827515))

(declare-fun m!827517 () Bool)

(assert (=> b!887263 m!827517))

(assert (=> b!887028 d!109899))

(declare-fun d!109901 () Bool)

(assert (=> d!109901 (= ($colon$colon!546 e!493779 (ite c!93681 (h!18759 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) (tuple2!11835 key1!49 v2!16))) (Cons!17622 (ite c!93681 (h!18759 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) (tuple2!11835 key1!49 v2!16)) e!493779))))

(assert (=> bm!39207 d!109901))

(declare-fun d!109903 () Bool)

(declare-fun res!602064 () Bool)

(declare-fun e!493941 () Bool)

(assert (=> d!109903 (=> res!602064 e!493941)))

(assert (=> d!109903 (= res!602064 (or ((_ is Nil!17623) lt!401451) ((_ is Nil!17623) (t!24895 lt!401451))))))

(assert (=> d!109903 (= (isStrictlySorted!477 lt!401451) e!493941)))

(declare-fun b!887264 () Bool)

(declare-fun e!493942 () Bool)

(assert (=> b!887264 (= e!493941 e!493942)))

(declare-fun res!602065 () Bool)

(assert (=> b!887264 (=> (not res!602065) (not e!493942))))

(assert (=> b!887264 (= res!602065 (bvslt (_1!5928 (h!18759 lt!401451)) (_1!5928 (h!18759 (t!24895 lt!401451)))))))

(declare-fun b!887265 () Bool)

(assert (=> b!887265 (= e!493942 (isStrictlySorted!477 (t!24895 lt!401451)))))

(assert (= (and d!109903 (not res!602064)) b!887264))

(assert (= (and b!887264 res!602065) b!887265))

(declare-fun m!827519 () Bool)

(assert (=> b!887265 m!827519))

(assert (=> d!109823 d!109903))

(declare-fun d!109905 () Bool)

(declare-fun res!602066 () Bool)

(declare-fun e!493943 () Bool)

(assert (=> d!109905 (=> res!602066 e!493943)))

(assert (=> d!109905 (= res!602066 (or ((_ is Nil!17623) (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) ((_ is Nil!17623) (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)))))))

(assert (=> d!109905 (= (isStrictlySorted!477 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38)) e!493943)))

(declare-fun b!887266 () Bool)

(declare-fun e!493944 () Bool)

(assert (=> b!887266 (= e!493943 e!493944)))

(declare-fun res!602067 () Bool)

(assert (=> b!887266 (=> (not res!602067) (not e!493944))))

(assert (=> b!887266 (= res!602067 (bvslt (_1!5928 (h!18759 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))) (_1!5928 (h!18759 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))))))))

(declare-fun b!887267 () Bool)

(assert (=> b!887267 (= e!493944 (isStrictlySorted!477 (t!24895 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38))))))

(assert (= (and d!109905 (not res!602066)) b!887266))

(assert (= (and b!887266 res!602067) b!887267))

(assert (=> b!887267 m!827489))

(assert (=> d!109823 d!109905))

(declare-fun d!109907 () Bool)

(declare-fun res!602068 () Bool)

(declare-fun e!493945 () Bool)

(assert (=> d!109907 (=> res!602068 e!493945)))

(assert (=> d!109907 (= res!602068 (or ((_ is Nil!17623) lt!401452) ((_ is Nil!17623) (t!24895 lt!401452))))))

(assert (=> d!109907 (= (isStrictlySorted!477 lt!401452) e!493945)))

(declare-fun b!887268 () Bool)

(declare-fun e!493946 () Bool)

(assert (=> b!887268 (= e!493945 e!493946)))

(declare-fun res!602069 () Bool)

(assert (=> b!887268 (=> (not res!602069) (not e!493946))))

(assert (=> b!887268 (= res!602069 (bvslt (_1!5928 (h!18759 lt!401452)) (_1!5928 (h!18759 (t!24895 lt!401452)))))))

(declare-fun b!887269 () Bool)

(assert (=> b!887269 (= e!493946 (isStrictlySorted!477 (t!24895 lt!401452)))))

(assert (= (and d!109907 (not res!602068)) b!887268))

(assert (= (and b!887268 res!602069) b!887269))

(declare-fun m!827521 () Bool)

(assert (=> b!887269 m!827521))

(assert (=> d!109831 d!109907))

(declare-fun d!109909 () Bool)

(declare-fun res!602070 () Bool)

(declare-fun e!493947 () Bool)

(assert (=> d!109909 (=> res!602070 e!493947)))

(assert (=> d!109909 (= res!602070 (or ((_ is Nil!17623) (insertStrictlySorted!298 l!906 key1!49 v1!38)) ((_ is Nil!17623) (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38)))))))

(assert (=> d!109909 (= (isStrictlySorted!477 (insertStrictlySorted!298 l!906 key1!49 v1!38)) e!493947)))

(declare-fun b!887270 () Bool)

(declare-fun e!493948 () Bool)

(assert (=> b!887270 (= e!493947 e!493948)))

(declare-fun res!602071 () Bool)

(assert (=> b!887270 (=> (not res!602071) (not e!493948))))

(assert (=> b!887270 (= res!602071 (bvslt (_1!5928 (h!18759 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (_1!5928 (h!18759 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))))))))

(declare-fun b!887271 () Bool)

(assert (=> b!887271 (= e!493948 (isStrictlySorted!477 (t!24895 (insertStrictlySorted!298 l!906 key1!49 v1!38))))))

(assert (= (and d!109909 (not res!602070)) b!887270))

(assert (= (and b!887270 res!602071) b!887271))

(assert (=> b!887271 m!827503))

(assert (=> d!109831 d!109909))

(declare-fun b!887272 () Bool)

(declare-fun e!493949 () List!17626)

(declare-fun call!39274 () List!17626)

(assert (=> b!887272 (= e!493949 call!39274)))

(declare-fun lt!401477 () List!17626)

(declare-fun b!887273 () Bool)

(declare-fun e!493951 () Bool)

(assert (=> b!887273 (= e!493951 (contains!4275 lt!401477 (tuple2!11835 key1!49 v1!38)))))

(declare-fun b!887274 () Bool)

(declare-fun e!493953 () List!17626)

(declare-fun call!39273 () List!17626)

(assert (=> b!887274 (= e!493953 call!39273)))

(declare-fun b!887275 () Bool)

(declare-fun e!493952 () List!17626)

(assert (=> b!887275 (= e!493952 (insertStrictlySorted!298 (t!24895 (t!24895 (t!24895 l!906))) key1!49 v1!38))))

(declare-fun c!93761 () Bool)

(declare-fun c!93764 () Bool)

(declare-fun b!887277 () Bool)

(assert (=> b!887277 (= e!493952 (ite c!93761 (t!24895 (t!24895 (t!24895 l!906))) (ite c!93764 (Cons!17622 (h!18759 (t!24895 (t!24895 l!906))) (t!24895 (t!24895 (t!24895 l!906)))) Nil!17623)))))

(declare-fun b!887278 () Bool)

(declare-fun e!493950 () List!17626)

(assert (=> b!887278 (= e!493953 e!493950)))

(assert (=> b!887278 (= c!93761 (and ((_ is Cons!17622) (t!24895 (t!24895 l!906))) (= (_1!5928 (h!18759 (t!24895 (t!24895 l!906)))) key1!49)))))

(declare-fun bm!39269 () Bool)

(declare-fun call!39272 () List!17626)

(assert (=> bm!39269 (= call!39274 call!39272)))

(declare-fun bm!39270 () Bool)

(assert (=> bm!39270 (= call!39272 call!39273)))

(declare-fun b!887279 () Bool)

(assert (=> b!887279 (= e!493950 call!39272)))

(declare-fun b!887280 () Bool)

(declare-fun res!602072 () Bool)

(assert (=> b!887280 (=> (not res!602072) (not e!493951))))

(assert (=> b!887280 (= res!602072 (containsKey!413 lt!401477 key1!49))))

(declare-fun b!887276 () Bool)

(assert (=> b!887276 (= e!493949 call!39274)))

(declare-fun d!109911 () Bool)

(assert (=> d!109911 e!493951))

(declare-fun res!602073 () Bool)

(assert (=> d!109911 (=> (not res!602073) (not e!493951))))

(assert (=> d!109911 (= res!602073 (isStrictlySorted!477 lt!401477))))

(assert (=> d!109911 (= lt!401477 e!493953)))

(declare-fun c!93763 () Bool)

(assert (=> d!109911 (= c!93763 (and ((_ is Cons!17622) (t!24895 (t!24895 l!906))) (bvslt (_1!5928 (h!18759 (t!24895 (t!24895 l!906)))) key1!49)))))

(assert (=> d!109911 (isStrictlySorted!477 (t!24895 (t!24895 l!906)))))

(assert (=> d!109911 (= (insertStrictlySorted!298 (t!24895 (t!24895 l!906)) key1!49 v1!38) lt!401477)))

(declare-fun bm!39271 () Bool)

(assert (=> bm!39271 (= call!39273 ($colon$colon!546 e!493952 (ite c!93763 (h!18759 (t!24895 (t!24895 l!906))) (tuple2!11835 key1!49 v1!38))))))

(declare-fun c!93762 () Bool)

(assert (=> bm!39271 (= c!93762 c!93763)))

(declare-fun b!887281 () Bool)

(assert (=> b!887281 (= c!93764 (and ((_ is Cons!17622) (t!24895 (t!24895 l!906))) (bvsgt (_1!5928 (h!18759 (t!24895 (t!24895 l!906)))) key1!49)))))

(assert (=> b!887281 (= e!493950 e!493949)))

(assert (= (and d!109911 c!93763) b!887274))

(assert (= (and d!109911 (not c!93763)) b!887278))

(assert (= (and b!887278 c!93761) b!887279))

(assert (= (and b!887278 (not c!93761)) b!887281))

(assert (= (and b!887281 c!93764) b!887272))

(assert (= (and b!887281 (not c!93764)) b!887276))

(assert (= (or b!887272 b!887276) bm!39269))

(assert (= (or b!887279 bm!39269) bm!39270))

(assert (= (or b!887274 bm!39270) bm!39271))

(assert (= (and bm!39271 c!93762) b!887275))

(assert (= (and bm!39271 (not c!93762)) b!887277))

(assert (= (and d!109911 res!602073) b!887280))

(assert (= (and b!887280 res!602072) b!887273))

(declare-fun m!827523 () Bool)

(assert (=> b!887275 m!827523))

(declare-fun m!827525 () Bool)

(assert (=> d!109911 m!827525))

(assert (=> d!109911 m!827435))

(declare-fun m!827527 () Bool)

(assert (=> b!887280 m!827527))

(declare-fun m!827529 () Bool)

(assert (=> bm!39271 m!827529))

(declare-fun m!827531 () Bool)

(assert (=> b!887273 m!827531))

(assert (=> b!887050 d!109911))

(declare-fun d!109913 () Bool)

(declare-fun lt!401478 () Bool)

(assert (=> d!109913 (= lt!401478 (select (content!394 lt!401456) (tuple2!11835 key1!49 v1!38)))))

(declare-fun e!493955 () Bool)

(assert (=> d!109913 (= lt!401478 e!493955)))

(declare-fun res!602075 () Bool)

(assert (=> d!109913 (=> (not res!602075) (not e!493955))))

(assert (=> d!109913 (= res!602075 ((_ is Cons!17622) lt!401456))))

(assert (=> d!109913 (= (contains!4275 lt!401456 (tuple2!11835 key1!49 v1!38)) lt!401478)))

(declare-fun b!887282 () Bool)

(declare-fun e!493954 () Bool)

(assert (=> b!887282 (= e!493955 e!493954)))

(declare-fun res!602074 () Bool)

(assert (=> b!887282 (=> res!602074 e!493954)))

(assert (=> b!887282 (= res!602074 (= (h!18759 lt!401456) (tuple2!11835 key1!49 v1!38)))))

(declare-fun b!887283 () Bool)

(assert (=> b!887283 (= e!493954 (contains!4275 (t!24895 lt!401456) (tuple2!11835 key1!49 v1!38)))))

(assert (= (and d!109913 res!602075) b!887282))

(assert (= (and b!887282 (not res!602074)) b!887283))

(declare-fun m!827533 () Bool)

(assert (=> d!109913 m!827533))

(declare-fun m!827535 () Bool)

(assert (=> d!109913 m!827535))

(declare-fun m!827537 () Bool)

(assert (=> b!887283 m!827537))

(assert (=> b!887048 d!109913))

(declare-fun d!109915 () Bool)

(declare-fun lt!401479 () Bool)

(assert (=> d!109915 (= lt!401479 (select (content!394 lt!401452) (tuple2!11835 key1!49 v2!16)))))

(declare-fun e!493957 () Bool)

(assert (=> d!109915 (= lt!401479 e!493957)))

(declare-fun res!602077 () Bool)

(assert (=> d!109915 (=> (not res!602077) (not e!493957))))

(assert (=> d!109915 (= res!602077 ((_ is Cons!17622) lt!401452))))

(assert (=> d!109915 (= (contains!4275 lt!401452 (tuple2!11835 key1!49 v2!16)) lt!401479)))

(declare-fun b!887284 () Bool)

(declare-fun e!493956 () Bool)

(assert (=> b!887284 (= e!493957 e!493956)))

(declare-fun res!602076 () Bool)

(assert (=> b!887284 (=> res!602076 e!493956)))

(assert (=> b!887284 (= res!602076 (= (h!18759 lt!401452) (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887285 () Bool)

(assert (=> b!887285 (= e!493956 (contains!4275 (t!24895 lt!401452) (tuple2!11835 key1!49 v2!16)))))

(assert (= (and d!109915 res!602077) b!887284))

(assert (= (and b!887284 (not res!602076)) b!887285))

(declare-fun m!827539 () Bool)

(assert (=> d!109915 m!827539))

(declare-fun m!827541 () Bool)

(assert (=> d!109915 m!827541))

(declare-fun m!827543 () Bool)

(assert (=> b!887285 m!827543))

(assert (=> b!887000 d!109915))

(declare-fun d!109917 () Bool)

(declare-fun res!602078 () Bool)

(declare-fun e!493958 () Bool)

(assert (=> d!109917 (=> res!602078 e!493958)))

(assert (=> d!109917 (= res!602078 (and ((_ is Cons!17622) lt!401456) (= (_1!5928 (h!18759 lt!401456)) key1!49)))))

(assert (=> d!109917 (= (containsKey!413 lt!401456 key1!49) e!493958)))

(declare-fun b!887286 () Bool)

(declare-fun e!493959 () Bool)

(assert (=> b!887286 (= e!493958 e!493959)))

(declare-fun res!602079 () Bool)

(assert (=> b!887286 (=> (not res!602079) (not e!493959))))

(assert (=> b!887286 (= res!602079 (and (or (not ((_ is Cons!17622) lt!401456)) (bvsle (_1!5928 (h!18759 lt!401456)) key1!49)) ((_ is Cons!17622) lt!401456) (bvslt (_1!5928 (h!18759 lt!401456)) key1!49)))))

(declare-fun b!887287 () Bool)

(assert (=> b!887287 (= e!493959 (containsKey!413 (t!24895 lt!401456) key1!49))))

(assert (= (and d!109917 (not res!602078)) b!887286))

(assert (= (and b!887286 res!602079) b!887287))

(declare-fun m!827545 () Bool)

(assert (=> b!887287 m!827545))

(assert (=> b!887055 d!109917))

(declare-fun d!109919 () Bool)

(assert (=> d!109919 (= ($colon$colon!546 e!493808 (ite c!93703 (h!18759 (t!24895 l!906)) (tuple2!11835 key1!49 v1!38))) (Cons!17622 (ite c!93703 (h!18759 (t!24895 l!906)) (tuple2!11835 key1!49 v1!38)) e!493808))))

(assert (=> bm!39226 d!109919))

(declare-fun d!109921 () Bool)

(declare-fun res!602080 () Bool)

(declare-fun e!493960 () Bool)

(assert (=> d!109921 (=> res!602080 e!493960)))

(assert (=> d!109921 (= res!602080 (and ((_ is Cons!17622) lt!401452) (= (_1!5928 (h!18759 lt!401452)) key1!49)))))

(assert (=> d!109921 (= (containsKey!413 lt!401452 key1!49) e!493960)))

(declare-fun b!887288 () Bool)

(declare-fun e!493961 () Bool)

(assert (=> b!887288 (= e!493960 e!493961)))

(declare-fun res!602081 () Bool)

(assert (=> b!887288 (=> (not res!602081) (not e!493961))))

(assert (=> b!887288 (= res!602081 (and (or (not ((_ is Cons!17622) lt!401452)) (bvsle (_1!5928 (h!18759 lt!401452)) key1!49)) ((_ is Cons!17622) lt!401452) (bvslt (_1!5928 (h!18759 lt!401452)) key1!49)))))

(declare-fun b!887289 () Bool)

(assert (=> b!887289 (= e!493961 (containsKey!413 (t!24895 lt!401452) key1!49))))

(assert (= (and d!109921 (not res!602080)) b!887288))

(assert (= (and b!887288 res!602081) b!887289))

(declare-fun m!827547 () Bool)

(assert (=> b!887289 m!827547))

(assert (=> b!887007 d!109921))

(declare-fun d!109923 () Bool)

(declare-fun res!602082 () Bool)

(declare-fun e!493962 () Bool)

(assert (=> d!109923 (=> res!602082 e!493962)))

(assert (=> d!109923 (= res!602082 (or ((_ is Nil!17623) lt!401454) ((_ is Nil!17623) (t!24895 lt!401454))))))

(assert (=> d!109923 (= (isStrictlySorted!477 lt!401454) e!493962)))

(declare-fun b!887290 () Bool)

(declare-fun e!493963 () Bool)

(assert (=> b!887290 (= e!493962 e!493963)))

(declare-fun res!602083 () Bool)

(assert (=> b!887290 (=> (not res!602083) (not e!493963))))

(assert (=> b!887290 (= res!602083 (bvslt (_1!5928 (h!18759 lt!401454)) (_1!5928 (h!18759 (t!24895 lt!401454)))))))

(declare-fun b!887291 () Bool)

(assert (=> b!887291 (= e!493963 (isStrictlySorted!477 (t!24895 lt!401454)))))

(assert (= (and d!109923 (not res!602082)) b!887290))

(assert (= (and b!887290 res!602083) b!887291))

(declare-fun m!827549 () Bool)

(assert (=> b!887291 m!827549))

(assert (=> d!109833 d!109923))

(assert (=> d!109833 d!109849))

(assert (=> d!109819 d!109823))

(assert (=> d!109819 d!109849))

(assert (=> d!109819 d!109833))

(assert (=> d!109819 d!109837))

(declare-fun d!109925 () Bool)

(assert (=> d!109925 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24895 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 (t!24895 l!906) key1!49 v2!16))))

(assert (=> d!109925 true))

(declare-fun _$8!133 () Unit!30220)

(assert (=> d!109925 (= (choose!1456 (t!24895 l!906) key1!49 v1!38 v2!16) _$8!133)))

(declare-fun bs!24865 () Bool)

(assert (= bs!24865 d!109925))

(assert (=> bs!24865 m!827213))

(assert (=> bs!24865 m!827213))

(assert (=> bs!24865 m!827215))

(assert (=> bs!24865 m!827223))

(assert (=> d!109819 d!109925))

(declare-fun d!109927 () Bool)

(assert (=> d!109927 (= ($colon$colon!546 e!493818 (ite c!93711 (h!18759 l!906) (tuple2!11835 key1!49 v2!16))) (Cons!17622 (ite c!93711 (h!18759 l!906) (tuple2!11835 key1!49 v2!16)) e!493818))))

(assert (=> bm!39232 d!109927))

(declare-fun b!887292 () Bool)

(declare-fun e!493964 () List!17626)

(declare-fun call!39277 () List!17626)

(assert (=> b!887292 (= e!493964 call!39277)))

(declare-fun lt!401480 () List!17626)

(declare-fun b!887293 () Bool)

(declare-fun e!493966 () Bool)

(assert (=> b!887293 (= e!493966 (contains!4275 lt!401480 (tuple2!11835 key1!49 v2!16)))))

(declare-fun b!887294 () Bool)

(declare-fun e!493968 () List!17626)

(declare-fun call!39276 () List!17626)

(assert (=> b!887294 (= e!493968 call!39276)))

(declare-fun b!887295 () Bool)

(declare-fun e!493967 () List!17626)

(assert (=> b!887295 (= e!493967 (insertStrictlySorted!298 (t!24895 (t!24895 (t!24895 l!906))) key1!49 v2!16))))

(declare-fun c!93765 () Bool)

(declare-fun c!93768 () Bool)

(declare-fun b!887297 () Bool)

(assert (=> b!887297 (= e!493967 (ite c!93765 (t!24895 (t!24895 (t!24895 l!906))) (ite c!93768 (Cons!17622 (h!18759 (t!24895 (t!24895 l!906))) (t!24895 (t!24895 (t!24895 l!906)))) Nil!17623)))))

(declare-fun b!887298 () Bool)

(declare-fun e!493965 () List!17626)

(assert (=> b!887298 (= e!493968 e!493965)))

(assert (=> b!887298 (= c!93765 (and ((_ is Cons!17622) (t!24895 (t!24895 l!906))) (= (_1!5928 (h!18759 (t!24895 (t!24895 l!906)))) key1!49)))))

(declare-fun bm!39272 () Bool)

(declare-fun call!39275 () List!17626)

(assert (=> bm!39272 (= call!39277 call!39275)))

(declare-fun bm!39273 () Bool)

(assert (=> bm!39273 (= call!39275 call!39276)))

(declare-fun b!887299 () Bool)

(assert (=> b!887299 (= e!493965 call!39275)))

(declare-fun b!887300 () Bool)

(declare-fun res!602084 () Bool)

(assert (=> b!887300 (=> (not res!602084) (not e!493966))))

(assert (=> b!887300 (= res!602084 (containsKey!413 lt!401480 key1!49))))

(declare-fun b!887296 () Bool)

(assert (=> b!887296 (= e!493964 call!39277)))

(declare-fun d!109929 () Bool)

(assert (=> d!109929 e!493966))

(declare-fun res!602085 () Bool)

(assert (=> d!109929 (=> (not res!602085) (not e!493966))))

(assert (=> d!109929 (= res!602085 (isStrictlySorted!477 lt!401480))))

(assert (=> d!109929 (= lt!401480 e!493968)))

(declare-fun c!93767 () Bool)

(assert (=> d!109929 (= c!93767 (and ((_ is Cons!17622) (t!24895 (t!24895 l!906))) (bvslt (_1!5928 (h!18759 (t!24895 (t!24895 l!906)))) key1!49)))))

(assert (=> d!109929 (isStrictlySorted!477 (t!24895 (t!24895 l!906)))))

(assert (=> d!109929 (= (insertStrictlySorted!298 (t!24895 (t!24895 l!906)) key1!49 v2!16) lt!401480)))

(declare-fun bm!39274 () Bool)

(assert (=> bm!39274 (= call!39276 ($colon$colon!546 e!493967 (ite c!93767 (h!18759 (t!24895 (t!24895 l!906))) (tuple2!11835 key1!49 v2!16))))))

(declare-fun c!93766 () Bool)

(assert (=> bm!39274 (= c!93766 c!93767)))

(declare-fun b!887301 () Bool)

(assert (=> b!887301 (= c!93768 (and ((_ is Cons!17622) (t!24895 (t!24895 l!906))) (bvsgt (_1!5928 (h!18759 (t!24895 (t!24895 l!906)))) key1!49)))))

(assert (=> b!887301 (= e!493965 e!493964)))

(assert (= (and d!109929 c!93767) b!887294))

(assert (= (and d!109929 (not c!93767)) b!887298))

(assert (= (and b!887298 c!93765) b!887299))

(assert (= (and b!887298 (not c!93765)) b!887301))

(assert (= (and b!887301 c!93768) b!887292))

(assert (= (and b!887301 (not c!93768)) b!887296))

(assert (= (or b!887292 b!887296) bm!39272))

(assert (= (or b!887299 bm!39272) bm!39273))

(assert (= (or b!887294 bm!39273) bm!39274))

(assert (= (and bm!39274 c!93766) b!887295))

(assert (= (and bm!39274 (not c!93766)) b!887297))

(assert (= (and d!109929 res!602085) b!887300))

(assert (= (and b!887300 res!602084) b!887293))

(declare-fun m!827551 () Bool)

(assert (=> b!887295 m!827551))

(declare-fun m!827553 () Bool)

(assert (=> d!109929 m!827553))

(assert (=> d!109929 m!827435))

(declare-fun m!827555 () Bool)

(assert (=> b!887300 m!827555))

(declare-fun m!827557 () Bool)

(assert (=> bm!39274 m!827557))

(declare-fun m!827559 () Bool)

(assert (=> b!887293 m!827559))

(assert (=> b!887030 d!109929))

(declare-fun d!109931 () Bool)

(declare-fun res!602086 () Bool)

(declare-fun e!493969 () Bool)

(assert (=> d!109931 (=> res!602086 e!493969)))

(assert (=> d!109931 (= res!602086 (and ((_ is Cons!17622) lt!401461) (= (_1!5928 (h!18759 lt!401461)) key1!49)))))

(assert (=> d!109931 (= (containsKey!413 lt!401461 key1!49) e!493969)))

(declare-fun b!887302 () Bool)

(declare-fun e!493970 () Bool)

(assert (=> b!887302 (= e!493969 e!493970)))

(declare-fun res!602087 () Bool)

(assert (=> b!887302 (=> (not res!602087) (not e!493970))))

(assert (=> b!887302 (= res!602087 (and (or (not ((_ is Cons!17622) lt!401461)) (bvsle (_1!5928 (h!18759 lt!401461)) key1!49)) ((_ is Cons!17622) lt!401461) (bvslt (_1!5928 (h!18759 lt!401461)) key1!49)))))

(declare-fun b!887303 () Bool)

(assert (=> b!887303 (= e!493970 (containsKey!413 (t!24895 lt!401461) key1!49))))

(assert (= (and d!109931 (not res!602086)) b!887302))

(assert (= (and b!887302 res!602087) b!887303))

(declare-fun m!827561 () Bool)

(assert (=> b!887303 m!827561))

(assert (=> b!887105 d!109931))

(declare-fun d!109933 () Bool)

(assert (=> d!109933 (= ($colon$colon!546 e!493833 (ite c!93723 (h!18759 l!906) (tuple2!11835 key1!49 v1!38))) (Cons!17622 (ite c!93723 (h!18759 l!906) (tuple2!11835 key1!49 v1!38)) e!493833))))

(assert (=> bm!39241 d!109933))

(declare-fun d!109935 () Bool)

(declare-fun res!602088 () Bool)

(declare-fun e!493971 () Bool)

(assert (=> d!109935 (=> res!602088 e!493971)))

(assert (=> d!109935 (= res!602088 (and ((_ is Cons!17622) lt!401458) (= (_1!5928 (h!18759 lt!401458)) key1!49)))))

(assert (=> d!109935 (= (containsKey!413 lt!401458 key1!49) e!493971)))

(declare-fun b!887304 () Bool)

(declare-fun e!493972 () Bool)

(assert (=> b!887304 (= e!493971 e!493972)))

(declare-fun res!602089 () Bool)

(assert (=> b!887304 (=> (not res!602089) (not e!493972))))

(assert (=> b!887304 (= res!602089 (and (or (not ((_ is Cons!17622) lt!401458)) (bvsle (_1!5928 (h!18759 lt!401458)) key1!49)) ((_ is Cons!17622) lt!401458) (bvslt (_1!5928 (h!18759 lt!401458)) key1!49)))))

(declare-fun b!887305 () Bool)

(assert (=> b!887305 (= e!493972 (containsKey!413 (t!24895 lt!401458) key1!49))))

(assert (= (and d!109935 (not res!602088)) b!887304))

(assert (= (and b!887304 res!602089) b!887305))

(declare-fun m!827563 () Bool)

(assert (=> b!887305 m!827563))

(assert (=> b!887075 d!109935))

(declare-fun b!887306 () Bool)

(declare-fun e!493973 () Bool)

(declare-fun tp!54382 () Bool)

(assert (=> b!887306 (= e!493973 (and tp_is_empty!17809 tp!54382))))

(assert (=> b!887183 (= tp!54375 e!493973)))

(assert (= (and b!887183 ((_ is Cons!17622) (t!24895 (t!24895 l!906)))) b!887306))

(check-sat (not d!109925) (not d!109911) (not b!887237) (not d!109929) (not b!887235) (not b!887275) (not b!887261) (not b!887303) (not b!887287) (not b!887271) (not b!887263) (not b!887241) (not b!887291) (not b!887273) (not bm!39274) (not b!887267) (not d!109873) (not b!887223) (not b!887249) (not b!887265) tp_is_empty!17809 (not d!109895) (not b!887239) (not b!887225) (not b!887246) (not b!887221) (not b!887253) (not b!887283) (not b!887269) (not b!887258) (not b!887305) (not b!887295) (not d!109891) (not b!887229) (not bm!39268) (not b!887280) (not d!109913) (not d!109889) (not b!887251) (not b!887300) (not b!887293) (not b!887227) (not d!109899) (not b!887289) (not d!109881) (not bm!39265) (not b!887306) (not bm!39271) (not d!109915) (not b!887285))
(check-sat)
