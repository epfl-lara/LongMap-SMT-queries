; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136946 () Bool)

(assert start!136946)

(declare-fun res!1079048 () Bool)

(declare-fun e!880994 () Bool)

(assert (=> start!136946 (=> res!1079048 e!880994)))

(declare-datatypes ((B!2588 0))(
  ( (B!2589 (val!19656 Int)) )
))
(declare-datatypes ((tuple2!25414 0))(
  ( (tuple2!25415 (_1!12718 (_ BitVec 64)) (_2!12718 B!2588)) )
))
(declare-datatypes ((List!36776 0))(
  ( (Nil!36773) (Cons!36772 (h!38315 tuple2!25414) (t!51690 List!36776)) )
))
(declare-fun lt!676498 () List!36776)

(declare-fun isStrictlySorted!1037 (List!36776) Bool)

(assert (=> start!136946 (= res!1079048 (not (isStrictlySorted!1037 lt!676498)))))

(declare-datatypes ((ListLongMap!22753 0))(
  ( (ListLongMap!22754 (toList!11392 List!36776)) )
))
(declare-fun thiss!201 () ListLongMap!22753)

(declare-fun keyValue!4 () tuple2!25414)

(declare-fun insertStrictlySorted!608 (List!36776 (_ BitVec 64) B!2588) List!36776)

(assert (=> start!136946 (= lt!676498 (insertStrictlySorted!608 (toList!11392 thiss!201) (_1!12718 keyValue!4) (_2!12718 keyValue!4)))))

(assert (=> start!136946 e!880994))

(declare-fun e!880993 () Bool)

(declare-fun inv!58952 (ListLongMap!22753) Bool)

(assert (=> start!136946 (and (inv!58952 thiss!201) e!880993)))

(declare-fun tp_is_empty!39133 () Bool)

(assert (=> start!136946 tp_is_empty!39133))

(declare-fun b!1579315 () Bool)

(declare-fun res!1079049 () Bool)

(assert (=> b!1579315 (=> res!1079049 e!880994)))

(declare-fun containsKey!883 (List!36776 (_ BitVec 64)) Bool)

(assert (=> b!1579315 (= res!1079049 (not (containsKey!883 lt!676498 (_1!12718 keyValue!4))))))

(declare-fun b!1579316 () Bool)

(declare-fun contains!10448 (List!36776 tuple2!25414) Bool)

(assert (=> b!1579316 (= e!880994 (not (contains!10448 lt!676498 keyValue!4)))))

(declare-fun b!1579317 () Bool)

(declare-fun tp!114324 () Bool)

(assert (=> b!1579317 (= e!880993 tp!114324)))

(assert (= (and start!136946 (not res!1079048)) b!1579315))

(assert (= (and b!1579315 (not res!1079049)) b!1579316))

(assert (= start!136946 b!1579317))

(declare-fun m!1451173 () Bool)

(assert (=> start!136946 m!1451173))

(declare-fun m!1451175 () Bool)

(assert (=> start!136946 m!1451175))

(declare-fun m!1451177 () Bool)

(assert (=> start!136946 m!1451177))

(declare-fun m!1451179 () Bool)

(assert (=> b!1579315 m!1451179))

(declare-fun m!1451181 () Bool)

(assert (=> b!1579316 m!1451181))

(push 1)

(assert (not b!1579317))

(assert tp_is_empty!39133)

(assert (not b!1579316))

(assert (not start!136946))

(assert (not b!1579315))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166257 () Bool)

(declare-fun lt!676507 () Bool)

(declare-fun content!824 (List!36776) (Set tuple2!25414))

(assert (=> d!166257 (= lt!676507 (set.member keyValue!4 (content!824 lt!676498)))))

(declare-fun e!881024 () Bool)

(assert (=> d!166257 (= lt!676507 e!881024)))

(declare-fun res!1079079 () Bool)

(assert (=> d!166257 (=> (not res!1079079) (not e!881024))))

(assert (=> d!166257 (= res!1079079 (is-Cons!36772 lt!676498))))

(assert (=> d!166257 (= (contains!10448 lt!676498 keyValue!4) lt!676507)))

(declare-fun b!1579352 () Bool)

(declare-fun e!881023 () Bool)

(assert (=> b!1579352 (= e!881024 e!881023)))

(declare-fun res!1079078 () Bool)

