; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1740 () Bool)

(assert start!1740)

(declare-fun res!9925 () Bool)

(declare-fun e!7313 () Bool)

(assert (=> start!1740 (=> (not res!9925) (not e!7313))))

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

(declare-fun isStrictlySorted!60 (List!366) Bool)

(assert (=> start!1740 (= res!9925 (isStrictlySorted!60 l!1094))))

(assert (=> start!1740 e!7313))

(declare-fun e!7311 () Bool)

(assert (=> start!1740 e!7311))

(declare-fun tp_is_empty!619 () Bool)

(assert (=> start!1740 tp_is_empty!619))

(assert (=> start!1740 true))

(declare-fun b!12237 () Bool)

(declare-fun tp!2060 () Bool)

(assert (=> b!12237 (= e!7311 (and tp_is_empty!619 tp!2060))))

(declare-fun b!12238 () Bool)

(declare-fun e!7312 () Bool)

(declare-fun ListPrimitiveSize!16 (List!366) Int)

(assert (=> b!12238 (= e!7312 (>= (ListPrimitiveSize!16 (t!2753 l!1094)) (ListPrimitiveSize!16 l!1094)))))

(declare-fun b!12239 () Bool)

(declare-fun res!9924 () Bool)

(assert (=> b!12239 (=> (not res!9924) (not e!7312))))

(declare-datatypes ((Option!50 0))(
  ( (Some!49 (v!1364 B!446)) (None!48) )
))
(declare-fun lt!3108 () Option!50)

(declare-fun key!303 () (_ BitVec 64))

(declare-fun getValueByKey!44 (List!366 (_ BitVec 64)) Option!50)

(assert (=> b!12239 (= res!9924 (= (getValueByKey!44 (t!2753 l!1094) key!303) lt!3108))))

(declare-fun b!12240 () Bool)

(assert (=> b!12240 (= e!7313 e!7312)))

(declare-fun res!9927 () Bool)

(assert (=> b!12240 (=> (not res!9927) (not e!7312))))

(assert (=> b!12240 (= res!9927 (= (getValueByKey!44 l!1094 key!303) lt!3108))))

(declare-fun v!194 () B!446)

(assert (=> b!12240 (= lt!3108 (Some!49 v!194))))

(declare-fun b!12241 () Bool)

(declare-fun res!9926 () Bool)

(assert (=> b!12241 (=> (not res!9926) (not e!7312))))

(get-info :version)

(assert (=> b!12241 (= res!9926 (and ((_ is Cons!362) l!1094) (not (= (_1!216 (h!928 l!1094)) key!303))))))

(declare-fun b!12242 () Bool)

(declare-fun res!9928 () Bool)

(assert (=> b!12242 (=> (not res!9928) (not e!7312))))

(assert (=> b!12242 (= res!9928 (isStrictlySorted!60 (t!2753 l!1094)))))

(assert (= (and start!1740 res!9925) b!12240))

(assert (= (and b!12240 res!9927) b!12241))

(assert (= (and b!12241 res!9926) b!12242))

(assert (= (and b!12242 res!9928) b!12239))

(assert (= (and b!12239 res!9924) b!12238))

(assert (= (and start!1740 ((_ is Cons!362) l!1094)) b!12237))

(declare-fun m!8397 () Bool)

(assert (=> b!12240 m!8397))

(declare-fun m!8399 () Bool)

(assert (=> start!1740 m!8399))

(declare-fun m!8401 () Bool)

(assert (=> b!12238 m!8401))

(declare-fun m!8403 () Bool)

(assert (=> b!12238 m!8403))

(declare-fun m!8405 () Bool)

(assert (=> b!12239 m!8405))

(declare-fun m!8407 () Bool)

(assert (=> b!12242 m!8407))

(check-sat (not b!12240) (not b!12237) (not b!12239) tp_is_empty!619 (not b!12242) (not start!1740) (not b!12238))
(check-sat)
(get-model)

(declare-fun b!12289 () Bool)

(declare-fun e!7337 () Option!50)

(assert (=> b!12289 (= e!7337 (getValueByKey!44 (t!2753 (t!2753 l!1094)) key!303))))

