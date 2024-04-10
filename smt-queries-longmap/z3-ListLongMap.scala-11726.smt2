; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137414 () Bool)

(assert start!137414)

(declare-fun b!1581478 () Bool)

(declare-fun res!1080462 () Bool)

(declare-fun e!882442 () Bool)

(assert (=> b!1581478 (=> (not res!1080462) (not e!882442))))

(declare-datatypes ((B!2698 0))(
  ( (B!2699 (val!19711 Int)) )
))
(declare-datatypes ((tuple2!25580 0))(
  ( (tuple2!25581 (_1!12801 (_ BitVec 64)) (_2!12801 B!2698)) )
))
(declare-datatypes ((List!36831 0))(
  ( (Nil!36828) (Cons!36827 (h!38370 tuple2!25580) (t!51745 List!36831)) )
))
(declare-fun l!1390 () List!36831)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!935 (List!36831 (_ BitVec 64)) Bool)

(assert (=> b!1581478 (= res!1080462 (containsKey!935 l!1390 key!405))))

(declare-fun b!1581479 () Bool)

(declare-fun res!1080457 () Bool)

(declare-fun e!882441 () Bool)

(assert (=> b!1581479 (=> (not res!1080457) (not e!882441))))

(declare-fun lt!676963 () tuple2!25580)

(declare-fun contains!10503 (List!36831 tuple2!25580) Bool)

(assert (=> b!1581479 (= res!1080457 (contains!10503 (t!51745 l!1390) lt!676963))))

(declare-fun res!1080459 () Bool)

(assert (=> start!137414 (=> (not res!1080459) (not e!882442))))

(declare-fun isStrictlySorted!1089 (List!36831) Bool)

(assert (=> start!137414 (= res!1080459 (isStrictlySorted!1089 l!1390))))

(assert (=> start!137414 e!882442))

(declare-fun e!882439 () Bool)

(assert (=> start!137414 e!882439))

(assert (=> start!137414 true))

(declare-fun tp_is_empty!39243 () Bool)

(assert (=> start!137414 tp_is_empty!39243))

(declare-fun b!1581480 () Bool)

(declare-fun e!882440 () Bool)

(declare-datatypes ((tuple2!25582 0))(
  ( (tuple2!25583 (_1!12802 tuple2!25580) (_2!12802 List!36831)) )
))
(declare-datatypes ((Option!925 0))(
  ( (Some!924 (v!22440 tuple2!25582)) (None!923) )
))
(declare-fun lt!676965 () Option!925)

(get-info :version)

(declare-fun get!26819 (Option!925) tuple2!25582)

(assert (=> b!1581480 (= e!882440 (not ((_ is Nil!36828) (_2!12802 (get!26819 lt!676965)))))))

(declare-fun b!1581481 () Bool)

(declare-fun e!882443 () Bool)

(assert (=> b!1581481 (= e!882443 e!882441)))

(declare-fun res!1080455 () Bool)

(assert (=> b!1581481 (=> (not res!1080455) (not e!882441))))

(assert (=> b!1581481 (= res!1080455 e!882440)))

(declare-fun res!1080461 () Bool)

(assert (=> b!1581481 (=> res!1080461 e!882440)))

(declare-fun isEmpty!1182 (Option!925) Bool)

(assert (=> b!1581481 (= res!1080461 (isEmpty!1182 lt!676965))))

(declare-fun unapply!98 (List!36831) Option!925)

(assert (=> b!1581481 (= lt!676965 (unapply!98 l!1390))))

(declare-fun b!1581482 () Bool)

(declare-fun res!1080458 () Bool)

(assert (=> b!1581482 (=> (not res!1080458) (not e!882441))))

(assert (=> b!1581482 (= res!1080458 (and (or (not ((_ is Cons!36827) l!1390)) (not (= (_1!12801 (h!38370 l!1390)) key!405))) ((_ is Cons!36827) l!1390)))))

(declare-fun b!1581483 () Bool)

(declare-fun res!1080460 () Bool)

