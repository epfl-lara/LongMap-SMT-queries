; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106350 () Bool)

(assert start!106350)

(declare-fun res!842346 () Bool)

(declare-fun e!720361 () Bool)

(assert (=> start!106350 (=> (not res!842346) (not e!720361))))

(declare-datatypes ((B!1952 0))(
  ( (B!1953 (val!16311 Int)) )
))
(declare-datatypes ((tuple2!21222 0))(
  ( (tuple2!21223 (_1!10622 (_ BitVec 64)) (_2!10622 B!1952)) )
))
(declare-datatypes ((List!28387 0))(
  ( (Nil!28384) (Cons!28383 (h!29592 tuple2!21222) (t!41899 List!28387)) )
))
(declare-fun l!706 () List!28387)

(declare-fun isStrictlySorted!777 (List!28387) Bool)

(assert (=> start!106350 (= res!842346 (isStrictlySorted!777 l!706))))

(assert (=> start!106350 e!720361))

(declare-fun e!720362 () Bool)

(assert (=> start!106350 e!720362))

(assert (=> start!106350 true))

(declare-fun tp_is_empty!32485 () Bool)

(assert (=> start!106350 tp_is_empty!32485))

(declare-fun b!1264960 () Bool)

(declare-fun tp!96293 () Bool)

(assert (=> b!1264960 (= e!720362 (and tp_is_empty!32485 tp!96293))))

(declare-fun b!1264961 () Bool)

(declare-fun res!842342 () Bool)

(assert (=> b!1264961 (=> (not res!842342) (not e!720361))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!638 (List!28387 (_ BitVec 64)) Bool)

(assert (=> b!1264961 (= res!842342 (not (containsKey!638 l!706 key1!31)))))

(declare-fun b!1264962 () Bool)

(declare-fun res!842344 () Bool)

(assert (=> b!1264962 (=> (not res!842344) (not e!720361))))

(assert (=> b!1264962 (= res!842344 (isStrictlySorted!777 (t!41899 l!706)))))

(declare-fun v1!26 () B!1952)

(declare-fun b!1264963 () Bool)

(declare-fun insertStrictlySorted!460 (List!28387 (_ BitVec 64) B!1952) List!28387)

(assert (=> b!1264963 (= e!720361 (not (isStrictlySorted!777 (insertStrictlySorted!460 l!706 key1!31 v1!26))))))

(declare-fun removeStrictlySorted!152 (List!28387 (_ BitVec 64)) List!28387)

(assert (=> b!1264963 (= (removeStrictlySorted!152 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26) key1!31) (t!41899 l!706))))

(declare-datatypes ((Unit!42027 0))(
  ( (Unit!42028) )
))
(declare-fun lt!573826 () Unit!42027)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!7 (List!28387 (_ BitVec 64) B!1952) Unit!42027)

(assert (=> b!1264963 (= lt!573826 (lemmaInsertStrictlySortedThenRemoveIsSame!7 (t!41899 l!706) key1!31 v1!26))))

(declare-fun b!1264964 () Bool)

(declare-fun res!842345 () Bool)

(assert (=> b!1264964 (=> (not res!842345) (not e!720361))))

(get-info :version)

(assert (=> b!1264964 (= res!842345 ((_ is Cons!28383) l!706))))

(declare-fun b!1264965 () Bool)

(declare-fun res!842343 () Bool)

(assert (=> b!1264965 (=> (not res!842343) (not e!720361))))

(assert (=> b!1264965 (= res!842343 (not (containsKey!638 (t!41899 l!706) key1!31)))))

(assert (= (and start!106350 res!842346) b!1264961))

(assert (= (and b!1264961 res!842342) b!1264964))

(assert (= (and b!1264964 res!842345) b!1264962))

(assert (= (and b!1264962 res!842344) b!1264965))

(assert (= (and b!1264965 res!842343) b!1264963))

(assert (= (and start!106350 ((_ is Cons!28383) l!706)) b!1264960))

