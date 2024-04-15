; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106392 () Bool)

(assert start!106392)

(declare-fun b!1265256 () Bool)

(declare-fun e!720538 () Bool)

(declare-fun tp_is_empty!32497 () Bool)

(declare-fun tp!96320 () Bool)

(assert (=> b!1265256 (= e!720538 (and tp_is_empty!32497 tp!96320))))

(declare-fun b!1265254 () Bool)

(declare-fun res!842472 () Bool)

(declare-fun e!720539 () Bool)

(assert (=> b!1265254 (=> (not res!842472) (not e!720539))))

(declare-datatypes ((B!1964 0))(
  ( (B!1965 (val!16317 Int)) )
))
(declare-datatypes ((tuple2!21234 0))(
  ( (tuple2!21235 (_1!10628 (_ BitVec 64)) (_2!10628 B!1964)) )
))
(declare-datatypes ((List!28393 0))(
  ( (Nil!28390) (Cons!28389 (h!29598 tuple2!21234) (t!41905 List!28393)) )
))
(declare-fun l!706 () List!28393)

(get-info :version)

(assert (=> b!1265254 (= res!842472 (not ((_ is Cons!28389) l!706)))))

(declare-fun b!1265255 () Bool)

(declare-fun v1!26 () B!1964)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun isStrictlySorted!780 (List!28393) Bool)

(declare-fun insertStrictlySorted!463 (List!28393 (_ BitVec 64) B!1964) List!28393)

(assert (=> b!1265255 (= e!720539 (not (isStrictlySorted!780 (insertStrictlySorted!463 l!706 key1!31 v1!26))))))

(declare-fun b!1265253 () Bool)

(declare-fun res!842470 () Bool)

(assert (=> b!1265253 (=> (not res!842470) (not e!720539))))

(declare-fun containsKey!641 (List!28393 (_ BitVec 64)) Bool)

(assert (=> b!1265253 (= res!842470 (not (containsKey!641 l!706 key1!31)))))

(declare-fun res!842471 () Bool)

(assert (=> start!106392 (=> (not res!842471) (not e!720539))))

(assert (=> start!106392 (= res!842471 (isStrictlySorted!780 l!706))))

(assert (=> start!106392 e!720539))

(assert (=> start!106392 e!720538))

(assert (=> start!106392 true))

(assert (=> start!106392 tp_is_empty!32497))

(assert (= (and start!106392 res!842471) b!1265253))

(assert (= (and b!1265253 res!842470) b!1265254))

(assert (= (and b!1265254 res!842472) b!1265255))

(assert (= (and start!106392 ((_ is Cons!28389) l!706)) b!1265256))

(declare-fun m!1165055 () Bool)

(assert (=> b!1265255 m!1165055))

(assert (=> b!1265255 m!1165055))

(declare-fun m!1165057 () Bool)

(assert (=> b!1265255 m!1165057))

(declare-fun m!1165059 () Bool)

(assert (=> b!1265253 m!1165059))

(declare-fun m!1165061 () Bool)

(assert (=> start!106392 m!1165061))

(check-sat (not start!106392) (not b!1265253) (not b!1265256) (not b!1265255) tp_is_empty!32497)
(check-sat)
(get-model)

(declare-fun d!138769 () Bool)

(declare-fun res!842505 () Bool)

(declare-fun e!720566 () Bool)

(assert (=> d!138769 (=> res!842505 e!720566)))

(assert (=> d!138769 (= res!842505 (and ((_ is Cons!28389) l!706) (= (_1!10628 (h!29598 l!706)) key1!31)))))

(assert (=> d!138769 (= (containsKey!641 l!706 key1!31) e!720566)))

(declare-fun b!1265295 () Bool)

(declare-fun e!720567 () Bool)

(assert (=> b!1265295 (= e!720566 e!720567)))

(declare-fun res!842506 () Bool)

(assert (=> b!1265295 (=> (not res!842506) (not e!720567))))

(assert (=> b!1265295 (= res!842506 (and (or (not ((_ is Cons!28389) l!706)) (bvsle (_1!10628 (h!29598 l!706)) key1!31)) ((_ is Cons!28389) l!706) (bvslt (_1!10628 (h!29598 l!706)) key1!31)))))

(declare-fun b!1265296 () Bool)

(assert (=> b!1265296 (= e!720567 (containsKey!641 (t!41905 l!706) key1!31))))

(assert (= (and d!138769 (not res!842505)) b!1265295))

(assert (= (and b!1265295 res!842506) b!1265296))

