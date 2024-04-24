; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137670 () Bool)

(assert start!137670)

(declare-fun b!1583264 () Bool)

(declare-fun e!883469 () Bool)

(declare-datatypes ((B!2676 0))(
  ( (B!2677 (val!19700 Int)) )
))
(declare-datatypes ((tuple2!25596 0))(
  ( (tuple2!25597 (_1!12809 (_ BitVec 64)) (_2!12809 B!2676)) )
))
(declare-datatypes ((List!36852 0))(
  ( (Nil!36849) (Cons!36848 (h!38409 tuple2!25596) (t!51758 List!36852)) )
))
(declare-datatypes ((tuple2!25598 0))(
  ( (tuple2!25599 (_1!12810 tuple2!25596) (_2!12810 List!36852)) )
))
(declare-datatypes ((Option!905 0))(
  ( (Some!904 (v!22405 tuple2!25598)) (None!903) )
))
(declare-fun lt!677721 () Option!905)

(declare-fun get!26844 (Option!905) tuple2!25598)

(assert (=> b!1583264 (= e!883469 (not (is-Nil!36849 (_2!12810 (get!26844 lt!677721)))))))

(declare-fun res!1080808 () Bool)

(declare-fun e!883465 () Bool)

(assert (=> start!137670 (=> (not res!1080808) (not e!883465))))

(declare-fun l!1390 () List!36852)

(declare-fun isStrictlySorted!1066 (List!36852) Bool)

(assert (=> start!137670 (= res!1080808 (isStrictlySorted!1066 l!1390))))

(assert (=> start!137670 e!883465))

(declare-fun e!883468 () Bool)

(assert (=> start!137670 e!883468))

(assert (=> start!137670 true))

(declare-fun tp_is_empty!39221 () Bool)

(assert (=> start!137670 tp_is_empty!39221))

(declare-fun b!1583265 () Bool)

(declare-fun e!883467 () Bool)

(declare-fun e!883466 () Bool)

(assert (=> b!1583265 (= e!883467 e!883466)))

(declare-fun res!1080806 () Bool)

(assert (=> b!1583265 (=> res!1080806 e!883466)))

(assert (=> b!1583265 (= res!1080806 (not (isStrictlySorted!1066 (t!51758 l!1390))))))

(declare-fun b!1583266 () Bool)

(declare-fun res!1080809 () Bool)

(assert (=> b!1583266 (=> (not res!1080809) (not e!883467))))

(declare-fun key!405 () (_ BitVec 64))

(assert (=> b!1583266 (= res!1080809 (and (is-Cons!36848 l!1390) (= (_1!12809 (h!38409 l!1390)) key!405)))))

(declare-fun b!1583267 () Bool)

(declare-fun res!1080811 () Bool)

(assert (=> b!1583267 (=> (not res!1080811) (not e!883465))))

(declare-fun containsKey!925 (List!36852 (_ BitVec 64)) Bool)

(assert (=> b!1583267 (= res!1080811 (containsKey!925 l!1390 key!405))))

(declare-fun b!1583268 () Bool)

(declare-fun tp!114513 () Bool)

(assert (=> b!1583268 (= e!883468 (and tp_is_empty!39221 tp!114513))))

(declare-fun b!1583269 () Bool)

(assert (=> b!1583269 (= e!883466 (containsKey!925 (t!51758 l!1390) key!405))))

(declare-fun b!1583270 () Bool)

(assert (=> b!1583270 (= e!883465 e!883467)))

(declare-fun res!1080807 () Bool)

(assert (=> b!1583270 (=> (not res!1080807) (not e!883467))))

(assert (=> b!1583270 (= res!1080807 e!883469)))

(declare-fun res!1080812 () Bool)

(assert (=> b!1583270 (=> res!1080812 e!883469)))

(declare-fun isEmpty!1174 (Option!905) Bool)

(assert (=> b!1583270 (= res!1080812 (isEmpty!1174 lt!677721))))

(declare-fun unapply!87 (List!36852) Option!905)

(assert (=> b!1583270 (= lt!677721 (unapply!87 l!1390))))

(declare-fun b!1583271 () Bool)

(declare-fun res!1080810 () Bool)

(assert (=> b!1583271 (=> (not res!1080810) (not e!883465))))

(declare-fun value!194 () B!2676)

(declare-fun contains!10537 (List!36852 tuple2!25596) Bool)

(assert (=> b!1583271 (= res!1080810 (contains!10537 l!1390 (tuple2!25597 key!405 value!194)))))

(assert (= (and start!137670 res!1080808) b!1583267))

(assert (= (and b!1583267 res!1080811) b!1583271))

(assert (= (and b!1583271 res!1080810) b!1583270))

(assert (= (and b!1583270 (not res!1080812)) b!1583264))

(assert (= (and b!1583270 res!1080807) b!1583266))

(assert (= (and b!1583266 res!1080809) b!1583265))

(assert (= (and b!1583265 (not res!1080806)) b!1583269))