(declare-fun m!1164893 () Bool)

(assert (=> b!1264963 m!1164893))

(declare-fun m!1164895 () Bool)

(assert (=> b!1264963 m!1164895))

(declare-fun m!1164897 () Bool)

(assert (=> b!1264963 m!1164897))

(declare-fun m!1164899 () Bool)

(assert (=> b!1264963 m!1164899))

(assert (=> b!1264963 m!1164897))

(declare-fun m!1164901 () Bool)

(assert (=> b!1264963 m!1164901))

(assert (=> b!1264963 m!1164893))

(declare-fun m!1164903 () Bool)

(assert (=> b!1264961 m!1164903))

(declare-fun m!1164905 () Bool)

(assert (=> b!1264962 m!1164905))

(declare-fun m!1164907 () Bool)

(assert (=> start!106350 m!1164907))

(declare-fun m!1164909 () Bool)

(assert (=> b!1264965 m!1164909))

(check-sat (not b!1264960) (not b!1264962) (not start!106350) (not b!1264965) tp_is_empty!32485 (not b!1264963) (not b!1264961))
(check-sat)
(get-model)

(declare-fun d!138713 () Bool)

(declare-fun res!842391 () Bool)

(declare-fun e!720389 () Bool)

(assert (=> d!138713 (=> res!842391 e!720389)))

(assert (=> d!138713 (= res!842391 (and ((_ is Cons!28383) (t!41899 l!706)) (= (_1!10622 (h!29592 (t!41899 l!706))) key1!31)))))

(assert (=> d!138713 (= (containsKey!638 (t!41899 l!706) key1!31) e!720389)))

(declare-fun b!1265016 () Bool)

(declare-fun e!720390 () Bool)

(assert (=> b!1265016 (= e!720389 e!720390)))

(declare-fun res!842392 () Bool)

(assert (=> b!1265016 (=> (not res!842392) (not e!720390))))

(assert (=> b!1265016 (= res!842392 (and (or (not ((_ is Cons!28383) (t!41899 l!706))) (bvsle (_1!10622 (h!29592 (t!41899 l!706))) key1!31)) ((_ is Cons!28383) (t!41899 l!706)) (bvslt (_1!10622 (h!29592 (t!41899 l!706))) key1!31)))))

(declare-fun b!1265017 () Bool)

(assert (=> b!1265017 (= e!720390 (containsKey!638 (t!41899 (t!41899 l!706)) key1!31))))

(assert (= (and d!138713 (not res!842391)) b!1265016))

(assert (= (and b!1265016 res!842392) b!1265017))

(declare-fun m!1164949 () Bool)

(assert (=> b!1265017 m!1164949))

(assert (=> b!1264965 d!138713))

(declare-fun d!138719 () Bool)

(declare-fun res!842405 () Bool)

(declare-fun e!720403 () Bool)

(assert (=> d!138719 (=> res!842405 e!720403)))

(assert (=> d!138719 (= res!842405 (or ((_ is Nil!28384) l!706) ((_ is Nil!28384) (t!41899 l!706))))))

(assert (=> d!138719 (= (isStrictlySorted!777 l!706) e!720403)))

(declare-fun b!1265030 () Bool)

(declare-fun e!720404 () Bool)

(assert (=> b!1265030 (= e!720403 e!720404)))

(declare-fun res!842406 () Bool)

(assert (=> b!1265030 (=> (not res!842406) (not e!720404))))

(assert (=> b!1265030 (= res!842406 (bvslt (_1!10622 (h!29592 l!706)) (_1!10622 (h!29592 (t!41899 l!706)))))))

(declare-fun b!1265031 () Bool)

(assert (=> b!1265031 (= e!720404 (isStrictlySorted!777 (t!41899 l!706)))))

(assert (= (and d!138719 (not res!842405)) b!1265030))

(assert (= (and b!1265030 res!842406) b!1265031))

(assert (=> b!1265031 m!1164905))