(assert (=> b!1581483 (=> (not res!1080460) (not e!882441))))

(assert (=> b!1581483 (= res!1080460 (containsKey!935 (t!51745 l!1390) key!405))))

(declare-fun b!1581484 () Bool)

(assert (=> b!1581484 (= e!882442 e!882443)))

(declare-fun res!1080456 () Bool)

(assert (=> b!1581484 (=> (not res!1080456) (not e!882443))))

(assert (=> b!1581484 (= res!1080456 (contains!10503 l!1390 lt!676963))))

(declare-fun value!194 () B!2698)

(assert (=> b!1581484 (= lt!676963 (tuple2!25581 key!405 value!194))))

(declare-fun b!1581485 () Bool)

(declare-fun res!1080454 () Bool)

(assert (=> b!1581485 (=> (not res!1080454) (not e!882441))))

(assert (=> b!1581485 (= res!1080454 (isStrictlySorted!1089 (t!51745 l!1390)))))

(declare-datatypes ((Option!926 0))(
  ( (Some!925 (v!22441 B!2698)) (None!924) )
))
(declare-fun lt!676962 () Option!926)

(declare-fun b!1581486 () Bool)

(declare-fun getValueByKey!821 (List!36831 (_ BitVec 64)) Option!926)

(assert (=> b!1581486 (= e!882441 (not (= (getValueByKey!821 l!1390 key!405) lt!676962)))))

(assert (=> b!1581486 (= (getValueByKey!821 (t!51745 l!1390) key!405) lt!676962)))

(assert (=> b!1581486 (= lt!676962 (Some!925 value!194))))

(declare-datatypes ((Unit!52254 0))(
  ( (Unit!52255) )
))
(declare-fun lt!676964 () Unit!52254)

(declare-fun lemmaContainsTupThenGetReturnValue!401 (List!36831 (_ BitVec 64) B!2698) Unit!52254)

(assert (=> b!1581486 (= lt!676964 (lemmaContainsTupThenGetReturnValue!401 (t!51745 l!1390) key!405 value!194))))

(declare-fun b!1581487 () Bool)

(declare-fun tp!114581 () Bool)

(assert (=> b!1581487 (= e!882439 (and tp_is_empty!39243 tp!114581))))

(assert (= (and start!137414 res!1080459) b!1581478))

(assert (= (and b!1581478 res!1080462) b!1581484))

(assert (= (and b!1581484 res!1080456) b!1581481))

(assert (= (and b!1581481 (not res!1080461)) b!1581480))

(assert (= (and b!1581481 res!1080455) b!1581482))

(assert (= (and b!1581482 res!1080458) b!1581485))

(assert (= (and b!1581485 res!1080454) b!1581483))

(assert (= (and b!1581483 res!1080460) b!1581479))

(assert (= (and b!1581479 res!1080457) b!1581486))

(assert (= (and start!137414 ((_ is Cons!36827) l!1390)) b!1581487))

(declare-fun m!1452437 () Bool)

(assert (=> b!1581485 m!1452437))

(declare-fun m!1452439 () Bool)

(assert (=> b!1581480 m!1452439))

(declare-fun m!1452441 () Bool)

(assert (=> b!1581478 m!1452441))

(declare-fun m!1452443 () Bool)

(assert (=> b!1581479 m!1452443))

(declare-fun m!1452445 () Bool)

(assert (=> b!1581483 m!1452445))

(declare-fun m!1452447 () Bool)

(assert (=> b!1581486 m!1452447))

(declare-fun m!1452449 () Bool)

(assert (=> b!1581486 m!1452449))

(declare-fun m!1452451 () Bool)

(assert (=> b!1581486 m!1452451))

(declare-fun m!1452453 () Bool)

(assert (=> b!1581481 m!1452453))

(declare-fun m!1452455 () Bool)

(assert (=> b!1581481 m!1452455))

(declare-fun m!1452457 () Bool)

(assert (=> b!1581484 m!1452457))

(declare-fun m!1452459 () Bool)

