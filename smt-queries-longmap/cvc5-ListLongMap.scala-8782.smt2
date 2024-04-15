; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106804 () Bool)

(assert start!106804)

(declare-fun res!843740 () Bool)

(declare-fun e!722050 () Bool)

(assert (=> start!106804 (=> (not res!843740) (not e!722050))))

(declare-datatypes ((B!2088 0))(
  ( (B!2089 (val!16379 Int)) )
))
(declare-datatypes ((tuple2!21358 0))(
  ( (tuple2!21359 (_1!10690 (_ BitVec 64)) (_2!10690 B!2088)) )
))
(declare-datatypes ((List!28455 0))(
  ( (Nil!28452) (Cons!28451 (h!29660 tuple2!21358) (t!41973 List!28455)) )
))
(declare-fun l!874 () List!28455)

(declare-fun isStrictlySorted!824 (List!28455) Bool)

(assert (=> start!106804 (= res!843740 (isStrictlySorted!824 l!874))))

(assert (=> start!106804 e!722050))

(declare-fun e!722051 () Bool)

(assert (=> start!106804 e!722051))

(assert (=> start!106804 true))

(declare-fun b!1267465 () Bool)

(declare-fun res!843738 () Bool)

(assert (=> b!1267465 (=> (not res!843738) (not e!722050))))

(assert (=> b!1267465 (= res!843738 (is-Cons!28451 l!874))))

(declare-fun b!1267466 () Bool)

(declare-fun res!843741 () Bool)

(assert (=> b!1267466 (=> (not res!843741) (not e!722050))))

(assert (=> b!1267466 (= res!843741 (isStrictlySorted!824 (t!41973 l!874)))))

(declare-fun b!1267467 () Bool)

(declare-fun ListPrimitiveSize!162 (List!28455) Int)

(assert (=> b!1267467 (= e!722050 (>= (ListPrimitiveSize!162 (t!41973 l!874)) (ListPrimitiveSize!162 l!874)))))

(declare-fun b!1267468 () Bool)

(declare-fun res!843739 () Bool)

(assert (=> b!1267468 (=> (not res!843739) (not e!722050))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!685 (List!28455 (_ BitVec 64)) Bool)

(assert (=> b!1267468 (= res!843739 (not (containsKey!685 (t!41973 l!874) key!235)))))

(declare-fun b!1267469 () Bool)

(declare-fun res!843737 () Bool)

(assert (=> b!1267469 (=> (not res!843737) (not e!722050))))

(assert (=> b!1267469 (= res!843737 (not (containsKey!685 l!874 key!235)))))

(declare-fun b!1267470 () Bool)

(declare-fun tp_is_empty!32609 () Bool)

(declare-fun tp!96629 () Bool)

(assert (=> b!1267470 (= e!722051 (and tp_is_empty!32609 tp!96629))))

(assert (= (and start!106804 res!843740) b!1267469))

(assert (= (and b!1267469 res!843737) b!1267465))

(assert (= (and b!1267465 res!843738) b!1267466))

(assert (= (and b!1267466 res!843741) b!1267468))

(assert (= (and b!1267468 res!843739) b!1267467))

(assert (= (and start!106804 (is-Cons!28451 l!874)) b!1267470))

(declare-fun m!1166261 () Bool)

(assert (=> b!1267466 m!1166261))

(declare-fun m!1166263 () Bool)

(assert (=> b!1267469 m!1166263))

(declare-fun m!1166265 () Bool)

(assert (=> b!1267468 m!1166265))

(declare-fun m!1166267 () Bool)

(assert (=> b!1267467 m!1166267))

(declare-fun m!1166269 () Bool)

(assert (=> b!1267467 m!1166269))

(declare-fun m!1166271 () Bool)

(assert (=> start!106804 m!1166271))

(push 1)

(assert (not b!1267468))

(assert (not start!106804))

(assert (not b!1267466))

(assert (not b!1267467))

(assert tp_is_empty!32609)

(assert (not b!1267470))

(assert (not b!1267469))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139355 () Bool)

(declare-fun res!843756 () Bool)

(declare-fun e!722066 () Bool)

