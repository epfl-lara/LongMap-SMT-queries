; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87800 () Bool)

(assert start!87800)

(declare-fun b!1014938 () Bool)

(assert (=> b!1014938 true))

(assert (=> b!1014938 true))

(declare-datatypes ((Unit!33200 0))(
  ( (Unit!33201) )
))
(declare-fun e!570951 () Unit!33200)

(declare-fun lt!448865 () Unit!33200)

(assert (=> b!1014938 (= e!570951 lt!448865)))

(declare-datatypes ((List!21450 0))(
  ( (Nil!21447) (Cons!21446 (h!22644 (_ BitVec 64)) (t!30451 List!21450)) )
))
(declare-fun lt!448866 () List!21450)

(declare-datatypes ((B!1450 0))(
  ( (B!1451 (val!11809 Int)) )
))
(declare-fun value!115 () B!1450)

(declare-datatypes ((tuple2!15164 0))(
  ( (tuple2!15165 (_1!7593 (_ BitVec 64)) (_2!7593 B!1450)) )
))
(declare-datatypes ((List!21451 0))(
  ( (Nil!21448) (Cons!21447 (h!22645 tuple2!15164) (t!30452 List!21451)) )
))
(declare-fun l!412 () List!21451)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!42 (List!21451 List!21450 B!1450 tuple2!15164) Unit!33200)

(assert (=> b!1014938 (= lt!448865 (lemmaForallGetValueByKeySameWithASmallerHead!42 (t!30452 l!412) lt!448866 value!115 (h!22645 l!412)))))

(declare-fun lambda!779 () Int)

(declare-fun forall!248 (List!21450 Int) Bool)

(assert (=> b!1014938 (forall!248 lt!448866 lambda!779)))

(declare-fun b!1014939 () Bool)

(declare-fun res!680934 () Bool)

(declare-fun e!570950 () Bool)

(assert (=> b!1014939 (=> (not res!680934) (not e!570950))))

(get-info :version)

(assert (=> b!1014939 (= res!680934 (and (not (= (_2!7593 (h!22645 l!412)) value!115)) ((_ is Cons!21447) l!412)))))

(declare-fun b!1014940 () Bool)

(declare-fun ListPrimitiveSize!119 (List!21451) Int)

(assert (=> b!1014940 (= e!570950 (>= (ListPrimitiveSize!119 (t!30452 l!412)) (ListPrimitiveSize!119 l!412)))))

(declare-fun lt!448864 () Unit!33200)

(assert (=> b!1014940 (= lt!448864 e!570951)))

(declare-fun c!102795 () Bool)

(declare-fun isEmpty!846 (List!21450) Bool)

(assert (=> b!1014940 (= c!102795 (not (isEmpty!846 lt!448866)))))

(declare-fun getKeysOf!56 (List!21451 B!1450) List!21450)

(assert (=> b!1014940 (= lt!448866 (getKeysOf!56 (t!30452 l!412) value!115))))

(declare-fun res!680933 () Bool)

(assert (=> start!87800 (=> (not res!680933) (not e!570950))))

(declare-fun isStrictlySorted!583 (List!21451) Bool)

(assert (=> start!87800 (= res!680933 (isStrictlySorted!583 l!412))))

(assert (=> start!87800 e!570950))

(declare-fun e!570952 () Bool)

(assert (=> start!87800 e!570952))

(declare-fun tp_is_empty!23517 () Bool)

(assert (=> start!87800 tp_is_empty!23517))

(declare-fun b!1014941 () Bool)

(declare-fun tp!70577 () Bool)

(assert (=> b!1014941 (= e!570952 (and tp_is_empty!23517 tp!70577))))

(declare-fun b!1014942 () Bool)

(declare-fun Unit!33202 () Unit!33200)

(assert (=> b!1014942 (= e!570951 Unit!33202)))

(assert (= (and start!87800 res!680933) b!1014939))

(assert (= (and b!1014939 res!680934) b!1014940))

(assert (= (and b!1014940 c!102795) b!1014938))

(assert (= (and b!1014940 (not c!102795)) b!1014942))

(assert (= (and start!87800 ((_ is Cons!21447) l!412)) b!1014941))

(declare-fun m!937259 () Bool)

