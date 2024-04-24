; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137708 () Bool)

(assert start!137708)

(declare-fun b!1583371 () Bool)

(declare-fun e!883558 () Bool)

(declare-datatypes ((B!2678 0))(
  ( (B!2679 (val!19701 Int)) )
))
(declare-datatypes ((tuple2!25600 0))(
  ( (tuple2!25601 (_1!12811 (_ BitVec 64)) (_2!12811 B!2678)) )
))
(declare-datatypes ((List!36853 0))(
  ( (Nil!36850) (Cons!36849 (h!38410 tuple2!25600) (t!51759 List!36853)) )
))
(declare-datatypes ((tuple2!25602 0))(
  ( (tuple2!25603 (_1!12812 tuple2!25600) (_2!12812 List!36853)) )
))
(declare-datatypes ((Option!906 0))(
  ( (Some!905 (v!22409 tuple2!25602)) (None!904) )
))
(declare-fun lt!677738 () Option!906)

(get-info :version)

(declare-fun get!26847 (Option!906) tuple2!25602)

(assert (=> b!1583371 (= e!883558 (not ((_ is Nil!36850) (_2!12812 (get!26847 lt!677738)))))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun l!1390 () List!36853)

(declare-fun e!883556 () Bool)

(declare-fun b!1583372 () Bool)

(declare-fun value!194 () B!2678)

(declare-datatypes ((Option!907 0))(
  ( (Some!906 (v!22410 B!2678)) (None!905) )
))
(declare-fun getValueByKey!813 (List!36853 (_ BitVec 64)) Option!907)

(assert (=> b!1583372 (= e!883556 (not (= (getValueByKey!813 l!1390 key!405) (Some!906 value!194))))))

(declare-fun lt!677737 () tuple2!25600)

(declare-fun contains!10538 (List!36853 tuple2!25600) Bool)

(assert (=> b!1583372 (not (contains!10538 (t!51759 l!1390) lt!677737))))

(declare-datatypes ((Unit!52153 0))(
  ( (Unit!52154) )
))
(declare-fun lt!677739 () Unit!52153)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!4 (List!36853 (_ BitVec 64) B!2678) Unit!52153)

(assert (=> b!1583372 (= lt!677739 (lemmaNotContainsKeyThenNotContainsTuple!4 (t!51759 l!1390) key!405 value!194))))

(declare-fun res!1080901 () Bool)

(declare-fun e!883559 () Bool)

(assert (=> start!137708 (=> (not res!1080901) (not e!883559))))

(declare-fun isStrictlySorted!1067 (List!36853) Bool)

(assert (=> start!137708 (= res!1080901 (isStrictlySorted!1067 l!1390))))

(assert (=> start!137708 e!883559))

(declare-fun e!883555 () Bool)

(assert (=> start!137708 e!883555))

(assert (=> start!137708 true))

(declare-fun tp_is_empty!39223 () Bool)

(assert (=> start!137708 tp_is_empty!39223))

(declare-fun b!1583373 () Bool)

(declare-fun e!883557 () Bool)

(assert (=> b!1583373 (= e!883557 e!883556)))

(declare-fun res!1080897 () Bool)

(assert (=> b!1583373 (=> (not res!1080897) (not e!883556))))

(assert (=> b!1583373 (= res!1080897 e!883558)))

(declare-fun res!1080899 () Bool)

(assert (=> b!1583373 (=> res!1080899 e!883558)))

(declare-fun isEmpty!1175 (Option!906) Bool)

(assert (=> b!1583373 (= res!1080899 (isEmpty!1175 lt!677738))))

(declare-fun unapply!88 (List!36853) Option!906)

(assert (=> b!1583373 (= lt!677738 (unapply!88 l!1390))))

(declare-fun b!1583374 () Bool)

(declare-fun res!1080898 () Bool)

(assert (=> b!1583374 (=> (not res!1080898) (not e!883556))))

(assert (=> b!1583374 (= res!1080898 (isStrictlySorted!1067 (t!51759 l!1390)))))

(declare-fun b!1583375 () Bool)

(assert (=> b!1583375 (= e!883559 e!883557)))

(declare-fun res!1080895 () Bool)

(assert (=> b!1583375 (=> (not res!1080895) (not e!883557))))