(assert (=> b!1579352 (=> res!1079078 e!881023)))

(assert (=> b!1579352 (= res!1079078 (= (h!38315 lt!676498) keyValue!4))))

(declare-fun b!1579353 () Bool)

(assert (=> b!1579353 (= e!881023 (contains!10448 (t!51690 lt!676498) keyValue!4))))

(assert (= (and d!166257 res!1079079) b!1579352))

(assert (= (and b!1579352 (not res!1079078)) b!1579353))

(declare-fun m!1451207 () Bool)

(assert (=> d!166257 m!1451207))

(declare-fun m!1451209 () Bool)

(assert (=> d!166257 m!1451209))

(declare-fun m!1451211 () Bool)

(assert (=> b!1579353 m!1451211))

(assert (=> b!1579316 d!166257))

(declare-fun d!166263 () Bool)

(declare-fun res!1079090 () Bool)

(declare-fun e!881035 () Bool)

(assert (=> d!166263 (=> res!1079090 e!881035)))

(assert (=> d!166263 (= res!1079090 (and (is-Cons!36772 lt!676498) (= (_1!12718 (h!38315 lt!676498)) (_1!12718 keyValue!4))))))

(assert (=> d!166263 (= (containsKey!883 lt!676498 (_1!12718 keyValue!4)) e!881035)))

(declare-fun b!1579364 () Bool)

(declare-fun e!881036 () Bool)

(assert (=> b!1579364 (= e!881035 e!881036)))

(declare-fun res!1079091 () Bool)

(assert (=> b!1579364 (=> (not res!1079091) (not e!881036))))

(assert (=> b!1579364 (= res!1079091 (and (or (not (is-Cons!36772 lt!676498)) (bvsle (_1!12718 (h!38315 lt!676498)) (_1!12718 keyValue!4))) (is-Cons!36772 lt!676498) (bvslt (_1!12718 (h!38315 lt!676498)) (_1!12718 keyValue!4))))))

(declare-fun b!1579365 () Bool)

(assert (=> b!1579365 (= e!881036 (containsKey!883 (t!51690 lt!676498) (_1!12718 keyValue!4)))))

(assert (= (and d!166263 (not res!1079090)) b!1579364))

(assert (= (and b!1579364 res!1079091) b!1579365))

(declare-fun m!1451219 () Bool)

(assert (=> b!1579365 m!1451219))

(assert (=> b!1579315 d!166263))

(declare-fun d!166267 () Bool)

(declare-fun res!1079102 () Bool)

(declare-fun e!881055 () Bool)

(assert (=> d!166267 (=> res!1079102 e!881055)))

(assert (=> d!166267 (= res!1079102 (or (is-Nil!36773 lt!676498) (is-Nil!36773 (t!51690 lt!676498))))))

(assert (=> d!166267 (= (isStrictlySorted!1037 lt!676498) e!881055)))

(declare-fun b!1579392 () Bool)

(declare-fun e!881056 () Bool)

(assert (=> b!1579392 (= e!881055 e!881056)))

(declare-fun res!1079103 () Bool)

(assert (=> b!1579392 (=> (not res!1079103) (not e!881056))))

(assert (=> b!1579392 (= res!1079103 (bvslt (_1!12718 (h!38315 lt!676498)) (_1!12718 (h!38315 (t!51690 lt!676498)))))))

(declare-fun b!1579393 () Bool)

(assert (=> b!1579393 (= e!881056 (isStrictlySorted!1037 (t!51690 lt!676498)))))

(assert (= (and d!166267 (not res!1079102)) b!1579392))

(assert (= (and b!1579392 res!1079103) b!1579393))

(declare-fun m!1451223 () Bool)

(assert (=> b!1579393 m!1451223))

(assert (=> start!136946 d!166267))

(declare-fun b!1579475 () Bool)

(declare-fun e!881104 () List!36776)

(declare-fun call!72423 () List!36776)

(assert (=> b!1579475 (= e!881104 call!72423)))

(declare-fun b!1579476 () Bool)

(declare-fun e!881108 () List!36776)

(declare-fun call!72424 () List!36776)

(assert (=> b!1579476 (= e!881108 call!72424)))

(declare-fun b!1579477 () Bool)

(declare-fun c!146405 () Bool)