(assert (=> b!1014938 m!937259))

(declare-fun m!937261 () Bool)

(assert (=> b!1014938 m!937261))

(declare-fun m!937263 () Bool)

(assert (=> b!1014940 m!937263))

(declare-fun m!937265 () Bool)

(assert (=> b!1014940 m!937265))

(declare-fun m!937267 () Bool)

(assert (=> b!1014940 m!937267))

(declare-fun m!937269 () Bool)

(assert (=> b!1014940 m!937269))

(declare-fun m!937271 () Bool)

(assert (=> start!87800 m!937271))

(check-sat (not start!87800) tp_is_empty!23517 (not b!1014940) (not b!1014938) (not b!1014941))
(check-sat)
(get-model)

(declare-fun d!120857 () Bool)

(declare-fun lt!448878 () Int)

(assert (=> d!120857 (>= lt!448878 0)))

(declare-fun e!570964 () Int)

(assert (=> d!120857 (= lt!448878 e!570964)))

(declare-fun c!102801 () Bool)

(assert (=> d!120857 (= c!102801 ((_ is Nil!21448) (t!30452 l!412)))))

(assert (=> d!120857 (= (ListPrimitiveSize!119 (t!30452 l!412)) lt!448878)))

(declare-fun b!1014970 () Bool)

(assert (=> b!1014970 (= e!570964 0)))

(declare-fun b!1014971 () Bool)

(assert (=> b!1014971 (= e!570964 (+ 1 (ListPrimitiveSize!119 (t!30452 (t!30452 l!412)))))))

(assert (= (and d!120857 c!102801) b!1014970))

(assert (= (and d!120857 (not c!102801)) b!1014971))

(declare-fun m!937287 () Bool)

(assert (=> b!1014971 m!937287))

(assert (=> b!1014940 d!120857))

(declare-fun d!120859 () Bool)

(declare-fun lt!448879 () Int)

(assert (=> d!120859 (>= lt!448879 0)))

(declare-fun e!570965 () Int)

(assert (=> d!120859 (= lt!448879 e!570965)))

(declare-fun c!102802 () Bool)

(assert (=> d!120859 (= c!102802 ((_ is Nil!21448) l!412))))

(assert (=> d!120859 (= (ListPrimitiveSize!119 l!412) lt!448879)))

(declare-fun b!1014972 () Bool)

(assert (=> b!1014972 (= e!570965 0)))

(declare-fun b!1014973 () Bool)

(assert (=> b!1014973 (= e!570965 (+ 1 (ListPrimitiveSize!119 (t!30452 l!412))))))

(assert (= (and d!120859 c!102802) b!1014972))

(assert (= (and d!120859 (not c!102802)) b!1014973))

(assert (=> b!1014973 m!937263))

(assert (=> b!1014940 d!120859))

(declare-fun d!120861 () Bool)

(assert (=> d!120861 (= (isEmpty!846 lt!448866) ((_ is Nil!21447) lt!448866))))

(assert (=> b!1014940 d!120861))

(declare-fun bs!29316 () Bool)

(declare-fun b!1015031 () Bool)

(assert (= bs!29316 (and b!1015031 b!1014938)))

(declare-fun lambda!795 () Int)

(declare-fun lt!448915 () tuple2!15164)

(declare-fun lt!448919 () List!21451)

(assert (=> bs!29316 (= (= (Cons!21447 lt!448915 lt!448919) l!412) (= lambda!795 lambda!779))))

(assert (=> b!1015031 true))

(assert (=> b!1015031 true))

(assert (=> b!1015031 true))

(declare-fun bs!29317 () Bool)

(declare-fun b!1015034 () Bool)

(assert (= bs!29317 (and b!1015034 b!1014938)))

(declare-fun lambda!796 () Int)

(declare-fun lt!448916 () List!21451)

(declare-fun lt!448925 () tuple2!15164)

(assert (=> bs!29317 (= (= (Cons!21447 lt!448925 lt!448916) l!412) (= lambda!796 lambda!779))))

(declare-fun bs!29318 () Bool)

(assert (= bs!29318 (and b!1015034 b!1015031)))

