; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136950 () Bool)

(assert start!136950)

(declare-fun res!1079061 () Bool)

(declare-fun e!881006 () Bool)

(assert (=> start!136950 (=> res!1079061 e!881006)))

(declare-datatypes ((B!2592 0))(
  ( (B!2593 (val!19658 Int)) )
))
(declare-datatypes ((tuple2!25418 0))(
  ( (tuple2!25419 (_1!12720 (_ BitVec 64)) (_2!12720 B!2592)) )
))
(declare-datatypes ((List!36778 0))(
  ( (Nil!36775) (Cons!36774 (h!38317 tuple2!25418) (t!51692 List!36778)) )
))
(declare-fun lt!676504 () List!36778)

(declare-fun isStrictlySorted!1039 (List!36778) Bool)

(assert (=> start!136950 (= res!1079061 (not (isStrictlySorted!1039 lt!676504)))))

(declare-datatypes ((ListLongMap!22757 0))(
  ( (ListLongMap!22758 (toList!11394 List!36778)) )
))
(declare-fun thiss!201 () ListLongMap!22757)

(declare-fun keyValue!4 () tuple2!25418)

(declare-fun insertStrictlySorted!610 (List!36778 (_ BitVec 64) B!2592) List!36778)

(assert (=> start!136950 (= lt!676504 (insertStrictlySorted!610 (toList!11394 thiss!201) (_1!12720 keyValue!4) (_2!12720 keyValue!4)))))

(assert (=> start!136950 e!881006))

(declare-fun e!881005 () Bool)

(declare-fun inv!58954 (ListLongMap!22757) Bool)

(assert (=> start!136950 (and (inv!58954 thiss!201) e!881005)))

(declare-fun tp_is_empty!39137 () Bool)

(assert (=> start!136950 tp_is_empty!39137))

(declare-fun b!1579333 () Bool)

(declare-fun res!1079060 () Bool)

(assert (=> b!1579333 (=> res!1079060 e!881006)))

(declare-fun containsKey!885 (List!36778 (_ BitVec 64)) Bool)

(assert (=> b!1579333 (= res!1079060 (not (containsKey!885 lt!676504 (_1!12720 keyValue!4))))))

(declare-fun b!1579334 () Bool)

(declare-fun contains!10450 (List!36778 tuple2!25418) Bool)

(assert (=> b!1579334 (= e!881006 (not (contains!10450 lt!676504 keyValue!4)))))

(declare-fun b!1579335 () Bool)

(declare-fun tp!114330 () Bool)

(assert (=> b!1579335 (= e!881005 tp!114330)))

(assert (= (and start!136950 (not res!1079061)) b!1579333))

(assert (= (and b!1579333 (not res!1079060)) b!1579334))

(assert (= start!136950 b!1579335))

(declare-fun m!1451193 () Bool)

(assert (=> start!136950 m!1451193))

(declare-fun m!1451195 () Bool)

(assert (=> start!136950 m!1451195))

(declare-fun m!1451197 () Bool)

(assert (=> start!136950 m!1451197))

(declare-fun m!1451199 () Bool)

(assert (=> b!1579333 m!1451199))

(declare-fun m!1451201 () Bool)

(assert (=> b!1579334 m!1451201))

(push 1)

(assert (not b!1579334))

(assert (not start!136950))

(assert (not b!1579333))

(assert (not b!1579335))

(assert tp_is_empty!39137)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166255 () Bool)

(declare-fun res!1079072 () Bool)

(declare-fun e!881017 () Bool)

(assert (=> d!166255 (=> res!1079072 e!881017)))

(assert (=> d!166255 (= res!1079072 (and (is-Cons!36774 lt!676504) (= (_1!12720 (h!38317 lt!676504)) (_1!12720 keyValue!4))))))

(assert (=> d!166255 (= (containsKey!885 lt!676504 (_1!12720 keyValue!4)) e!881017)))

(declare-fun b!1579346 () Bool)

(declare-fun e!881018 () Bool)

(assert (=> b!1579346 (= e!881017 e!881018)))

(declare-fun res!1079073 () Bool)

(assert (=> b!1579346 (=> (not res!1079073) (not e!881018))))

(assert (=> b!1579346 (= res!1079073 (and (or (not (is-Cons!36774 lt!676504)) (bvsle (_1!12720 (h!38317 lt!676504)) (_1!12720 keyValue!4))) (is-Cons!36774 lt!676504) (bvslt (_1!12720 (h!38317 lt!676504)) (_1!12720 keyValue!4))))))

(declare-fun b!1579347 () Bool)

(assert (=> b!1579347 (= e!881018 (containsKey!885 (t!51692 lt!676504) (_1!12720 keyValue!4)))))

(assert (= (and d!166255 (not res!1079072)) b!1579346))

(assert (= (and b!1579346 res!1079073) b!1579347))

(declare-fun m!1451205 () Bool)

(assert (=> b!1579347 m!1451205))

(assert (=> b!1579333 d!166255))

(declare-fun d!166261 () Bool)

(declare-fun lt!676510 () Bool)

(declare-fun content!825 (List!36778) (Set tuple2!25418))