(assert (=> b!1583375 (= res!1080895 (contains!10538 l!1390 lt!677737))))

(assert (=> b!1583375 (= lt!677737 (tuple2!25601 key!405 value!194))))

(declare-fun b!1583376 () Bool)

(declare-fun res!1080896 () Bool)

(assert (=> b!1583376 (=> (not res!1080896) (not e!883556))))

(assert (=> b!1583376 (= res!1080896 (and ((_ is Cons!36849) l!1390) (= (_1!12811 (h!38410 l!1390)) key!405)))))

(declare-fun b!1583377 () Bool)

(declare-fun res!1080900 () Bool)

(assert (=> b!1583377 (=> (not res!1080900) (not e!883556))))

(declare-fun containsKey!926 (List!36853 (_ BitVec 64)) Bool)

(assert (=> b!1583377 (= res!1080900 (not (containsKey!926 (t!51759 l!1390) key!405)))))

(declare-fun b!1583378 () Bool)

(declare-fun tp!114525 () Bool)

(assert (=> b!1583378 (= e!883555 (and tp_is_empty!39223 tp!114525))))

(declare-fun b!1583379 () Bool)

(declare-fun res!1080902 () Bool)

(assert (=> b!1583379 (=> (not res!1080902) (not e!883559))))

(assert (=> b!1583379 (= res!1080902 (containsKey!926 l!1390 key!405))))

(assert (= (and start!137708 res!1080901) b!1583379))

(assert (= (and b!1583379 res!1080902) b!1583375))

(assert (= (and b!1583375 res!1080895) b!1583373))

(assert (= (and b!1583373 (not res!1080899)) b!1583371))

(assert (= (and b!1583373 res!1080897) b!1583376))

(assert (= (and b!1583376 res!1080896) b!1583374))

(assert (= (and b!1583374 res!1080898) b!1583377))

(assert (= (and b!1583377 res!1080900) b!1583372))

(assert (= (and start!137708 ((_ is Cons!36849) l!1390)) b!1583378))

(declare-fun m!1454403 () Bool)

(assert (=> b!1583373 m!1454403))

(declare-fun m!1454405 () Bool)

(assert (=> b!1583373 m!1454405))

(declare-fun m!1454407 () Bool)

(assert (=> b!1583374 m!1454407))

(declare-fun m!1454409 () Bool)

(assert (=> b!1583375 m!1454409))

(declare-fun m!1454411 () Bool)

(assert (=> start!137708 m!1454411))

(declare-fun m!1454413 () Bool)

(assert (=> b!1583371 m!1454413))

(declare-fun m!1454415 () Bool)

(assert (=> b!1583379 m!1454415))

(declare-fun m!1454417 () Bool)

(assert (=> b!1583377 m!1454417))

(declare-fun m!1454419 () Bool)

(assert (=> b!1583372 m!1454419))

(declare-fun m!1454421 () Bool)

(assert (=> b!1583372 m!1454421))

(declare-fun m!1454423 () Bool)

(assert (=> b!1583372 m!1454423))

(check-sat (not b!1583378) (not b!1583375) (not start!137708) (not b!1583372) (not b!1583374) (not b!1583379) (not b!1583377) (not b!1583373) (not b!1583371) tp_is_empty!39223)
(check-sat)
(get-model)

(declare-fun d!167279 () Bool)

(assert (=> d!167279 (= (get!26847 lt!677738) (v!22409 lt!677738))))

(assert (=> b!1583371 d!167279))

(declare-fun d!167281 () Bool)

(declare-fun res!1080955 () Bool)

(declare-fun e!883594 () Bool)

(assert (=> d!167281 (=> res!1080955 e!883594)))

(assert (=> d!167281 (= res!1080955 (and ((_ is Cons!36849) (t!51759 l!1390)) (= (_1!12811 (h!38410 (t!51759 l!1390))) key!405)))))

(assert (=> d!167281 (= (containsKey!926 (t!51759 l!1390) key!405) e!883594)))

(declare-fun b!1583438 () Bool)

(declare-fun e!883595 () Bool)

(assert (=> b!1583438 (= e!883594 e!883595)))

(declare-fun res!1080956 () Bool)