(declare-fun m!1165081 () Bool)

(assert (=> b!1265296 m!1165081))

(assert (=> b!1265253 d!138769))

(declare-fun d!138777 () Bool)

(declare-fun res!842519 () Bool)

(declare-fun e!720580 () Bool)

(assert (=> d!138777 (=> res!842519 e!720580)))

(assert (=> d!138777 (= res!842519 (or ((_ is Nil!28390) l!706) ((_ is Nil!28390) (t!41905 l!706))))))

(assert (=> d!138777 (= (isStrictlySorted!780 l!706) e!720580)))

(declare-fun b!1265309 () Bool)

(declare-fun e!720581 () Bool)

(assert (=> b!1265309 (= e!720580 e!720581)))

(declare-fun res!842520 () Bool)

(assert (=> b!1265309 (=> (not res!842520) (not e!720581))))

(assert (=> b!1265309 (= res!842520 (bvslt (_1!10628 (h!29598 l!706)) (_1!10628 (h!29598 (t!41905 l!706)))))))

(declare-fun b!1265310 () Bool)

(assert (=> b!1265310 (= e!720581 (isStrictlySorted!780 (t!41905 l!706)))))

(assert (= (and d!138777 (not res!842519)) b!1265309))

(assert (= (and b!1265309 res!842520) b!1265310))

(declare-fun m!1165087 () Bool)

(assert (=> b!1265310 m!1165087))

(assert (=> start!106392 d!138777))

(declare-fun d!138783 () Bool)

(declare-fun res!842523 () Bool)

(declare-fun e!720584 () Bool)

(assert (=> d!138783 (=> res!842523 e!720584)))

(assert (=> d!138783 (= res!842523 (or ((_ is Nil!28390) (insertStrictlySorted!463 l!706 key1!31 v1!26)) ((_ is Nil!28390) (t!41905 (insertStrictlySorted!463 l!706 key1!31 v1!26)))))))

(assert (=> d!138783 (= (isStrictlySorted!780 (insertStrictlySorted!463 l!706 key1!31 v1!26)) e!720584)))

(declare-fun b!1265313 () Bool)

(declare-fun e!720585 () Bool)

(assert (=> b!1265313 (= e!720584 e!720585)))

(declare-fun res!842524 () Bool)

(assert (=> b!1265313 (=> (not res!842524) (not e!720585))))

(assert (=> b!1265313 (= res!842524 (bvslt (_1!10628 (h!29598 (insertStrictlySorted!463 l!706 key1!31 v1!26))) (_1!10628 (h!29598 (t!41905 (insertStrictlySorted!463 l!706 key1!31 v1!26))))))))

(declare-fun b!1265314 () Bool)

(assert (=> b!1265314 (= e!720585 (isStrictlySorted!780 (t!41905 (insertStrictlySorted!463 l!706 key1!31 v1!26))))))

(assert (= (and d!138783 (not res!842523)) b!1265313))

(assert (= (and b!1265313 res!842524) b!1265314))

(declare-fun m!1165091 () Bool)

(assert (=> b!1265314 m!1165091))

(assert (=> b!1265255 d!138783))

(declare-fun e!720622 () List!28393)

(declare-fun b!1265385 () Bool)

(assert (=> b!1265385 (= e!720622 (insertStrictlySorted!463 (t!41905 l!706) key1!31 v1!26))))

(declare-fun b!1265386 () Bool)

(declare-fun e!720621 () List!28393)

(declare-fun call!62399 () List!28393)

(assert (=> b!1265386 (= e!720621 call!62399)))

(declare-fun b!1265387 () Bool)

(declare-fun e!720625 () List!28393)

(assert (=> b!1265387 (= e!720621 e!720625)))

(declare-fun c!123294 () Bool)

(assert (=> b!1265387 (= c!123294 (and ((_ is Cons!28389) l!706) (= (_1!10628 (h!29598 l!706)) key1!31)))))

(declare-fun e!720623 () Bool)

(declare-fun b!1265388 () Bool)

(declare-fun lt!573870 () List!28393)

(declare-fun contains!7607 (List!28393 tuple2!21234) Bool)

(assert (=> b!1265388 (= e!720623 (contains!7607 lt!573870 (tuple2!21235 key1!31 v1!26)))))

(declare-fun b!1265389 () Bool)

(declare-fun res!842539 () Bool)

(assert (=> b!1265389 (=> (not res!842539) (not e!720623))))

(assert (=> b!1265389 (= res!842539 (containsKey!641 lt!573870 key1!31))))

