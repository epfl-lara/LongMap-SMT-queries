; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1740 () Bool)

(assert start!1740)

(declare-fun b!12231 () Bool)

(declare-fun e!7307 () Bool)

(declare-datatypes ((B!446 0))(
  ( (B!447 (val!318 Int)) )
))
(declare-datatypes ((tuple2!432 0))(
  ( (tuple2!433 (_1!216 (_ BitVec 64)) (_2!216 B!446)) )
))
(declare-datatypes ((List!366 0))(
  ( (Nil!363) (Cons!362 (h!928 tuple2!432) (t!2753 List!366)) )
))
(declare-fun l!1094 () List!366)

(declare-fun ListPrimitiveSize!16 (List!366) Int)

(assert (=> b!12231 (= e!7307 (>= (ListPrimitiveSize!16 (t!2753 l!1094)) (ListPrimitiveSize!16 l!1094)))))

(declare-fun b!12232 () Bool)

(declare-fun res!9925 () Bool)

(assert (=> b!12232 (=> (not res!9925) (not e!7307))))

(declare-fun isStrictlySorted!57 (List!366) Bool)

(assert (=> b!12232 (= res!9925 (isStrictlySorted!57 (t!2753 l!1094)))))

(declare-fun b!12233 () Bool)

(declare-fun res!9922 () Bool)

(assert (=> b!12233 (=> (not res!9922) (not e!7307))))

(declare-datatypes ((Option!50 0))(
  ( (Some!49 (v!1364 B!446)) (None!48) )
))
(declare-fun lt!3108 () Option!50)

(declare-fun key!303 () (_ BitVec 64))

(declare-fun getValueByKey!44 (List!366 (_ BitVec 64)) Option!50)

(assert (=> b!12233 (= res!9922 (= (getValueByKey!44 (t!2753 l!1094) key!303) lt!3108))))

(declare-fun b!12234 () Bool)

(declare-fun e!7309 () Bool)

(declare-fun tp_is_empty!619 () Bool)

(declare-fun tp!2060 () Bool)

(assert (=> b!12234 (= e!7309 (and tp_is_empty!619 tp!2060))))

(declare-fun b!12235 () Bool)

(declare-fun e!7308 () Bool)

(assert (=> b!12235 (= e!7308 e!7307)))

(declare-fun res!9926 () Bool)

(assert (=> b!12235 (=> (not res!9926) (not e!7307))))

(assert (=> b!12235 (= res!9926 (= (getValueByKey!44 l!1094 key!303) lt!3108))))

(declare-fun v!194 () B!446)

(assert (=> b!12235 (= lt!3108 (Some!49 v!194))))

(declare-fun b!12236 () Bool)

(declare-fun res!9924 () Bool)

(assert (=> b!12236 (=> (not res!9924) (not e!7307))))

(get-info :version)

(assert (=> b!12236 (= res!9924 (and ((_ is Cons!362) l!1094) (not (= (_1!216 (h!928 l!1094)) key!303))))))

(declare-fun res!9923 () Bool)

(assert (=> start!1740 (=> (not res!9923) (not e!7308))))

(assert (=> start!1740 (= res!9923 (isStrictlySorted!57 l!1094))))

(assert (=> start!1740 e!7308))

(assert (=> start!1740 e!7309))

(assert (=> start!1740 tp_is_empty!619))

(assert (=> start!1740 true))

(assert (= (and start!1740 res!9923) b!12235))

(assert (= (and b!12235 res!9926) b!12236))

(assert (= (and b!12236 res!9924) b!12232))

(assert (= (and b!12232 res!9925) b!12233))

(assert (= (and b!12233 res!9922) b!12231))

(assert (= (and start!1740 ((_ is Cons!362) l!1094)) b!12234))

(declare-fun m!8391 () Bool)

(assert (=> b!12233 m!8391))

(declare-fun m!8393 () Bool)

(assert (=> b!12231 m!8393))

(declare-fun m!8395 () Bool)

(assert (=> b!12231 m!8395))

(declare-fun m!8397 () Bool)

(assert (=> b!12235 m!8397))

(declare-fun m!8399 () Bool)

(assert (=> start!1740 m!8399))

(declare-fun m!8401 () Bool)

(assert (=> b!12232 m!8401))

