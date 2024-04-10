; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106506 () Bool)

(assert start!106506)

(declare-fun b!1265978 () Bool)

(declare-fun res!842918 () Bool)

(declare-fun e!721007 () Bool)

(assert (=> b!1265978 (=> (not res!842918) (not e!721007))))

(declare-datatypes ((B!1996 0))(
  ( (B!1997 (val!16333 Int)) )
))
(declare-datatypes ((tuple2!21184 0))(
  ( (tuple2!21185 (_1!10603 (_ BitVec 64)) (_2!10603 B!1996)) )
))
(declare-datatypes ((List!28325 0))(
  ( (Nil!28322) (Cons!28321 (h!29530 tuple2!21184) (t!41846 List!28325)) )
))
(declare-fun l!706 () List!28325)

(declare-fun isStrictlySorted!800 (List!28325) Bool)

(assert (=> b!1265978 (= res!842918 (isStrictlySorted!800 (t!41846 l!706)))))

(declare-fun b!1265979 () Bool)

(declare-fun res!842916 () Bool)

(assert (=> b!1265979 (=> (not res!842916) (not e!721007))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!659 (List!28325 (_ BitVec 64)) Bool)

(assert (=> b!1265979 (= res!842916 (not (containsKey!659 (t!41846 l!706) key1!31)))))

(declare-fun v1!26 () B!1996)

(declare-fun b!1265980 () Bool)

(declare-fun removeStrictlySorted!156 (List!28325 (_ BitVec 64)) List!28325)

(declare-fun insertStrictlySorted!466 (List!28325 (_ BitVec 64) B!1996) List!28325)

(assert (=> b!1265980 (= e!721007 (not (= (removeStrictlySorted!156 (insertStrictlySorted!466 l!706 key1!31 v1!26) key1!31) l!706)))))

(assert (=> b!1265980 (= (removeStrictlySorted!156 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26) key1!31) (t!41846 l!706))))

(declare-datatypes ((Unit!42185 0))(
  ( (Unit!42186) )
))
(declare-fun lt!574077 () Unit!42185)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!11 (List!28325 (_ BitVec 64) B!1996) Unit!42185)

(assert (=> b!1265980 (= lt!574077 (lemmaInsertStrictlySortedThenRemoveIsSame!11 (t!41846 l!706) key1!31 v1!26))))

(declare-fun res!842917 () Bool)

(assert (=> start!106506 (=> (not res!842917) (not e!721007))))

(assert (=> start!106506 (= res!842917 (isStrictlySorted!800 l!706))))

(assert (=> start!106506 e!721007))

(declare-fun e!721006 () Bool)

(assert (=> start!106506 e!721006))

(assert (=> start!106506 true))

(declare-fun tp_is_empty!32529 () Bool)

(assert (=> start!106506 tp_is_empty!32529))

(declare-fun b!1265981 () Bool)

(declare-fun res!842920 () Bool)

(assert (=> b!1265981 (=> (not res!842920) (not e!721007))))

(assert (=> b!1265981 (= res!842920 (not (containsKey!659 l!706 key1!31)))))

(declare-fun b!1265982 () Bool)

(declare-fun tp!96413 () Bool)

(assert (=> b!1265982 (= e!721006 (and tp_is_empty!32529 tp!96413))))

(declare-fun b!1265983 () Bool)

(declare-fun res!842919 () Bool)

(assert (=> b!1265983 (=> (not res!842919) (not e!721007))))

(get-info :version)

(assert (=> b!1265983 (= res!842919 ((_ is Cons!28321) l!706))))

(assert (= (and start!106506 res!842917) b!1265981))

(assert (= (and b!1265981 res!842920) b!1265983))

(assert (= (and b!1265983 res!842919) b!1265978))

(assert (= (and b!1265978 res!842918) b!1265979))

(assert (= (and b!1265979 res!842916) b!1265980))

(assert (= (and start!106506 ((_ is Cons!28321) l!706)) b!1265982))

(declare-fun m!1165821 () Bool)

(assert (=> b!1265978 m!1165821))

(declare-fun m!1165823 () Bool)

(assert (=> b!1265979 m!1165823))

(declare-fun m!1165825 () Bool)

(assert (=> start!106506 m!1165825))

(declare-fun m!1165827 () Bool)

(assert (=> b!1265980 m!1165827))

(declare-fun m!1165829 () Bool)

(assert (=> b!1265980 m!1165829))

(assert (=> b!1265980 m!1165827))

(declare-fun m!1165831 () Bool)

(assert (=> b!1265980 m!1165831))

(declare-fun m!1165833 () Bool)

(assert (=> b!1265980 m!1165833))

(assert (=> b!1265980 m!1165833))

(declare-fun m!1165835 () Bool)

(assert (=> b!1265980 m!1165835))

(declare-fun m!1165837 () Bool)

(assert (=> b!1265981 m!1165837))

(check-sat (not b!1265980) (not b!1265979) tp_is_empty!32529 (not b!1265982) (not b!1265981) (not start!106506) (not b!1265978))
(check-sat)
(get-model)

(declare-fun b!1266040 () Bool)

(declare-fun e!721045 () List!28325)

(assert (=> b!1266040 (= e!721045 Nil!28322)))

(declare-fun e!721044 () List!28325)

(declare-fun b!1266041 () Bool)

(assert (=> b!1266041 (= e!721044 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)))))

(declare-fun b!1266042 () Bool)

(declare-fun e!721046 () Bool)

(declare-fun lt!574085 () List!28325)

(assert (=> b!1266042 (= e!721046 (not (containsKey!659 lt!574085 key1!31)))))

(declare-fun b!1266043 () Bool)

(declare-fun $colon$colon!642 (List!28325 tuple2!21184) List!28325)

(assert (=> b!1266043 (= e!721045 ($colon$colon!642 (removeStrictlySorted!156 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)) key1!31) (h!29530 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))))))

(declare-fun b!1266044 () Bool)

(assert (=> b!1266044 (= e!721044 e!721045)))

(declare-fun c!123349 () Bool)

(assert (=> b!1266044 (= c!123349 (and ((_ is Cons!28321) (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)) (not (= (_1!10603 (h!29530 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))) key1!31))))))

(declare-fun d!139033 () Bool)

(assert (=> d!139033 e!721046))

(declare-fun res!842958 () Bool)

(assert (=> d!139033 (=> (not res!842958) (not e!721046))))

(assert (=> d!139033 (= res!842958 (isStrictlySorted!800 lt!574085))))

(assert (=> d!139033 (= lt!574085 e!721044)))

(declare-fun c!123350 () Bool)

