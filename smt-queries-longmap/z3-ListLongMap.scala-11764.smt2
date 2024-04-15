; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138042 () Bool)

(assert start!138042)

(declare-fun res!1082134 () Bool)

(declare-fun e!884325 () Bool)

(assert (=> start!138042 (=> (not res!1082134) (not e!884325))))

(declare-datatypes ((B!2924 0))(
  ( (B!2925 (val!19824 Int)) )
))
(declare-datatypes ((tuple2!25884 0))(
  ( (tuple2!25885 (_1!12953 (_ BitVec 64)) (_2!12953 B!2924)) )
))
(declare-datatypes ((List!36985 0))(
  ( (Nil!36982) (Cons!36981 (h!38525 tuple2!25884) (t!51891 List!36985)) )
))
(declare-fun l!1251 () List!36985)

(declare-fun isStrictlySorted!1167 (List!36985) Bool)

(assert (=> start!138042 (= res!1082134 (isStrictlySorted!1167 l!1251))))

(assert (=> start!138042 e!884325))

(declare-fun e!884326 () Bool)

(assert (=> start!138042 e!884326))

(assert (=> start!138042 true))

(declare-fun tp_is_empty!39457 () Bool)

(assert (=> start!138042 tp_is_empty!39457))

(declare-fun b!1584172 () Bool)

(declare-fun res!1082131 () Bool)

(assert (=> b!1584172 (=> (not res!1082131) (not e!884325))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1584172 (= res!1082131 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36981) l!1251)))))

(declare-fun b!1584173 () Bool)

(declare-fun res!1082133 () Bool)

(assert (=> b!1584173 (=> (not res!1082133) (not e!884325))))

(declare-fun containsKey!1001 (List!36985 (_ BitVec 64)) Bool)

(assert (=> b!1584173 (= res!1082133 (not (containsKey!1001 (t!51891 l!1251) otherKey!56)))))

(declare-fun b!1584174 () Bool)

(declare-fun newValue!123 () B!2924)

(declare-fun insertStrictlySorted!627 (List!36985 (_ BitVec 64) B!2924) List!36985)

(assert (=> b!1584174 (= e!884325 (not (not (containsKey!1001 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123) otherKey!56))))))

(assert (=> b!1584174 (not (containsKey!1001 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52105 0))(
  ( (Unit!52106) )
))
(declare-fun lt!676976 () Unit!52105)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!10 (List!36985 (_ BitVec 64) B!2924 (_ BitVec 64)) Unit!52105)