(assert (=> d!166261 (= lt!676510 (member keyValue!4 (content!825 lt!676504)))))

(declare-fun e!881032 () Bool)

(assert (=> d!166261 (= lt!676510 e!881032)))

(declare-fun res!1079086 () Bool)

(assert (=> d!166261 (=> (not res!1079086) (not e!881032))))

(assert (=> d!166261 (= res!1079086 (is-Cons!36774 lt!676504))))

(assert (=> d!166261 (= (contains!10450 lt!676504 keyValue!4) lt!676510)))

(declare-fun b!1579360 () Bool)

(declare-fun e!881031 () Bool)

(assert (=> b!1579360 (= e!881032 e!881031)))

(declare-fun res!1079087 () Bool)

(assert (=> b!1579360 (=> res!1079087 e!881031)))

(assert (=> b!1579360 (= res!1079087 (= (h!38317 lt!676504) keyValue!4))))

(declare-fun b!1579361 () Bool)

(assert (=> b!1579361 (= e!881031 (contains!10450 (t!51692 lt!676504) keyValue!4))))

(assert (= (and d!166261 res!1079086) b!1579360))

(assert (= (and b!1579360 (not res!1079087)) b!1579361))

(declare-fun m!1451213 () Bool)

(assert (=> d!166261 m!1451213))

(declare-fun m!1451215 () Bool)

(assert (=> d!166261 m!1451215))

(declare-fun m!1451217 () Bool)

(assert (=> b!1579361 m!1451217))

(assert (=> b!1579334 d!166261))

(declare-fun d!166265 () Bool)

(declare-fun res!1079096 () Bool)

(declare-fun e!881047 () Bool)

(assert (=> d!166265 (=> res!1079096 e!881047)))

(assert (=> d!166265 (= res!1079096 (or (is-Nil!36775 lt!676504) (is-Nil!36775 (t!51692 lt!676504))))))

(assert (=> d!166265 (= (isStrictlySorted!1039 lt!676504) e!881047)))

(declare-fun b!1579382 () Bool)

(declare-fun e!881048 () Bool)

(assert (=> b!1579382 (= e!881047 e!881048)))

(declare-fun res!1079097 () Bool)

(assert (=> b!1579382 (=> (not res!1079097) (not e!881048))))

(assert (=> b!1579382 (= res!1079097 (bvslt (_1!12720 (h!38317 lt!676504)) (_1!12720 (h!38317 (t!51692 lt!676504)))))))

(declare-fun b!1579383 () Bool)

(assert (=> b!1579383 (= e!881048 (isStrictlySorted!1039 (t!51692 lt!676504)))))

(assert (= (and d!166265 (not res!1079096)) b!1579382))

(assert (= (and b!1579382 res!1079097) b!1579383))

(declare-fun m!1451221 () Bool)

(assert (=> b!1579383 m!1451221))

(assert (=> start!136950 d!166265))

(declare-fun b!1579464 () Bool)

(declare-fun e!881098 () List!36778)

(declare-fun call!72422 () List!36778)

(assert (=> b!1579464 (= e!881098 call!72422)))

(declare-fun c!146400 () Bool)

(declare-fun e!881099 () List!36778)

(declare-fun c!146402 () Bool)

(declare-fun b!1579465 () Bool)

(assert (=> b!1579465 (= e!881099 (ite c!146402 (t!51692 (toList!11394 thiss!201)) (ite c!146400 (Cons!36774 (h!38317 (toList!11394 thiss!201)) (t!51692 (toList!11394 thiss!201))) Nil!36775)))))

(declare-fun b!1579466 () Bool)

(declare-fun e!881100 () List!36778)

(declare-fun call!72420 () List!36778)

(assert (=> b!1579466 (= e!881100 call!72420)))

(declare-fun b!1579467 () Bool)

(declare-fun res!1079131 () Bool)

(declare-fun e!881101 () Bool)

(assert (=> b!1579467 (=> (not res!1079131) (not e!881101))))

(declare-fun lt!676521 () List!36778)

(assert (=> b!1579467 (= res!1079131 (containsKey!885 lt!676521 (_1!12720 keyValue!4)))))

(declare-fun b!1579468 () Bool)

(assert (=> b!1579468 (= e!881098 call!72422)))

(declare-fun bm!72417 () Bool)

(assert (=> bm!72417 (= call!72422 call!72420)))

(declare-fun bm!72418 () Bool)

(declare-fun call!72421 () List!36778)

(assert (=> bm!72418 (= call!72420 call!72421)))

(declare-fun b!1579469 () Bool)

(assert (=> b!1579469 (= e!881101 (contains!10450 lt!676521 (tuple2!25419 (_1!12720 keyValue!4) (_2!12720 keyValue!4))))))

(declare-fun b!1579470 () Bool)

(assert (=> b!1579470 (= c!146400 (and (is-Cons!36774 (toList!11394 thiss!201)) (bvsgt (_1!12720 (h!38317 (toList!11394 thiss!201))) (_1!12720 keyValue!4))))))

(assert (=> b!1579470 (= e!881100 e!881098)))