(assert (=> d!139033 (= c!123350 (and ((_ is Cons!28321) (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)) (= (_1!10603 (h!29530 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!139033 (isStrictlySorted!800 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))))

(assert (=> d!139033 (= (removeStrictlySorted!156 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26) key1!31) lt!574085)))

(assert (= (and d!139033 c!123350) b!1266041))

(assert (= (and d!139033 (not c!123350)) b!1266044))

(assert (= (and b!1266044 c!123349) b!1266043))

(assert (= (and b!1266044 (not c!123349)) b!1266040))

(assert (= (and d!139033 res!842958) b!1266042))

(declare-fun m!1165861 () Bool)

(assert (=> b!1266042 m!1165861))

(declare-fun m!1165863 () Bool)

(assert (=> b!1266043 m!1165863))

(assert (=> b!1266043 m!1165863))

(declare-fun m!1165865 () Bool)

(assert (=> b!1266043 m!1165865))

(declare-fun m!1165867 () Bool)

(assert (=> d!139033 m!1165867))

(assert (=> d!139033 m!1165827))

(declare-fun m!1165869 () Bool)

(assert (=> d!139033 m!1165869))

(assert (=> b!1265980 d!139033))

(declare-fun b!1266154 () Bool)

(declare-fun e!721110 () List!28325)

(declare-fun c!123393 () Bool)

(declare-fun c!123395 () Bool)

(assert (=> b!1266154 (= e!721110 (ite c!123395 (t!41846 l!706) (ite c!123393 (Cons!28321 (h!29530 l!706) (t!41846 l!706)) Nil!28322)))))

(declare-fun b!1266155 () Bool)

(declare-fun e!721106 () List!28325)

(declare-fun call!62449 () List!28325)

(assert (=> b!1266155 (= e!721106 call!62449)))

(declare-fun b!1266156 () Bool)

(declare-fun e!721108 () List!28325)

(declare-fun call!62448 () List!28325)

(assert (=> b!1266156 (= e!721108 call!62448)))

(declare-fun b!1266157 () Bool)

(declare-fun e!721107 () List!28325)

(assert (=> b!1266157 (= e!721107 e!721108)))

(assert (=> b!1266157 (= c!123395 (and ((_ is Cons!28321) l!706) (= (_1!10603 (h!29530 l!706)) key1!31)))))

(declare-fun b!1266158 () Bool)

(assert (=> b!1266158 (= c!123393 (and ((_ is Cons!28321) l!706) (bvsgt (_1!10603 (h!29530 l!706)) key1!31)))))

(assert (=> b!1266158 (= e!721108 e!721106)))

(declare-fun bm!62444 () Bool)

(declare-fun call!62447 () List!28325)

(assert (=> bm!62444 (= call!62448 call!62447)))

(declare-fun d!139043 () Bool)

(declare-fun e!721109 () Bool)

(assert (=> d!139043 e!721109))

(declare-fun res!842985 () Bool)

(assert (=> d!139043 (=> (not res!842985) (not e!721109))))

(declare-fun lt!574102 () List!28325)

(assert (=> d!139043 (= res!842985 (isStrictlySorted!800 lt!574102))))

(assert (=> d!139043 (= lt!574102 e!721107)))

(declare-fun c!123396 () Bool)

(assert (=> d!139043 (= c!123396 (and ((_ is Cons!28321) l!706) (bvslt (_1!10603 (h!29530 l!706)) key1!31)))))

(assert (=> d!139043 (isStrictlySorted!800 l!706)))

(assert (=> d!139043 (= (insertStrictlySorted!466 l!706 key1!31 v1!26) lt!574102)))

(declare-fun b!1266159 () Bool)

(assert (=> b!1266159 (= e!721110 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))))

(declare-fun b!1266160 () Bool)

(assert (=> b!1266160 (= e!721107 call!62447)))

(declare-fun bm!62445 () Bool)

(assert (=> bm!62445 (= call!62447 ($colon$colon!642 e!721110 (ite c!123396 (h!29530 l!706) (tuple2!21185 key1!31 v1!26))))))

(declare-fun c!123394 () Bool)

(assert (=> bm!62445 (= c!123394 c!123396)))

(declare-fun b!1266161 () Bool)

(declare-fun res!842984 () Bool)

(assert (=> b!1266161 (=> (not res!842984) (not e!721109))))

(assert (=> b!1266161 (= res!842984 (containsKey!659 lt!574102 key1!31))))

(declare-fun b!1266162 () Bool)

(declare-fun contains!7641 (List!28325 tuple2!21184) Bool)

(assert (=> b!1266162 (= e!721109 (contains!7641 lt!574102 (tuple2!21185 key1!31 v1!26)))))

(declare-fun b!1266163 () Bool)

(assert (=> b!1266163 (= e!721106 call!62449)))

(declare-fun bm!62446 () Bool)

(assert (=> bm!62446 (= call!62449 call!62448)))

(assert (= (and d!139043 c!123396) b!1266160))

(assert (= (and d!139043 (not c!123396)) b!1266157))

(assert (= (and b!1266157 c!123395) b!1266156))

(assert (= (and b!1266157 (not c!123395)) b!1266158))

(assert (= (and b!1266158 c!123393) b!1266163))

(assert (= (and b!1266158 (not c!123393)) b!1266155))

(assert (= (or b!1266163 b!1266155) bm!62446))

(assert (= (or b!1266156 bm!62446) bm!62444))

(assert (= (or b!1266160 bm!62444) bm!62445))

(assert (= (and bm!62445 c!123394) b!1266159))

(assert (= (and bm!62445 (not c!123394)) b!1266154))

(assert (= (and d!139043 res!842985) b!1266161))

(assert (= (and b!1266161 res!842984) b!1266162))

(declare-fun m!1165921 () Bool)

(assert (=> bm!62445 m!1165921))

(assert (=> b!1266159 m!1165827))

(declare-fun m!1165923 () Bool)

(assert (=> b!1266161 m!1165923))

(declare-fun m!1165925 () Bool)

(assert (=> d!139043 m!1165925))

(assert (=> d!139043 m!1165825))

(declare-fun m!1165927 () Bool)

(assert (=> b!1266162 m!1165927))

(assert (=> b!1265980 d!139043))

(declare-fun b!1266169 () Bool)

(declare-fun e!721115 () List!28325)

(assert (=> b!1266169 (= e!721115 Nil!28322)))

(declare-fun b!1266170 () Bool)

(declare-fun e!721114 () List!28325)

(assert (=> b!1266170 (= e!721114 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)))))

(declare-fun b!1266171 () Bool)

(declare-fun e!721116 () Bool)

(declare-fun lt!574103 () List!28325)

(assert (=> b!1266171 (= e!721116 (not (containsKey!659 lt!574103 key1!31)))))

(declare-fun b!1266172 () Bool)

(assert (=> b!1266172 (= e!721115 ($colon$colon!642 (removeStrictlySorted!156 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)) key1!31) (h!29530 (insertStrictlySorted!466 l!706 key1!31 v1!26))))))

(declare-fun b!1266173 () Bool)

(assert (=> b!1266173 (= e!721114 e!721115)))

(declare-fun c!123397 () Bool)

(assert (=> b!1266173 (= c!123397 (and ((_ is Cons!28321) (insertStrictlySorted!466 l!706 key1!31 v1!26)) (not (= (_1!10603 (h!29530 (insertStrictlySorted!466 l!706 key1!31 v1!26))) key1!31))))))

(declare-fun d!139059 () Bool)

(assert (=> d!139059 e!721116))

(declare-fun res!842986 () Bool)

(assert (=> d!139059 (=> (not res!842986) (not e!721116))))

(assert (=> d!139059 (= res!842986 (isStrictlySorted!800 lt!574103))))

(assert (=> d!139059 (= lt!574103 e!721114)))

(declare-fun c!123398 () Bool)