(check-sat (not b!12232) (not b!12231) (not b!12235) (not b!12233) (not start!1740) tp_is_empty!619 (not b!12234))
(check-sat)
(get-model)

(declare-fun b!12288 () Bool)

(declare-fun e!7335 () Option!50)

(declare-fun e!7336 () Option!50)

(assert (=> b!12288 (= e!7335 e!7336)))

(declare-fun c!1071 () Bool)

(assert (=> b!12288 (= c!1071 (and ((_ is Cons!362) (t!2753 l!1094)) (not (= (_1!216 (h!928 (t!2753 l!1094))) key!303))))))

(declare-fun b!12287 () Bool)

(assert (=> b!12287 (= e!7335 (Some!49 (_2!216 (h!928 (t!2753 l!1094)))))))

(declare-fun b!12290 () Bool)

(assert (=> b!12290 (= e!7336 None!48)))

(declare-fun d!1711 () Bool)

(declare-fun c!1070 () Bool)

(assert (=> d!1711 (= c!1070 (and ((_ is Cons!362) (t!2753 l!1094)) (= (_1!216 (h!928 (t!2753 l!1094))) key!303)))))

(assert (=> d!1711 (= (getValueByKey!44 (t!2753 l!1094) key!303) e!7335)))

(declare-fun b!12289 () Bool)

(assert (=> b!12289 (= e!7336 (getValueByKey!44 (t!2753 (t!2753 l!1094)) key!303))))

(assert (= (and d!1711 c!1070) b!12287))

(assert (= (and d!1711 (not c!1070)) b!12288))

(assert (= (and b!12288 c!1071) b!12289))

(assert (= (and b!12288 (not c!1071)) b!12290))

(declare-fun m!8429 () Bool)

(assert (=> b!12289 m!8429))

(assert (=> b!12233 d!1711))

(declare-fun d!1719 () Bool)

(declare-fun res!9965 () Bool)

(declare-fun e!7354 () Bool)

(assert (=> d!1719 (=> res!9965 e!7354)))

(assert (=> d!1719 (= res!9965 (or ((_ is Nil!363) l!1094) ((_ is Nil!363) (t!2753 l!1094))))))

(assert (=> d!1719 (= (isStrictlySorted!57 l!1094) e!7354)))

(declare-fun b!12317 () Bool)

(declare-fun e!7355 () Bool)

(assert (=> b!12317 (= e!7354 e!7355)))

(declare-fun res!9966 () Bool)

(assert (=> b!12317 (=> (not res!9966) (not e!7355))))

(assert (=> b!12317 (= res!9966 (bvslt (_1!216 (h!928 l!1094)) (_1!216 (h!928 (t!2753 l!1094)))))))

(declare-fun b!12318 () Bool)

(assert (=> b!12318 (= e!7355 (isStrictlySorted!57 (t!2753 l!1094)))))

(assert (= (and d!1719 (not res!9965)) b!12317))

(assert (= (and b!12317 res!9966) b!12318))

(assert (=> b!12318 m!8401))

(assert (=> start!1740 d!1719))

(declare-fun b!12322 () Bool)

(declare-fun e!7358 () Option!50)

(declare-fun e!7359 () Option!50)

(assert (=> b!12322 (= e!7358 e!7359)))

(declare-fun c!1082 () Bool)

(assert (=> b!12322 (= c!1082 (and ((_ is Cons!362) l!1094) (not (= (_1!216 (h!928 l!1094)) key!303))))))

(declare-fun b!12321 () Bool)

(assert (=> b!12321 (= e!7358 (Some!49 (_2!216 (h!928 l!1094))))))

(declare-fun b!12324 () Bool)

(assert (=> b!12324 (= e!7359 None!48)))

(declare-fun d!1727 () Bool)

(declare-fun c!1081 () Bool)

(assert (=> d!1727 (= c!1081 (and ((_ is Cons!362) l!1094) (= (_1!216 (h!928 l!1094)) key!303)))))

(assert (=> d!1727 (= (getValueByKey!44 l!1094 key!303) e!7358)))

(declare-fun b!12323 () Bool)

(assert (=> b!12323 (= e!7359 (getValueByKey!44 (t!2753 l!1094) key!303))))

(assert (= (and d!1727 c!1081) b!12321))