(assert (= (and start!137670 (is-Cons!36848 l!1390)) b!1583268))

(declare-fun m!1454357 () Bool)

(assert (=> b!1583264 m!1454357))

(declare-fun m!1454359 () Bool)

(assert (=> b!1583265 m!1454359))

(declare-fun m!1454361 () Bool)

(assert (=> b!1583270 m!1454361))

(declare-fun m!1454363 () Bool)

(assert (=> b!1583270 m!1454363))

(declare-fun m!1454365 () Bool)

(assert (=> b!1583267 m!1454365))

(declare-fun m!1454367 () Bool)

(assert (=> b!1583271 m!1454367))

(declare-fun m!1454369 () Bool)

(assert (=> b!1583269 m!1454369))

(declare-fun m!1454371 () Bool)

(assert (=> start!137670 m!1454371))

(push 1)

(assert (not b!1583264))

(assert (not b!1583268))

(assert tp_is_empty!39221)

(assert (not b!1583267))

(assert (not b!1583265))

(assert (not b!1583271))

(assert (not b!1583269))

(assert (not start!137670))

(assert (not b!1583270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167237 () Bool)

(declare-fun res!1080833 () Bool)

(declare-fun e!883490 () Bool)

(assert (=> d!167237 (=> res!1080833 e!883490)))

(assert (=> d!167237 (= res!1080833 (or (is-Nil!36849 (t!51758 l!1390)) (is-Nil!36849 (t!51758 (t!51758 l!1390)))))))

(assert (=> d!167237 (= (isStrictlySorted!1066 (t!51758 l!1390)) e!883490)))

(declare-fun b!1583292 () Bool)

(declare-fun e!883491 () Bool)

(assert (=> b!1583292 (= e!883490 e!883491)))

(declare-fun res!1080834 () Bool)

(assert (=> b!1583292 (=> (not res!1080834) (not e!883491))))

(assert (=> b!1583292 (= res!1080834 (bvslt (_1!12809 (h!38409 (t!51758 l!1390))) (_1!12809 (h!38409 (t!51758 (t!51758 l!1390))))))))

(declare-fun b!1583293 () Bool)

(assert (=> b!1583293 (= e!883491 (isStrictlySorted!1066 (t!51758 (t!51758 l!1390))))))

(assert (= (and d!167237 (not res!1080833)) b!1583292))

(assert (= (and b!1583292 res!1080834) b!1583293))

(declare-fun m!1454379 () Bool)

(assert (=> b!1583293 m!1454379))

(assert (=> b!1583265 d!167237))

(declare-fun d!167245 () Bool)

(assert (=> d!167245 (= (isEmpty!1174 lt!677721) (not (is-Some!904 lt!677721)))))

(assert (=> b!1583270 d!167245))

(declare-fun d!167251 () Bool)

(assert (=> d!167251 (= (unapply!87 l!1390) (ite (is-Nil!36849 l!1390) None!903 (Some!904 (tuple2!25599 (h!38409 l!1390) (t!51758 l!1390)))))))

(assert (=> b!1583270 d!167251))

(declare-fun lt!677730 () Bool)

(declare-fun d!167253 () Bool)

(declare-fun content!825 (List!36852) (Set tuple2!25596))

(assert (=> d!167253 (= lt!677730 (set.member (tuple2!25597 key!405 value!194) (content!825 l!1390)))))

(declare-fun e!883519 () Bool)

(assert (=> d!167253 (= lt!677730 e!883519)))

(declare-fun res!1080860 () Bool)

(assert (=> d!167253 (=> (not res!1080860) (not e!883519))))

(assert (=> d!167253 (= res!1080860 (is-Cons!36848 l!1390))))

(assert (=> d!167253 (= (contains!10537 l!1390 (tuple2!25597 key!405 value!194)) lt!677730)))

(declare-fun b!1583323 () Bool)

(declare-fun e!883520 () Bool)

(assert (=> b!1583323 (= e!883519 e!883520)))

(declare-fun res!1080859 () Bool)

(assert (=> b!1583323 (=> res!1080859 e!883520)))

(assert (=> b!1583323 (= res!1080859 (= (h!38409 l!1390) (tuple2!25597 key!405 value!194)))))

(declare-fun b!1583324 () Bool)

(assert (=> b!1583324 (= e!883520 (contains!10537 (t!51758 l!1390) (tuple2!25597 key!405 value!194)))))

(assert (= (and d!167253 res!1080860) b!1583323))

(assert (= (and b!1583323 (not res!1080859)) b!1583324))

(declare-fun m!1454393 () Bool)

(assert (=> d!167253 m!1454393))

(declare-fun m!1454395 () Bool)

(assert (=> d!167253 m!1454395))

(declare-fun m!1454397 () Bool)

(assert (=> b!1583324 m!1454397))

(assert (=> b!1583271 d!167253))

(declare-fun d!167267 () Bool)

(declare-fun res!1080861 () Bool)

(declare-fun e!883521 () Bool)

(assert (=> d!167267 (=> res!1080861 e!883521)))

(assert (=> d!167267 (= res!1080861 (or (is-Nil!36849 l!1390) (is-Nil!36849 (t!51758 l!1390))))))

(assert (=> d!167267 (= (isStrictlySorted!1066 l!1390) e!883521)))

(declare-fun b!1583325 () Bool)

(declare-fun e!883522 () Bool)

(assert (=> b!1583325 (= e!883521 e!883522)))

(declare-fun res!1080862 () Bool)

(assert (=> b!1583325 (=> (not res!1080862) (not e!883522))))

(assert (=> b!1583325 (= res!1080862 (bvslt (_1!12809 (h!38409 l!1390)) (_1!12809 (h!38409 (t!51758 l!1390)))))))

(declare-fun b!1583326 () Bool)

(assert (=> b!1583326 (= e!883522 (isStrictlySorted!1066 (t!51758 l!1390)))))

(assert (= (and d!167267 (not res!1080861)) b!1583325))

(assert (= (and b!1583325 res!1080862) b!1583326))

(assert (=> b!1583326 m!1454359))

(assert (=> start!137670 d!167267))

(declare-fun d!167269 () Bool)

(declare-fun res!1080873 () Bool)

(declare-fun e!883533 () Bool)

(assert (=> d!167269 (=> res!1080873 e!883533)))

(assert (=> d!167269 (= res!1080873 (and (is-Cons!36848 l!1390) (= (_1!12809 (h!38409 l!1390)) key!405)))))

(assert (=> d!167269 (= (containsKey!925 l!1390 key!405) e!883533)))

(declare-fun b!1583337 () Bool)

(declare-fun e!883534 () Bool)

(assert (=> b!1583337 (= e!883533 e!883534)))

(declare-fun res!1080874 () Bool)

(assert (=> b!1583337 (=> (not res!1080874) (not e!883534))))

(assert (=> b!1583337 (= res!1080874 (and (or (not (is-Cons!36848 l!1390)) (bvsle (_1!12809 (h!38409 l!1390)) key!405)) (is-Cons!36848 l!1390) (bvslt (_1!12809 (h!38409 l!1390)) key!405)))))

(declare-fun b!1583338 () Bool)

(assert (=> b!1583338 (= e!883534 (containsKey!925 (t!51758 l!1390) key!405))))

(assert (= (and d!167269 (not res!1080873)) b!1583337))

(assert (= (and b!1583337 res!1080874) b!1583338))

(assert (=> b!1583338 m!1454369))

(assert (=> b!1583267 d!167269))

(declare-fun d!167273 () Bool)

(assert (=> d!167273 (= (get!26844 lt!677721) (v!22405 lt!677721))))

(assert (=> b!1583264 d!167273))

(declare-fun d!167275 () Bool)

(declare-fun res!1080877 () Bool)

(declare-fun e!883539 () Bool)

(assert (=> d!167275 (=> res!1080877 e!883539)))

(assert (=> d!167275 (= res!1080877 (and (is-Cons!36848 (t!51758 l!1390)) (= (_1!12809 (h!38409 (t!51758 l!1390))) key!405)))))

(assert (=> d!167275 (= (containsKey!925 (t!51758 l!1390) key!405) e!883539)))

(declare-fun b!1583345 () Bool)

(declare-fun e!883540 () Bool)

(assert (=> b!1583345 (= e!883539 e!883540)))

(declare-fun res!1080878 () Bool)

(assert (=> b!1583345 (=> (not res!1080878) (not e!883540))))

(assert (=> b!1583345 (= res!1080878 (and (or (not (is-Cons!36848 (t!51758 l!1390))) (bvsle (_1!12809 (h!38409 (t!51758 l!1390))) key!405)) (is-Cons!36848 (t!51758 l!1390)) (bvslt (_1!12809 (h!38409 (t!51758 l!1390))) key!405)))))

(declare-fun b!1583346 () Bool)

(assert (=> b!1583346 (= e!883540 (containsKey!925 (t!51758 (t!51758 l!1390)) key!405))))

(assert (= (and d!167275 (not res!1080877)) b!1583345))

(assert (= (and b!1583345 res!1080878) b!1583346))

(declare-fun m!1454401 () Bool)

(assert (=> b!1583346 m!1454401))

(assert (=> b!1583269 d!167275))

(declare-fun b!1583352 () Bool)

(declare-fun e!883544 () Bool)

(declare-fun tp!114522 () Bool)

(assert (=> b!1583352 (= e!883544 (and tp_is_empty!39221 tp!114522))))

(assert (=> b!1583268 (= tp!114513 e!883544)))

(assert (= (and b!1583268 (is-Cons!36848 (t!51758 l!1390))) b!1583352))

(push 1)

(assert (not b!1583324))

(assert (not b!1583338))

(assert (not b!1583293))

(assert (not b!1583346))

(assert (not b!1583326))

(assert (not b!1583352))

(assert (not d!167253))

(assert tp_is_empty!39221)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

