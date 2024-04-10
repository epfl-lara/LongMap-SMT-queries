; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137014 () Bool)

(assert start!137014)

(declare-fun res!1079175 () Bool)

(declare-fun e!881216 () Bool)

(assert (=> start!137014 (=> (not res!1079175) (not e!881216))))

(declare-datatypes ((B!2602 0))(
  ( (B!2603 (val!19663 Int)) )
))
(declare-datatypes ((tuple2!25428 0))(
  ( (tuple2!25429 (_1!12725 (_ BitVec 64)) (_2!12725 B!2602)) )
))
(declare-datatypes ((List!36783 0))(
  ( (Nil!36780) (Cons!36779 (h!38322 tuple2!25428) (t!51697 List!36783)) )
))
(declare-fun lt!676570 () List!36783)

(declare-fun keyValue!4 () tuple2!25428)

(declare-datatypes ((ListLongMap!22767 0))(
  ( (ListLongMap!22768 (toList!11399 List!36783)) )
))
(declare-fun contains!10456 (ListLongMap!22767 (_ BitVec 64)) Bool)

(assert (=> start!137014 (= res!1079175 (contains!10456 (ListLongMap!22768 lt!676570) (_1!12725 keyValue!4)))))

(declare-datatypes ((Option!885 0))(
  ( (Some!884 (v!22376 B!2602)) (None!883) )
))
(declare-fun getValueByKey!809 (List!36783 (_ BitVec 64)) Option!885)

(assert (=> start!137014 (= (getValueByKey!809 lt!676570 (_1!12725 keyValue!4)) (Some!884 (_2!12725 keyValue!4)))))

(declare-datatypes ((Unit!52227 0))(
  ( (Unit!52228) )
))
(declare-fun lt!676569 () Unit!52227)

(declare-fun lemmaContainsTupThenGetReturnValue!395 (List!36783 (_ BitVec 64) B!2602) Unit!52227)

(assert (=> start!137014 (= lt!676569 (lemmaContainsTupThenGetReturnValue!395 lt!676570 (_1!12725 keyValue!4) (_2!12725 keyValue!4)))))

(declare-fun thiss!201 () ListLongMap!22767)

(declare-fun insertStrictlySorted!615 (List!36783 (_ BitVec 64) B!2602) List!36783)

(assert (=> start!137014 (= lt!676570 (insertStrictlySorted!615 (toList!11399 thiss!201) (_1!12725 keyValue!4) (_2!12725 keyValue!4)))))

(assert (=> start!137014 (not e!881216)))

(declare-fun e!881215 () Bool)

(declare-fun inv!58969 (ListLongMap!22767) Bool)

(assert (=> start!137014 (and (inv!58969 thiss!201) e!881215)))

(declare-fun tp_is_empty!39147 () Bool)

(assert (=> start!137014 tp_is_empty!39147))

(declare-fun b!1579673 () Bool)

(declare-fun contains!10457 (List!36783 tuple2!25428) Bool)

(assert (=> b!1579673 (= e!881216 (contains!10457 lt!676570 keyValue!4))))

(declare-fun b!1579674 () Bool)

(declare-fun tp!114363 () Bool)

(assert (=> b!1579674 (= e!881215 tp!114363)))

(assert (= (and start!137014 res!1079175) b!1579673))

(assert (= start!137014 b!1579674))

(declare-fun m!1451383 () Bool)

(assert (=> start!137014 m!1451383))

(declare-fun m!1451385 () Bool)

(assert (=> start!137014 m!1451385))

(declare-fun m!1451387 () Bool)

(assert (=> start!137014 m!1451387))

(declare-fun m!1451389 () Bool)

(assert (=> start!137014 m!1451389))

(declare-fun m!1451391 () Bool)

(assert (=> start!137014 m!1451391))

(declare-fun m!1451393 () Bool)

(assert (=> b!1579673 m!1451393))

(check-sat (not start!137014) (not b!1579673) (not b!1579674) tp_is_empty!39147)
(check-sat)
(get-model)