(declare-fun c!123295 () Bool)

(declare-fun b!1265390 () Bool)

(assert (=> b!1265390 (= e!720622 (ite c!123294 (t!41905 l!706) (ite c!123295 (Cons!28389 (h!29598 l!706) (t!41905 l!706)) Nil!28390)))))

(declare-fun bm!62396 () Bool)

(declare-fun call!62398 () List!28393)

(assert (=> bm!62396 (= call!62398 call!62399)))

(declare-fun bm!62397 () Bool)

(declare-fun call!62400 () List!28393)

(assert (=> bm!62397 (= call!62400 call!62398)))

(declare-fun b!1265391 () Bool)

(assert (=> b!1265391 (= e!720625 call!62398)))

(declare-fun b!1265392 () Bool)

(assert (=> b!1265392 (= c!123295 (and ((_ is Cons!28389) l!706) (bvsgt (_1!10628 (h!29598 l!706)) key1!31)))))

(declare-fun e!720624 () List!28393)

(assert (=> b!1265392 (= e!720625 e!720624)))

(declare-fun b!1265393 () Bool)

(assert (=> b!1265393 (= e!720624 call!62400)))

(declare-fun b!1265394 () Bool)

(assert (=> b!1265394 (= e!720624 call!62400)))

(declare-fun bm!62395 () Bool)

(declare-fun c!123297 () Bool)

(declare-fun $colon$colon!639 (List!28393 tuple2!21234) List!28393)

(assert (=> bm!62395 (= call!62399 ($colon$colon!639 e!720622 (ite c!123297 (h!29598 l!706) (tuple2!21235 key1!31 v1!26))))))

(declare-fun c!123296 () Bool)

(assert (=> bm!62395 (= c!123296 c!123297)))

(declare-fun d!138787 () Bool)

(assert (=> d!138787 e!720623))

(declare-fun res!842540 () Bool)

(assert (=> d!138787 (=> (not res!842540) (not e!720623))))

(assert (=> d!138787 (= res!842540 (isStrictlySorted!780 lt!573870))))

(assert (=> d!138787 (= lt!573870 e!720621)))

(assert (=> d!138787 (= c!123297 (and ((_ is Cons!28389) l!706) (bvslt (_1!10628 (h!29598 l!706)) key1!31)))))

(assert (=> d!138787 (isStrictlySorted!780 l!706)))

(assert (=> d!138787 (= (insertStrictlySorted!463 l!706 key1!31 v1!26) lt!573870)))

(assert (= (and d!138787 c!123297) b!1265386))

(assert (= (and d!138787 (not c!123297)) b!1265387))

(assert (= (and b!1265387 c!123294) b!1265391))

(assert (= (and b!1265387 (not c!123294)) b!1265392))

(assert (= (and b!1265392 c!123295) b!1265394))

(assert (= (and b!1265392 (not c!123295)) b!1265393))

(assert (= (or b!1265394 b!1265393) bm!62397))

(assert (= (or b!1265391 bm!62397) bm!62396))

(assert (= (or b!1265386 bm!62396) bm!62395))

(assert (= (and bm!62395 c!123296) b!1265385))

(assert (= (and bm!62395 (not c!123296)) b!1265390))

(assert (= (and d!138787 res!842540) b!1265389))

(assert (= (and b!1265389 res!842539) b!1265388))

(declare-fun m!1165103 () Bool)

(assert (=> b!1265388 m!1165103))

(declare-fun m!1165105 () Bool)

(assert (=> b!1265389 m!1165105))

(declare-fun m!1165107 () Bool)

(assert (=> b!1265385 m!1165107))

(declare-fun m!1165113 () Bool)

(assert (=> bm!62395 m!1165113))

(declare-fun m!1165115 () Bool)

(assert (=> d!138787 m!1165115))

(assert (=> d!138787 m!1165061))

(assert (=> b!1265255 d!138787))

(declare-fun b!1265421 () Bool)

(declare-fun e!720643 () Bool)

(declare-fun tp!96331 () Bool)

(assert (=> b!1265421 (= e!720643 (and tp_is_empty!32497 tp!96331))))

(assert (=> b!1265256 (= tp!96320 e!720643)))

(assert (= (and b!1265256 ((_ is Cons!28389) (t!41905 l!706))) b!1265421))

(check-sat (not b!1265310) (not b!1265385) (not b!1265388) (not d!138787) (not b!1265314) (not b!1265421) tp_is_empty!32497 (not bm!62395) (not b!1265296) (not b!1265389))
(check-sat)