(assert (=> b!1583438 (=> (not res!1080956) (not e!883595))))

(assert (=> b!1583438 (= res!1080956 (and (or (not ((_ is Cons!36849) (t!51759 l!1390))) (bvsle (_1!12811 (h!38410 (t!51759 l!1390))) key!405)) ((_ is Cons!36849) (t!51759 l!1390)) (bvslt (_1!12811 (h!38410 (t!51759 l!1390))) key!405)))))

(declare-fun b!1583439 () Bool)

(assert (=> b!1583439 (= e!883595 (containsKey!926 (t!51759 (t!51759 l!1390)) key!405))))

(assert (= (and d!167281 (not res!1080955)) b!1583438))

(assert (= (and b!1583438 res!1080956) b!1583439))

(declare-fun m!1454469 () Bool)

(assert (=> b!1583439 m!1454469))

(assert (=> b!1583377 d!167281))

(declare-fun b!1583460 () Bool)

(declare-fun e!883612 () Option!907)

(assert (=> b!1583460 (= e!883612 (Some!906 (_2!12811 (h!38410 l!1390))))))

(declare-fun b!1583462 () Bool)

(declare-fun e!883613 () Option!907)

(assert (=> b!1583462 (= e!883613 (getValueByKey!813 (t!51759 l!1390) key!405))))

(declare-fun b!1583463 () Bool)

(assert (=> b!1583463 (= e!883613 None!905)))

(declare-fun d!167289 () Bool)

(declare-fun c!147370 () Bool)

(assert (=> d!167289 (= c!147370 (and ((_ is Cons!36849) l!1390) (= (_1!12811 (h!38410 l!1390)) key!405)))))

(assert (=> d!167289 (= (getValueByKey!813 l!1390 key!405) e!883612)))

(declare-fun b!1583461 () Bool)

(assert (=> b!1583461 (= e!883612 e!883613)))

(declare-fun c!147371 () Bool)

(assert (=> b!1583461 (= c!147371 (and ((_ is Cons!36849) l!1390) (not (= (_1!12811 (h!38410 l!1390)) key!405))))))

(assert (= (and d!167289 c!147370) b!1583460))

(assert (= (and d!167289 (not c!147370)) b!1583461))

(assert (= (and b!1583461 c!147371) b!1583462))

(assert (= (and b!1583461 (not c!147371)) b!1583463))

(declare-fun m!1454477 () Bool)

(assert (=> b!1583462 m!1454477))

(assert (=> b!1583372 d!167289))

(declare-fun d!167295 () Bool)

(declare-fun lt!677766 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!828 (List!36853) (InoxSet tuple2!25600))

(assert (=> d!167295 (= lt!677766 (select (content!828 (t!51759 l!1390)) lt!677737))))

(declare-fun e!883633 () Bool)

(assert (=> d!167295 (= lt!677766 e!883633)))

(declare-fun res!1080988 () Bool)

(assert (=> d!167295 (=> (not res!1080988) (not e!883633))))

(assert (=> d!167295 (= res!1080988 ((_ is Cons!36849) (t!51759 l!1390)))))

(assert (=> d!167295 (= (contains!10538 (t!51759 l!1390) lt!677737) lt!677766)))

(declare-fun b!1583482 () Bool)

(declare-fun e!883632 () Bool)

(assert (=> b!1583482 (= e!883633 e!883632)))

(declare-fun res!1080987 () Bool)

(assert (=> b!1583482 (=> res!1080987 e!883632)))

(assert (=> b!1583482 (= res!1080987 (= (h!38410 (t!51759 l!1390)) lt!677737))))

(declare-fun b!1583483 () Bool)

(assert (=> b!1583483 (= e!883632 (contains!10538 (t!51759 (t!51759 l!1390)) lt!677737))))

(assert (= (and d!167295 res!1080988) b!1583482))

(assert (= (and b!1583482 (not res!1080987)) b!1583483))

(declare-fun m!1454485 () Bool)

(assert (=> d!167295 m!1454485))

(declare-fun m!1454487 () Bool)

(assert (=> d!167295 m!1454487))

(declare-fun m!1454489 () Bool)

(assert (=> b!1583483 m!1454489))

(assert (=> b!1583372 d!167295))