(declare-fun b!1579689 () Bool)

(declare-fun e!881227 () Option!885)

(assert (=> b!1579689 (= e!881227 (Some!884 (_2!12725 (h!38322 lt!676570))))))

(declare-fun b!1579692 () Bool)

(declare-fun e!881228 () Option!885)

(assert (=> b!1579692 (= e!881228 None!883)))

(declare-fun b!1579691 () Bool)

(assert (=> b!1579691 (= e!881228 (getValueByKey!809 (t!51697 lt!676570) (_1!12725 keyValue!4)))))

(declare-fun b!1579690 () Bool)

(assert (=> b!1579690 (= e!881227 e!881228)))

(declare-fun c!146466 () Bool)

(get-info :version)

(assert (=> b!1579690 (= c!146466 (and ((_ is Cons!36779) lt!676570) (not (= (_1!12725 (h!38322 lt!676570)) (_1!12725 keyValue!4)))))))

(declare-fun d!166317 () Bool)

(declare-fun c!146465 () Bool)

(assert (=> d!166317 (= c!146465 (and ((_ is Cons!36779) lt!676570) (= (_1!12725 (h!38322 lt!676570)) (_1!12725 keyValue!4))))))

(assert (=> d!166317 (= (getValueByKey!809 lt!676570 (_1!12725 keyValue!4)) e!881227)))

(assert (= (and d!166317 c!146465) b!1579689))

(assert (= (and d!166317 (not c!146465)) b!1579690))

(assert (= (and b!1579690 c!146466) b!1579691))

(assert (= (and b!1579690 (not c!146466)) b!1579692))

(declare-fun m!1451409 () Bool)

(assert (=> b!1579691 m!1451409))

(assert (=> start!137014 d!166317))

(declare-fun d!166325 () Bool)

(declare-fun isStrictlySorted!1045 (List!36783) Bool)

(assert (=> d!166325 (= (inv!58969 thiss!201) (isStrictlySorted!1045 (toList!11399 thiss!201)))))

(declare-fun bs!45758 () Bool)

(assert (= bs!45758 d!166325))

(declare-fun m!1451413 () Bool)

(assert (=> bs!45758 m!1451413))

(assert (=> start!137014 d!166325))

(declare-fun d!166329 () Bool)

(assert (=> d!166329 (= (getValueByKey!809 lt!676570 (_1!12725 keyValue!4)) (Some!884 (_2!12725 keyValue!4)))))

(declare-fun lt!676594 () Unit!52227)

(declare-fun choose!2093 (List!36783 (_ BitVec 64) B!2602) Unit!52227)

(assert (=> d!166329 (= lt!676594 (choose!2093 lt!676570 (_1!12725 keyValue!4) (_2!12725 keyValue!4)))))

(declare-fun e!881240 () Bool)

(assert (=> d!166329 e!881240))

(declare-fun res!1079192 () Bool)

(assert (=> d!166329 (=> (not res!1079192) (not e!881240))))

(assert (=> d!166329 (= res!1079192 (isStrictlySorted!1045 lt!676570))))

(assert (=> d!166329 (= (lemmaContainsTupThenGetReturnValue!395 lt!676570 (_1!12725 keyValue!4) (_2!12725 keyValue!4)) lt!676594)))

(declare-fun b!1579712 () Bool)

(declare-fun res!1079193 () Bool)

(assert (=> b!1579712 (=> (not res!1079193) (not e!881240))))

(declare-fun containsKey!890 (List!36783 (_ BitVec 64)) Bool)

(assert (=> b!1579712 (= res!1079193 (containsKey!890 lt!676570 (_1!12725 keyValue!4)))))

(declare-fun b!1579713 () Bool)

(assert (=> b!1579713 (= e!881240 (contains!10457 lt!676570 (tuple2!25429 (_1!12725 keyValue!4) (_2!12725 keyValue!4))))))