(declare-fun b!12288 () Bool)

(declare-fun e!7336 () Option!50)

(assert (=> b!12288 (= e!7336 e!7337)))

(declare-fun c!1070 () Bool)

(assert (=> b!12288 (= c!1070 (and ((_ is Cons!362) (t!2753 l!1094)) (not (= (_1!216 (h!928 (t!2753 l!1094))) key!303))))))

(declare-fun d!1715 () Bool)

(declare-fun c!1069 () Bool)

(assert (=> d!1715 (= c!1069 (and ((_ is Cons!362) (t!2753 l!1094)) (= (_1!216 (h!928 (t!2753 l!1094))) key!303)))))

(assert (=> d!1715 (= (getValueByKey!44 (t!2753 l!1094) key!303) e!7336)))

(declare-fun b!12290 () Bool)

(assert (=> b!12290 (= e!7337 None!48)))

(declare-fun b!12287 () Bool)

(assert (=> b!12287 (= e!7336 (Some!49 (_2!216 (h!928 (t!2753 l!1094)))))))

(assert (= (and d!1715 c!1069) b!12287))

(assert (= (and d!1715 (not c!1069)) b!12288))

(assert (= (and b!12288 c!1070) b!12289))

(assert (= (and b!12288 (not c!1070)) b!12290))

(declare-fun m!8433 () Bool)

(assert (=> b!12289 m!8433))

(assert (=> b!12239 d!1715))

(declare-fun b!12293 () Bool)

(declare-fun e!7339 () Option!50)

(assert (=> b!12293 (= e!7339 (getValueByKey!44 (t!2753 l!1094) key!303))))

(declare-fun b!12292 () Bool)

(declare-fun e!7338 () Option!50)

(assert (=> b!12292 (= e!7338 e!7339)))

(declare-fun c!1072 () Bool)

(assert (=> b!12292 (= c!1072 (and ((_ is Cons!362) l!1094) (not (= (_1!216 (h!928 l!1094)) key!303))))))

(declare-fun d!1717 () Bool)

(declare-fun c!1071 () Bool)

(assert (=> d!1717 (= c!1071 (and ((_ is Cons!362) l!1094) (= (_1!216 (h!928 l!1094)) key!303)))))

(assert (=> d!1717 (= (getValueByKey!44 l!1094 key!303) e!7338)))

(declare-fun b!12294 () Bool)

(assert (=> b!12294 (= e!7339 None!48)))

(declare-fun b!12291 () Bool)

(assert (=> b!12291 (= e!7338 (Some!49 (_2!216 (h!928 l!1094))))))

(assert (= (and d!1717 c!1071) b!12291))

(assert (= (and d!1717 (not c!1071)) b!12292))

(assert (= (and b!12292 c!1072) b!12293))

(assert (= (and b!12292 (not c!1072)) b!12294))

(assert (=> b!12293 m!8405))

(assert (=> b!12240 d!1717))

(declare-fun d!1719 () Bool)

(declare-fun res!9963 () Bool)

(declare-fun e!7344 () Bool)

(assert (=> d!1719 (=> res!9963 e!7344)))

(assert (=> d!1719 (= res!9963 (or ((_ is Nil!363) l!1094) ((_ is Nil!363) (t!2753 l!1094))))))

(assert (=> d!1719 (= (isStrictlySorted!60 l!1094) e!7344)))

(declare-fun b!12299 () Bool)

(declare-fun e!7345 () Bool)

(assert (=> b!12299 (= e!7344 e!7345)))

(declare-fun res!9964 () Bool)

(assert (=> b!12299 (=> (not res!9964) (not e!7345))))

(assert (=> b!12299 (= res!9964 (bvslt (_1!216 (h!928 l!1094)) (_1!216 (h!928 (t!2753 l!1094)))))))

(declare-fun b!12300 () Bool)

(assert (=> b!12300 (= e!7345 (isStrictlySorted!60 (t!2753 l!1094)))))

(assert (= (and d!1719 (not res!9963)) b!12299))

(assert (= (and b!12299 res!9964) b!12300))