(assert (=> d!139059 (= c!123398 (and ((_ is Cons!28321) (insertStrictlySorted!466 l!706 key1!31 v1!26)) (= (_1!10603 (h!29530 (insertStrictlySorted!466 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!139059 (isStrictlySorted!800 (insertStrictlySorted!466 l!706 key1!31 v1!26))))

(assert (=> d!139059 (= (removeStrictlySorted!156 (insertStrictlySorted!466 l!706 key1!31 v1!26) key1!31) lt!574103)))

(assert (= (and d!139059 c!123398) b!1266170))

(assert (= (and d!139059 (not c!123398)) b!1266173))

(assert (= (and b!1266173 c!123397) b!1266172))

(assert (= (and b!1266173 (not c!123397)) b!1266169))

(assert (= (and d!139059 res!842986) b!1266171))

(declare-fun m!1165929 () Bool)

(assert (=> b!1266171 m!1165929))

(declare-fun m!1165931 () Bool)

(assert (=> b!1266172 m!1165931))

(assert (=> b!1266172 m!1165931))

(declare-fun m!1165933 () Bool)

(assert (=> b!1266172 m!1165933))

(declare-fun m!1165935 () Bool)

(assert (=> d!139059 m!1165935))

(assert (=> d!139059 m!1165833))

(declare-fun m!1165937 () Bool)

(assert (=> d!139059 m!1165937))

(assert (=> b!1265980 d!139059))

(declare-fun d!139061 () Bool)

(assert (=> d!139061 (= (removeStrictlySorted!156 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26) key1!31) (t!41846 l!706))))

(declare-fun lt!574108 () Unit!42185)

(declare-fun choose!1887 (List!28325 (_ BitVec 64) B!1996) Unit!42185)

(assert (=> d!139061 (= lt!574108 (choose!1887 (t!41846 l!706) key1!31 v1!26))))

(assert (=> d!139061 (isStrictlySorted!800 (t!41846 l!706))))

(assert (=> d!139061 (= (lemmaInsertStrictlySortedThenRemoveIsSame!11 (t!41846 l!706) key1!31 v1!26) lt!574108)))

(declare-fun bs!35835 () Bool)

(assert (= bs!35835 d!139061))

(assert (=> bs!35835 m!1165827))

(assert (=> bs!35835 m!1165827))

(assert (=> bs!35835 m!1165831))

(declare-fun m!1165957 () Bool)

(assert (=> bs!35835 m!1165957))

(assert (=> bs!35835 m!1165821))

(assert (=> b!1265980 d!139061))

(declare-fun b!1266189 () Bool)

(declare-fun c!123407 () Bool)

(declare-fun e!721129 () List!28325)

(declare-fun c!123405 () Bool)

(assert (=> b!1266189 (= e!721129 (ite c!123407 (t!41846 (t!41846 l!706)) (ite c!123405 (Cons!28321 (h!29530 (t!41846 l!706)) (t!41846 (t!41846 l!706))) Nil!28322)))))

(declare-fun b!1266190 () Bool)

(declare-fun e!721125 () List!28325)

(declare-fun call!62455 () List!28325)

(assert (=> b!1266190 (= e!721125 call!62455)))

(declare-fun b!1266191 () Bool)

(declare-fun e!721127 () List!28325)

(declare-fun call!62454 () List!28325)

(assert (=> b!1266191 (= e!721127 call!62454)))

(declare-fun b!1266192 () Bool)

(declare-fun e!721126 () List!28325)

(assert (=> b!1266192 (= e!721126 e!721127)))

(assert (=> b!1266192 (= c!123407 (and ((_ is Cons!28321) (t!41846 l!706)) (= (_1!10603 (h!29530 (t!41846 l!706))) key1!31)))))

(declare-fun b!1266193 () Bool)

(assert (=> b!1266193 (= c!123405 (and ((_ is Cons!28321) (t!41846 l!706)) (bvsgt (_1!10603 (h!29530 (t!41846 l!706))) key1!31)))))

(assert (=> b!1266193 (= e!721127 e!721125)))

(declare-fun bm!62450 () Bool)

(declare-fun call!62453 () List!28325)

(assert (=> bm!62450 (= call!62454 call!62453)))

(declare-fun d!139067 () Bool)

(declare-fun e!721128 () Bool)

(assert (=> d!139067 e!721128))

(declare-fun res!842991 () Bool)

(assert (=> d!139067 (=> (not res!842991) (not e!721128))))

(declare-fun lt!574109 () List!28325)

(assert (=> d!139067 (= res!842991 (isStrictlySorted!800 lt!574109))))

(assert (=> d!139067 (= lt!574109 e!721126)))

(declare-fun c!123408 () Bool)

(assert (=> d!139067 (= c!123408 (and ((_ is Cons!28321) (t!41846 l!706)) (bvslt (_1!10603 (h!29530 (t!41846 l!706))) key1!31)))))

(assert (=> d!139067 (isStrictlySorted!800 (t!41846 l!706))))

(assert (=> d!139067 (= (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26) lt!574109)))

(declare-fun b!1266194 () Bool)

(assert (=> b!1266194 (= e!721129 (insertStrictlySorted!466 (t!41846 (t!41846 l!706)) key1!31 v1!26))))

(declare-fun b!1266195 () Bool)

(assert (=> b!1266195 (= e!721126 call!62453)))

(declare-fun bm!62451 () Bool)

(assert (=> bm!62451 (= call!62453 ($colon$colon!642 e!721129 (ite c!123408 (h!29530 (t!41846 l!706)) (tuple2!21185 key1!31 v1!26))))))

(declare-fun c!123406 () Bool)

(assert (=> bm!62451 (= c!123406 c!123408)))

(declare-fun b!1266196 () Bool)

(declare-fun res!842990 () Bool)

(assert (=> b!1266196 (=> (not res!842990) (not e!721128))))

(assert (=> b!1266196 (= res!842990 (containsKey!659 lt!574109 key1!31))))

(declare-fun b!1266197 () Bool)

(assert (=> b!1266197 (= e!721128 (contains!7641 lt!574109 (tuple2!21185 key1!31 v1!26)))))

(declare-fun b!1266198 () Bool)

(assert (=> b!1266198 (= e!721125 call!62455)))

(declare-fun bm!62452 () Bool)

(assert (=> bm!62452 (= call!62455 call!62454)))

(assert (= (and d!139067 c!123408) b!1266195))

(assert (= (and d!139067 (not c!123408)) b!1266192))

(assert (= (and b!1266192 c!123407) b!1266191))

(assert (= (and b!1266192 (not c!123407)) b!1266193))

(assert (= (and b!1266193 c!123405) b!1266198))

(assert (= (and b!1266193 (not c!123405)) b!1266190))

(assert (= (or b!1266198 b!1266190) bm!62452))

(assert (= (or b!1266191 bm!62452) bm!62450))

(assert (= (or b!1266195 bm!62450) bm!62451))

(assert (= (and bm!62451 c!123406) b!1266194))

(assert (= (and bm!62451 (not c!123406)) b!1266189))

(assert (= (and d!139067 res!842991) b!1266196))

(assert (= (and b!1266196 res!842990) b!1266197))

(declare-fun m!1165959 () Bool)

(assert (=> bm!62451 m!1165959))

(declare-fun m!1165961 () Bool)

(assert (=> b!1266194 m!1165961))

(declare-fun m!1165963 () Bool)

(assert (=> b!1266196 m!1165963))

(declare-fun m!1165965 () Bool)

(assert (=> d!139067 m!1165965))

(assert (=> d!139067 m!1165821))

(declare-fun m!1165967 () Bool)

(assert (=> b!1266197 m!1165967))

(assert (=> b!1265980 d!139067))

(declare-fun d!139069 () Bool)

(declare-fun res!842998 () Bool)

(declare-fun e!721139 () Bool)

(assert (=> d!139069 (=> res!842998 e!721139)))

(assert (=> d!139069 (= res!842998 (and ((_ is Cons!28321) l!706) (= (_1!10603 (h!29530 l!706)) key1!31)))))

(assert (=> d!139069 (= (containsKey!659 l!706 key1!31) e!721139)))

(declare-fun b!1266213 () Bool)

(declare-fun e!721140 () Bool)

(assert (=> b!1266213 (= e!721139 e!721140)))

(declare-fun res!842999 () Bool)

(assert (=> b!1266213 (=> (not res!842999) (not e!721140))))

(assert (=> b!1266213 (= res!842999 (and (or (not ((_ is Cons!28321) l!706)) (bvsle (_1!10603 (h!29530 l!706)) key1!31)) ((_ is Cons!28321) l!706) (bvslt (_1!10603 (h!29530 l!706)) key1!31)))))

(declare-fun b!1266214 () Bool)

(assert (=> b!1266214 (= e!721140 (containsKey!659 (t!41846 l!706) key1!31))))

(assert (= (and d!139069 (not res!842998)) b!1266213))

(assert (= (and b!1266213 res!842999) b!1266214))

(assert (=> b!1266214 m!1165823))

(assert (=> b!1265981 d!139069))

(declare-fun d!139075 () Bool)

(declare-fun res!843008 () Bool)

(declare-fun e!721149 () Bool)

(assert (=> d!139075 (=> res!843008 e!721149)))

(assert (=> d!139075 (= res!843008 (or ((_ is Nil!28322) (t!41846 l!706)) ((_ is Nil!28322) (t!41846 (t!41846 l!706)))))))

(assert (=> d!139075 (= (isStrictlySorted!800 (t!41846 l!706)) e!721149)))

(declare-fun b!1266223 () Bool)

(declare-fun e!721150 () Bool)

(assert (=> b!1266223 (= e!721149 e!721150)))

(declare-fun res!843009 () Bool)

(assert (=> b!1266223 (=> (not res!843009) (not e!721150))))

(assert (=> b!1266223 (= res!843009 (bvslt (_1!10603 (h!29530 (t!41846 l!706))) (_1!10603 (h!29530 (t!41846 (t!41846 l!706))))))))

(declare-fun b!1266224 () Bool)

(assert (=> b!1266224 (= e!721150 (isStrictlySorted!800 (t!41846 (t!41846 l!706))))))

(assert (= (and d!139075 (not res!843008)) b!1266223))

(assert (= (and b!1266223 res!843009) b!1266224))

(declare-fun m!1165981 () Bool)

(assert (=> b!1266224 m!1165981))

(assert (=> b!1265978 d!139075))

(declare-fun d!139077 () Bool)

(declare-fun res!843011 () Bool)

(declare-fun e!721151 () Bool)

(assert (=> d!139077 (=> res!843011 e!721151)))

(assert (=> d!139077 (= res!843011 (or ((_ is Nil!28322) l!706) ((_ is Nil!28322) (t!41846 l!706))))))

(assert (=> d!139077 (= (isStrictlySorted!800 l!706) e!721151)))

(declare-fun b!1266226 () Bool)

(declare-fun e!721154 () Bool)

(assert (=> b!1266226 (= e!721151 e!721154)))

(declare-fun res!843013 () Bool)

(assert (=> b!1266226 (=> (not res!843013) (not e!721154))))

(assert (=> b!1266226 (= res!843013 (bvslt (_1!10603 (h!29530 l!706)) (_1!10603 (h!29530 (t!41846 l!706)))))))

(declare-fun b!1266228 () Bool)

(assert (=> b!1266228 (= e!721154 (isStrictlySorted!800 (t!41846 l!706)))))

(assert (= (and d!139077 (not res!843011)) b!1266226))

(assert (= (and b!1266226 res!843013) b!1266228))

(assert (=> b!1266228 m!1165821))

(assert (=> start!106506 d!139077))

(declare-fun d!139079 () Bool)

(declare-fun res!843014 () Bool)

(declare-fun e!721155 () Bool)

(assert (=> d!139079 (=> res!843014 e!721155)))

(assert (=> d!139079 (= res!843014 (and ((_ is Cons!28321) (t!41846 l!706)) (= (_1!10603 (h!29530 (t!41846 l!706))) key1!31)))))

(assert (=> d!139079 (= (containsKey!659 (t!41846 l!706) key1!31) e!721155)))

(declare-fun b!1266229 () Bool)

(declare-fun e!721156 () Bool)

(assert (=> b!1266229 (= e!721155 e!721156)))

(declare-fun res!843015 () Bool)

(assert (=> b!1266229 (=> (not res!843015) (not e!721156))))

(assert (=> b!1266229 (= res!843015 (and (or (not ((_ is Cons!28321) (t!41846 l!706))) (bvsle (_1!10603 (h!29530 (t!41846 l!706))) key1!31)) ((_ is Cons!28321) (t!41846 l!706)) (bvslt (_1!10603 (h!29530 (t!41846 l!706))) key1!31)))))

(declare-fun b!1266230 () Bool)

(assert (=> b!1266230 (= e!721156 (containsKey!659 (t!41846 (t!41846 l!706)) key1!31))))

(assert (= (and d!139079 (not res!843014)) b!1266229))

(assert (= (and b!1266229 res!843015) b!1266230))

(declare-fun m!1165984 () Bool)

(assert (=> b!1266230 m!1165984))

(assert (=> b!1265979 d!139079))

(declare-fun b!1266243 () Bool)

(declare-fun e!721165 () Bool)

(declare-fun tp!96424 () Bool)

(assert (=> b!1266243 (= e!721165 (and tp_is_empty!32529 tp!96424))))

(assert (=> b!1265982 (= tp!96413 e!721165)))

(assert (= (and b!1265982 ((_ is Cons!28321) (t!41846 l!706))) b!1266243))

(check-sat (not b!1266224) (not b!1266172) (not bm!62451) (not d!139067) (not b!1266194) (not b!1266228) (not b!1266230) (not b!1266197) (not b!1266196) (not b!1266162) (not b!1266171) (not d!139033) (not b!1266043) (not d!139043) (not b!1266161) (not d!139059) (not d!139061) (not b!1266243) tp_is_empty!32529 (not bm!62445) (not b!1266042) (not b!1266159) (not b!1266214))
(check-sat)
(get-model)

(assert (=> d!139061 d!139033))

(assert (=> d!139061 d!139067))

(declare-fun d!139089 () Bool)

(assert (=> d!139089 (= (removeStrictlySorted!156 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26) key1!31) (t!41846 l!706))))

(assert (=> d!139089 true))

(declare-fun _$4!63 () Unit!42185)

(assert (=> d!139089 (= (choose!1887 (t!41846 l!706) key1!31 v1!26) _$4!63)))

(declare-fun bs!35837 () Bool)

(assert (= bs!35837 d!139089))

(assert (=> bs!35837 m!1165827))

(assert (=> bs!35837 m!1165827))

(assert (=> bs!35837 m!1165831))

(assert (=> d!139061 d!139089))

(assert (=> d!139061 d!139075))

(declare-fun d!139095 () Bool)

(declare-fun res!843026 () Bool)

(declare-fun e!721173 () Bool)

(assert (=> d!139095 (=> res!843026 e!721173)))

(assert (=> d!139095 (= res!843026 (and ((_ is Cons!28321) lt!574085) (= (_1!10603 (h!29530 lt!574085)) key1!31)))))

(assert (=> d!139095 (= (containsKey!659 lt!574085 key1!31) e!721173)))

(declare-fun b!1266251 () Bool)

(declare-fun e!721174 () Bool)

(assert (=> b!1266251 (= e!721173 e!721174)))

(declare-fun res!843027 () Bool)

(assert (=> b!1266251 (=> (not res!843027) (not e!721174))))

(assert (=> b!1266251 (= res!843027 (and (or (not ((_ is Cons!28321) lt!574085)) (bvsle (_1!10603 (h!29530 lt!574085)) key1!31)) ((_ is Cons!28321) lt!574085) (bvslt (_1!10603 (h!29530 lt!574085)) key1!31)))))

(declare-fun b!1266252 () Bool)

(assert (=> b!1266252 (= e!721174 (containsKey!659 (t!41846 lt!574085) key1!31))))

(assert (= (and d!139095 (not res!843026)) b!1266251))

(assert (= (and b!1266251 res!843027) b!1266252))

(declare-fun m!1165995 () Bool)

(assert (=> b!1266252 m!1165995))

(assert (=> b!1266042 d!139095))

(declare-fun d!139099 () Bool)

(assert (=> d!139099 (= ($colon$colon!642 (removeStrictlySorted!156 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)) key1!31) (h!29530 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))) (Cons!28321 (h!29530 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)) (removeStrictlySorted!156 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)) key1!31)))))

