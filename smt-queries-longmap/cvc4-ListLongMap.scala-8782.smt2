; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106808 () Bool)

(assert start!106808)

(declare-fun b!1267547 () Bool)

(declare-fun e!722095 () Bool)

(declare-fun tp_is_empty!32609 () Bool)

(declare-fun tp!96629 () Bool)

(assert (=> b!1267547 (= e!722095 (and tp_is_empty!32609 tp!96629))))

(declare-fun b!1267548 () Bool)

(declare-fun res!843778 () Bool)

(declare-fun e!722096 () Bool)

(assert (=> b!1267548 (=> (not res!843778) (not e!722096))))

(declare-datatypes ((B!2088 0))(
  ( (B!2089 (val!16379 Int)) )
))
(declare-datatypes ((tuple2!21276 0))(
  ( (tuple2!21277 (_1!10649 (_ BitVec 64)) (_2!10649 B!2088)) )
))
(declare-datatypes ((List!28371 0))(
  ( (Nil!28368) (Cons!28367 (h!29576 tuple2!21276) (t!41898 List!28371)) )
))
(declare-fun l!874 () List!28371)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!687 (List!28371 (_ BitVec 64)) Bool)

(assert (=> b!1267548 (= res!843778 (not (containsKey!687 (t!41898 l!874) key!235)))))

(declare-fun b!1267549 () Bool)

(declare-fun res!843781 () Bool)

(assert (=> b!1267549 (=> (not res!843781) (not e!722096))))

(assert (=> b!1267549 (= res!843781 (not (containsKey!687 l!874 key!235)))))

(declare-fun b!1267550 () Bool)

(declare-fun ListPrimitiveSize!162 (List!28371) Int)

(assert (=> b!1267550 (= e!722096 (>= (ListPrimitiveSize!162 (t!41898 l!874)) (ListPrimitiveSize!162 l!874)))))

(declare-fun b!1267551 () Bool)

(declare-fun res!843777 () Bool)

(assert (=> b!1267551 (=> (not res!843777) (not e!722096))))

(declare-fun isStrictlySorted!828 (List!28371) Bool)

(assert (=> b!1267551 (= res!843777 (isStrictlySorted!828 (t!41898 l!874)))))

(declare-fun b!1267552 () Bool)

(declare-fun res!843780 () Bool)

(assert (=> b!1267552 (=> (not res!843780) (not e!722096))))

(assert (=> b!1267552 (= res!843780 (is-Cons!28367 l!874))))

(declare-fun res!843779 () Bool)

(assert (=> start!106808 (=> (not res!843779) (not e!722096))))

(assert (=> start!106808 (= res!843779 (isStrictlySorted!828 l!874))))

(assert (=> start!106808 e!722096))

(assert (=> start!106808 e!722095))

(assert (=> start!106808 true))

(assert (= (and start!106808 res!843779) b!1267549))

(assert (= (and b!1267549 res!843781) b!1267552))

(assert (= (and b!1267552 res!843780) b!1267551))

(assert (= (and b!1267551 res!843777) b!1267548))

(assert (= (and b!1267548 res!843778) b!1267550))

(assert (= (and start!106808 (is-Cons!28367 l!874)) b!1267547))

(declare-fun m!1166781 () Bool)

(assert (=> b!1267550 m!1166781))

(declare-fun m!1166783 () Bool)

(assert (=> b!1267550 m!1166783))

(declare-fun m!1166785 () Bool)

(assert (=> start!106808 m!1166785))

(declare-fun m!1166787 () Bool)

(assert (=> b!1267551 m!1166787))

(declare-fun m!1166789 () Bool)

(assert (=> b!1267549 m!1166789))

(declare-fun m!1166791 () Bool)

(assert (=> b!1267548 m!1166791))

(push 1)

(assert (not start!106808))

(assert (not b!1267548))

(assert (not b!1267549))

(assert (not b!1267547))

(assert tp_is_empty!32609)

(assert (not b!1267551))