(assert (=> bs!29318 (= (= (Cons!21447 lt!448925 lt!448916) (Cons!21447 lt!448915 lt!448919)) (= lambda!796 lambda!795))))

(assert (=> b!1015034 true))

(assert (=> b!1015034 true))

(assert (=> b!1015034 true))

(declare-fun bs!29319 () Bool)

(declare-fun d!120865 () Bool)

(assert (= bs!29319 (and d!120865 b!1014938)))

(declare-fun lambda!797 () Int)

(assert (=> bs!29319 (= (= (t!30452 l!412) l!412) (= lambda!797 lambda!779))))

(declare-fun bs!29320 () Bool)

(assert (= bs!29320 (and d!120865 b!1015031)))

(assert (=> bs!29320 (= (= (t!30452 l!412) (Cons!21447 lt!448915 lt!448919)) (= lambda!797 lambda!795))))

(declare-fun bs!29321 () Bool)

(assert (= bs!29321 (and d!120865 b!1015034)))

(assert (=> bs!29321 (= (= (t!30452 l!412) (Cons!21447 lt!448925 lt!448916)) (= lambda!797 lambda!796))))

(assert (=> d!120865 true))

(assert (=> d!120865 true))

(declare-fun b!1015029 () Bool)

(declare-fun e!570998 () Unit!33200)

(declare-fun Unit!33206 () Unit!33200)

(assert (=> b!1015029 (= e!570998 Unit!33206)))

(declare-fun bm!42891 () Bool)

(declare-fun call!42897 () List!21450)

(assert (=> bm!42891 (= call!42897 (getKeysOf!56 (t!30452 (t!30452 l!412)) value!115))))

(declare-fun b!1015030 () Bool)

(declare-fun lt!448917 () Unit!33200)

(declare-fun e!570999 () Unit!33200)

(assert (=> b!1015030 (= lt!448917 e!570999)))

(declare-fun c!102820 () Bool)

(declare-fun call!42896 () Bool)

(assert (=> b!1015030 (= c!102820 (not call!42896))))

(declare-fun lt!448920 () List!21450)

(assert (=> b!1015030 (= lt!448920 call!42897)))

(declare-fun e!571000 () List!21450)

(assert (=> b!1015030 (= e!571000 call!42897)))

(declare-fun lt!448923 () List!21450)

(declare-fun call!42894 () Unit!33200)

(declare-fun lt!448924 () List!21450)

(declare-fun c!102819 () Bool)

(declare-fun bm!42892 () Bool)

(assert (=> bm!42892 (= call!42894 (lemmaForallGetValueByKeySameWithASmallerHead!42 (ite c!102819 lt!448919 lt!448916) (ite c!102819 lt!448923 lt!448924) value!115 (ite c!102819 lt!448915 lt!448925)))))

(declare-fun b!1015032 () Bool)

(assert (=> b!1015032 (= e!571000 Nil!21447)))

(declare-fun call!42895 () Bool)

(declare-fun bm!42893 () Bool)

(assert (=> bm!42893 (= call!42895 (forall!248 (ite c!102819 lt!448923 lt!448924) (ite c!102819 lambda!795 lambda!796)))))

(declare-fun b!1015033 () Bool)

(declare-fun e!570997 () List!21450)

(assert (=> b!1015033 (= e!570997 e!571000)))

(declare-fun c!102821 () Bool)

(assert (=> b!1015033 (= c!102821 (and ((_ is Cons!21447) (t!30452 l!412)) (not (= (_2!7593 (h!22645 (t!30452 l!412))) value!115))))))

(declare-fun lt!448926 () Unit!33200)

(assert (=> b!1015034 (= e!570999 lt!448926)))

(assert (=> b!1015034 (= lt!448916 (t!30452 (t!30452 l!412)))))

(assert (=> b!1015034 (= lt!448924 call!42897)))

(assert (=> b!1015034 (= lt!448925 (h!22645 (t!30452 l!412)))))

(assert (=> b!1015034 (= lt!448926 call!42894)))

(assert (=> b!1015034 call!42895))

(assert (=> b!1015031 call!42895))

(declare-fun lt!448918 () Unit!33200)

(assert (=> b!1015031 (= lt!448918 call!42894)))