(assert (=> b!1266043 d!139099))

(declare-fun b!1266255 () Bool)

(declare-fun e!721178 () List!28325)

(assert (=> b!1266255 (= e!721178 Nil!28322)))

(declare-fun b!1266256 () Bool)

(declare-fun e!721177 () List!28325)

(assert (=> b!1266256 (= e!721177 (t!41846 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))))))

(declare-fun b!1266257 () Bool)

(declare-fun e!721179 () Bool)

(declare-fun lt!574114 () List!28325)

(assert (=> b!1266257 (= e!721179 (not (containsKey!659 lt!574114 key1!31)))))

(declare-fun b!1266258 () Bool)

(assert (=> b!1266258 (= e!721178 ($colon$colon!642 (removeStrictlySorted!156 (t!41846 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))) key1!31) (h!29530 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)))))))

(declare-fun b!1266259 () Bool)

(assert (=> b!1266259 (= e!721177 e!721178)))

(declare-fun c!123413 () Bool)

(assert (=> b!1266259 (= c!123413 (and ((_ is Cons!28321) (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))) (not (= (_1!10603 (h!29530 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)))) key1!31))))))

(declare-fun d!139103 () Bool)

(assert (=> d!139103 e!721179))

(declare-fun res!843030 () Bool)

(assert (=> d!139103 (=> (not res!843030) (not e!721179))))