(declare-fun d!167301 () Bool)

(assert (=> d!167301 (not (contains!10538 (t!51759 l!1390) (tuple2!25601 key!405 value!194)))))

(declare-fun lt!677769 () Unit!52153)

(declare-fun choose!2089 (List!36853 (_ BitVec 64) B!2678) Unit!52153)

(assert (=> d!167301 (= lt!677769 (choose!2089 (t!51759 l!1390) key!405 value!194))))

(declare-fun e!883656 () Bool)

(assert (=> d!167301 e!883656))

(declare-fun res!1081007 () Bool)

(assert (=> d!167301 (=> (not res!1081007) (not e!883656))))

(assert (=> d!167301 (= res!1081007 (isStrictlySorted!1067 (t!51759 l!1390)))))

(assert (=> d!167301 (= (lemmaNotContainsKeyThenNotContainsTuple!4 (t!51759 l!1390) key!405 value!194) lt!677769)))

(declare-fun b!1583510 () Bool)

(assert (=> b!1583510 (= e!883656 (not (containsKey!926 (t!51759 l!1390) key!405)))))

(assert (= (and d!167301 res!1081007) b!1583510))

(declare-fun m!1454495 () Bool)

(assert (=> d!167301 m!1454495))

(declare-fun m!1454497 () Bool)

(assert (=> d!167301 m!1454497))

(assert (=> d!167301 m!1454407))

(assert (=> b!1583510 m!1454417))

(assert (=> b!1583372 d!167301))

(declare-fun d!167315 () Bool)

(declare-fun res!1081014 () Bool)

(declare-fun e!883669 () Bool)

(assert (=> d!167315 (=> res!1081014 e!883669)))

(assert (=> d!167315 (= res!1081014 (or ((_ is Nil!36850) l!1390) ((_ is Nil!36850) (t!51759 l!1390))))))

(assert (=> d!167315 (= (isStrictlySorted!1067 l!1390) e!883669)))

(declare-fun b!1583529 () Bool)

(declare-fun e!883670 () Bool)

(assert (=> b!1583529 (= e!883669 e!883670)))

(declare-fun res!1081015 () Bool)

(assert (=> b!1583529 (=> (not res!1081015) (not e!883670))))

(assert (=> b!1583529 (= res!1081015 (bvslt (_1!12811 (h!38410 l!1390)) (_1!12811 (h!38410 (t!51759 l!1390)))))))

(declare-fun b!1583530 () Bool)

(assert (=> b!1583530 (= e!883670 (isStrictlySorted!1067 (t!51759 l!1390)))))

(assert (= (and d!167315 (not res!1081014)) b!1583529))

(assert (= (and b!1583529 res!1081015) b!1583530))

(assert (=> b!1583530 m!1454407))

(assert (=> start!137708 d!167315))

(declare-fun d!167323 () Bool)

(declare-fun res!1081016 () Bool)

(declare-fun e!883671 () Bool)

(assert (=> d!167323 (=> res!1081016 e!883671)))

(assert (=> d!167323 (= res!1081016 (and ((_ is Cons!36849) l!1390) (= (_1!12811 (h!38410 l!1390)) key!405)))))

(assert (=> d!167323 (= (containsKey!926 l!1390 key!405) e!883671)))

(declare-fun b!1583531 () Bool)

(declare-fun e!883672 () Bool)

(assert (=> b!1583531 (= e!883671 e!883672)))

(declare-fun res!1081017 () Bool)

(assert (=> b!1583531 (=> (not res!1081017) (not e!883672))))

(assert (=> b!1583531 (= res!1081017 (and (or (not ((_ is Cons!36849) l!1390)) (bvsle (_1!12811 (h!38410 l!1390)) key!405)) ((_ is Cons!36849) l!1390) (bvslt (_1!12811 (h!38410 l!1390)) key!405)))))

(declare-fun b!1583532 () Bool)

(assert (=> b!1583532 (= e!883672 (containsKey!926 (t!51759 l!1390) key!405))))

(assert (= (and d!167323 (not res!1081016)) b!1583531))

(assert (= (and b!1583531 res!1081017) b!1583532))

(assert (=> b!1583532 m!1454417))

(assert (=> b!1583379 d!167323))

(declare-fun d!167325 () Bool)