(assert (=> start!137414 m!1452459))

(check-sat (not b!1581487) tp_is_empty!39243 (not b!1581479) (not b!1581481) (not b!1581486) (not b!1581484) (not start!137414) (not b!1581480) (not b!1581483) (not b!1581478) (not b!1581485))
(check-sat)
(get-model)

(declare-fun d!166741 () Bool)

(declare-fun res!1080496 () Bool)

(declare-fun e!882465 () Bool)

(assert (=> d!166741 (=> res!1080496 e!882465)))

(assert (=> d!166741 (= res!1080496 (and ((_ is Cons!36827) (t!51745 l!1390)) (= (_1!12801 (h!38370 (t!51745 l!1390))) key!405)))))

(assert (=> d!166741 (= (containsKey!935 (t!51745 l!1390) key!405) e!882465)))

(declare-fun b!1581522 () Bool)

(declare-fun e!882466 () Bool)

(assert (=> b!1581522 (= e!882465 e!882466)))

(declare-fun res!1080497 () Bool)

(assert (=> b!1581522 (=> (not res!1080497) (not e!882466))))

(assert (=> b!1581522 (= res!1080497 (and (or (not ((_ is Cons!36827) (t!51745 l!1390))) (bvsle (_1!12801 (h!38370 (t!51745 l!1390))) key!405)) ((_ is Cons!36827) (t!51745 l!1390)) (bvslt (_1!12801 (h!38370 (t!51745 l!1390))) key!405)))))

(declare-fun b!1581523 () Bool)

(assert (=> b!1581523 (= e!882466 (containsKey!935 (t!51745 (t!51745 l!1390)) key!405))))

(assert (= (and d!166741 (not res!1080496)) b!1581522))

(assert (= (and b!1581522 res!1080497) b!1581523))

(declare-fun m!1452485 () Bool)

(assert (=> b!1581523 m!1452485))

(assert (=> b!1581483 d!166741))

(declare-fun d!166747 () Bool)

(declare-fun lt!676985 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!850 (List!36831) (InoxSet tuple2!25580))

(assert (=> d!166747 (= lt!676985 (select (content!850 l!1390) lt!676963))))

(declare-fun e!882483 () Bool)

(assert (=> d!166747 (= lt!676985 e!882483)))

(declare-fun res!1080514 () Bool)

(assert (=> d!166747 (=> (not res!1080514) (not e!882483))))

(assert (=> d!166747 (= res!1080514 ((_ is Cons!36827) l!1390))))

(assert (=> d!166747 (= (contains!10503 l!1390 lt!676963) lt!676985)))

(declare-fun b!1581542 () Bool)

(declare-fun e!882484 () Bool)

(assert (=> b!1581542 (= e!882483 e!882484)))

(declare-fun res!1080515 () Bool)

(assert (=> b!1581542 (=> res!1080515 e!882484)))

(assert (=> b!1581542 (= res!1080515 (= (h!38370 l!1390) lt!676963))))

(declare-fun b!1581543 () Bool)

(assert (=> b!1581543 (= e!882484 (contains!10503 (t!51745 l!1390) lt!676963))))

(assert (= (and d!166747 res!1080514) b!1581542))

(assert (= (and b!1581542 (not res!1080515)) b!1581543))

(declare-fun m!1452493 () Bool)

(assert (=> d!166747 m!1452493))

(declare-fun m!1452495 () Bool)

(assert (=> d!166747 m!1452495))

(assert (=> b!1581543 m!1452443))

(assert (=> b!1581484 d!166747))

(declare-fun d!166755 () Bool)

(declare-fun lt!676986 () Bool)

(assert (=> d!166755 (= lt!676986 (select (content!850 (t!51745 l!1390)) lt!676963))))

(declare-fun e!882489 () Bool)

(assert (=> d!166755 (= lt!676986 e!882489)))

(declare-fun res!1080520 () Bool)

(assert (=> d!166755 (=> (not res!1080520) (not e!882489))))