(assert (=> d!139103 (= res!843030 (isStrictlySorted!800 lt!574114))))

(assert (=> d!139103 (= lt!574114 e!721177)))

(declare-fun c!123414 () Bool)

(assert (=> d!139103 (= c!123414 (and ((_ is Cons!28321) (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))) (= (_1!10603 (h!29530 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)))) key1!31)))))

(assert (=> d!139103 (isStrictlySorted!800 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)))))

(assert (=> d!139103 (= (removeStrictlySorted!156 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)) key1!31) lt!574114)))

(assert (= (and d!139103 c!123414) b!1266256))

(assert (= (and d!139103 (not c!123414)) b!1266259))

(assert (= (and b!1266259 c!123413) b!1266258))

(assert (= (and b!1266259 (not c!123413)) b!1266255))

(assert (= (and d!139103 res!843030) b!1266257))

(declare-fun m!1166001 () Bool)

(assert (=> b!1266257 m!1166001))

(declare-fun m!1166003 () Bool)

(assert (=> b!1266258 m!1166003))

(assert (=> b!1266258 m!1166003))

(declare-fun m!1166005 () Bool)

(assert (=> b!1266258 m!1166005))

(declare-fun m!1166007 () Bool)

(assert (=> d!139103 m!1166007))

(declare-fun m!1166009 () Bool)

(assert (=> d!139103 m!1166009))

(assert (=> b!1266043 d!139103))

(assert (=> b!1266159 d!139067))

(declare-fun d!139109 () Bool)

(assert (=> d!139109 (= ($colon$colon!642 (removeStrictlySorted!156 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)) key1!31) (h!29530 (insertStrictlySorted!466 l!706 key1!31 v1!26))) (Cons!28321 (h!29530 (insertStrictlySorted!466 l!706 key1!31 v1!26)) (removeStrictlySorted!156 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)) key1!31)))))

(assert (=> b!1266172 d!139109))

(declare-fun b!1266266 () Bool)

(declare-fun e!721187 () List!28325)

(assert (=> b!1266266 (= e!721187 Nil!28322)))

(declare-fun e!721186 () List!28325)

(declare-fun b!1266267 () Bool)

(assert (=> b!1266267 (= e!721186 (t!41846 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26))))))

(declare-fun b!1266268 () Bool)

(declare-fun e!721188 () Bool)

(declare-fun lt!574115 () List!28325)

(assert (=> b!1266268 (= e!721188 (not (containsKey!659 lt!574115 key1!31)))))

(declare-fun b!1266269 () Bool)

(assert (=> b!1266269 (= e!721187 ($colon$colon!642 (removeStrictlySorted!156 (t!41846 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26))) key1!31) (h!29530 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)))))))

(declare-fun b!1266270 () Bool)

(assert (=> b!1266270 (= e!721186 e!721187)))

(declare-fun c!123415 () Bool)

(assert (=> b!1266270 (= c!123415 (and ((_ is Cons!28321) (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26))) (not (= (_1!10603 (h!29530 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)))) key1!31))))))

(declare-fun d!139113 () Bool)

(assert (=> d!139113 e!721188))

(declare-fun res!843037 () Bool)

(assert (=> d!139113 (=> (not res!843037) (not e!721188))))

(assert (=> d!139113 (= res!843037 (isStrictlySorted!800 lt!574115))))

(assert (=> d!139113 (= lt!574115 e!721186)))

(declare-fun c!123416 () Bool)

(assert (=> d!139113 (= c!123416 (and ((_ is Cons!28321) (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26))) (= (_1!10603 (h!29530 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)))) key1!31)))))

(assert (=> d!139113 (isStrictlySorted!800 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)))))

(assert (=> d!139113 (= (removeStrictlySorted!156 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)) key1!31) lt!574115)))

(assert (= (and d!139113 c!123416) b!1266267))

(assert (= (and d!139113 (not c!123416)) b!1266270))

(assert (= (and b!1266270 c!123415) b!1266269))

(assert (= (and b!1266270 (not c!123415)) b!1266266))

(assert (= (and d!139113 res!843037) b!1266268))

(declare-fun m!1166015 () Bool)

(assert (=> b!1266268 m!1166015))

(declare-fun m!1166017 () Bool)

(assert (=> b!1266269 m!1166017))

(assert (=> b!1266269 m!1166017))

(declare-fun m!1166019 () Bool)

(assert (=> b!1266269 m!1166019))

(declare-fun m!1166021 () Bool)

(assert (=> d!139113 m!1166021))

(declare-fun m!1166023 () Bool)

(assert (=> d!139113 m!1166023))

(assert (=> b!1266172 d!139113))

(declare-fun d!139119 () Bool)

(declare-fun res!843039 () Bool)

(declare-fun e!721192 () Bool)

(assert (=> d!139119 (=> res!843039 e!721192)))

(assert (=> d!139119 (= res!843039 (or ((_ is Nil!28322) lt!574085) ((_ is Nil!28322) (t!41846 lt!574085))))))

(assert (=> d!139119 (= (isStrictlySorted!800 lt!574085) e!721192)))

(declare-fun b!1266276 () Bool)

(declare-fun e!721193 () Bool)

(assert (=> b!1266276 (= e!721192 e!721193)))

(declare-fun res!843040 () Bool)

(assert (=> b!1266276 (=> (not res!843040) (not e!721193))))

(assert (=> b!1266276 (= res!843040 (bvslt (_1!10603 (h!29530 lt!574085)) (_1!10603 (h!29530 (t!41846 lt!574085)))))))

(declare-fun b!1266277 () Bool)

(assert (=> b!1266277 (= e!721193 (isStrictlySorted!800 (t!41846 lt!574085)))))

(assert (= (and d!139119 (not res!843039)) b!1266276))

(assert (= (and b!1266276 res!843040) b!1266277))

(declare-fun m!1166029 () Bool)

(assert (=> b!1266277 m!1166029))

(assert (=> d!139033 d!139119))

(declare-fun d!139121 () Bool)

(declare-fun res!843041 () Bool)

(declare-fun e!721194 () Bool)

(assert (=> d!139121 (=> res!843041 e!721194)))

(assert (=> d!139121 (= res!843041 (or ((_ is Nil!28322) (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)) ((_ is Nil!28322) (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)))))))

(assert (=> d!139121 (= (isStrictlySorted!800 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26)) e!721194)))

(declare-fun b!1266278 () Bool)

(declare-fun e!721195 () Bool)

(assert (=> b!1266278 (= e!721194 e!721195)))

(declare-fun res!843042 () Bool)

(assert (=> b!1266278 (=> (not res!843042) (not e!721195))))

(assert (=> b!1266278 (= res!843042 (bvslt (_1!10603 (h!29530 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))) (_1!10603 (h!29530 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))))))))

(declare-fun b!1266279 () Bool)

(assert (=> b!1266279 (= e!721195 (isStrictlySorted!800 (t!41846 (insertStrictlySorted!466 (t!41846 l!706) key1!31 v1!26))))))

(assert (= (and d!139121 (not res!843041)) b!1266278))

(assert (= (and b!1266278 res!843042) b!1266279))

(assert (=> b!1266279 m!1166009))

(assert (=> d!139033 d!139121))

(declare-fun lt!574122 () Bool)

(declare-fun d!139125 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!634 (List!28325) (InoxSet tuple2!21184))