(assert (=> start!106350 d!138719))

(declare-fun b!1265069 () Bool)

(declare-fun e!720428 () List!28387)

(assert (=> b!1265069 (= e!720428 Nil!28384)))

(declare-fun b!1265070 () Bool)

(declare-fun $colon$colon!636 (List!28387 tuple2!21222) List!28387)

(assert (=> b!1265070 (= e!720428 ($colon$colon!636 (removeStrictlySorted!152 (t!41899 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26)) key1!31) (h!29592 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26))))))

(declare-fun d!138725 () Bool)

(declare-fun e!720430 () Bool)

(assert (=> d!138725 e!720430))

(declare-fun res!842416 () Bool)

(assert (=> d!138725 (=> (not res!842416) (not e!720430))))

(declare-fun lt!573840 () List!28387)

(assert (=> d!138725 (= res!842416 (isStrictlySorted!777 lt!573840))))

(declare-fun e!720429 () List!28387)

(assert (=> d!138725 (= lt!573840 e!720429)))

(declare-fun c!123214 () Bool)

(assert (=> d!138725 (= c!123214 (and ((_ is Cons!28383) (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26)) (= (_1!10622 (h!29592 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!138725 (isStrictlySorted!777 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26))))

(assert (=> d!138725 (= (removeStrictlySorted!152 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26) key1!31) lt!573840)))

(declare-fun b!1265071 () Bool)

(assert (=> b!1265071 (= e!720430 (not (containsKey!638 lt!573840 key1!31)))))

(declare-fun b!1265072 () Bool)

(assert (=> b!1265072 (= e!720429 e!720428)))

(declare-fun c!123215 () Bool)

(assert (=> b!1265072 (= c!123215 (and ((_ is Cons!28383) (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26)) (not (= (_1!10622 (h!29592 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26))) key1!31))))))

(declare-fun b!1265073 () Bool)

(assert (=> b!1265073 (= e!720429 (t!41899 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26)))))

(assert (= (and d!138725 c!123214) b!1265073))

(assert (= (and d!138725 (not c!123214)) b!1265072))

(assert (= (and b!1265072 c!123215) b!1265070))

(assert (= (and b!1265072 (not c!123215)) b!1265069))

(assert (= (and d!138725 res!842416) b!1265071))

(declare-fun m!1164965 () Bool)

(assert (=> b!1265070 m!1164965))

(assert (=> b!1265070 m!1164965))

(declare-fun m!1164967 () Bool)

(assert (=> b!1265070 m!1164967))

(declare-fun m!1164971 () Bool)

(assert (=> d!138725 m!1164971))

(assert (=> d!138725 m!1164897))

(declare-fun m!1164973 () Bool)

(assert (=> d!138725 m!1164973))

(declare-fun m!1164975 () Bool)

(assert (=> b!1265071 m!1164975))

(assert (=> b!1264963 d!138725))

(declare-fun b!1265149 () Bool)

(declare-fun e!720477 () List!28387)

(declare-fun call!62363 () List!28387)

(assert (=> b!1265149 (= e!720477 call!62363)))

(declare-fun b!1265150 () Bool)

(assert (=> b!1265150 (= e!720477 call!62363)))

(declare-fun bm!62359 () Bool)

(declare-fun call!62364 () List!28387)

(assert (=> bm!62359 (= call!62363 call!62364)))

(declare-fun c!123250 () Bool)

(declare-fun e!720469 () List!28387)

(declare-fun c!123248 () Bool)

(declare-fun b!1265151 () Bool)

(assert (=> b!1265151 (= e!720469 (ite c!123250 (t!41899 l!706) (ite c!123248 (Cons!28383 (h!29592 l!706) (t!41899 l!706)) Nil!28384)))))

(declare-fun b!1265152 () Bool)

(declare-fun res!842434 () Bool)

(declare-fun e!720470 () Bool)

(assert (=> b!1265152 (=> (not res!842434) (not e!720470))))

(declare-fun lt!573849 () List!28387)

(assert (=> b!1265152 (= res!842434 (containsKey!638 lt!573849 key1!31))))

(declare-fun b!1265154 () Bool)

(declare-fun e!720471 () List!28387)

(assert (=> b!1265154 (= e!720471 call!62364)))

(declare-fun c!123249 () Bool)

(declare-fun bm!62360 () Bool)

(declare-fun call!62362 () List!28387)

(assert (=> bm!62360 (= call!62362 ($colon$colon!636 e!720469 (ite c!123249 (h!29592 l!706) (tuple2!21223 key1!31 v1!26))))))

(declare-fun c!123246 () Bool)

(assert (=> bm!62360 (= c!123246 c!123249)))

(declare-fun bm!62362 () Bool)

(assert (=> bm!62362 (= call!62364 call!62362)))

(declare-fun b!1265158 () Bool)

(declare-fun e!720474 () List!28387)

(assert (=> b!1265158 (= e!720474 e!720471)))

(assert (=> b!1265158 (= c!123250 (and ((_ is Cons!28383) l!706) (= (_1!10622 (h!29592 l!706)) key1!31)))))

(declare-fun b!1265160 () Bool)

(assert (=> b!1265160 (= e!720469 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26))))