(assert (=> b!1015031 (= lt!448915 (h!22645 (t!30452 l!412)))))

(assert (=> b!1015031 (= lt!448923 call!42897)))

(assert (=> b!1015031 (= lt!448919 (t!30452 (t!30452 l!412)))))

(assert (=> b!1015031 (= e!570998 lt!448918)))

(declare-fun lt!448922 () List!21450)

(assert (=> d!120865 (forall!248 lt!448922 lambda!797)))

(assert (=> d!120865 (= lt!448922 e!570997)))

(assert (=> d!120865 (= c!102819 (and ((_ is Cons!21447) (t!30452 l!412)) (= (_2!7593 (h!22645 (t!30452 l!412))) value!115)))))

(assert (=> d!120865 (isStrictlySorted!583 (t!30452 l!412))))

(assert (=> d!120865 (= (getKeysOf!56 (t!30452 l!412) value!115) lt!448922)))

(declare-fun b!1015035 () Bool)

(declare-fun Unit!33207 () Unit!33200)

(assert (=> b!1015035 (= e!570999 Unit!33207)))

(declare-fun bm!42894 () Bool)

(assert (=> bm!42894 (= call!42896 (isEmpty!846 call!42897))))

(declare-fun b!1015036 () Bool)

(assert (=> b!1015036 (= e!570997 (Cons!21446 (_1!7593 (h!22645 (t!30452 l!412))) call!42897))))

(declare-fun c!102822 () Bool)

(assert (=> b!1015036 (= c!102822 (not call!42896))))

(declare-fun lt!448921 () Unit!33200)

(assert (=> b!1015036 (= lt!448921 e!570998)))

(assert (= (and d!120865 c!102819) b!1015036))

(assert (= (and d!120865 (not c!102819)) b!1015033))

(assert (= (and b!1015036 c!102822) b!1015031))

(assert (= (and b!1015036 (not c!102822)) b!1015029))

(assert (= (and b!1015033 c!102821) b!1015030))

(assert (= (and b!1015033 (not c!102821)) b!1015032))

(assert (= (and b!1015030 c!102820) b!1015034))

(assert (= (and b!1015030 (not c!102820)) b!1015035))

(assert (= (or b!1015031 b!1015034) bm!42892))

(assert (= (or b!1015031 b!1015034) bm!42893))

(assert (= (or b!1015036 b!1015031 b!1015030 b!1015034) bm!42891))

(assert (= (or b!1015036 b!1015030) bm!42894))

(declare-fun m!937309 () Bool)

(assert (=> bm!42894 m!937309))

(declare-fun m!937311 () Bool)

(assert (=> bm!42893 m!937311))

(declare-fun m!937313 () Bool)

(assert (=> d!120865 m!937313))

(declare-fun m!937315 () Bool)

(assert (=> d!120865 m!937315))

(declare-fun m!937317 () Bool)

(assert (=> bm!42892 m!937317))

(declare-fun m!937319 () Bool)

(assert (=> bm!42891 m!937319))

(assert (=> b!1014940 d!120865))

(declare-fun d!120887 () Bool)

(declare-fun res!680966 () Bool)

(declare-fun e!571005 () Bool)

(assert (=> d!120887 (=> res!680966 e!571005)))

(assert (=> d!120887 (= res!680966 (or ((_ is Nil!21448) l!412) ((_ is Nil!21448) (t!30452 l!412))))))

(assert (=> d!120887 (= (isStrictlySorted!583 l!412) e!571005)))

(declare-fun b!1015043 () Bool)

(declare-fun e!571006 () Bool)

(assert (=> b!1015043 (= e!571005 e!571006)))

(declare-fun res!680967 () Bool)

(assert (=> b!1015043 (=> (not res!680967) (not e!571006))))

(assert (=> b!1015043 (= res!680967 (bvslt (_1!7593 (h!22645 l!412)) (_1!7593 (h!22645 (t!30452 l!412)))))))

(declare-fun b!1015044 () Bool)

(assert (=> b!1015044 (= e!571006 (isStrictlySorted!583 (t!30452 l!412)))))

(assert (= (and d!120887 (not res!680966)) b!1015043))

(assert (= (and b!1015043 res!680967) b!1015044))

(assert (=> b!1015044 m!937315))