(assert (=> d!139125 (= lt!574122 (select (content!634 lt!574102) (tuple2!21185 key1!31 v1!26)))))

(declare-fun e!721213 () Bool)

(assert (=> d!139125 (= lt!574122 e!721213)))

(declare-fun res!843058 () Bool)

(assert (=> d!139125 (=> (not res!843058) (not e!721213))))

(assert (=> d!139125 (= res!843058 ((_ is Cons!28321) lt!574102))))

(assert (=> d!139125 (= (contains!7641 lt!574102 (tuple2!21185 key1!31 v1!26)) lt!574122)))

(declare-fun b!1266302 () Bool)

(declare-fun e!721214 () Bool)

(assert (=> b!1266302 (= e!721213 e!721214)))

(declare-fun res!843057 () Bool)

(assert (=> b!1266302 (=> res!843057 e!721214)))

(assert (=> b!1266302 (= res!843057 (= (h!29530 lt!574102) (tuple2!21185 key1!31 v1!26)))))

(declare-fun b!1266303 () Bool)

(assert (=> b!1266303 (= e!721214 (contains!7641 (t!41846 lt!574102) (tuple2!21185 key1!31 v1!26)))))

(assert (= (and d!139125 res!843058) b!1266302))

(assert (= (and b!1266302 (not res!843057)) b!1266303))

(declare-fun m!1166049 () Bool)

(assert (=> d!139125 m!1166049))

(declare-fun m!1166051 () Bool)

(assert (=> d!139125 m!1166051))

(declare-fun m!1166053 () Bool)

(assert (=> b!1266303 m!1166053))

(assert (=> b!1266162 d!139125))

(assert (=> b!1266228 d!139075))

(declare-fun d!139133 () Bool)

(declare-fun res!843059 () Bool)

(declare-fun e!721215 () Bool)

(assert (=> d!139133 (=> res!843059 e!721215)))

(assert (=> d!139133 (= res!843059 (and ((_ is Cons!28321) lt!574102) (= (_1!10603 (h!29530 lt!574102)) key1!31)))))

(assert (=> d!139133 (= (containsKey!659 lt!574102 key1!31) e!721215)))

(declare-fun b!1266304 () Bool)

(declare-fun e!721216 () Bool)

(assert (=> b!1266304 (= e!721215 e!721216)))

(declare-fun res!843060 () Bool)

(assert (=> b!1266304 (=> (not res!843060) (not e!721216))))

(assert (=> b!1266304 (= res!843060 (and (or (not ((_ is Cons!28321) lt!574102)) (bvsle (_1!10603 (h!29530 lt!574102)) key1!31)) ((_ is Cons!28321) lt!574102) (bvslt (_1!10603 (h!29530 lt!574102)) key1!31)))))

(declare-fun b!1266305 () Bool)

(assert (=> b!1266305 (= e!721216 (containsKey!659 (t!41846 lt!574102) key1!31))))

(assert (= (and d!139133 (not res!843059)) b!1266304))

(assert (= (and b!1266304 res!843060) b!1266305))

(declare-fun m!1166055 () Bool)

(assert (=> b!1266305 m!1166055))

(assert (=> b!1266161 d!139133))

(declare-fun c!123423 () Bool)

(declare-fun e!721221 () List!28325)

(declare-fun c!123425 () Bool)

(declare-fun b!1266306 () Bool)

(assert (=> b!1266306 (= e!721221 (ite c!123425 (t!41846 (t!41846 (t!41846 l!706))) (ite c!123423 (Cons!28321 (h!29530 (t!41846 (t!41846 l!706))) (t!41846 (t!41846 (t!41846 l!706)))) Nil!28322)))))

(declare-fun b!1266307 () Bool)

(declare-fun e!721217 () List!28325)

(declare-fun call!62464 () List!28325)

(assert (=> b!1266307 (= e!721217 call!62464)))

(declare-fun b!1266308 () Bool)

(declare-fun e!721219 () List!28325)

(declare-fun call!62463 () List!28325)

(assert (=> b!1266308 (= e!721219 call!62463)))

(declare-fun b!1266309 () Bool)

(declare-fun e!721218 () List!28325)

(assert (=> b!1266309 (= e!721218 e!721219)))

(assert (=> b!1266309 (= c!123425 (and ((_ is Cons!28321) (t!41846 (t!41846 l!706))) (= (_1!10603 (h!29530 (t!41846 (t!41846 l!706)))) key1!31)))))

(declare-fun b!1266310 () Bool)

(assert (=> b!1266310 (= c!123423 (and ((_ is Cons!28321) (t!41846 (t!41846 l!706))) (bvsgt (_1!10603 (h!29530 (t!41846 (t!41846 l!706)))) key1!31)))))

(assert (=> b!1266310 (= e!721219 e!721217)))

(declare-fun bm!62459 () Bool)

(declare-fun call!62462 () List!28325)

(assert (=> bm!62459 (= call!62463 call!62462)))

(declare-fun d!139135 () Bool)

(declare-fun e!721220 () Bool)

(assert (=> d!139135 e!721220))

(declare-fun res!843062 () Bool)

(assert (=> d!139135 (=> (not res!843062) (not e!721220))))

(declare-fun lt!574123 () List!28325)

(assert (=> d!139135 (= res!843062 (isStrictlySorted!800 lt!574123))))

(assert (=> d!139135 (= lt!574123 e!721218)))

(declare-fun c!123426 () Bool)

(assert (=> d!139135 (= c!123426 (and ((_ is Cons!28321) (t!41846 (t!41846 l!706))) (bvslt (_1!10603 (h!29530 (t!41846 (t!41846 l!706)))) key1!31)))))

(assert (=> d!139135 (isStrictlySorted!800 (t!41846 (t!41846 l!706)))))

(assert (=> d!139135 (= (insertStrictlySorted!466 (t!41846 (t!41846 l!706)) key1!31 v1!26) lt!574123)))

(declare-fun b!1266311 () Bool)

(assert (=> b!1266311 (= e!721221 (insertStrictlySorted!466 (t!41846 (t!41846 (t!41846 l!706))) key1!31 v1!26))))

(declare-fun b!1266312 () Bool)

(assert (=> b!1266312 (= e!721218 call!62462)))

(declare-fun bm!62460 () Bool)

(assert (=> bm!62460 (= call!62462 ($colon$colon!642 e!721221 (ite c!123426 (h!29530 (t!41846 (t!41846 l!706))) (tuple2!21185 key1!31 v1!26))))))

(declare-fun c!123424 () Bool)

(assert (=> bm!62460 (= c!123424 c!123426)))

(declare-fun b!1266313 () Bool)

(declare-fun res!843061 () Bool)

(assert (=> b!1266313 (=> (not res!843061) (not e!721220))))

(assert (=> b!1266313 (= res!843061 (containsKey!659 lt!574123 key1!31))))

(declare-fun b!1266314 () Bool)

(assert (=> b!1266314 (= e!721220 (contains!7641 lt!574123 (tuple2!21185 key1!31 v1!26)))))

(declare-fun b!1266315 () Bool)

(assert (=> b!1266315 (= e!721217 call!62464)))

(declare-fun bm!62461 () Bool)

(assert (=> bm!62461 (= call!62464 call!62463)))

(assert (= (and d!139135 c!123426) b!1266312))

(assert (= (and d!139135 (not c!123426)) b!1266309))

(assert (= (and b!1266309 c!123425) b!1266308))

(assert (= (and b!1266309 (not c!123425)) b!1266310))

(assert (= (and b!1266310 c!123423) b!1266315))

(assert (= (and b!1266310 (not c!123423)) b!1266307))

(assert (= (or b!1266315 b!1266307) bm!62461))

(assert (= (or b!1266308 bm!62461) bm!62459))

(assert (= (or b!1266312 bm!62459) bm!62460))

(assert (= (and bm!62460 c!123424) b!1266311))

(assert (= (and bm!62460 (not c!123424)) b!1266306))