(assert (=> d!166755 (= res!1080520 ((_ is Cons!36827) (t!51745 l!1390)))))

(assert (=> d!166755 (= (contains!10503 (t!51745 l!1390) lt!676963) lt!676986)))

(declare-fun b!1581548 () Bool)

(declare-fun e!882490 () Bool)

(assert (=> b!1581548 (= e!882489 e!882490)))

(declare-fun res!1080521 () Bool)

(assert (=> b!1581548 (=> res!1080521 e!882490)))

(assert (=> b!1581548 (= res!1080521 (= (h!38370 (t!51745 l!1390)) lt!676963))))

(declare-fun b!1581549 () Bool)

(assert (=> b!1581549 (= e!882490 (contains!10503 (t!51745 (t!51745 l!1390)) lt!676963))))

(assert (= (and d!166755 res!1080520) b!1581548))

(assert (= (and b!1581548 (not res!1080521)) b!1581549))

(declare-fun m!1452497 () Bool)

(assert (=> d!166755 m!1452497))

(declare-fun m!1452499 () Bool)

(assert (=> d!166755 m!1452499))

(declare-fun m!1452501 () Bool)

(assert (=> b!1581549 m!1452501))

(assert (=> b!1581479 d!166755))

(declare-fun d!166757 () Bool)

(declare-fun res!1080528 () Bool)

(declare-fun e!882503 () Bool)

(assert (=> d!166757 (=> res!1080528 e!882503)))

(assert (=> d!166757 (= res!1080528 (or ((_ is Nil!36828) l!1390) ((_ is Nil!36828) (t!51745 l!1390))))))

(assert (=> d!166757 (= (isStrictlySorted!1089 l!1390) e!882503)))

(declare-fun b!1581568 () Bool)

(declare-fun e!882504 () Bool)

(assert (=> b!1581568 (= e!882503 e!882504)))

(declare-fun res!1080529 () Bool)

(assert (=> b!1581568 (=> (not res!1080529) (not e!882504))))

(assert (=> b!1581568 (= res!1080529 (bvslt (_1!12801 (h!38370 l!1390)) (_1!12801 (h!38370 (t!51745 l!1390)))))))

(declare-fun b!1581569 () Bool)

(assert (=> b!1581569 (= e!882504 (isStrictlySorted!1089 (t!51745 l!1390)))))

(assert (= (and d!166757 (not res!1080528)) b!1581568))

(assert (= (and b!1581568 res!1080529) b!1581569))

(assert (=> b!1581569 m!1452437))

(assert (=> start!137414 d!166757))

(declare-fun d!166767 () Bool)

(declare-fun res!1080530 () Bool)

(declare-fun e!882507 () Bool)

(assert (=> d!166767 (=> res!1080530 e!882507)))

(assert (=> d!166767 (= res!1080530 (and ((_ is Cons!36827) l!1390) (= (_1!12801 (h!38370 l!1390)) key!405)))))

(assert (=> d!166767 (= (containsKey!935 l!1390 key!405) e!882507)))

(declare-fun b!1581574 () Bool)

(declare-fun e!882508 () Bool)

(assert (=> b!1581574 (= e!882507 e!882508)))

(declare-fun res!1080531 () Bool)

(assert (=> b!1581574 (=> (not res!1080531) (not e!882508))))

(assert (=> b!1581574 (= res!1080531 (and (or (not ((_ is Cons!36827) l!1390)) (bvsle (_1!12801 (h!38370 l!1390)) key!405)) ((_ is Cons!36827) l!1390) (bvslt (_1!12801 (h!38370 l!1390)) key!405)))))

(declare-fun b!1581575 () Bool)

(assert (=> b!1581575 (= e!882508 (containsKey!935 (t!51745 l!1390) key!405))))

(assert (= (and d!166767 (not res!1080530)) b!1581574))

(assert (= (and b!1581574 res!1080531) b!1581575))

(assert (=> b!1581575 m!1452445))

(assert (=> b!1581478 d!166767))

(declare-fun d!166771 () Bool)