(assert (=> start!87800 d!120887))

(declare-fun bs!29322 () Bool)

(declare-fun b!1015068 () Bool)

(assert (= bs!29322 (and b!1015068 b!1014938)))

(declare-fun lambda!806 () Int)

(assert (=> bs!29322 (= (= (t!30452 l!412) l!412) (= lambda!806 lambda!779))))

(declare-fun bs!29323 () Bool)

(assert (= bs!29323 (and b!1015068 b!1015031)))

(assert (=> bs!29323 (= (= (t!30452 l!412) (Cons!21447 lt!448915 lt!448919)) (= lambda!806 lambda!795))))

(declare-fun bs!29324 () Bool)

(assert (= bs!29324 (and b!1015068 b!1015034)))

(assert (=> bs!29324 (= (= (t!30452 l!412) (Cons!21447 lt!448925 lt!448916)) (= lambda!806 lambda!796))))

(declare-fun bs!29325 () Bool)

(assert (= bs!29325 (and b!1015068 d!120865)))

(assert (=> bs!29325 (= lambda!806 lambda!797)))

(assert (=> b!1015068 true))

(assert (=> b!1015068 true))

(declare-fun bs!29326 () Bool)

(declare-fun d!120889 () Bool)

(assert (= bs!29326 (and d!120889 b!1015034)))

(declare-fun lambda!811 () Int)

(assert (=> bs!29326 (= (= (Cons!21447 (h!22645 l!412) (t!30452 l!412)) (Cons!21447 lt!448925 lt!448916)) (= lambda!811 lambda!796))))

(declare-fun bs!29327 () Bool)

(assert (= bs!29327 (and d!120889 b!1015068)))

(assert (=> bs!29327 (= (= (Cons!21447 (h!22645 l!412) (t!30452 l!412)) (t!30452 l!412)) (= lambda!811 lambda!806))))

(declare-fun bs!29328 () Bool)

(assert (= bs!29328 (and d!120889 b!1015031)))

(assert (=> bs!29328 (= (= (Cons!21447 (h!22645 l!412) (t!30452 l!412)) (Cons!21447 lt!448915 lt!448919)) (= lambda!811 lambda!795))))

(declare-fun bs!29329 () Bool)

(assert (= bs!29329 (and d!120889 d!120865)))

(assert (=> bs!29329 (= (= (Cons!21447 (h!22645 l!412) (t!30452 l!412)) (t!30452 l!412)) (= lambda!811 lambda!797))))

(declare-fun bs!29330 () Bool)

(assert (= bs!29330 (and d!120889 b!1014938)))

(assert (=> bs!29330 (= (= (Cons!21447 (h!22645 l!412) (t!30452 l!412)) l!412) (= lambda!811 lambda!779))))

(assert (=> d!120889 true))

(assert (=> d!120889 true))

(assert (=> d!120889 true))

(assert (=> d!120889 (forall!248 lt!448866 lambda!811)))

(declare-fun lt!448953 () Unit!33200)

(declare-fun choose!1636 (List!21451 List!21450 B!1450 tuple2!15164) Unit!33200)

(assert (=> d!120889 (= lt!448953 (choose!1636 (t!30452 l!412) lt!448866 value!115 (h!22645 l!412)))))

(declare-fun e!571017 () Bool)

(assert (=> d!120889 e!571017))

(declare-fun res!680974 () Bool)

(assert (=> d!120889 (=> (not res!680974) (not e!571017))))

(assert (=> d!120889 (= res!680974 (isStrictlySorted!583 (t!30452 l!412)))))

(assert (=> d!120889 (= (lemmaForallGetValueByKeySameWithASmallerHead!42 (t!30452 l!412) lt!448866 value!115 (h!22645 l!412)) lt!448953)))

(declare-fun b!1015067 () Bool)

(declare-fun res!680975 () Bool)

(assert (=> b!1015067 (=> (not res!680975) (not e!571017))))

(declare-fun isEmpty!849 (List!21451) Bool)

(assert (=> b!1015067 (= res!680975 (not (isEmpty!849 (t!30452 l!412))))))

(declare-fun res!680976 () Bool)

(assert (=> b!1015068 (=> (not res!680976) (not e!571017))))