(declare-fun b!1265157 () Bool)

(assert (=> b!1265157 (= e!720474 call!62362)))

(declare-fun d!138731 () Bool)

(assert (=> d!138731 e!720470))

(declare-fun res!842433 () Bool)

(assert (=> d!138731 (=> (not res!842433) (not e!720470))))

(assert (=> d!138731 (= res!842433 (isStrictlySorted!777 lt!573849))))

(assert (=> d!138731 (= lt!573849 e!720474)))

(assert (=> d!138731 (= c!123249 (and ((_ is Cons!28383) l!706) (bvslt (_1!10622 (h!29592 l!706)) key1!31)))))

(assert (=> d!138731 (isStrictlySorted!777 l!706)))

(assert (=> d!138731 (= (insertStrictlySorted!460 l!706 key1!31 v1!26) lt!573849)))

(declare-fun b!1265161 () Bool)

(assert (=> b!1265161 (= c!123248 (and ((_ is Cons!28383) l!706) (bvsgt (_1!10622 (h!29592 l!706)) key1!31)))))

(assert (=> b!1265161 (= e!720471 e!720477)))

(declare-fun b!1265163 () Bool)

(declare-fun contains!7604 (List!28387 tuple2!21222) Bool)

(assert (=> b!1265163 (= e!720470 (contains!7604 lt!573849 (tuple2!21223 key1!31 v1!26)))))

(assert (= (and d!138731 c!123249) b!1265157))

(assert (= (and d!138731 (not c!123249)) b!1265158))

(assert (= (and b!1265158 c!123250) b!1265154))

(assert (= (and b!1265158 (not c!123250)) b!1265161))

(assert (= (and b!1265161 c!123248) b!1265150))

(assert (= (and b!1265161 (not c!123248)) b!1265149))

(assert (= (or b!1265150 b!1265149) bm!62359))

(assert (= (or b!1265154 bm!62359) bm!62362))

(assert (= (or b!1265157 bm!62362) bm!62360))

(assert (= (and bm!62360 c!123246) b!1265160))

(assert (= (and bm!62360 (not c!123246)) b!1265151))

(assert (= (and d!138731 res!842433) b!1265152))

(assert (= (and b!1265152 res!842434) b!1265163))

(assert (=> b!1265160 m!1164897))

(declare-fun m!1164997 () Bool)

(assert (=> b!1265163 m!1164997))

(declare-fun m!1164999 () Bool)

(assert (=> b!1265152 m!1164999))

(declare-fun m!1165001 () Bool)

(assert (=> d!138731 m!1165001))

(assert (=> d!138731 m!1164907))

(declare-fun m!1165007 () Bool)

(assert (=> bm!62360 m!1165007))