(assert (=> d!139355 (=> res!843756 e!722066)))

(assert (=> d!139355 (= res!843756 (and (is-Cons!28451 l!874) (= (_1!10690 (h!29660 l!874)) key!235)))))

(assert (=> d!139355 (= (containsKey!685 l!874 key!235) e!722066)))

(declare-fun b!1267485 () Bool)

(declare-fun e!722067 () Bool)

(assert (=> b!1267485 (= e!722066 e!722067)))

(declare-fun res!843757 () Bool)

(assert (=> b!1267485 (=> (not res!843757) (not e!722067))))

(assert (=> b!1267485 (= res!843757 (and (or (not (is-Cons!28451 l!874)) (bvsle (_1!10690 (h!29660 l!874)) key!235)) (is-Cons!28451 l!874) (bvslt (_1!10690 (h!29660 l!874)) key!235)))))

(declare-fun b!1267486 () Bool)

(assert (=> b!1267486 (= e!722067 (containsKey!685 (t!41973 l!874) key!235))))

(assert (= (and d!139355 (not res!843756)) b!1267485))

(assert (= (and b!1267485 res!843757) b!1267486))

(assert (=> b!1267486 m!1166265))

(assert (=> b!1267469 d!139355))

(declare-fun d!139363 () Bool)

(declare-fun res!843770 () Bool)

(declare-fun e!722080 () Bool)

(assert (=> d!139363 (=> res!843770 e!722080)))

(assert (=> d!139363 (= res!843770 (or (is-Nil!28452 (t!41973 l!874)) (is-Nil!28452 (t!41973 (t!41973 l!874)))))))

(assert (=> d!139363 (= (isStrictlySorted!824 (t!41973 l!874)) e!722080)))

(declare-fun b!1267499 () Bool)

(declare-fun e!722081 () Bool)

(assert (=> b!1267499 (= e!722080 e!722081)))

(declare-fun res!843771 () Bool)

(assert (=> b!1267499 (=> (not res!843771) (not e!722081))))

(assert (=> b!1267499 (= res!843771 (bvslt (_1!10690 (h!29660 (t!41973 l!874))) (_1!10690 (h!29660 (t!41973 (t!41973 l!874))))))))

(declare-fun b!1267500 () Bool)

(assert (=> b!1267500 (= e!722081 (isStrictlySorted!824 (t!41973 (t!41973 l!874))))))

(assert (= (and d!139363 (not res!843770)) b!1267499))

(assert (= (and b!1267499 res!843771) b!1267500))

(declare-fun m!1166277 () Bool)

(assert (=> b!1267500 m!1166277))

(assert (=> b!1267466 d!139363))

(declare-fun d!139369 () Bool)

(declare-fun lt!574157 () Int)

(assert (=> d!139369 (>= lt!574157 0)))

(declare-fun e!722090 () Int)

(assert (=> d!139369 (= lt!574157 e!722090)))

(declare-fun c!123551 () Bool)

(assert (=> d!139369 (= c!123551 (is-Nil!28452 (t!41973 l!874)))))

(assert (=> d!139369 (= (ListPrimitiveSize!162 (t!41973 l!874)) lt!574157)))

(declare-fun b!1267515 () Bool)

(assert (=> b!1267515 (= e!722090 0)))

(declare-fun b!1267516 () Bool)

(assert (=> b!1267516 (= e!722090 (+ 1 (ListPrimitiveSize!162 (t!41973 (t!41973 l!874)))))))

(assert (= (and d!139369 c!123551) b!1267515))

(assert (= (and d!139369 (not c!123551)) b!1267516))

(declare-fun m!1166281 () Bool)

(assert (=> b!1267516 m!1166281))

(assert (=> b!1267467 d!139369))

(declare-fun d!139373 () Bool)

(declare-fun lt!574158 () Int)

(assert (=> d!139373 (>= lt!574158 0)))

(declare-fun e!722091 () Int)

(assert (=> d!139373 (= lt!574158 e!722091)))

(declare-fun c!123552 () Bool)

(assert (=> d!139373 (= c!123552 (is-Nil!28452 l!874))))