(assert (=> b!1584174 (= lt!676976 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!10 (t!51891 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1584175 () Bool)

(declare-fun tp!115121 () Bool)

(assert (=> b!1584175 (= e!884326 (and tp_is_empty!39457 tp!115121))))

(declare-fun b!1584176 () Bool)

(declare-fun res!1082135 () Bool)

(assert (=> b!1584176 (=> (not res!1082135) (not e!884325))))

(assert (=> b!1584176 (= res!1082135 (isStrictlySorted!1167 (t!51891 l!1251)))))

(declare-fun b!1584177 () Bool)

(declare-fun res!1082132 () Bool)

(assert (=> b!1584177 (=> (not res!1082132) (not e!884325))))

(assert (=> b!1584177 (= res!1082132 (not (containsKey!1001 l!1251 otherKey!56)))))

(assert (= (and start!138042 res!1082134) b!1584177))

(assert (= (and b!1584177 res!1082132) b!1584172))

(assert (= (and b!1584172 res!1082131) b!1584176))

(assert (= (and b!1584176 res!1082135) b!1584173))

(assert (= (and b!1584173 res!1082133) b!1584174))

(assert (= (and start!138042 ((_ is Cons!36981) l!1251)) b!1584175))

(declare-fun m!1452859 () Bool)

(assert (=> b!1584174 m!1452859))

(declare-fun m!1452861 () Bool)

(assert (=> b!1584174 m!1452861))

(declare-fun m!1452863 () Bool)

(assert (=> b!1584174 m!1452863))

(declare-fun m!1452865 () Bool)

(assert (=> b!1584174 m!1452865))

(assert (=> b!1584174 m!1452861))

(declare-fun m!1452867 () Bool)

(assert (=> b!1584174 m!1452867))

(assert (=> b!1584174 m!1452863))

(declare-fun m!1452869 () Bool)

(assert (=> b!1584177 m!1452869))

(declare-fun m!1452871 () Bool)

(assert (=> b!1584173 m!1452871))

(declare-fun m!1452873 () Bool)

(assert (=> start!138042 m!1452873))

(declare-fun m!1452875 () Bool)

(assert (=> b!1584176 m!1452875))

(check-sat (not b!1584173) (not b!1584176) (not b!1584177) (not b!1584174) tp_is_empty!39457 (not start!138042) (not b!1584175))
(check-sat)
(get-model)

(declare-fun d!167201 () Bool)

(declare-fun res!1082178 () Bool)

(declare-fun e!884351 () Bool)

(assert (=> d!167201 (=> res!1082178 e!884351)))

(assert (=> d!167201 (= res!1082178 (or ((_ is Nil!36982) l!1251) ((_ is Nil!36982) (t!51891 l!1251))))))

(assert (=> d!167201 (= (isStrictlySorted!1167 l!1251) e!884351)))

(declare-fun b!1584224 () Bool)

(declare-fun e!884352 () Bool)

(assert (=> b!1584224 (= e!884351 e!884352)))

(declare-fun res!1082179 () Bool)

(assert (=> b!1584224 (=> (not res!1082179) (not e!884352))))

(assert (=> b!1584224 (= res!1082179 (bvslt (_1!12953 (h!38525 l!1251)) (_1!12953 (h!38525 (t!51891 l!1251)))))))

(declare-fun b!1584225 () Bool)

(assert (=> b!1584225 (= e!884352 (isStrictlySorted!1167 (t!51891 l!1251)))))

(assert (= (and d!167201 (not res!1082178)) b!1584224))

(assert (= (and b!1584224 res!1082179) b!1584225))

(assert (=> b!1584225 m!1452875))

(assert (=> start!138042 d!167201))

(declare-fun d!167207 () Bool)

(declare-fun res!1082194 () Bool)

(declare-fun e!884367 () Bool)

(assert (=> d!167207 (=> res!1082194 e!884367)))

(assert (=> d!167207 (= res!1082194 (and ((_ is Cons!36981) l!1251) (= (_1!12953 (h!38525 l!1251)) otherKey!56)))))

(assert (=> d!167207 (= (containsKey!1001 l!1251 otherKey!56) e!884367)))

(declare-fun b!1584242 () Bool)

(declare-fun e!884368 () Bool)

(assert (=> b!1584242 (= e!884367 e!884368)))

(declare-fun res!1082195 () Bool)

(assert (=> b!1584242 (=> (not res!1082195) (not e!884368))))

(assert (=> b!1584242 (= res!1082195 (and (or (not ((_ is Cons!36981) l!1251)) (bvsle (_1!12953 (h!38525 l!1251)) otherKey!56)) ((_ is Cons!36981) l!1251) (bvslt (_1!12953 (h!38525 l!1251)) otherKey!56)))))

(declare-fun b!1584243 () Bool)

(assert (=> b!1584243 (= e!884368 (containsKey!1001 (t!51891 l!1251) otherKey!56))))

(assert (= (and d!167207 (not res!1082194)) b!1584242))

(assert (= (and b!1584242 res!1082195) b!1584243))

(assert (=> b!1584243 m!1452871))

(assert (=> b!1584177 d!167207))

(declare-fun b!1584314 () Bool)

(declare-fun e!884413 () List!36985)

(declare-fun call!72527 () List!36985)

(assert (=> b!1584314 (= e!884413 call!72527)))

(declare-fun e!884412 () List!36985)

(declare-fun bm!72523 () Bool)

(declare-fun c!146791 () Bool)

(declare-fun $colon$colon!1026 (List!36985 tuple2!25884) List!36985)

(assert (=> bm!72523 (= call!72527 ($colon$colon!1026 e!884412 (ite c!146791 (h!38525 l!1251) (tuple2!25885 newKey!123 newValue!123))))))

(declare-fun c!146794 () Bool)

(assert (=> bm!72523 (= c!146794 c!146791)))

(declare-fun b!1584316 () Bool)

(declare-fun e!884411 () List!36985)

(declare-fun call!72528 () List!36985)

(assert (=> b!1584316 (= e!884411 call!72528)))

(declare-fun b!1584317 () Bool)

(declare-fun e!884410 () List!36985)

(assert (=> b!1584317 (= e!884413 e!884410)))

(declare-fun c!146792 () Bool)

(assert (=> b!1584317 (= c!146792 (and ((_ is Cons!36981) l!1251) (= (_1!12953 (h!38525 l!1251)) newKey!123)))))

(declare-fun b!1584318 () Bool)

(declare-fun call!72526 () List!36985)

(assert (=> b!1584318 (= e!884410 call!72526)))

(declare-fun c!146793 () Bool)

(declare-fun b!1584319 () Bool)

(assert (=> b!1584319 (= e!884412 (ite c!146792 (t!51891 l!1251) (ite c!146793 (Cons!36981 (h!38525 l!1251) (t!51891 l!1251)) Nil!36982)))))

(declare-fun bm!72524 () Bool)

(assert (=> bm!72524 (= call!72526 call!72527)))

(declare-fun b!1584320 () Bool)

(assert (=> b!1584320 (= e!884412 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123))))

(declare-fun b!1584321 () Bool)

(assert (=> b!1584321 (= c!146793 (and ((_ is Cons!36981) l!1251) (bvsgt (_1!12953 (h!38525 l!1251)) newKey!123)))))

(assert (=> b!1584321 (= e!884410 e!884411)))

(declare-fun bm!72525 () Bool)

(assert (=> bm!72525 (= call!72528 call!72526)))

(declare-fun b!1584322 () Bool)

(assert (=> b!1584322 (= e!884411 call!72528)))

(declare-fun b!1584323 () Bool)

(declare-fun e!884409 () Bool)

(declare-fun lt!676989 () List!36985)

(declare-fun contains!10480 (List!36985 tuple2!25884) Bool)

(assert (=> b!1584323 (= e!884409 (contains!10480 lt!676989 (tuple2!25885 newKey!123 newValue!123)))))

(declare-fun b!1584315 () Bool)

(declare-fun res!1082219 () Bool)

(assert (=> b!1584315 (=> (not res!1082219) (not e!884409))))

(assert (=> b!1584315 (= res!1082219 (containsKey!1001 lt!676989 newKey!123))))

(declare-fun d!167217 () Bool)

(assert (=> d!167217 e!884409))

(declare-fun res!1082218 () Bool)

(assert (=> d!167217 (=> (not res!1082218) (not e!884409))))

(assert (=> d!167217 (= res!1082218 (isStrictlySorted!1167 lt!676989))))

(assert (=> d!167217 (= lt!676989 e!884413)))

(assert (=> d!167217 (= c!146791 (and ((_ is Cons!36981) l!1251) (bvslt (_1!12953 (h!38525 l!1251)) newKey!123)))))

(assert (=> d!167217 (isStrictlySorted!1167 l!1251)))

(assert (=> d!167217 (= (insertStrictlySorted!627 l!1251 newKey!123 newValue!123) lt!676989)))

(assert (= (and d!167217 c!146791) b!1584314))

(assert (= (and d!167217 (not c!146791)) b!1584317))

(assert (= (and b!1584317 c!146792) b!1584318))

(assert (= (and b!1584317 (not c!146792)) b!1584321))

(assert (= (and b!1584321 c!146793) b!1584322))

(assert (= (and b!1584321 (not c!146793)) b!1584316))

(assert (= (or b!1584322 b!1584316) bm!72525))

(assert (= (or b!1584318 bm!72525) bm!72524))

(assert (= (or b!1584314 bm!72524) bm!72523))

(assert (= (and bm!72523 c!146794) b!1584320))

(assert (= (and bm!72523 (not c!146794)) b!1584319))

(assert (= (and d!167217 res!1082218) b!1584315))

(assert (= (and b!1584315 res!1082219) b!1584323))

(declare-fun m!1452919 () Bool)

(assert (=> d!167217 m!1452919))

(assert (=> d!167217 m!1452873))

(declare-fun m!1452921 () Bool)

(assert (=> bm!72523 m!1452921))

(declare-fun m!1452923 () Bool)

(assert (=> b!1584315 m!1452923))

(declare-fun m!1452925 () Bool)

(assert (=> b!1584323 m!1452925))

(assert (=> b!1584320 m!1452861))

(assert (=> b!1584174 d!167217))

(declare-fun b!1584334 () Bool)

(declare-fun e!884423 () List!36985)

(declare-fun call!72533 () List!36985)

(assert (=> b!1584334 (= e!884423 call!72533)))

(declare-fun e!884422 () List!36985)

(declare-fun bm!72529 () Bool)

(declare-fun c!146799 () Bool)

(assert (=> bm!72529 (= call!72533 ($colon$colon!1026 e!884422 (ite c!146799 (h!38525 (t!51891 l!1251)) (tuple2!25885 newKey!123 newValue!123))))))

(declare-fun c!146802 () Bool)

(assert (=> bm!72529 (= c!146802 c!146799)))

(declare-fun b!1584336 () Bool)

(declare-fun e!884421 () List!36985)

(declare-fun call!72534 () List!36985)

(assert (=> b!1584336 (= e!884421 call!72534)))

(declare-fun b!1584337 () Bool)

(declare-fun e!884420 () List!36985)

(assert (=> b!1584337 (= e!884423 e!884420)))

(declare-fun c!146800 () Bool)

(assert (=> b!1584337 (= c!146800 (and ((_ is Cons!36981) (t!51891 l!1251)) (= (_1!12953 (h!38525 (t!51891 l!1251))) newKey!123)))))

(declare-fun b!1584338 () Bool)

(declare-fun call!72532 () List!36985)

(assert (=> b!1584338 (= e!884420 call!72532)))

(declare-fun c!146801 () Bool)

(declare-fun b!1584339 () Bool)

(assert (=> b!1584339 (= e!884422 (ite c!146800 (t!51891 (t!51891 l!1251)) (ite c!146801 (Cons!36981 (h!38525 (t!51891 l!1251)) (t!51891 (t!51891 l!1251))) Nil!36982)))))

(declare-fun bm!72530 () Bool)

(assert (=> bm!72530 (= call!72532 call!72533)))

(declare-fun b!1584340 () Bool)

(assert (=> b!1584340 (= e!884422 (insertStrictlySorted!627 (t!51891 (t!51891 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1584341 () Bool)

(assert (=> b!1584341 (= c!146801 (and ((_ is Cons!36981) (t!51891 l!1251)) (bvsgt (_1!12953 (h!38525 (t!51891 l!1251))) newKey!123)))))

(assert (=> b!1584341 (= e!884420 e!884421)))

(declare-fun bm!72531 () Bool)

(assert (=> bm!72531 (= call!72534 call!72532)))

(declare-fun b!1584342 () Bool)

(assert (=> b!1584342 (= e!884421 call!72534)))

(declare-fun b!1584343 () Bool)

(declare-fun lt!676991 () List!36985)

(declare-fun e!884419 () Bool)

(assert (=> b!1584343 (= e!884419 (contains!10480 lt!676991 (tuple2!25885 newKey!123 newValue!123)))))

(declare-fun b!1584335 () Bool)

(declare-fun res!1082223 () Bool)

(assert (=> b!1584335 (=> (not res!1082223) (not e!884419))))

(assert (=> b!1584335 (= res!1082223 (containsKey!1001 lt!676991 newKey!123))))

(declare-fun d!167223 () Bool)

(assert (=> d!167223 e!884419))

(declare-fun res!1082222 () Bool)

(assert (=> d!167223 (=> (not res!1082222) (not e!884419))))

(assert (=> d!167223 (= res!1082222 (isStrictlySorted!1167 lt!676991))))

(assert (=> d!167223 (= lt!676991 e!884423)))

(assert (=> d!167223 (= c!146799 (and ((_ is Cons!36981) (t!51891 l!1251)) (bvslt (_1!12953 (h!38525 (t!51891 l!1251))) newKey!123)))))

(assert (=> d!167223 (isStrictlySorted!1167 (t!51891 l!1251))))

(assert (=> d!167223 (= (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123) lt!676991)))

(assert (= (and d!167223 c!146799) b!1584334))

(assert (= (and d!167223 (not c!146799)) b!1584337))

(assert (= (and b!1584337 c!146800) b!1584338))

(assert (= (and b!1584337 (not c!146800)) b!1584341))

(assert (= (and b!1584341 c!146801) b!1584342))

(assert (= (and b!1584341 (not c!146801)) b!1584336))

(assert (= (or b!1584342 b!1584336) bm!72531))

(assert (= (or b!1584338 bm!72531) bm!72530))

(assert (= (or b!1584334 bm!72530) bm!72529))

(assert (= (and bm!72529 c!146802) b!1584340))

(assert (= (and bm!72529 (not c!146802)) b!1584339))

(assert (= (and d!167223 res!1082222) b!1584335))

(assert (= (and b!1584335 res!1082223) b!1584343))

(declare-fun m!1452935 () Bool)

(assert (=> d!167223 m!1452935))

(assert (=> d!167223 m!1452875))

(declare-fun m!1452937 () Bool)

(assert (=> bm!72529 m!1452937))

(declare-fun m!1452939 () Bool)

(assert (=> b!1584335 m!1452939))

(declare-fun m!1452941 () Bool)

(assert (=> b!1584343 m!1452941))

(declare-fun m!1452943 () Bool)

(assert (=> b!1584340 m!1452943))

(assert (=> b!1584174 d!167223))

(declare-fun d!167227 () Bool)

(assert (=> d!167227 (not (containsKey!1001 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!676999 () Unit!52105)

(declare-fun choose!2117 (List!36985 (_ BitVec 64) B!2924 (_ BitVec 64)) Unit!52105)

(assert (=> d!167227 (= lt!676999 (choose!2117 (t!51891 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!884445 () Bool)

(assert (=> d!167227 e!884445))

(declare-fun res!1082240 () Bool)

(assert (=> d!167227 (=> (not res!1082240) (not e!884445))))

(assert (=> d!167227 (= res!1082240 (isStrictlySorted!1167 (t!51891 l!1251)))))

(assert (=> d!167227 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!10 (t!51891 l!1251) newKey!123 newValue!123 otherKey!56) lt!676999)))

(declare-fun b!1584384 () Bool)

(declare-fun res!1082241 () Bool)

(assert (=> b!1584384 (=> (not res!1082241) (not e!884445))))

(assert (=> b!1584384 (= res!1082241 (not (containsKey!1001 (t!51891 l!1251) otherKey!56)))))

(declare-fun b!1584385 () Bool)

(assert (=> b!1584385 (= e!884445 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!167227 res!1082240) b!1584384))

(assert (= (and b!1584384 res!1082241) b!1584385))

(assert (=> d!167227 m!1452861))

(assert (=> d!167227 m!1452861))

(assert (=> d!167227 m!1452867))

(declare-fun m!1452973 () Bool)

(assert (=> d!167227 m!1452973))

(assert (=> d!167227 m!1452875))

(assert (=> b!1584384 m!1452871))

(assert (=> b!1584174 d!167227))

(declare-fun d!167235 () Bool)

(declare-fun res!1082244 () Bool)

(declare-fun e!884446 () Bool)

(assert (=> d!167235 (=> res!1082244 e!884446)))

(assert (=> d!167235 (= res!1082244 (and ((_ is Cons!36981) (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) (= (_1!12953 (h!38525 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167235 (= (containsKey!1001 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123) otherKey!56) e!884446)))

(declare-fun b!1584388 () Bool)

(declare-fun e!884447 () Bool)

(assert (=> b!1584388 (= e!884446 e!884447)))

(declare-fun res!1082245 () Bool)

(assert (=> b!1584388 (=> (not res!1082245) (not e!884447))))

(assert (=> b!1584388 (= res!1082245 (and (or (not ((_ is Cons!36981) (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) (bvsle (_1!12953 (h!38525 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56)) ((_ is Cons!36981) (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) (bvslt (_1!12953 (h!38525 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584389 () Bool)

(assert (=> b!1584389 (= e!884447 (containsKey!1001 (t!51891 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167235 (not res!1082244)) b!1584388))

(assert (= (and b!1584388 res!1082245) b!1584389))

(declare-fun m!1452975 () Bool)

(assert (=> b!1584389 m!1452975))

(assert (=> b!1584174 d!167235))

(declare-fun d!167237 () Bool)

(declare-fun res!1082248 () Bool)

(declare-fun e!884449 () Bool)

(assert (=> d!167237 (=> res!1082248 e!884449)))

(assert (=> d!167237 (= res!1082248 (and ((_ is Cons!36981) (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123)) (= (_1!12953 (h!38525 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167237 (= (containsKey!1001 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123) otherKey!56) e!884449)))

(declare-fun b!1584392 () Bool)

(declare-fun e!884450 () Bool)

(assert (=> b!1584392 (= e!884449 e!884450)))

(declare-fun res!1082249 () Bool)

(assert (=> b!1584392 (=> (not res!1082249) (not e!884450))))

(assert (=> b!1584392 (= res!1082249 (and (or (not ((_ is Cons!36981) (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123))) (bvsle (_1!12953 (h!38525 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123))) otherKey!56)) ((_ is Cons!36981) (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123)) (bvslt (_1!12953 (h!38525 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584393 () Bool)

(assert (=> b!1584393 (= e!884450 (containsKey!1001 (t!51891 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167237 (not res!1082248)) b!1584392))

(assert (= (and b!1584392 res!1082249) b!1584393))

(declare-fun m!1452979 () Bool)

(assert (=> b!1584393 m!1452979))

(assert (=> b!1584174 d!167237))

(declare-fun d!167241 () Bool)

(declare-fun res!1082254 () Bool)

(declare-fun e!884454 () Bool)

(assert (=> d!167241 (=> res!1082254 e!884454)))

(assert (=> d!167241 (= res!1082254 (and ((_ is Cons!36981) (t!51891 l!1251)) (= (_1!12953 (h!38525 (t!51891 l!1251))) otherKey!56)))))

(assert (=> d!167241 (= (containsKey!1001 (t!51891 l!1251) otherKey!56) e!884454)))

(declare-fun b!1584398 () Bool)

(declare-fun e!884455 () Bool)

(assert (=> b!1584398 (= e!884454 e!884455)))

(declare-fun res!1082255 () Bool)

(assert (=> b!1584398 (=> (not res!1082255) (not e!884455))))

(assert (=> b!1584398 (= res!1082255 (and (or (not ((_ is Cons!36981) (t!51891 l!1251))) (bvsle (_1!12953 (h!38525 (t!51891 l!1251))) otherKey!56)) ((_ is Cons!36981) (t!51891 l!1251)) (bvslt (_1!12953 (h!38525 (t!51891 l!1251))) otherKey!56)))))

(declare-fun b!1584399 () Bool)

(assert (=> b!1584399 (= e!884455 (containsKey!1001 (t!51891 (t!51891 l!1251)) otherKey!56))))

(assert (= (and d!167241 (not res!1082254)) b!1584398))

(assert (= (and b!1584398 res!1082255) b!1584399))

(declare-fun m!1452983 () Bool)

(assert (=> b!1584399 m!1452983))

(assert (=> b!1584173 d!167241))

(declare-fun d!167245 () Bool)

(declare-fun res!1082258 () Bool)

(declare-fun e!884458 () Bool)

(assert (=> d!167245 (=> res!1082258 e!884458)))

(assert (=> d!167245 (= res!1082258 (or ((_ is Nil!36982) (t!51891 l!1251)) ((_ is Nil!36982) (t!51891 (t!51891 l!1251)))))))

(assert (=> d!167245 (= (isStrictlySorted!1167 (t!51891 l!1251)) e!884458)))

(declare-fun b!1584402 () Bool)

(declare-fun e!884459 () Bool)

(assert (=> b!1584402 (= e!884458 e!884459)))

(declare-fun res!1082259 () Bool)

(assert (=> b!1584402 (=> (not res!1082259) (not e!884459))))

(assert (=> b!1584402 (= res!1082259 (bvslt (_1!12953 (h!38525 (t!51891 l!1251))) (_1!12953 (h!38525 (t!51891 (t!51891 l!1251))))))))

(declare-fun b!1584403 () Bool)

(assert (=> b!1584403 (= e!884459 (isStrictlySorted!1167 (t!51891 (t!51891 l!1251))))))

(assert (= (and d!167245 (not res!1082258)) b!1584402))

(assert (= (and b!1584402 res!1082259) b!1584403))

(declare-fun m!1452987 () Bool)

(assert (=> b!1584403 m!1452987))

(assert (=> b!1584176 d!167245))

(declare-fun b!1584418 () Bool)

(declare-fun e!884470 () Bool)

(declare-fun tp!115132 () Bool)

(assert (=> b!1584418 (= e!884470 (and tp_is_empty!39457 tp!115132))))

(assert (=> b!1584175 (= tp!115121 e!884470)))

(assert (= (and b!1584175 ((_ is Cons!36981) (t!51891 l!1251))) b!1584418))

(check-sat (not b!1584225) (not b!1584393) (not b!1584243) (not b!1584335) (not d!167223) (not b!1584343) (not b!1584403) (not d!167227) (not b!1584389) (not d!167217) (not b!1584384) (not bm!72529) (not b!1584315) (not b!1584340) (not b!1584323) tp_is_empty!39457 (not b!1584399) (not b!1584320) (not b!1584418) (not bm!72523))
(check-sat)
(get-model)

(declare-fun d!167255 () Bool)

(assert (=> d!167255 (= ($colon$colon!1026 e!884422 (ite c!146799 (h!38525 (t!51891 l!1251)) (tuple2!25885 newKey!123 newValue!123))) (Cons!36981 (ite c!146799 (h!38525 (t!51891 l!1251)) (tuple2!25885 newKey!123 newValue!123)) e!884422))))

(assert (=> bm!72529 d!167255))

(declare-fun d!167257 () Bool)

(declare-fun res!1082268 () Bool)

(declare-fun e!884477 () Bool)

(assert (=> d!167257 (=> res!1082268 e!884477)))

(assert (=> d!167257 (= res!1082268 (and ((_ is Cons!36981) lt!676989) (= (_1!12953 (h!38525 lt!676989)) newKey!123)))))

(assert (=> d!167257 (= (containsKey!1001 lt!676989 newKey!123) e!884477)))

(declare-fun b!1584427 () Bool)

(declare-fun e!884478 () Bool)

(assert (=> b!1584427 (= e!884477 e!884478)))

(declare-fun res!1082269 () Bool)

(assert (=> b!1584427 (=> (not res!1082269) (not e!884478))))

(assert (=> b!1584427 (= res!1082269 (and (or (not ((_ is Cons!36981) lt!676989)) (bvsle (_1!12953 (h!38525 lt!676989)) newKey!123)) ((_ is Cons!36981) lt!676989) (bvslt (_1!12953 (h!38525 lt!676989)) newKey!123)))))

(declare-fun b!1584428 () Bool)

(assert (=> b!1584428 (= e!884478 (containsKey!1001 (t!51891 lt!676989) newKey!123))))

(assert (= (and d!167257 (not res!1082268)) b!1584427))

(assert (= (and b!1584427 res!1082269) b!1584428))

(declare-fun m!1452997 () Bool)

(assert (=> b!1584428 m!1452997))

(assert (=> b!1584315 d!167257))

(declare-fun d!167259 () Bool)

(declare-fun res!1082270 () Bool)

(declare-fun e!884479 () Bool)

(assert (=> d!167259 (=> res!1082270 e!884479)))

(assert (=> d!167259 (= res!1082270 (or ((_ is Nil!36982) (t!51891 (t!51891 l!1251))) ((_ is Nil!36982) (t!51891 (t!51891 (t!51891 l!1251))))))))

(assert (=> d!167259 (= (isStrictlySorted!1167 (t!51891 (t!51891 l!1251))) e!884479)))

(declare-fun b!1584429 () Bool)

(declare-fun e!884480 () Bool)

(assert (=> b!1584429 (= e!884479 e!884480)))

(declare-fun res!1082271 () Bool)

(assert (=> b!1584429 (=> (not res!1082271) (not e!884480))))

(assert (=> b!1584429 (= res!1082271 (bvslt (_1!12953 (h!38525 (t!51891 (t!51891 l!1251)))) (_1!12953 (h!38525 (t!51891 (t!51891 (t!51891 l!1251)))))))))

(declare-fun b!1584430 () Bool)

(assert (=> b!1584430 (= e!884480 (isStrictlySorted!1167 (t!51891 (t!51891 (t!51891 l!1251)))))))

(assert (= (and d!167259 (not res!1082270)) b!1584429))

(assert (= (and b!1584429 res!1082271) b!1584430))

(declare-fun m!1452999 () Bool)

(assert (=> b!1584430 m!1452999))

(assert (=> b!1584403 d!167259))

(declare-fun d!167261 () Bool)

(declare-fun res!1082272 () Bool)

(declare-fun e!884481 () Bool)

(assert (=> d!167261 (=> res!1082272 e!884481)))

(assert (=> d!167261 (= res!1082272 (and ((_ is Cons!36981) lt!676991) (= (_1!12953 (h!38525 lt!676991)) newKey!123)))))

(assert (=> d!167261 (= (containsKey!1001 lt!676991 newKey!123) e!884481)))

(declare-fun b!1584431 () Bool)

(declare-fun e!884482 () Bool)

(assert (=> b!1584431 (= e!884481 e!884482)))

(declare-fun res!1082273 () Bool)

(assert (=> b!1584431 (=> (not res!1082273) (not e!884482))))

(assert (=> b!1584431 (= res!1082273 (and (or (not ((_ is Cons!36981) lt!676991)) (bvsle (_1!12953 (h!38525 lt!676991)) newKey!123)) ((_ is Cons!36981) lt!676991) (bvslt (_1!12953 (h!38525 lt!676991)) newKey!123)))))

(declare-fun b!1584432 () Bool)

(assert (=> b!1584432 (= e!884482 (containsKey!1001 (t!51891 lt!676991) newKey!123))))

(assert (= (and d!167261 (not res!1082272)) b!1584431))

(assert (= (and b!1584431 res!1082273) b!1584432))

(declare-fun m!1453001 () Bool)

(assert (=> b!1584432 m!1453001))

(assert (=> b!1584335 d!167261))

(assert (=> b!1584384 d!167241))

(declare-fun lt!677006 () Bool)

(declare-fun d!167263 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!851 (List!36985) (InoxSet tuple2!25884))

(assert (=> d!167263 (= lt!677006 (select (content!851 lt!676991) (tuple2!25885 newKey!123 newValue!123)))))

(declare-fun e!884487 () Bool)

(assert (=> d!167263 (= lt!677006 e!884487)))

(declare-fun res!1082279 () Bool)

(assert (=> d!167263 (=> (not res!1082279) (not e!884487))))

(assert (=> d!167263 (= res!1082279 ((_ is Cons!36981) lt!676991))))

(assert (=> d!167263 (= (contains!10480 lt!676991 (tuple2!25885 newKey!123 newValue!123)) lt!677006)))

(declare-fun b!1584437 () Bool)

(declare-fun e!884488 () Bool)

(assert (=> b!1584437 (= e!884487 e!884488)))

(declare-fun res!1082278 () Bool)

(assert (=> b!1584437 (=> res!1082278 e!884488)))

(assert (=> b!1584437 (= res!1082278 (= (h!38525 lt!676991) (tuple2!25885 newKey!123 newValue!123)))))

(declare-fun b!1584438 () Bool)

(assert (=> b!1584438 (= e!884488 (contains!10480 (t!51891 lt!676991) (tuple2!25885 newKey!123 newValue!123)))))

(assert (= (and d!167263 res!1082279) b!1584437))

(assert (= (and b!1584437 (not res!1082278)) b!1584438))

(declare-fun m!1453003 () Bool)

(assert (=> d!167263 m!1453003))

(declare-fun m!1453005 () Bool)

(assert (=> d!167263 m!1453005))

(declare-fun m!1453007 () Bool)

(assert (=> b!1584438 m!1453007))

(assert (=> b!1584343 d!167263))

(declare-fun d!167265 () Bool)

(declare-fun res!1082280 () Bool)

(declare-fun e!884489 () Bool)

(assert (=> d!167265 (=> res!1082280 e!884489)))

(assert (=> d!167265 (= res!1082280 (and ((_ is Cons!36981) (t!51891 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123))) (= (_1!12953 (h!38525 (t!51891 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!167265 (= (containsKey!1001 (t!51891 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123)) otherKey!56) e!884489)))

(declare-fun b!1584439 () Bool)

(declare-fun e!884490 () Bool)

(assert (=> b!1584439 (= e!884489 e!884490)))

(declare-fun res!1082281 () Bool)

(assert (=> b!1584439 (=> (not res!1082281) (not e!884490))))

(assert (=> b!1584439 (= res!1082281 (and (or (not ((_ is Cons!36981) (t!51891 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123)))) (bvsle (_1!12953 (h!38525 (t!51891 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123)))) otherKey!56)) ((_ is Cons!36981) (t!51891 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123))) (bvslt (_1!12953 (h!38525 (t!51891 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1584440 () Bool)

(assert (=> b!1584440 (= e!884490 (containsKey!1001 (t!51891 (t!51891 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!167265 (not res!1082280)) b!1584439))

(assert (= (and b!1584439 res!1082281) b!1584440))

(declare-fun m!1453009 () Bool)

(assert (=> b!1584440 m!1453009))

(assert (=> b!1584393 d!167265))

(declare-fun d!167267 () Bool)

(declare-fun res!1082282 () Bool)

(declare-fun e!884491 () Bool)

(assert (=> d!167267 (=> res!1082282 e!884491)))

(assert (=> d!167267 (= res!1082282 (or ((_ is Nil!36982) lt!676989) ((_ is Nil!36982) (t!51891 lt!676989))))))

(assert (=> d!167267 (= (isStrictlySorted!1167 lt!676989) e!884491)))

(declare-fun b!1584441 () Bool)

(declare-fun e!884492 () Bool)

(assert (=> b!1584441 (= e!884491 e!884492)))

(declare-fun res!1082283 () Bool)

(assert (=> b!1584441 (=> (not res!1082283) (not e!884492))))

(assert (=> b!1584441 (= res!1082283 (bvslt (_1!12953 (h!38525 lt!676989)) (_1!12953 (h!38525 (t!51891 lt!676989)))))))

(declare-fun b!1584442 () Bool)

(assert (=> b!1584442 (= e!884492 (isStrictlySorted!1167 (t!51891 lt!676989)))))

(assert (= (and d!167267 (not res!1082282)) b!1584441))

(assert (= (and b!1584441 res!1082283) b!1584442))

(declare-fun m!1453011 () Bool)

(assert (=> b!1584442 m!1453011))

(assert (=> d!167217 d!167267))

(assert (=> d!167217 d!167201))

(assert (=> d!167227 d!167237))

(assert (=> d!167227 d!167223))

(declare-fun d!167269 () Bool)

(assert (=> d!167269 (not (containsKey!1001 (insertStrictlySorted!627 (t!51891 l!1251) newKey!123 newValue!123) otherKey!56))))

(assert (=> d!167269 true))

(declare-fun _$17!98 () Unit!52105)

(assert (=> d!167269 (= (choose!2117 (t!51891 l!1251) newKey!123 newValue!123 otherKey!56) _$17!98)))

(declare-fun bs!45894 () Bool)

(assert (= bs!45894 d!167269))

(assert (=> bs!45894 m!1452861))

(assert (=> bs!45894 m!1452861))

(assert (=> bs!45894 m!1452867))

(assert (=> d!167227 d!167269))

(assert (=> d!167227 d!167245))

(assert (=> b!1584225 d!167245))

(assert (=> b!1584320 d!167223))

(assert (=> b!1584243 d!167241))

(declare-fun d!167271 () Bool)

(declare-fun res!1082284 () Bool)

(declare-fun e!884493 () Bool)

(assert (=> d!167271 (=> res!1082284 e!884493)))

(assert (=> d!167271 (= res!1082284 (or ((_ is Nil!36982) lt!676991) ((_ is Nil!36982) (t!51891 lt!676991))))))

(assert (=> d!167271 (= (isStrictlySorted!1167 lt!676991) e!884493)))

(declare-fun b!1584443 () Bool)

(declare-fun e!884494 () Bool)

(assert (=> b!1584443 (= e!884493 e!884494)))

(declare-fun res!1082285 () Bool)

(assert (=> b!1584443 (=> (not res!1082285) (not e!884494))))

(assert (=> b!1584443 (= res!1082285 (bvslt (_1!12953 (h!38525 lt!676991)) (_1!12953 (h!38525 (t!51891 lt!676991)))))))

(declare-fun b!1584444 () Bool)

(assert (=> b!1584444 (= e!884494 (isStrictlySorted!1167 (t!51891 lt!676991)))))

(assert (= (and d!167271 (not res!1082284)) b!1584443))

(assert (= (and b!1584443 res!1082285) b!1584444))

(declare-fun m!1453013 () Bool)

(assert (=> b!1584444 m!1453013))

(assert (=> d!167223 d!167271))

(assert (=> d!167223 d!167245))

(declare-fun d!167273 () Bool)

(declare-fun res!1082286 () Bool)

(declare-fun e!884495 () Bool)

(assert (=> d!167273 (=> res!1082286 e!884495)))

(assert (=> d!167273 (= res!1082286 (and ((_ is Cons!36981) (t!51891 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) (= (_1!12953 (h!38525 (t!51891 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!167273 (= (containsKey!1001 (t!51891 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)) otherKey!56) e!884495)))

(declare-fun b!1584445 () Bool)

(declare-fun e!884496 () Bool)

(assert (=> b!1584445 (= e!884495 e!884496)))

(declare-fun res!1082287 () Bool)

(assert (=> b!1584445 (=> (not res!1082287) (not e!884496))))

(assert (=> b!1584445 (= res!1082287 (and (or (not ((_ is Cons!36981) (t!51891 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) (bvsle (_1!12953 (h!38525 (t!51891 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) otherKey!56)) ((_ is Cons!36981) (t!51891 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) (bvslt (_1!12953 (h!38525 (t!51891 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1584446 () Bool)

(assert (=> b!1584446 (= e!884496 (containsKey!1001 (t!51891 (t!51891 (insertStrictlySorted!627 l!1251 newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!167273 (not res!1082286)) b!1584445))

(assert (= (and b!1584445 res!1082287) b!1584446))

(declare-fun m!1453015 () Bool)

(assert (=> b!1584446 m!1453015))

(assert (=> b!1584389 d!167273))

(declare-fun b!1584447 () Bool)

(declare-fun e!884501 () List!36985)

(declare-fun call!72545 () List!36985)

(assert (=> b!1584447 (= e!884501 call!72545)))

(declare-fun c!146815 () Bool)

(declare-fun e!884500 () List!36985)

(declare-fun bm!72541 () Bool)

(assert (=> bm!72541 (= call!72545 ($colon$colon!1026 e!884500 (ite c!146815 (h!38525 (t!51891 (t!51891 l!1251))) (tuple2!25885 newKey!123 newValue!123))))))

(declare-fun c!146818 () Bool)

(assert (=> bm!72541 (= c!146818 c!146815)))

(declare-fun b!1584449 () Bool)

(declare-fun e!884499 () List!36985)

(declare-fun call!72546 () List!36985)

(assert (=> b!1584449 (= e!884499 call!72546)))

(declare-fun b!1584450 () Bool)

(declare-fun e!884498 () List!36985)

(assert (=> b!1584450 (= e!884501 e!884498)))

(declare-fun c!146816 () Bool)

(assert (=> b!1584450 (= c!146816 (and ((_ is Cons!36981) (t!51891 (t!51891 l!1251))) (= (_1!12953 (h!38525 (t!51891 (t!51891 l!1251)))) newKey!123)))))

(declare-fun b!1584451 () Bool)

(declare-fun call!72544 () List!36985)

(assert (=> b!1584451 (= e!884498 call!72544)))

(declare-fun b!1584452 () Bool)

(declare-fun c!146817 () Bool)

(assert (=> b!1584452 (= e!884500 (ite c!146816 (t!51891 (t!51891 (t!51891 l!1251))) (ite c!146817 (Cons!36981 (h!38525 (t!51891 (t!51891 l!1251))) (t!51891 (t!51891 (t!51891 l!1251)))) Nil!36982)))))

(declare-fun bm!72542 () Bool)

(assert (=> bm!72542 (= call!72544 call!72545)))

(declare-fun b!1584453 () Bool)

(assert (=> b!1584453 (= e!884500 (insertStrictlySorted!627 (t!51891 (t!51891 (t!51891 l!1251))) newKey!123 newValue!123))))

(declare-fun b!1584454 () Bool)

(assert (=> b!1584454 (= c!146817 (and ((_ is Cons!36981) (t!51891 (t!51891 l!1251))) (bvsgt (_1!12953 (h!38525 (t!51891 (t!51891 l!1251)))) newKey!123)))))

(assert (=> b!1584454 (= e!884498 e!884499)))

(declare-fun bm!72543 () Bool)

(assert (=> bm!72543 (= call!72546 call!72544)))

(declare-fun b!1584455 () Bool)

(assert (=> b!1584455 (= e!884499 call!72546)))

(declare-fun b!1584456 () Bool)

(declare-fun lt!677007 () List!36985)

(declare-fun e!884497 () Bool)

(assert (=> b!1584456 (= e!884497 (contains!10480 lt!677007 (tuple2!25885 newKey!123 newValue!123)))))

(declare-fun b!1584448 () Bool)

(declare-fun res!1082289 () Bool)

(assert (=> b!1584448 (=> (not res!1082289) (not e!884497))))

(assert (=> b!1584448 (= res!1082289 (containsKey!1001 lt!677007 newKey!123))))

(declare-fun d!167275 () Bool)

(assert (=> d!167275 e!884497))

(declare-fun res!1082288 () Bool)

(assert (=> d!167275 (=> (not res!1082288) (not e!884497))))

(assert (=> d!167275 (= res!1082288 (isStrictlySorted!1167 lt!677007))))

(assert (=> d!167275 (= lt!677007 e!884501)))

(assert (=> d!167275 (= c!146815 (and ((_ is Cons!36981) (t!51891 (t!51891 l!1251))) (bvslt (_1!12953 (h!38525 (t!51891 (t!51891 l!1251)))) newKey!123)))))

(assert (=> d!167275 (isStrictlySorted!1167 (t!51891 (t!51891 l!1251)))))

(assert (=> d!167275 (= (insertStrictlySorted!627 (t!51891 (t!51891 l!1251)) newKey!123 newValue!123) lt!677007)))

(assert (= (and d!167275 c!146815) b!1584447))

(assert (= (and d!167275 (not c!146815)) b!1584450))

(assert (= (and b!1584450 c!146816) b!1584451))

(assert (= (and b!1584450 (not c!146816)) b!1584454))

(assert (= (and b!1584454 c!146817) b!1584455))

(assert (= (and b!1584454 (not c!146817)) b!1584449))

(assert (= (or b!1584455 b!1584449) bm!72543))

(assert (= (or b!1584451 bm!72543) bm!72542))

(assert (= (or b!1584447 bm!72542) bm!72541))

(assert (= (and bm!72541 c!146818) b!1584453))

(assert (= (and bm!72541 (not c!146818)) b!1584452))

(assert (= (and d!167275 res!1082288) b!1584448))

(assert (= (and b!1584448 res!1082289) b!1584456))

(declare-fun m!1453017 () Bool)

(assert (=> d!167275 m!1453017))

(assert (=> d!167275 m!1452987))

(declare-fun m!1453019 () Bool)

(assert (=> bm!72541 m!1453019))

(declare-fun m!1453021 () Bool)

(assert (=> b!1584448 m!1453021))

(declare-fun m!1453023 () Bool)

(assert (=> b!1584456 m!1453023))

(declare-fun m!1453025 () Bool)

(assert (=> b!1584453 m!1453025))

(assert (=> b!1584340 d!167275))

(declare-fun d!167277 () Bool)

(declare-fun res!1082290 () Bool)

(declare-fun e!884502 () Bool)

(assert (=> d!167277 (=> res!1082290 e!884502)))

(assert (=> d!167277 (= res!1082290 (and ((_ is Cons!36981) (t!51891 (t!51891 l!1251))) (= (_1!12953 (h!38525 (t!51891 (t!51891 l!1251)))) otherKey!56)))))

(assert (=> d!167277 (= (containsKey!1001 (t!51891 (t!51891 l!1251)) otherKey!56) e!884502)))

(declare-fun b!1584457 () Bool)

(declare-fun e!884503 () Bool)

(assert (=> b!1584457 (= e!884502 e!884503)))

(declare-fun res!1082291 () Bool)

(assert (=> b!1584457 (=> (not res!1082291) (not e!884503))))

(assert (=> b!1584457 (= res!1082291 (and (or (not ((_ is Cons!36981) (t!51891 (t!51891 l!1251)))) (bvsle (_1!12953 (h!38525 (t!51891 (t!51891 l!1251)))) otherKey!56)) ((_ is Cons!36981) (t!51891 (t!51891 l!1251))) (bvslt (_1!12953 (h!38525 (t!51891 (t!51891 l!1251)))) otherKey!56)))))

(declare-fun b!1584458 () Bool)

(assert (=> b!1584458 (= e!884503 (containsKey!1001 (t!51891 (t!51891 (t!51891 l!1251))) otherKey!56))))

(assert (= (and d!167277 (not res!1082290)) b!1584457))

(assert (= (and b!1584457 res!1082291) b!1584458))

(declare-fun m!1453027 () Bool)

(assert (=> b!1584458 m!1453027))

(assert (=> b!1584399 d!167277))

(declare-fun lt!677008 () Bool)

(declare-fun d!167279 () Bool)

(assert (=> d!167279 (= lt!677008 (select (content!851 lt!676989) (tuple2!25885 newKey!123 newValue!123)))))

(declare-fun e!884504 () Bool)

(assert (=> d!167279 (= lt!677008 e!884504)))

(declare-fun res!1082293 () Bool)

(assert (=> d!167279 (=> (not res!1082293) (not e!884504))))

(assert (=> d!167279 (= res!1082293 ((_ is Cons!36981) lt!676989))))

(assert (=> d!167279 (= (contains!10480 lt!676989 (tuple2!25885 newKey!123 newValue!123)) lt!677008)))

(declare-fun b!1584459 () Bool)

(declare-fun e!884505 () Bool)

(assert (=> b!1584459 (= e!884504 e!884505)))

(declare-fun res!1082292 () Bool)

(assert (=> b!1584459 (=> res!1082292 e!884505)))

(assert (=> b!1584459 (= res!1082292 (= (h!38525 lt!676989) (tuple2!25885 newKey!123 newValue!123)))))

(declare-fun b!1584460 () Bool)

(assert (=> b!1584460 (= e!884505 (contains!10480 (t!51891 lt!676989) (tuple2!25885 newKey!123 newValue!123)))))

(assert (= (and d!167279 res!1082293) b!1584459))

(assert (= (and b!1584459 (not res!1082292)) b!1584460))

(declare-fun m!1453029 () Bool)

(assert (=> d!167279 m!1453029))

(declare-fun m!1453031 () Bool)

(assert (=> d!167279 m!1453031))

(declare-fun m!1453033 () Bool)

(assert (=> b!1584460 m!1453033))

(assert (=> b!1584323 d!167279))

(declare-fun d!167281 () Bool)

(assert (=> d!167281 (= ($colon$colon!1026 e!884412 (ite c!146791 (h!38525 l!1251) (tuple2!25885 newKey!123 newValue!123))) (Cons!36981 (ite c!146791 (h!38525 l!1251) (tuple2!25885 newKey!123 newValue!123)) e!884412))))

(assert (=> bm!72523 d!167281))

(declare-fun b!1584461 () Bool)

(declare-fun e!884506 () Bool)

(declare-fun tp!115137 () Bool)

(assert (=> b!1584461 (= e!884506 (and tp_is_empty!39457 tp!115137))))

(assert (=> b!1584418 (= tp!115132 e!884506)))

(assert (= (and b!1584418 ((_ is Cons!36981) (t!51891 (t!51891 l!1251)))) b!1584461))

(check-sat (not b!1584442) (not d!167275) (not b!1584461) (not d!167269) (not d!167279) (not b!1584438) (not b!1584432) (not d!167263) (not b!1584430) (not b!1584444) (not b!1584428) (not bm!72541) (not b!1584456) (not b!1584448) (not b!1584460) tp_is_empty!39457 (not b!1584440) (not b!1584446) (not b!1584458) (not b!1584453))
(check-sat)