(assert (=> b!1264963 d!138731))

(declare-fun d!138739 () Bool)

(assert (=> d!138739 (= (removeStrictlySorted!152 (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26) key1!31) (t!41899 l!706))))

(declare-fun lt!573859 () Unit!42027)

(declare-fun choose!1892 (List!28387 (_ BitVec 64) B!1952) Unit!42027)

(assert (=> d!138739 (= lt!573859 (choose!1892 (t!41899 l!706) key1!31 v1!26))))

(assert (=> d!138739 (isStrictlySorted!777 (t!41899 l!706))))

(assert (=> d!138739 (= (lemmaInsertStrictlySortedThenRemoveIsSame!7 (t!41899 l!706) key1!31 v1!26) lt!573859)))

(declare-fun bs!35783 () Bool)

(assert (= bs!35783 d!138739))

(assert (=> bs!35783 m!1164897))

(assert (=> bs!35783 m!1164897))

(assert (=> bs!35783 m!1164901))

(declare-fun m!1165021 () Bool)

(assert (=> bs!35783 m!1165021))

(assert (=> bs!35783 m!1164905))

(assert (=> b!1264963 d!138739))

(declare-fun b!1265179 () Bool)

(declare-fun e!720493 () List!28387)

(declare-fun call!62372 () List!28387)

(assert (=> b!1265179 (= e!720493 call!62372)))

(declare-fun b!1265180 () Bool)

(assert (=> b!1265180 (= e!720493 call!62372)))

(declare-fun bm!62368 () Bool)

(declare-fun call!62374 () List!28387)

(assert (=> bm!62368 (= call!62372 call!62374)))

(declare-fun c!123260 () Bool)

(declare-fun c!123263 () Bool)

(declare-fun b!1265182 () Bool)

(declare-fun e!720484 () List!28387)

(assert (=> b!1265182 (= e!720484 (ite c!123263 (t!41899 (t!41899 l!706)) (ite c!123260 (Cons!28383 (h!29592 (t!41899 l!706)) (t!41899 (t!41899 l!706))) Nil!28384)))))

(declare-fun b!1265184 () Bool)

(declare-fun res!842440 () Bool)

(declare-fun e!720485 () Bool)

(assert (=> b!1265184 (=> (not res!842440) (not e!720485))))

(declare-fun lt!573861 () List!28387)

(assert (=> b!1265184 (= res!842440 (containsKey!638 lt!573861 key1!31))))

(declare-fun b!1265186 () Bool)

(declare-fun e!720487 () List!28387)

(assert (=> b!1265186 (= e!720487 call!62374)))

(declare-fun c!123261 () Bool)

(declare-fun bm!62372 () Bool)

(declare-fun call!62371 () List!28387)

(assert (=> bm!62372 (= call!62371 ($colon$colon!636 e!720484 (ite c!123261 (h!29592 (t!41899 l!706)) (tuple2!21223 key1!31 v1!26))))))

(declare-fun c!123258 () Bool)

(assert (=> bm!62372 (= c!123258 c!123261)))

(declare-fun bm!62373 () Bool)

(assert (=> bm!62373 (= call!62374 call!62371)))

(declare-fun b!1265195 () Bool)

(declare-fun e!720491 () List!28387)

(assert (=> b!1265195 (= e!720491 e!720487)))

(assert (=> b!1265195 (= c!123263 (and ((_ is Cons!28383) (t!41899 l!706)) (= (_1!10622 (h!29592 (t!41899 l!706))) key1!31)))))

(declare-fun b!1265196 () Bool)

(assert (=> b!1265196 (= e!720484 (insertStrictlySorted!460 (t!41899 (t!41899 l!706)) key1!31 v1!26))))

(declare-fun b!1265194 () Bool)

(assert (=> b!1265194 (= e!720491 call!62371)))

(declare-fun d!138745 () Bool)

(assert (=> d!138745 e!720485))

(declare-fun res!842439 () Bool)