(assert (=> d!166771 (= (get!26819 lt!676965) (v!22440 lt!676965))))

(assert (=> b!1581480 d!166771))

(declare-fun d!166773 () Bool)

(declare-fun res!1080532 () Bool)

(declare-fun e!882509 () Bool)

(assert (=> d!166773 (=> res!1080532 e!882509)))

(assert (=> d!166773 (= res!1080532 (or ((_ is Nil!36828) (t!51745 l!1390)) ((_ is Nil!36828) (t!51745 (t!51745 l!1390)))))))

(assert (=> d!166773 (= (isStrictlySorted!1089 (t!51745 l!1390)) e!882509)))

(declare-fun b!1581576 () Bool)

(declare-fun e!882510 () Bool)

(assert (=> b!1581576 (= e!882509 e!882510)))

(declare-fun res!1080533 () Bool)

(assert (=> b!1581576 (=> (not res!1080533) (not e!882510))))

(assert (=> b!1581576 (= res!1080533 (bvslt (_1!12801 (h!38370 (t!51745 l!1390))) (_1!12801 (h!38370 (t!51745 (t!51745 l!1390))))))))

(declare-fun b!1581577 () Bool)

(assert (=> b!1581577 (= e!882510 (isStrictlySorted!1089 (t!51745 (t!51745 l!1390))))))

(assert (= (and d!166773 (not res!1080532)) b!1581576))

(assert (= (and b!1581576 res!1080533) b!1581577))

(declare-fun m!1452509 () Bool)

(assert (=> b!1581577 m!1452509))

(assert (=> b!1581485 d!166773))

(declare-fun b!1581605 () Bool)

(declare-fun e!882529 () Option!926)

(assert (=> b!1581605 (= e!882529 None!924)))

(declare-fun b!1581602 () Bool)

(declare-fun e!882528 () Option!926)

(assert (=> b!1581602 (= e!882528 (Some!925 (_2!12801 (h!38370 l!1390))))))

(declare-fun b!1581603 () Bool)

(assert (=> b!1581603 (= e!882528 e!882529)))

(declare-fun c!146604 () Bool)

(assert (=> b!1581603 (= c!146604 (and ((_ is Cons!36827) l!1390) (not (= (_1!12801 (h!38370 l!1390)) key!405))))))

(declare-fun d!166775 () Bool)

(declare-fun c!146603 () Bool)

(assert (=> d!166775 (= c!146603 (and ((_ is Cons!36827) l!1390) (= (_1!12801 (h!38370 l!1390)) key!405)))))

(assert (=> d!166775 (= (getValueByKey!821 l!1390 key!405) e!882528)))

(declare-fun b!1581604 () Bool)

(assert (=> b!1581604 (= e!882529 (getValueByKey!821 (t!51745 l!1390) key!405))))

(assert (= (and d!166775 c!146603) b!1581602))

(assert (= (and d!166775 (not c!146603)) b!1581603))

(assert (= (and b!1581603 c!146604) b!1581604))

(assert (= (and b!1581603 (not c!146604)) b!1581605))

(assert (=> b!1581604 m!1452449))

(assert (=> b!1581486 d!166775))

(declare-fun b!1581609 () Bool)

(declare-fun e!882531 () Option!926)

(assert (=> b!1581609 (= e!882531 None!924)))

(declare-fun b!1581606 () Bool)

(declare-fun e!882530 () Option!926)

(assert (=> b!1581606 (= e!882530 (Some!925 (_2!12801 (h!38370 (t!51745 l!1390)))))))

(declare-fun b!1581607 () Bool)

(assert (=> b!1581607 (= e!882530 e!882531)))

(declare-fun c!146606 () Bool)

(assert (=> b!1581607 (= c!146606 (and ((_ is Cons!36827) (t!51745 l!1390)) (not (= (_1!12801 (h!38370 (t!51745 l!1390))) key!405))))))

(declare-fun d!166787 () Bool)

(declare-fun c!146605 () Bool)