(assert (=> b!1015068 (= res!680976 (forall!248 lt!448866 lambda!806))))

(declare-fun b!1015069 () Bool)

(declare-fun head!945 (List!21451) tuple2!15164)

(assert (=> b!1015069 (= e!571017 (bvslt (_1!7593 (h!22645 l!412)) (_1!7593 (head!945 (t!30452 l!412)))))))

(assert (= (and d!120889 res!680974) b!1015067))

(assert (= (and b!1015067 res!680975) b!1015068))

(assert (= (and b!1015068 res!680976) b!1015069))

(declare-fun m!937321 () Bool)

(assert (=> d!120889 m!937321))

(declare-fun m!937323 () Bool)

(assert (=> d!120889 m!937323))

(assert (=> d!120889 m!937315))

(declare-fun m!937325 () Bool)

(assert (=> b!1015067 m!937325))

(declare-fun m!937327 () Bool)

(assert (=> b!1015068 m!937327))

(declare-fun m!937329 () Bool)

(assert (=> b!1015069 m!937329))

(assert (=> b!1014938 d!120889))

(declare-fun d!120891 () Bool)

(declare-fun res!680981 () Bool)

(declare-fun e!571034 () Bool)

(assert (=> d!120891 (=> res!680981 e!571034)))

(assert (=> d!120891 (= res!680981 ((_ is Nil!21447) lt!448866))))

(assert (=> d!120891 (= (forall!248 lt!448866 lambda!779) e!571034)))

(declare-fun b!1015098 () Bool)

(declare-fun e!571035 () Bool)

(assert (=> b!1015098 (= e!571034 e!571035)))

(declare-fun res!680982 () Bool)

(assert (=> b!1015098 (=> (not res!680982) (not e!571035))))

(declare-fun dynLambda!1895 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015098 (= res!680982 (dynLambda!1895 lambda!779 (h!22644 lt!448866)))))

(declare-fun b!1015099 () Bool)

(assert (=> b!1015099 (= e!571035 (forall!248 (t!30451 lt!448866) lambda!779))))

(assert (= (and d!120891 (not res!680981)) b!1015098))

(assert (= (and b!1015098 res!680982) b!1015099))

(declare-fun b_lambda!15381 () Bool)

(assert (=> (not b_lambda!15381) (not b!1015098)))

(declare-fun m!937331 () Bool)

(assert (=> b!1015098 m!937331))

(declare-fun m!937333 () Bool)

(assert (=> b!1015099 m!937333))

(assert (=> b!1014938 d!120891))

(declare-fun b!1015108 () Bool)

(declare-fun e!571040 () Bool)

(declare-fun tp!70585 () Bool)

(assert (=> b!1015108 (= e!571040 (and tp_is_empty!23517 tp!70585))))

(assert (=> b!1014941 (= tp!70577 e!571040)))

(assert (= (and b!1014941 ((_ is Cons!21447) (t!30452 l!412))) b!1015108))

(declare-fun b_lambda!15383 () Bool)

(assert (= b_lambda!15381 (or b!1014938 b_lambda!15383)))

(declare-fun bs!29343 () Bool)

(declare-fun d!120893 () Bool)

(assert (= bs!29343 (and d!120893 b!1014938)))

(declare-datatypes ((Option!580 0))(
  ( (Some!579 (v!14430 B!1450)) (None!578) )
))
(declare-fun getValueByKey!529 (List!21451 (_ BitVec 64)) Option!580)

(assert (=> bs!29343 (= (dynLambda!1895 lambda!779 (h!22644 lt!448866)) (= (getValueByKey!529 l!412 (h!22644 lt!448866)) (Some!579 value!115)))))

(declare-fun m!937345 () Bool)

(assert (=> bs!29343 m!937345))

(assert (=> b!1015098 d!120893))

(check-sat (not bs!29343) (not b!1015044) (not bm!42893) (not d!120889) (not b!1015069) (not b!1015108) (not bm!42891) (not b!1015067) (not b_lambda!15383) tp_is_empty!23517 (not bm!42892) (not b!1014973) (not bm!42894) (not b!1014971) (not b!1015068) (not b!1015099) (not d!120865))
(check-sat)