(assert (=> d!138745 (=> (not res!842439) (not e!720485))))

(assert (=> d!138745 (= res!842439 (isStrictlySorted!777 lt!573861))))

(assert (=> d!138745 (= lt!573861 e!720491)))

(assert (=> d!138745 (= c!123261 (and ((_ is Cons!28383) (t!41899 l!706)) (bvslt (_1!10622 (h!29592 (t!41899 l!706))) key1!31)))))

(assert (=> d!138745 (isStrictlySorted!777 (t!41899 l!706))))

(assert (=> d!138745 (= (insertStrictlySorted!460 (t!41899 l!706) key1!31 v1!26) lt!573861)))

(declare-fun b!1265197 () Bool)

(assert (=> b!1265197 (= c!123260 (and ((_ is Cons!28383) (t!41899 l!706)) (bvsgt (_1!10622 (h!29592 (t!41899 l!706))) key1!31)))))

(assert (=> b!1265197 (= e!720487 e!720493)))

(declare-fun b!1265198 () Bool)

(assert (=> b!1265198 (= e!720485 (contains!7604 lt!573861 (tuple2!21223 key1!31 v1!26)))))

(assert (= (and d!138745 c!123261) b!1265194))

(assert (= (and d!138745 (not c!123261)) b!1265195))

(assert (= (and b!1265195 c!123263) b!1265186))

(assert (= (and b!1265195 (not c!123263)) b!1265197))

(assert (= (and b!1265197 c!123260) b!1265180))

(assert (= (and b!1265197 (not c!123260)) b!1265179))

(assert (= (or b!1265180 b!1265179) bm!62368))

(assert (= (or b!1265186 bm!62368) bm!62373))

(assert (= (or b!1265194 bm!62373) bm!62372))

(assert (= (and bm!62372 c!123258) b!1265196))

(assert (= (and bm!62372 (not c!123258)) b!1265182))

(assert (= (and d!138745 res!842439) b!1265184))

(assert (= (and b!1265184 res!842440) b!1265198))

(declare-fun m!1165027 () Bool)

(assert (=> b!1265196 m!1165027))

(declare-fun m!1165031 () Bool)

(assert (=> b!1265198 m!1165031))

(declare-fun m!1165033 () Bool)

(assert (=> b!1265184 m!1165033))

(declare-fun m!1165035 () Bool)

(assert (=> d!138745 m!1165035))

(assert (=> d!138745 m!1164905))

(declare-fun m!1165043 () Bool)

(assert (=> bm!62372 m!1165043))

(assert (=> b!1264963 d!138745))

(declare-fun d!138751 () Bool)

(declare-fun res!842448 () Bool)

(declare-fun e!720500 () Bool)

(assert (=> d!138751 (=> res!842448 e!720500)))

(assert (=> d!138751 (= res!842448 (or ((_ is Nil!28384) (insertStrictlySorted!460 l!706 key1!31 v1!26)) ((_ is Nil!28384) (t!41899 (insertStrictlySorted!460 l!706 key1!31 v1!26)))))))

(assert (=> d!138751 (= (isStrictlySorted!777 (insertStrictlySorted!460 l!706 key1!31 v1!26)) e!720500)))

(declare-fun b!1265205 () Bool)

(declare-fun e!720501 () Bool)

(assert (=> b!1265205 (= e!720500 e!720501)))

(declare-fun res!842449 () Bool)

(assert (=> b!1265205 (=> (not res!842449) (not e!720501))))

(assert (=> b!1265205 (= res!842449 (bvslt (_1!10622 (h!29592 (insertStrictlySorted!460 l!706 key1!31 v1!26))) (_1!10622 (h!29592 (t!41899 (insertStrictlySorted!460 l!706 key1!31 v1!26))))))))

(declare-fun b!1265206 () Bool)

(assert (=> b!1265206 (= e!720501 (isStrictlySorted!777 (t!41899 (insertStrictlySorted!460 l!706 key1!31 v1!26))))))