(assert (= (and d!166329 res!1079192) b!1579712))

(assert (= (and b!1579712 res!1079193) b!1579713))

(assert (=> d!166329 m!1451389))

(declare-fun m!1451431 () Bool)

(assert (=> d!166329 m!1451431))

(declare-fun m!1451433 () Bool)

(assert (=> d!166329 m!1451433))

(declare-fun m!1451435 () Bool)

(assert (=> b!1579712 m!1451435))

(declare-fun m!1451437 () Bool)

(assert (=> b!1579713 m!1451437))

(assert (=> start!137014 d!166329))

(declare-fun bm!72456 () Bool)

(declare-fun call!72459 () List!36783)

(declare-fun call!72461 () List!36783)

(assert (=> bm!72456 (= call!72459 call!72461)))

(declare-fun b!1579773 () Bool)

(declare-fun e!881274 () List!36783)

(assert (=> b!1579773 (= e!881274 (insertStrictlySorted!615 (t!51697 (toList!11399 thiss!201)) (_1!12725 keyValue!4) (_2!12725 keyValue!4)))))

(declare-fun c!146495 () Bool)

(declare-fun b!1579774 () Bool)

(declare-fun c!146493 () Bool)

(assert (=> b!1579774 (= e!881274 (ite c!146493 (t!51697 (toList!11399 thiss!201)) (ite c!146495 (Cons!36779 (h!38322 (toList!11399 thiss!201)) (t!51697 (toList!11399 thiss!201))) Nil!36780)))))

(declare-fun b!1579775 () Bool)

(declare-fun e!881273 () List!36783)

(assert (=> b!1579775 (= e!881273 call!72459)))

(declare-fun b!1579776 () Bool)

(declare-fun e!881275 () List!36783)

(assert (=> b!1579776 (= e!881275 call!72461)))

(declare-fun call!72460 () List!36783)

(declare-fun c!146496 () Bool)

(declare-fun bm!72457 () Bool)

(declare-fun $colon$colon!1013 (List!36783 tuple2!25428) List!36783)

(assert (=> bm!72457 (= call!72460 ($colon$colon!1013 e!881274 (ite c!146496 (h!38322 (toList!11399 thiss!201)) (tuple2!25429 (_1!12725 keyValue!4) (_2!12725 keyValue!4)))))))

(declare-fun c!146494 () Bool)

(assert (=> bm!72457 (= c!146494 c!146496)))

(declare-fun b!1579777 () Bool)

(declare-fun e!881276 () List!36783)

(assert (=> b!1579777 (= e!881276 call!72460)))

(declare-fun b!1579778 () Bool)

(assert (=> b!1579778 (= c!146495 (and ((_ is Cons!36779) (toList!11399 thiss!201)) (bvsgt (_1!12725 (h!38322 (toList!11399 thiss!201))) (_1!12725 keyValue!4))))))

(assert (=> b!1579778 (= e!881275 e!881273)))

(declare-fun d!166335 () Bool)

(declare-fun e!881272 () Bool)

(assert (=> d!166335 e!881272))

(declare-fun res!1079207 () Bool)

(assert (=> d!166335 (=> (not res!1079207) (not e!881272))))

(declare-fun lt!676612 () List!36783)

(assert (=> d!166335 (= res!1079207 (isStrictlySorted!1045 lt!676612))))

(assert (=> d!166335 (= lt!676612 e!881276)))

(assert (=> d!166335 (= c!146496 (and ((_ is Cons!36779) (toList!11399 thiss!201)) (bvslt (_1!12725 (h!38322 (toList!11399 thiss!201))) (_1!12725 keyValue!4))))))

(assert (=> d!166335 (isStrictlySorted!1045 (toList!11399 thiss!201))))

(assert (=> d!166335 (= (insertStrictlySorted!615 (toList!11399 thiss!201) (_1!12725 keyValue!4) (_2!12725 keyValue!4)) lt!676612)))

(declare-fun b!1579779 () Bool)