(assert (not b!1267550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139489 () Bool)

(declare-fun res!843790 () Bool)

(declare-fun e!722107 () Bool)

(assert (=> d!139489 (=> res!843790 e!722107)))

(assert (=> d!139489 (= res!843790 (or (is-Nil!28368 (t!41898 l!874)) (is-Nil!28368 (t!41898 (t!41898 l!874)))))))

(assert (=> d!139489 (= (isStrictlySorted!828 (t!41898 l!874)) e!722107)))

(declare-fun b!1267565 () Bool)

(declare-fun e!722108 () Bool)

(assert (=> b!1267565 (= e!722107 e!722108)))

(declare-fun res!843791 () Bool)

(assert (=> b!1267565 (=> (not res!843791) (not e!722108))))

(assert (=> b!1267565 (= res!843791 (bvslt (_1!10649 (h!29576 (t!41898 l!874))) (_1!10649 (h!29576 (t!41898 (t!41898 l!874))))))))

(declare-fun b!1267566 () Bool)

(assert (=> b!1267566 (= e!722108 (isStrictlySorted!828 (t!41898 (t!41898 l!874))))))

(assert (= (and d!139489 (not res!843790)) b!1267565))

(assert (= (and b!1267565 res!843791) b!1267566))

(declare-fun m!1166793 () Bool)

(assert (=> b!1267566 m!1166793))

(assert (=> b!1267551 d!139489))

(declare-fun d!139493 () Bool)

(declare-fun res!843792 () Bool)

(declare-fun e!722109 () Bool)

(assert (=> d!139493 (=> res!843792 e!722109)))

(assert (=> d!139493 (= res!843792 (or (is-Nil!28368 l!874) (is-Nil!28368 (t!41898 l!874))))))

(assert (=> d!139493 (= (isStrictlySorted!828 l!874) e!722109)))

(declare-fun b!1267567 () Bool)

(declare-fun e!722110 () Bool)

(assert (=> b!1267567 (= e!722109 e!722110)))

(declare-fun res!843793 () Bool)

(assert (=> b!1267567 (=> (not res!843793) (not e!722110))))

(assert (=> b!1267567 (= res!843793 (bvslt (_1!10649 (h!29576 l!874)) (_1!10649 (h!29576 (t!41898 l!874)))))))

(declare-fun b!1267568 () Bool)

(assert (=> b!1267568 (= e!722110 (isStrictlySorted!828 (t!41898 l!874)))))

(assert (= (and d!139493 (not res!843792)) b!1267567))

(assert (= (and b!1267567 res!843793) b!1267568))

(assert (=> b!1267568 m!1166787))

(assert (=> start!106808 d!139493))

(declare-fun d!139495 () Bool)

(declare-fun lt!574338 () Int)

(assert (=> d!139495 (>= lt!574338 0)))

(declare-fun e!722119 () Int)

(assert (=> d!139495 (= lt!574338 e!722119)))

(declare-fun c!123571 () Bool)

(assert (=> d!139495 (= c!123571 (is-Nil!28368 (t!41898 l!874)))))

(assert (=> d!139495 (= (ListPrimitiveSize!162 (t!41898 l!874)) lt!574338)))

(declare-fun b!1267583 () Bool)

(assert (=> b!1267583 (= e!722119 0)))

(declare-fun b!1267584 () Bool)

(assert (=> b!1267584 (= e!722119 (+ 1 (ListPrimitiveSize!162 (t!41898 (t!41898 l!874)))))))

(assert (= (and d!139495 c!123571) b!1267583))

(assert (= (and d!139495 (not c!123571)) b!1267584))

(declare-fun m!1166797 () Bool)

(assert (=> b!1267584 m!1166797))

(assert (=> b!1267550 d!139495))

(declare-fun d!139503 () Bool)

(declare-fun lt!574340 () Int)

(assert (=> d!139503 (>= lt!574340 0)))

(declare-fun e!722121 () Int)

(assert (=> d!139503 (= lt!574340 e!722121)))

(declare-fun c!123573 () Bool)

(assert (=> d!139503 (= c!123573 (is-Nil!28368 l!874))))

(assert (=> d!139503 (= (ListPrimitiveSize!162 l!874) lt!574340)))

(declare-fun b!1267587 () Bool)

(assert (=> b!1267587 (= e!722121 0)))

(declare-fun b!1267588 () Bool)

(assert (=> b!1267588 (= e!722121 (+ 1 (ListPrimitiveSize!162 (t!41898 l!874))))))

(assert (= (and d!139503 c!123573) b!1267587))

(assert (= (and d!139503 (not c!123573)) b!1267588))

(assert (=> b!1267588 m!1166781))

(assert (=> b!1267550 d!139503))

(declare-fun d!139507 () Bool)

(declare-fun res!843812 () Bool)

(declare-fun e!722139 () Bool)

(assert (=> d!139507 (=> res!843812 e!722139)))

(assert (=> d!139507 (= res!843812 (and (is-Cons!28367 l!874) (= (_1!10649 (h!29576 l!874)) key!235)))))

(assert (=> d!139507 (= (containsKey!687 l!874 key!235) e!722139)))

(declare-fun b!1267607 () Bool)

(declare-fun e!722140 () Bool)

(assert (=> b!1267607 (= e!722139 e!722140)))

(declare-fun res!843813 () Bool)

(assert (=> b!1267607 (=> (not res!843813) (not e!722140))))

(assert (=> b!1267607 (= res!843813 (and (or (not (is-Cons!28367 l!874)) (bvsle (_1!10649 (h!29576 l!874)) key!235)) (is-Cons!28367 l!874) (bvslt (_1!10649 (h!29576 l!874)) key!235)))))

(declare-fun b!1267608 () Bool)

(assert (=> b!1267608 (= e!722140 (containsKey!687 (t!41898 l!874) key!235))))

(assert (= (and d!139507 (not res!843812)) b!1267607))

(assert (= (and b!1267607 res!843813) b!1267608))

(assert (=> b!1267608 m!1166791))

(assert (=> b!1267549 d!139507))

(declare-fun d!139515 () Bool)

(declare-fun res!843816 () Bool)

(declare-fun e!722143 () Bool)

(assert (=> d!139515 (=> res!843816 e!722143)))

(assert (=> d!139515 (= res!843816 (and (is-Cons!28367 (t!41898 l!874)) (= (_1!10649 (h!29576 (t!41898 l!874))) key!235)))))

(assert (=> d!139515 (= (containsKey!687 (t!41898 l!874) key!235) e!722143)))

(declare-fun b!1267611 () Bool)

(declare-fun e!722144 () Bool)

(assert (=> b!1267611 (= e!722143 e!722144)))

(declare-fun res!843817 () Bool)

(assert (=> b!1267611 (=> (not res!843817) (not e!722144))))

(assert (=> b!1267611 (= res!843817 (and (or (not (is-Cons!28367 (t!41898 l!874))) (bvsle (_1!10649 (h!29576 (t!41898 l!874))) key!235)) (is-Cons!28367 (t!41898 l!874)) (bvslt (_1!10649 (h!29576 (t!41898 l!874))) key!235)))))

(declare-fun b!1267612 () Bool)

(assert (=> b!1267612 (= e!722144 (containsKey!687 (t!41898 (t!41898 l!874)) key!235))))

(assert (= (and d!139515 (not res!843816)) b!1267611))

(assert (= (and b!1267611 res!843817) b!1267612))

(declare-fun m!1166805 () Bool)

(assert (=> b!1267612 m!1166805))

(assert (=> b!1267548 d!139515))

(declare-fun b!1267622 () Bool)

(declare-fun e!722150 () Bool)

(declare-fun tp!96635 () Bool)

(assert (=> b!1267622 (= e!722150 (and tp_is_empty!32609 tp!96635))))

(assert (=> b!1267547 (= tp!96629 e!722150)))

(assert (= (and b!1267547 (is-Cons!28367 (t!41898 l!874))) b!1267622))

(push 1)