(assert (=> b!1579477 (= c!146405 (and (is-Cons!36772 (toList!11392 thiss!201)) (bvsgt (_1!12718 (h!38315 (toList!11392 thiss!201))) (_1!12718 keyValue!4))))))

(assert (=> b!1579477 (= e!881108 e!881104)))

(declare-fun b!1579478 () Bool)

(declare-fun e!881105 () List!36776)

(declare-fun c!146404 () Bool)

(assert (=> b!1579478 (= e!881105 (ite c!146404 (t!51690 (toList!11392 thiss!201)) (ite c!146405 (Cons!36772 (h!38315 (toList!11392 thiss!201)) (t!51690 (toList!11392 thiss!201))) Nil!36773)))))

(declare-fun b!1579479 () Bool)

(declare-fun e!881107 () Bool)

(declare-fun lt!676522 () List!36776)

(assert (=> b!1579479 (= e!881107 (contains!10448 lt!676522 (tuple2!25415 (_1!12718 keyValue!4) (_2!12718 keyValue!4))))))

(declare-fun b!1579480 () Bool)

(assert (=> b!1579480 (= e!881105 (insertStrictlySorted!608 (t!51690 (toList!11392 thiss!201)) (_1!12718 keyValue!4) (_2!12718 keyValue!4)))))

(declare-fun b!1579481 () Bool)

(declare-fun e!881106 () List!36776)

(declare-fun call!72425 () List!36776)

(assert (=> b!1579481 (= e!881106 call!72425)))

(declare-fun d!166271 () Bool)

(assert (=> d!166271 e!881107))

(declare-fun res!1079132 () Bool)

(assert (=> d!166271 (=> (not res!1079132) (not e!881107))))

(assert (=> d!166271 (= res!1079132 (isStrictlySorted!1037 lt!676522))))

(assert (=> d!166271 (= lt!676522 e!881106)))

(declare-fun c!146406 () Bool)

(assert (=> d!166271 (= c!146406 (and (is-Cons!36772 (toList!11392 thiss!201)) (bvslt (_1!12718 (h!38315 (toList!11392 thiss!201))) (_1!12718 keyValue!4))))))

(assert (=> d!166271 (isStrictlySorted!1037 (toList!11392 thiss!201))))

(assert (=> d!166271 (= (insertStrictlySorted!608 (toList!11392 thiss!201) (_1!12718 keyValue!4) (_2!12718 keyValue!4)) lt!676522)))

(declare-fun bm!72420 () Bool)

(assert (=> bm!72420 (= call!72423 call!72424)))

(declare-fun b!1579482 () Bool)

(assert (=> b!1579482 (= e!881104 call!72423)))

(declare-fun b!1579483 () Bool)

(declare-fun res!1079133 () Bool)

(assert (=> b!1579483 (=> (not res!1079133) (not e!881107))))

(assert (=> b!1579483 (= res!1079133 (containsKey!883 lt!676522 (_1!12718 keyValue!4)))))

(declare-fun bm!72421 () Bool)

(declare-fun $colon$colon!1009 (List!36776 tuple2!25414) List!36776)

(assert (=> bm!72421 (= call!72425 ($colon$colon!1009 e!881105 (ite c!146406 (h!38315 (toList!11392 thiss!201)) (tuple2!25415 (_1!12718 keyValue!4) (_2!12718 keyValue!4)))))))

(declare-fun c!146403 () Bool)

(assert (=> bm!72421 (= c!146403 c!146406)))

(declare-fun bm!72422 () Bool)

(assert (=> bm!72422 (= call!72424 call!72425)))

(declare-fun b!1579484 () Bool)

(assert (=> b!1579484 (= e!881106 e!881108)))

(assert (=> b!1579484 (= c!146404 (and (is-Cons!36772 (toList!11392 thiss!201)) (= (_1!12718 (h!38315 (toList!11392 thiss!201))) (_1!12718 keyValue!4))))))

(assert (= (and d!166271 c!146406) b!1579481))

(assert (= (and d!166271 (not c!146406)) b!1579484))

(assert (= (and b!1579484 c!146404) b!1579476))

(assert (= (and b!1579484 (not c!146404)) b!1579477))

(assert (= (and b!1579477 c!146405) b!1579482))

(assert (= (and b!1579477 (not c!146405)) b!1579475))

(assert (= (or b!1579482 b!1579475) bm!72420))

(assert (= (or b!1579476 bm!72420) bm!72422))