(assert (=> d!166787 (= c!146605 (and ((_ is Cons!36827) (t!51745 l!1390)) (= (_1!12801 (h!38370 (t!51745 l!1390))) key!405)))))

(assert (=> d!166787 (= (getValueByKey!821 (t!51745 l!1390) key!405) e!882530)))

(declare-fun b!1581608 () Bool)

(assert (=> b!1581608 (= e!882531 (getValueByKey!821 (t!51745 (t!51745 l!1390)) key!405))))

(assert (= (and d!166787 c!146605) b!1581606))

(assert (= (and d!166787 (not c!146605)) b!1581607))

(assert (= (and b!1581607 c!146606) b!1581608))

(assert (= (and b!1581607 (not c!146606)) b!1581609))

(declare-fun m!1452523 () Bool)

(assert (=> b!1581608 m!1452523))

(assert (=> b!1581486 d!166787))

(declare-fun d!166791 () Bool)

(assert (=> d!166791 (= (getValueByKey!821 (t!51745 l!1390) key!405) (Some!925 value!194))))

(declare-fun lt!676994 () Unit!52254)

(declare-fun choose!2099 (List!36831 (_ BitVec 64) B!2698) Unit!52254)

(assert (=> d!166791 (= lt!676994 (choose!2099 (t!51745 l!1390) key!405 value!194))))

(declare-fun e!882548 () Bool)

(assert (=> d!166791 e!882548))

(declare-fun res!1080560 () Bool)

(assert (=> d!166791 (=> (not res!1080560) (not e!882548))))

(assert (=> d!166791 (= res!1080560 (isStrictlySorted!1089 (t!51745 l!1390)))))

(assert (=> d!166791 (= (lemmaContainsTupThenGetReturnValue!401 (t!51745 l!1390) key!405 value!194) lt!676994)))

(declare-fun b!1581636 () Bool)

(declare-fun res!1080561 () Bool)

(assert (=> b!1581636 (=> (not res!1080561) (not e!882548))))

(assert (=> b!1581636 (= res!1080561 (containsKey!935 (t!51745 l!1390) key!405))))

(declare-fun b!1581637 () Bool)

(assert (=> b!1581637 (= e!882548 (contains!10503 (t!51745 l!1390) (tuple2!25581 key!405 value!194)))))

(assert (= (and d!166791 res!1080560) b!1581636))

(assert (= (and b!1581636 res!1080561) b!1581637))

(assert (=> d!166791 m!1452449))

(declare-fun m!1452527 () Bool)

(assert (=> d!166791 m!1452527))

(assert (=> d!166791 m!1452437))

(assert (=> b!1581636 m!1452445))

(declare-fun m!1452529 () Bool)

(assert (=> b!1581637 m!1452529))

(assert (=> b!1581486 d!166791))

(declare-fun d!166801 () Bool)

(assert (=> d!166801 (= (isEmpty!1182 lt!676965) (not ((_ is Some!924) lt!676965)))))

(assert (=> b!1581481 d!166801))

(declare-fun d!166803 () Bool)

(assert (=> d!166803 (= (unapply!98 l!1390) (ite ((_ is Nil!36828) l!1390) None!923 (Some!924 (tuple2!25583 (h!38370 l!1390) (t!51745 l!1390)))))))

(assert (=> b!1581481 d!166803))

(declare-fun b!1581652 () Bool)

(declare-fun e!882559 () Bool)

(declare-fun tp!114587 () Bool)

(assert (=> b!1581652 (= e!882559 (and tp_is_empty!39243 tp!114587))))

(assert (=> b!1581487 (= tp!114581 e!882559)))

(assert (= (and b!1581487 ((_ is Cons!36827) (t!51745 l!1390))) b!1581652))

(check-sat (not b!1581543) (not b!1581604) (not b!1581569) (not b!1581577) (not b!1581637) (not b!1581652) (not d!166755) (not d!166747) (not b!1581523) (not d!166791) (not b!1581608) (not b!1581549) tp_is_empty!39243 (not b!1581575) (not b!1581636))
(check-sat)