(assert (=> d!139373 (= (ListPrimitiveSize!162 l!874) lt!574158)))

(declare-fun b!1267517 () Bool)

(assert (=> b!1267517 (= e!722091 0)))

(declare-fun b!1267518 () Bool)

(assert (=> b!1267518 (= e!722091 (+ 1 (ListPrimitiveSize!162 (t!41973 l!874))))))

(assert (= (and d!139373 c!123552) b!1267517))

(assert (= (and d!139373 (not c!123552)) b!1267518))

(assert (=> b!1267518 m!1166267))

(assert (=> b!1267467 d!139373))

(declare-fun d!139375 () Bool)

(declare-fun res!843774 () Bool)

(declare-fun e!722094 () Bool)

(assert (=> d!139375 (=> res!843774 e!722094)))

(assert (=> d!139375 (= res!843774 (and (is-Cons!28451 (t!41973 l!874)) (= (_1!10690 (h!29660 (t!41973 l!874))) key!235)))))

(assert (=> d!139375 (= (containsKey!685 (t!41973 l!874) key!235) e!722094)))

(declare-fun b!1267523 () Bool)

(declare-fun e!722095 () Bool)

(assert (=> b!1267523 (= e!722094 e!722095)))

(declare-fun res!843775 () Bool)

(assert (=> b!1267523 (=> (not res!843775) (not e!722095))))

(assert (=> b!1267523 (= res!843775 (and (or (not (is-Cons!28451 (t!41973 l!874))) (bvsle (_1!10690 (h!29660 (t!41973 l!874))) key!235)) (is-Cons!28451 (t!41973 l!874)) (bvslt (_1!10690 (h!29660 (t!41973 l!874))) key!235)))))

(declare-fun b!1267524 () Bool)

(assert (=> b!1267524 (= e!722095 (containsKey!685 (t!41973 (t!41973 l!874)) key!235))))

(assert (= (and d!139375 (not res!843774)) b!1267523))

(assert (= (and b!1267523 res!843775) b!1267524))

(declare-fun m!1166287 () Bool)

(assert (=> b!1267524 m!1166287))

(assert (=> b!1267468 d!139375))

(declare-fun d!139383 () Bool)

(declare-fun res!843778 () Bool)

(declare-fun e!722100 () Bool)

(assert (=> d!139383 (=> res!843778 e!722100)))

(assert (=> d!139383 (= res!843778 (or (is-Nil!28452 l!874) (is-Nil!28452 (t!41973 l!874))))))

(assert (=> d!139383 (= (isStrictlySorted!824 l!874) e!722100)))

(declare-fun b!1267531 () Bool)

(declare-fun e!722101 () Bool)

(assert (=> b!1267531 (= e!722100 e!722101)))

(declare-fun res!843779 () Bool)

(assert (=> b!1267531 (=> (not res!843779) (not e!722101))))

(assert (=> b!1267531 (= res!843779 (bvslt (_1!10690 (h!29660 l!874)) (_1!10690 (h!29660 (t!41973 l!874)))))))

(declare-fun b!1267532 () Bool)

(assert (=> b!1267532 (= e!722101 (isStrictlySorted!824 (t!41973 l!874)))))

(assert (= (and d!139383 (not res!843778)) b!1267531))

(assert (= (and b!1267531 res!843779) b!1267532))

(assert (=> b!1267532 m!1166261))

(assert (=> start!106804 d!139383))

(declare-fun b!1267542 () Bool)

(declare-fun e!722107 () Bool)

(declare-fun tp!96635 () Bool)

(assert (=> b!1267542 (= e!722107 (and tp_is_empty!32609 tp!96635))))

(assert (=> b!1267470 (= tp!96629 e!722107)))

(assert (= (and b!1267470 (is-Cons!28451 (t!41973 l!874))) b!1267542))

(push 1)

(assert (not b!1267486))

(assert (not b!1267532))

(assert (not b!1267516))

(assert (not b!1267500))

(assert tp_is_empty!32609)

(assert (not b!1267518))

(assert (not b!1267524))

(assert (not b!1267542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