(assert (= (and d!1727 (not c!1081)) b!12322))

(assert (= (and b!12322 c!1082) b!12323))

(assert (= (and b!12322 (not c!1082)) b!12324))

(assert (=> b!12323 m!8391))

(assert (=> b!12235 d!1727))

(declare-fun d!1731 () Bool)

(declare-fun lt!3121 () Int)

(assert (=> d!1731 (>= lt!3121 0)))

(declare-fun e!7374 () Int)

(assert (=> d!1731 (= lt!3121 e!7374)))

(declare-fun c!1089 () Bool)

(assert (=> d!1731 (= c!1089 ((_ is Nil!363) (t!2753 l!1094)))))

(assert (=> d!1731 (= (ListPrimitiveSize!16 (t!2753 l!1094)) lt!3121)))

(declare-fun b!12345 () Bool)

(assert (=> b!12345 (= e!7374 0)))

(declare-fun b!12346 () Bool)

(assert (=> b!12346 (= e!7374 (+ 1 (ListPrimitiveSize!16 (t!2753 (t!2753 l!1094)))))))

(assert (= (and d!1731 c!1089) b!12345))

(assert (= (and d!1731 (not c!1089)) b!12346))

(declare-fun m!8437 () Bool)

(assert (=> b!12346 m!8437))

(assert (=> b!12231 d!1731))

(declare-fun d!1737 () Bool)

(declare-fun lt!3124 () Int)

(assert (=> d!1737 (>= lt!3124 0)))

(declare-fun e!7377 () Int)

(assert (=> d!1737 (= lt!3124 e!7377)))

(declare-fun c!1092 () Bool)

(assert (=> d!1737 (= c!1092 ((_ is Nil!363) l!1094))))

(assert (=> d!1737 (= (ListPrimitiveSize!16 l!1094) lt!3124)))

(declare-fun b!12351 () Bool)

(assert (=> b!12351 (= e!7377 0)))

(declare-fun b!12352 () Bool)

(assert (=> b!12352 (= e!7377 (+ 1 (ListPrimitiveSize!16 (t!2753 l!1094))))))

(assert (= (and d!1737 c!1092) b!12351))

(assert (= (and d!1737 (not c!1092)) b!12352))

(assert (=> b!12352 m!8393))

(assert (=> b!12231 d!1737))

(declare-fun d!1739 () Bool)

(declare-fun res!9977 () Bool)

(declare-fun e!7379 () Bool)

(assert (=> d!1739 (=> res!9977 e!7379)))

(assert (=> d!1739 (= res!9977 (or ((_ is Nil!363) (t!2753 l!1094)) ((_ is Nil!363) (t!2753 (t!2753 l!1094)))))))

(assert (=> d!1739 (= (isStrictlySorted!57 (t!2753 l!1094)) e!7379)))

(declare-fun b!12354 () Bool)

(declare-fun e!7381 () Bool)

(assert (=> b!12354 (= e!7379 e!7381)))

(declare-fun res!9978 () Bool)

(assert (=> b!12354 (=> (not res!9978) (not e!7381))))

(assert (=> b!12354 (= res!9978 (bvslt (_1!216 (h!928 (t!2753 l!1094))) (_1!216 (h!928 (t!2753 (t!2753 l!1094))))))))

(declare-fun b!12356 () Bool)

(assert (=> b!12356 (= e!7381 (isStrictlySorted!57 (t!2753 (t!2753 l!1094))))))

(assert (= (and d!1739 (not res!9977)) b!12354))

(assert (= (and b!12354 res!9978) b!12356))

(declare-fun m!8439 () Bool)

(assert (=> b!12356 m!8439))

(assert (=> b!12232 d!1739))

(declare-fun b!12377 () Bool)

(declare-fun e!7392 () Bool)

(declare-fun tp!2069 () Bool)

(assert (=> b!12377 (= e!7392 (and tp_is_empty!619 tp!2069))))

(assert (=> b!12234 (= tp!2060 e!7392)))

(assert (= (and b!12234 ((_ is Cons!362) (t!2753 l!1094))) b!12377))

(check-sat (not b!12352) tp_is_empty!619 (not b!12318) (not b!12356) (not b!12323) (not b!12346) (not b!12289) (not b!12377))
(check-sat)