(assert (= (and d!139135 res!843062) b!1266313))

(assert (= (and b!1266313 res!843061) b!1266314))

(declare-fun m!1166063 () Bool)

(assert (=> bm!62460 m!1166063))

(declare-fun m!1166065 () Bool)

(assert (=> b!1266311 m!1166065))

(declare-fun m!1166067 () Bool)

(assert (=> b!1266313 m!1166067))

(declare-fun m!1166069 () Bool)

(assert (=> d!139135 m!1166069))

(assert (=> d!139135 m!1165981))

(declare-fun m!1166071 () Bool)

(assert (=> b!1266314 m!1166071))

(assert (=> b!1266194 d!139135))

(declare-fun d!139141 () Bool)

(declare-fun res!843066 () Bool)

(declare-fun e!721227 () Bool)

(assert (=> d!139141 (=> res!843066 e!721227)))

(assert (=> d!139141 (= res!843066 (and ((_ is Cons!28321) (t!41846 (t!41846 l!706))) (= (_1!10603 (h!29530 (t!41846 (t!41846 l!706)))) key1!31)))))

(assert (=> d!139141 (= (containsKey!659 (t!41846 (t!41846 l!706)) key1!31) e!721227)))

(declare-fun b!1266323 () Bool)

(declare-fun e!721228 () Bool)

(assert (=> b!1266323 (= e!721227 e!721228)))

(declare-fun res!843067 () Bool)

(assert (=> b!1266323 (=> (not res!843067) (not e!721228))))

(assert (=> b!1266323 (= res!843067 (and (or (not ((_ is Cons!28321) (t!41846 (t!41846 l!706)))) (bvsle (_1!10603 (h!29530 (t!41846 (t!41846 l!706)))) key1!31)) ((_ is Cons!28321) (t!41846 (t!41846 l!706))) (bvslt (_1!10603 (h!29530 (t!41846 (t!41846 l!706)))) key1!31)))))

(declare-fun b!1266324 () Bool)

(assert (=> b!1266324 (= e!721228 (containsKey!659 (t!41846 (t!41846 (t!41846 l!706))) key1!31))))

(assert (= (and d!139141 (not res!843066)) b!1266323))

(assert (= (and b!1266323 res!843067) b!1266324))

(declare-fun m!1166081 () Bool)

(assert (=> b!1266324 m!1166081))

(assert (=> b!1266230 d!139141))

(assert (=> b!1266214 d!139079))

(declare-fun d!139145 () Bool)

(assert (=> d!139145 (= ($colon$colon!642 e!721110 (ite c!123396 (h!29530 l!706) (tuple2!21185 key1!31 v1!26))) (Cons!28321 (ite c!123396 (h!29530 l!706) (tuple2!21185 key1!31 v1!26)) e!721110))))

(assert (=> bm!62445 d!139145))

(declare-fun d!139147 () Bool)

(declare-fun res!843070 () Bool)

(declare-fun e!721231 () Bool)

(assert (=> d!139147 (=> res!843070 e!721231)))

(assert (=> d!139147 (= res!843070 (or ((_ is Nil!28322) lt!574109) ((_ is Nil!28322) (t!41846 lt!574109))))))

(assert (=> d!139147 (= (isStrictlySorted!800 lt!574109) e!721231)))

(declare-fun b!1266327 () Bool)

(declare-fun e!721232 () Bool)

(assert (=> b!1266327 (= e!721231 e!721232)))

(declare-fun res!843071 () Bool)

(assert (=> b!1266327 (=> (not res!843071) (not e!721232))))

(assert (=> b!1266327 (= res!843071 (bvslt (_1!10603 (h!29530 lt!574109)) (_1!10603 (h!29530 (t!41846 lt!574109)))))))

(declare-fun b!1266328 () Bool)

(assert (=> b!1266328 (= e!721232 (isStrictlySorted!800 (t!41846 lt!574109)))))

(assert (= (and d!139147 (not res!843070)) b!1266327))

(assert (= (and b!1266327 res!843071) b!1266328))

(declare-fun m!1166085 () Bool)

(assert (=> b!1266328 m!1166085))

(assert (=> d!139067 d!139147))

(assert (=> d!139067 d!139075))

(declare-fun d!139151 () Bool)

(declare-fun lt!574126 () Bool)

(assert (=> d!139151 (= lt!574126 (select (content!634 lt!574109) (tuple2!21185 key1!31 v1!26)))))

(declare-fun e!721235 () Bool)

(assert (=> d!139151 (= lt!574126 e!721235)))

(declare-fun res!843075 () Bool)

(assert (=> d!139151 (=> (not res!843075) (not e!721235))))

(assert (=> d!139151 (= res!843075 ((_ is Cons!28321) lt!574109))))

(assert (=> d!139151 (= (contains!7641 lt!574109 (tuple2!21185 key1!31 v1!26)) lt!574126)))

(declare-fun b!1266331 () Bool)

(declare-fun e!721236 () Bool)

(assert (=> b!1266331 (= e!721235 e!721236)))

(declare-fun res!843074 () Bool)

(assert (=> b!1266331 (=> res!843074 e!721236)))

(assert (=> b!1266331 (= res!843074 (= (h!29530 lt!574109) (tuple2!21185 key1!31 v1!26)))))

(declare-fun b!1266332 () Bool)

(assert (=> b!1266332 (= e!721236 (contains!7641 (t!41846 lt!574109) (tuple2!21185 key1!31 v1!26)))))

(assert (= (and d!139151 res!843075) b!1266331))

(assert (= (and b!1266331 (not res!843074)) b!1266332))

(declare-fun m!1166089 () Bool)

(assert (=> d!139151 m!1166089))

(declare-fun m!1166091 () Bool)

(assert (=> d!139151 m!1166091))

(declare-fun m!1166093 () Bool)

(assert (=> b!1266332 m!1166093))

(assert (=> b!1266197 d!139151))

(declare-fun d!139157 () Bool)

(declare-fun res!843078 () Bool)

(declare-fun e!721239 () Bool)

(assert (=> d!139157 (=> res!843078 e!721239)))

(assert (=> d!139157 (= res!843078 (and ((_ is Cons!28321) lt!574109) (= (_1!10603 (h!29530 lt!574109)) key1!31)))))

(assert (=> d!139157 (= (containsKey!659 lt!574109 key1!31) e!721239)))

(declare-fun b!1266335 () Bool)

(declare-fun e!721240 () Bool)

(assert (=> b!1266335 (= e!721239 e!721240)))

(declare-fun res!843079 () Bool)

(assert (=> b!1266335 (=> (not res!843079) (not e!721240))))

(assert (=> b!1266335 (= res!843079 (and (or (not ((_ is Cons!28321) lt!574109)) (bvsle (_1!10603 (h!29530 lt!574109)) key1!31)) ((_ is Cons!28321) lt!574109) (bvslt (_1!10603 (h!29530 lt!574109)) key1!31)))))

(declare-fun b!1266336 () Bool)

(assert (=> b!1266336 (= e!721240 (containsKey!659 (t!41846 lt!574109) key1!31))))

(assert (= (and d!139157 (not res!843078)) b!1266335))

(assert (= (and b!1266335 res!843079) b!1266336))

(declare-fun m!1166097 () Bool)

(assert (=> b!1266336 m!1166097))

(assert (=> b!1266196 d!139157))

(declare-fun d!139161 () Bool)

(assert (=> d!139161 (= ($colon$colon!642 e!721129 (ite c!123408 (h!29530 (t!41846 l!706)) (tuple2!21185 key1!31 v1!26))) (Cons!28321 (ite c!123408 (h!29530 (t!41846 l!706)) (tuple2!21185 key1!31 v1!26)) e!721129))))

(assert (=> bm!62451 d!139161))

(declare-fun d!139163 () Bool)

(declare-fun res!843082 () Bool)

(declare-fun e!721243 () Bool)

(assert (=> d!139163 (=> res!843082 e!721243)))