(assert (=> b!12300 m!8407))

(assert (=> start!1740 d!1719))

(declare-fun d!1725 () Bool)

(declare-fun res!9965 () Bool)

(declare-fun e!7346 () Bool)

(assert (=> d!1725 (=> res!9965 e!7346)))

(assert (=> d!1725 (= res!9965 (or ((_ is Nil!363) (t!2753 l!1094)) ((_ is Nil!363) (t!2753 (t!2753 l!1094)))))))

(assert (=> d!1725 (= (isStrictlySorted!60 (t!2753 l!1094)) e!7346)))

(declare-fun b!12301 () Bool)

(declare-fun e!7347 () Bool)

(assert (=> b!12301 (= e!7346 e!7347)))

(declare-fun res!9966 () Bool)

(assert (=> b!12301 (=> (not res!9966) (not e!7347))))

(assert (=> b!12301 (= res!9966 (bvslt (_1!216 (h!928 (t!2753 l!1094))) (_1!216 (h!928 (t!2753 (t!2753 l!1094))))))))

(declare-fun b!12302 () Bool)

(assert (=> b!12302 (= e!7347 (isStrictlySorted!60 (t!2753 (t!2753 l!1094))))))

(assert (= (and d!1725 (not res!9965)) b!12301))

(assert (= (and b!12301 res!9966) b!12302))

(declare-fun m!8435 () Bool)

(assert (=> b!12302 m!8435))

(assert (=> b!12242 d!1725))

(declare-fun d!1727 () Bool)

(declare-fun lt!3119 () Int)

(assert (=> d!1727 (>= lt!3119 0)))

(declare-fun e!7356 () Int)

(assert (=> d!1727 (= lt!3119 e!7356)))

(declare-fun c!1081 () Bool)

(assert (=> d!1727 (= c!1081 ((_ is Nil!363) (t!2753 l!1094)))))

(assert (=> d!1727 (= (ListPrimitiveSize!16 (t!2753 l!1094)) lt!3119)))

(declare-fun b!12319 () Bool)

(assert (=> b!12319 (= e!7356 0)))

(declare-fun b!12320 () Bool)

(assert (=> b!12320 (= e!7356 (+ 1 (ListPrimitiveSize!16 (t!2753 (t!2753 l!1094)))))))

(assert (= (and d!1727 c!1081) b!12319))

(assert (= (and d!1727 (not c!1081)) b!12320))

(declare-fun m!8437 () Bool)

(assert (=> b!12320 m!8437))

(assert (=> b!12238 d!1727))

(declare-fun d!1729 () Bool)

(declare-fun lt!3120 () Int)

(assert (=> d!1729 (>= lt!3120 0)))

(declare-fun e!7357 () Int)

(assert (=> d!1729 (= lt!3120 e!7357)))

(declare-fun c!1082 () Bool)

(assert (=> d!1729 (= c!1082 ((_ is Nil!363) l!1094))))

(assert (=> d!1729 (= (ListPrimitiveSize!16 l!1094) lt!3120)))

(declare-fun b!12321 () Bool)

(assert (=> b!12321 (= e!7357 0)))

(declare-fun b!12322 () Bool)

(assert (=> b!12322 (= e!7357 (+ 1 (ListPrimitiveSize!16 (t!2753 l!1094))))))

(assert (= (and d!1729 c!1082) b!12321))

(assert (= (and d!1729 (not c!1082)) b!12322))

(assert (=> b!12322 m!8401))

(assert (=> b!12238 d!1729))

(declare-fun b!12331 () Bool)

(declare-fun e!7362 () Bool)

(declare-fun tp!2069 () Bool)

(assert (=> b!12331 (= e!7362 (and tp_is_empty!619 tp!2069))))

(assert (=> b!12237 (= tp!2060 e!7362)))

(assert (= (and b!12237 ((_ is Cons!362) (t!2753 l!1094))) b!12331))

(check-sat (not b!12322) (not b!12302) tp_is_empty!619 (not b!12331) (not b!12289) (not b!12320) (not b!12293) (not b!12300))
(check-sat)