(declare-fun res!1079208 () Bool)

(assert (=> b!1579779 (=> (not res!1079208) (not e!881272))))

(assert (=> b!1579779 (= res!1079208 (containsKey!890 lt!676612 (_1!12725 keyValue!4)))))

(declare-fun bm!72458 () Bool)

(assert (=> bm!72458 (= call!72461 call!72460)))

(declare-fun b!1579780 () Bool)

(assert (=> b!1579780 (= e!881273 call!72459)))

(declare-fun b!1579781 () Bool)

(assert (=> b!1579781 (= e!881272 (contains!10457 lt!676612 (tuple2!25429 (_1!12725 keyValue!4) (_2!12725 keyValue!4))))))

(declare-fun b!1579782 () Bool)

(assert (=> b!1579782 (= e!881276 e!881275)))

(assert (=> b!1579782 (= c!146493 (and ((_ is Cons!36779) (toList!11399 thiss!201)) (= (_1!12725 (h!38322 (toList!11399 thiss!201))) (_1!12725 keyValue!4))))))

(assert (= (and d!166335 c!146496) b!1579777))

(assert (= (and d!166335 (not c!146496)) b!1579782))

(assert (= (and b!1579782 c!146493) b!1579776))

(assert (= (and b!1579782 (not c!146493)) b!1579778))

(assert (= (and b!1579778 c!146495) b!1579780))

(assert (= (and b!1579778 (not c!146495)) b!1579775))

(assert (= (or b!1579780 b!1579775) bm!72456))

(assert (= (or b!1579776 bm!72456) bm!72458))

(assert (= (or b!1579777 bm!72458) bm!72457))

(assert (= (and bm!72457 c!146494) b!1579773))

(assert (= (and bm!72457 (not c!146494)) b!1579774))

(assert (= (and d!166335 res!1079207) b!1579779))

(assert (= (and b!1579779 res!1079208) b!1579781))

(declare-fun m!1451459 () Bool)

(assert (=> b!1579781 m!1451459))

(declare-fun m!1451461 () Bool)

(assert (=> d!166335 m!1451461))

(assert (=> d!166335 m!1451413))

(declare-fun m!1451463 () Bool)

(assert (=> bm!72457 m!1451463))

(declare-fun m!1451465 () Bool)

(assert (=> b!1579779 m!1451465))

(declare-fun m!1451467 () Bool)

(assert (=> b!1579773 m!1451467))

(assert (=> start!137014 d!166335))

(declare-fun d!166345 () Bool)

(declare-fun e!881302 () Bool)

(assert (=> d!166345 e!881302))

(declare-fun res!1079219 () Bool)

(assert (=> d!166345 (=> res!1079219 e!881302)))

(declare-fun lt!676625 () Bool)

(assert (=> d!166345 (= res!1079219 (not lt!676625))))

(declare-fun lt!676627 () Bool)

(assert (=> d!166345 (= lt!676625 lt!676627)))

(declare-fun lt!676628 () Unit!52227)

(declare-fun e!881301 () Unit!52227)

(assert (=> d!166345 (= lt!676628 e!881301)))

(declare-fun c!146515 () Bool)

(assert (=> d!166345 (= c!146515 lt!676627)))

(assert (=> d!166345 (= lt!676627 (containsKey!890 (toList!11399 (ListLongMap!22768 lt!676570)) (_1!12725 keyValue!4)))))

(assert (=> d!166345 (= (contains!10456 (ListLongMap!22768 lt!676570) (_1!12725 keyValue!4)) lt!676625)))

(declare-fun b!1579829 () Bool)

(declare-fun lt!676626 () Unit!52227)