(assert (=> d!139163 (= res!843082 (or ((_ is Nil!28322) lt!574103) ((_ is Nil!28322) (t!41846 lt!574103))))))

(assert (=> d!139163 (= (isStrictlySorted!800 lt!574103) e!721243)))

(declare-fun b!1266339 () Bool)

(declare-fun e!721244 () Bool)

(assert (=> b!1266339 (= e!721243 e!721244)))

(declare-fun res!843083 () Bool)

(assert (=> b!1266339 (=> (not res!843083) (not e!721244))))

(assert (=> b!1266339 (= res!843083 (bvslt (_1!10603 (h!29530 lt!574103)) (_1!10603 (h!29530 (t!41846 lt!574103)))))))

(declare-fun b!1266340 () Bool)

(assert (=> b!1266340 (= e!721244 (isStrictlySorted!800 (t!41846 lt!574103)))))

(assert (= (and d!139163 (not res!843082)) b!1266339))

(assert (= (and b!1266339 res!843083) b!1266340))

(declare-fun m!1166105 () Bool)

(assert (=> b!1266340 m!1166105))

(assert (=> d!139059 d!139163))

(declare-fun d!139165 () Bool)

(declare-fun res!843084 () Bool)

(declare-fun e!721246 () Bool)

(assert (=> d!139165 (=> res!843084 e!721246)))

(assert (=> d!139165 (= res!843084 (or ((_ is Nil!28322) (insertStrictlySorted!466 l!706 key1!31 v1!26)) ((_ is Nil!28322) (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26)))))))

(assert (=> d!139165 (= (isStrictlySorted!800 (insertStrictlySorted!466 l!706 key1!31 v1!26)) e!721246)))

(declare-fun b!1266342 () Bool)

(declare-fun e!721247 () Bool)

(assert (=> b!1266342 (= e!721246 e!721247)))

(declare-fun res!843085 () Bool)

(assert (=> b!1266342 (=> (not res!843085) (not e!721247))))

(assert (=> b!1266342 (= res!843085 (bvslt (_1!10603 (h!29530 (insertStrictlySorted!466 l!706 key1!31 v1!26))) (_1!10603 (h!29530 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26))))))))

(declare-fun b!1266343 () Bool)

(assert (=> b!1266343 (= e!721247 (isStrictlySorted!800 (t!41846 (insertStrictlySorted!466 l!706 key1!31 v1!26))))))

(assert (= (and d!139165 (not res!843084)) b!1266342))

(assert (= (and b!1266342 res!843085) b!1266343))

(assert (=> b!1266343 m!1166023))

(assert (=> d!139059 d!139165))

(declare-fun d!139167 () Bool)

(declare-fun res!843086 () Bool)

(declare-fun e!721248 () Bool)

(assert (=> d!139167 (=> res!843086 e!721248)))

(assert (=> d!139167 (= res!843086 (and ((_ is Cons!28321) lt!574103) (= (_1!10603 (h!29530 lt!574103)) key1!31)))))

(assert (=> d!139167 (= (containsKey!659 lt!574103 key1!31) e!721248)))

(declare-fun b!1266344 () Bool)

(declare-fun e!721249 () Bool)

(assert (=> b!1266344 (= e!721248 e!721249)))

(declare-fun res!843087 () Bool)

(assert (=> b!1266344 (=> (not res!843087) (not e!721249))))

(assert (=> b!1266344 (= res!843087 (and (or (not ((_ is Cons!28321) lt!574103)) (bvsle (_1!10603 (h!29530 lt!574103)) key1!31)) ((_ is Cons!28321) lt!574103) (bvslt (_1!10603 (h!29530 lt!574103)) key1!31)))))

(declare-fun b!1266345 () Bool)

(assert (=> b!1266345 (= e!721249 (containsKey!659 (t!41846 lt!574103) key1!31))))

(assert (= (and d!139167 (not res!843086)) b!1266344))

(assert (= (and b!1266344 res!843087) b!1266345))

(declare-fun m!1166107 () Bool)

(assert (=> b!1266345 m!1166107))

(assert (=> b!1266171 d!139167))

(declare-fun d!139169 () Bool)

(declare-fun res!843088 () Bool)

(declare-fun e!721250 () Bool)

(assert (=> d!139169 (=> res!843088 e!721250)))

(assert (=> d!139169 (= res!843088 (or ((_ is Nil!28322) (t!41846 (t!41846 l!706))) ((_ is Nil!28322) (t!41846 (t!41846 (t!41846 l!706))))))))

(assert (=> d!139169 (= (isStrictlySorted!800 (t!41846 (t!41846 l!706))) e!721250)))

(declare-fun b!1266346 () Bool)

(declare-fun e!721251 () Bool)

(assert (=> b!1266346 (= e!721250 e!721251)))

(declare-fun res!843089 () Bool)

(assert (=> b!1266346 (=> (not res!843089) (not e!721251))))

(assert (=> b!1266346 (= res!843089 (bvslt (_1!10603 (h!29530 (t!41846 (t!41846 l!706)))) (_1!10603 (h!29530 (t!41846 (t!41846 (t!41846 l!706)))))))))

(declare-fun b!1266347 () Bool)

(assert (=> b!1266347 (= e!721251 (isStrictlySorted!800 (t!41846 (t!41846 (t!41846 l!706)))))))

(assert (= (and d!139169 (not res!843088)) b!1266346))

(assert (= (and b!1266346 res!843089) b!1266347))

(declare-fun m!1166109 () Bool)

(assert (=> b!1266347 m!1166109))

(assert (=> b!1266224 d!139169))

(declare-fun d!139171 () Bool)

(declare-fun res!843090 () Bool)

(declare-fun e!721252 () Bool)

(assert (=> d!139171 (=> res!843090 e!721252)))

(assert (=> d!139171 (= res!843090 (or ((_ is Nil!28322) lt!574102) ((_ is Nil!28322) (t!41846 lt!574102))))))

(assert (=> d!139171 (= (isStrictlySorted!800 lt!574102) e!721252)))

(declare-fun b!1266348 () Bool)

(declare-fun e!721253 () Bool)

(assert (=> b!1266348 (= e!721252 e!721253)))

(declare-fun res!843091 () Bool)

(assert (=> b!1266348 (=> (not res!843091) (not e!721253))))

(assert (=> b!1266348 (= res!843091 (bvslt (_1!10603 (h!29530 lt!574102)) (_1!10603 (h!29530 (t!41846 lt!574102)))))))

(declare-fun b!1266349 () Bool)

(assert (=> b!1266349 (= e!721253 (isStrictlySorted!800 (t!41846 lt!574102)))))

(assert (= (and d!139171 (not res!843090)) b!1266348))

(assert (= (and b!1266348 res!843091) b!1266349))

(declare-fun m!1166111 () Bool)

(assert (=> b!1266349 m!1166111))

(assert (=> d!139043 d!139171))

(assert (=> d!139043 d!139077))

(declare-fun b!1266350 () Bool)

(declare-fun e!721254 () Bool)

(declare-fun tp!96427 () Bool)

(assert (=> b!1266350 (= e!721254 (and tp_is_empty!32529 tp!96427))))

(assert (=> b!1266243 (= tp!96424 e!721254)))

(assert (= (and b!1266243 ((_ is Cons!28321) (t!41846 (t!41846 l!706)))) b!1266350))

(check-sat (not b!1266258) (not d!139125) (not b!1266340) (not b!1266314) (not d!139089) (not b!1266313) (not b!1266305) (not b!1266303) (not b!1266279) (not b!1266349) (not d!139113) (not b!1266345) (not b!1266324) (not b!1266269) (not d!139135) (not b!1266252) (not b!1266311) tp_is_empty!32529 (not b!1266277) (not d!139151) (not b!1266347) (not b!1266336) (not b!1266350) (not b!1266268) (not b!1266257) (not b!1266332) (not bm!62460) (not b!1266328) (not d!139103) (not b!1266343))
(check-sat)