(assert (= (and d!138751 (not res!842448)) b!1265205))

(assert (= (and b!1265205 res!842449) b!1265206))

(declare-fun m!1165047 () Bool)

(assert (=> b!1265206 m!1165047))

(assert (=> b!1264963 d!138751))

(declare-fun d!138755 () Bool)

(declare-fun res!842454 () Bool)

(declare-fun e!720506 () Bool)

(assert (=> d!138755 (=> res!842454 e!720506)))

(assert (=> d!138755 (= res!842454 (and ((_ is Cons!28383) l!706) (= (_1!10622 (h!29592 l!706)) key1!31)))))

(assert (=> d!138755 (= (containsKey!638 l!706 key1!31) e!720506)))

(declare-fun b!1265211 () Bool)

(declare-fun e!720507 () Bool)

(assert (=> b!1265211 (= e!720506 e!720507)))

(declare-fun res!842455 () Bool)

(assert (=> b!1265211 (=> (not res!842455) (not e!720507))))

(assert (=> b!1265211 (= res!842455 (and (or (not ((_ is Cons!28383) l!706)) (bvsle (_1!10622 (h!29592 l!706)) key1!31)) ((_ is Cons!28383) l!706) (bvslt (_1!10622 (h!29592 l!706)) key1!31)))))

(declare-fun b!1265212 () Bool)

(assert (=> b!1265212 (= e!720507 (containsKey!638 (t!41899 l!706) key1!31))))

(assert (= (and d!138755 (not res!842454)) b!1265211))

(assert (= (and b!1265211 res!842455) b!1265212))

(assert (=> b!1265212 m!1164909))

(assert (=> b!1264961 d!138755))

(declare-fun d!138761 () Bool)

(declare-fun res!842460 () Bool)

(declare-fun e!720512 () Bool)

(assert (=> d!138761 (=> res!842460 e!720512)))

(assert (=> d!138761 (= res!842460 (or ((_ is Nil!28384) (t!41899 l!706)) ((_ is Nil!28384) (t!41899 (t!41899 l!706)))))))

(assert (=> d!138761 (= (isStrictlySorted!777 (t!41899 l!706)) e!720512)))

(declare-fun b!1265217 () Bool)

(declare-fun e!720513 () Bool)

(assert (=> b!1265217 (= e!720512 e!720513)))

(declare-fun res!842461 () Bool)

(assert (=> b!1265217 (=> (not res!842461) (not e!720513))))

(assert (=> b!1265217 (= res!842461 (bvslt (_1!10622 (h!29592 (t!41899 l!706))) (_1!10622 (h!29592 (t!41899 (t!41899 l!706))))))))

(declare-fun b!1265218 () Bool)

(assert (=> b!1265218 (= e!720513 (isStrictlySorted!777 (t!41899 (t!41899 l!706))))))

(assert (= (and d!138761 (not res!842460)) b!1265217))

(assert (= (and b!1265217 res!842461) b!1265218))

(declare-fun m!1165051 () Bool)

(assert (=> b!1265218 m!1165051))

(assert (=> b!1264962 d!138761))

(declare-fun b!1265234 () Bool)

(declare-fun e!720523 () Bool)

(declare-fun tp!96307 () Bool)

(assert (=> b!1265234 (= e!720523 (and tp_is_empty!32485 tp!96307))))

(assert (=> b!1264960 (= tp!96293 e!720523)))

(assert (= (and b!1264960 ((_ is Cons!28383) (t!41899 l!706))) b!1265234))

(check-sat (not b!1265160) (not b!1265071) (not bm!62360) (not b!1265234) (not b!1265017) (not d!138739) (not b!1265206) (not d!138731) (not d!138725) (not b!1265212) (not b!1265184) (not b!1265031) (not b!1265070) (not b!1265196) (not b!1265163) (not b!1265198) (not d!138745) (not b!1265152) (not b!1265218) tp_is_empty!32485 (not bm!62372))
(check-sat)