(declare-fun res!1081018 () Bool)

(declare-fun e!883673 () Bool)

(assert (=> d!167325 (=> res!1081018 e!883673)))

(assert (=> d!167325 (= res!1081018 (or ((_ is Nil!36850) (t!51759 l!1390)) ((_ is Nil!36850) (t!51759 (t!51759 l!1390)))))))

(assert (=> d!167325 (= (isStrictlySorted!1067 (t!51759 l!1390)) e!883673)))

(declare-fun b!1583533 () Bool)

(declare-fun e!883674 () Bool)

(assert (=> b!1583533 (= e!883673 e!883674)))

(declare-fun res!1081019 () Bool)

(assert (=> b!1583533 (=> (not res!1081019) (not e!883674))))

(assert (=> b!1583533 (= res!1081019 (bvslt (_1!12811 (h!38410 (t!51759 l!1390))) (_1!12811 (h!38410 (t!51759 (t!51759 l!1390))))))))

(declare-fun b!1583534 () Bool)

(assert (=> b!1583534 (= e!883674 (isStrictlySorted!1067 (t!51759 (t!51759 l!1390))))))

(assert (= (and d!167325 (not res!1081018)) b!1583533))

(assert (= (and b!1583533 res!1081019) b!1583534))

(declare-fun m!1454507 () Bool)

(assert (=> b!1583534 m!1454507))

(assert (=> b!1583374 d!167325))

(declare-fun d!167327 () Bool)

(assert (=> d!167327 (= (isEmpty!1175 lt!677738) (not ((_ is Some!905) lt!677738)))))

(assert (=> b!1583373 d!167327))

(declare-fun d!167329 () Bool)

(assert (=> d!167329 (= (unapply!88 l!1390) (ite ((_ is Nil!36850) l!1390) None!904 (Some!905 (tuple2!25603 (h!38410 l!1390) (t!51759 l!1390)))))))

(assert (=> b!1583373 d!167329))

(declare-fun d!167335 () Bool)

(declare-fun lt!677775 () Bool)

(assert (=> d!167335 (= lt!677775 (select (content!828 l!1390) lt!677737))))

(declare-fun e!883683 () Bool)

(assert (=> d!167335 (= lt!677775 e!883683)))

(declare-fun res!1081026 () Bool)

(assert (=> d!167335 (=> (not res!1081026) (not e!883683))))

(assert (=> d!167335 (= res!1081026 ((_ is Cons!36849) l!1390))))

(assert (=> d!167335 (= (contains!10538 l!1390 lt!677737) lt!677775)))

(declare-fun b!1583544 () Bool)

(declare-fun e!883682 () Bool)

(assert (=> b!1583544 (= e!883683 e!883682)))

(declare-fun res!1081025 () Bool)

(assert (=> b!1583544 (=> res!1081025 e!883682)))

(assert (=> b!1583544 (= res!1081025 (= (h!38410 l!1390) lt!677737))))

(declare-fun b!1583545 () Bool)

(assert (=> b!1583545 (= e!883682 (contains!10538 (t!51759 l!1390) lt!677737))))

(assert (= (and d!167335 res!1081026) b!1583544))

(assert (= (and b!1583544 (not res!1081025)) b!1583545))

(declare-fun m!1454521 () Bool)

(assert (=> d!167335 m!1454521))

(declare-fun m!1454523 () Bool)

(assert (=> d!167335 m!1454523))

(assert (=> b!1583545 m!1454421))

(assert (=> b!1583375 d!167335))

(declare-fun b!1583552 () Bool)

(declare-fun e!883688 () Bool)

(declare-fun tp!114534 () Bool)

(assert (=> b!1583552 (= e!883688 (and tp_is_empty!39223 tp!114534))))

(assert (=> b!1583378 (= tp!114525 e!883688)))

(assert (= (and b!1583378 ((_ is Cons!36849) (t!51759 l!1390))) b!1583552))

(check-sat (not d!167335) (not b!1583545) (not d!167301) (not b!1583439) (not b!1583462) (not b!1583552) (not b!1583510) tp_is_empty!39223 (not b!1583483) (not b!1583530) (not b!1583532) (not b!1583534) (not d!167295))
(check-sat)