(assert (=> b!1579829 (= e!881301 lt!676626)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!548 (List!36783 (_ BitVec 64)) Unit!52227)

(assert (=> b!1579829 (= lt!676626 (lemmaContainsKeyImpliesGetValueByKeyDefined!548 (toList!11399 (ListLongMap!22768 lt!676570)) (_1!12725 keyValue!4)))))

(declare-fun isDefined!596 (Option!885) Bool)

(assert (=> b!1579829 (isDefined!596 (getValueByKey!809 (toList!11399 (ListLongMap!22768 lt!676570)) (_1!12725 keyValue!4)))))

(declare-fun b!1579830 () Bool)

(declare-fun Unit!52233 () Unit!52227)

(assert (=> b!1579830 (= e!881301 Unit!52233)))

(declare-fun b!1579831 () Bool)

(assert (=> b!1579831 (= e!881302 (isDefined!596 (getValueByKey!809 (toList!11399 (ListLongMap!22768 lt!676570)) (_1!12725 keyValue!4))))))

(assert (= (and d!166345 c!146515) b!1579829))

(assert (= (and d!166345 (not c!146515)) b!1579830))

(assert (= (and d!166345 (not res!1079219)) b!1579831))

(declare-fun m!1451469 () Bool)

(assert (=> d!166345 m!1451469))

(declare-fun m!1451471 () Bool)

(assert (=> b!1579829 m!1451471))

(declare-fun m!1451473 () Bool)

(assert (=> b!1579829 m!1451473))

(assert (=> b!1579829 m!1451473))

(declare-fun m!1451475 () Bool)

(assert (=> b!1579829 m!1451475))

(assert (=> b!1579831 m!1451473))

(assert (=> b!1579831 m!1451473))

(assert (=> b!1579831 m!1451475))

(assert (=> start!137014 d!166345))

(declare-fun d!166347 () Bool)

(declare-fun lt!676635 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!827 (List!36783) (InoxSet tuple2!25428))

(assert (=> d!166347 (= lt!676635 (select (content!827 lt!676570) keyValue!4))))

(declare-fun e!881322 () Bool)

(assert (=> d!166347 (= lt!676635 e!881322)))

(declare-fun res!1079233 () Bool)

(assert (=> d!166347 (=> (not res!1079233) (not e!881322))))

(assert (=> d!166347 (= res!1079233 ((_ is Cons!36779) lt!676570))))

(assert (=> d!166347 (= (contains!10457 lt!676570 keyValue!4) lt!676635)))

(declare-fun b!1579860 () Bool)

(declare-fun e!881321 () Bool)

(assert (=> b!1579860 (= e!881322 e!881321)))

(declare-fun res!1079232 () Bool)

(assert (=> b!1579860 (=> res!1079232 e!881321)))

(assert (=> b!1579860 (= res!1079232 (= (h!38322 lt!676570) keyValue!4))))

(declare-fun b!1579861 () Bool)

(assert (=> b!1579861 (= e!881321 (contains!10457 (t!51697 lt!676570) keyValue!4))))

(assert (= (and d!166347 res!1079233) b!1579860))

(assert (= (and b!1579860 (not res!1079232)) b!1579861))

(declare-fun m!1451497 () Bool)

(assert (=> d!166347 m!1451497))

(declare-fun m!1451499 () Bool)

(assert (=> d!166347 m!1451499))

(declare-fun m!1451501 () Bool)

(assert (=> b!1579861 m!1451501))

(assert (=> b!1579673 d!166347))

(declare-fun b!1579868 () Bool)

(declare-fun e!881327 () Bool)

(declare-fun tp!114369 () Bool)

(assert (=> b!1579868 (= e!881327 (and tp_is_empty!39147 tp!114369))))

(assert (=> b!1579674 (= tp!114363 e!881327)))

(assert (= (and b!1579674 ((_ is Cons!36779) (toList!11399 thiss!201))) b!1579868))

(check-sat (not b!1579781) (not b!1579868) (not b!1579713) (not d!166325) (not bm!72457) tp_is_empty!39147 (not b!1579829) (not b!1579831) (not d!166345) (not d!166347) (not b!1579861) (not d!166335) (not b!1579712) (not b!1579779) (not d!166329) (not b!1579691) (not b!1579773))
(check-sat)
