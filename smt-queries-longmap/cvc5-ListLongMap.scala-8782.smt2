; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106804 () Bool)

(assert start!106804)

(declare-fun b!1267511 () Bool)

(declare-fun e!722083 () Bool)

(declare-datatypes ((B!2084 0))(
  ( (B!2085 (val!16377 Int)) )
))
(declare-datatypes ((tuple2!21272 0))(
  ( (tuple2!21273 (_1!10647 (_ BitVec 64)) (_2!10647 B!2084)) )
))
(declare-datatypes ((List!28369 0))(
  ( (Nil!28366) (Cons!28365 (h!29574 tuple2!21272) (t!41896 List!28369)) )
))
(declare-fun l!874 () List!28369)

(declare-fun ListPrimitiveSize!160 (List!28369) Int)

(assert (=> b!1267511 (= e!722083 (>= (ListPrimitiveSize!160 (t!41896 l!874)) (ListPrimitiveSize!160 l!874)))))

(declare-fun b!1267512 () Bool)

(declare-fun res!843749 () Bool)

(assert (=> b!1267512 (=> (not res!843749) (not e!722083))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!685 (List!28369 (_ BitVec 64)) Bool)

(assert (=> b!1267512 (= res!843749 (not (containsKey!685 l!874 key!235)))))

(declare-fun b!1267513 () Bool)

(declare-fun res!843747 () Bool)

(assert (=> b!1267513 (=> (not res!843747) (not e!722083))))

(assert (=> b!1267513 (= res!843747 (not (containsKey!685 (t!41896 l!874) key!235)))))

(declare-fun b!1267514 () Bool)

(declare-fun res!843751 () Bool)

(assert (=> b!1267514 (=> (not res!843751) (not e!722083))))

(declare-fun isStrictlySorted!826 (List!28369) Bool)

(assert (=> b!1267514 (= res!843751 (isStrictlySorted!826 (t!41896 l!874)))))

(declare-fun b!1267515 () Bool)

(declare-fun res!843748 () Bool)

(assert (=> b!1267515 (=> (not res!843748) (not e!722083))))

(assert (=> b!1267515 (= res!843748 (is-Cons!28365 l!874))))

(declare-fun b!1267516 () Bool)

(declare-fun e!722084 () Bool)

(declare-fun tp_is_empty!32605 () Bool)

(declare-fun tp!96623 () Bool)

(assert (=> b!1267516 (= e!722084 (and tp_is_empty!32605 tp!96623))))

(declare-fun res!843750 () Bool)

(assert (=> start!106804 (=> (not res!843750) (not e!722083))))

(assert (=> start!106804 (= res!843750 (isStrictlySorted!826 l!874))))

(assert (=> start!106804 e!722083))

(assert (=> start!106804 e!722084))

(assert (=> start!106804 true))

(assert (= (and start!106804 res!843750) b!1267512))

(assert (= (and b!1267512 res!843749) b!1267515))

(assert (= (and b!1267515 res!843748) b!1267514))

(assert (= (and b!1267514 res!843751) b!1267513))

(assert (= (and b!1267513 res!843747) b!1267511))

(assert (= (and start!106804 (is-Cons!28365 l!874)) b!1267516))

(declare-fun m!1166757 () Bool)

(assert (=> b!1267511 m!1166757))

(declare-fun m!1166759 () Bool)

(assert (=> b!1267511 m!1166759))

(declare-fun m!1166761 () Bool)

(assert (=> start!106804 m!1166761))

(declare-fun m!1166763 () Bool)

(assert (=> b!1267514 m!1166763))

(declare-fun m!1166765 () Bool)

(assert (=> b!1267512 m!1166765))

(declare-fun m!1166767 () Bool)

(assert (=> b!1267513 m!1166767))

(push 1)

(assert (not b!1267512))

(assert (not b!1267514))

(assert (not start!106804))

(assert tp_is_empty!32605)

(assert (not b!1267511))

(assert (not b!1267516))

(assert (not b!1267513))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139488 () Bool)

(declare-fun res!843794 () Bool)

(declare-fun e!722111 () Bool)

(assert (=> d!139488 (=> res!843794 e!722111)))

(assert (=> d!139488 (= res!843794 (and (is-Cons!28365 l!874) (= (_1!10647 (h!29574 l!874)) key!235)))))

(assert (=> d!139488 (= (containsKey!685 l!874 key!235) e!722111)))

(declare-fun b!1267569 () Bool)

(declare-fun e!722112 () Bool)

(assert (=> b!1267569 (= e!722111 e!722112)))

(declare-fun res!843795 () Bool)

(assert (=> b!1267569 (=> (not res!843795) (not e!722112))))

(assert (=> b!1267569 (= res!843795 (and (or (not (is-Cons!28365 l!874)) (bvsle (_1!10647 (h!29574 l!874)) key!235)) (is-Cons!28365 l!874) (bvslt (_1!10647 (h!29574 l!874)) key!235)))))

(declare-fun b!1267570 () Bool)

(assert (=> b!1267570 (= e!722112 (containsKey!685 (t!41896 l!874) key!235))))

(assert (= (and d!139488 (not res!843794)) b!1267569))

(assert (= (and b!1267569 res!843795) b!1267570))

(assert (=> b!1267570 m!1166767))

(assert (=> b!1267512 d!139488))

(declare-fun d!139499 () Bool)

(declare-fun lt!574339 () Int)

(assert (=> d!139499 (>= lt!574339 0)))

(declare-fun e!722120 () Int)

(assert (=> d!139499 (= lt!574339 e!722120)))

(declare-fun c!123572 () Bool)

(assert (=> d!139499 (= c!123572 (is-Nil!28366 (t!41896 l!874)))))

(assert (=> d!139499 (= (ListPrimitiveSize!160 (t!41896 l!874)) lt!574339)))

(declare-fun b!1267585 () Bool)

(assert (=> b!1267585 (= e!722120 0)))

(declare-fun b!1267586 () Bool)

(assert (=> b!1267586 (= e!722120 (+ 1 (ListPrimitiveSize!160 (t!41896 (t!41896 l!874)))))))

(assert (= (and d!139499 c!123572) b!1267585))

(assert (= (and d!139499 (not c!123572)) b!1267586))

(declare-fun m!1166799 () Bool)

(assert (=> b!1267586 m!1166799))

(assert (=> b!1267511 d!139499))

(declare-fun d!139505 () Bool)

(declare-fun lt!574341 () Int)

(assert (=> d!139505 (>= lt!574341 0)))

(declare-fun e!722122 () Int)

(assert (=> d!139505 (= lt!574341 e!722122)))

(declare-fun c!123574 () Bool)

(assert (=> d!139505 (= c!123574 (is-Nil!28366 l!874))))

(assert (=> d!139505 (= (ListPrimitiveSize!160 l!874) lt!574341)))

(declare-fun b!1267589 () Bool)

(assert (=> b!1267589 (= e!722122 0)))

(declare-fun b!1267590 () Bool)

(assert (=> b!1267590 (= e!722122 (+ 1 (ListPrimitiveSize!160 (t!41896 l!874))))))

(assert (= (and d!139505 c!123574) b!1267589))

(assert (= (and d!139505 (not c!123574)) b!1267590))

(assert (=> b!1267590 m!1166757))

(assert (=> b!1267511 d!139505))

(declare-fun d!139509 () Bool)

(declare-fun res!843808 () Bool)

(declare-fun e!722135 () Bool)

(assert (=> d!139509 (=> res!843808 e!722135)))

(assert (=> d!139509 (= res!843808 (or (is-Nil!28366 l!874) (is-Nil!28366 (t!41896 l!874))))))

(assert (=> d!139509 (= (isStrictlySorted!826 l!874) e!722135)))

(declare-fun b!1267603 () Bool)

(declare-fun e!722136 () Bool)

(assert (=> b!1267603 (= e!722135 e!722136)))

(declare-fun res!843809 () Bool)

(assert (=> b!1267603 (=> (not res!843809) (not e!722136))))

(assert (=> b!1267603 (= res!843809 (bvslt (_1!10647 (h!29574 l!874)) (_1!10647 (h!29574 (t!41896 l!874)))))))

(declare-fun b!1267604 () Bool)

(assert (=> b!1267604 (= e!722136 (isStrictlySorted!826 (t!41896 l!874)))))

(assert (= (and d!139509 (not res!843808)) b!1267603))

(assert (= (and b!1267603 res!843809) b!1267604))

(assert (=> b!1267604 m!1166763))

(assert (=> start!106804 d!139509))

(declare-fun d!139511 () Bool)

(declare-fun res!843810 () Bool)

(declare-fun e!722137 () Bool)

(assert (=> d!139511 (=> res!843810 e!722137)))

(assert (=> d!139511 (= res!843810 (or (is-Nil!28366 (t!41896 l!874)) (is-Nil!28366 (t!41896 (t!41896 l!874)))))))

(assert (=> d!139511 (= (isStrictlySorted!826 (t!41896 l!874)) e!722137)))

(declare-fun b!1267605 () Bool)

(declare-fun e!722138 () Bool)

(assert (=> b!1267605 (= e!722137 e!722138)))

(declare-fun res!843811 () Bool)

(assert (=> b!1267605 (=> (not res!843811) (not e!722138))))

(assert (=> b!1267605 (= res!843811 (bvslt (_1!10647 (h!29574 (t!41896 l!874))) (_1!10647 (h!29574 (t!41896 (t!41896 l!874))))))))

(declare-fun b!1267606 () Bool)

(assert (=> b!1267606 (= e!722138 (isStrictlySorted!826 (t!41896 (t!41896 l!874))))))

(assert (= (and d!139511 (not res!843810)) b!1267605))

(assert (= (and b!1267605 res!843811) b!1267606))

(declare-fun m!1166801 () Bool)

(assert (=> b!1267606 m!1166801))

(assert (=> b!1267514 d!139511))

(declare-fun d!139513 () Bool)

(declare-fun res!843814 () Bool)

(declare-fun e!722141 () Bool)

(assert (=> d!139513 (=> res!843814 e!722141)))

(assert (=> d!139513 (= res!843814 (and (is-Cons!28365 (t!41896 l!874)) (= (_1!10647 (h!29574 (t!41896 l!874))) key!235)))))

(assert (=> d!139513 (= (containsKey!685 (t!41896 l!874) key!235) e!722141)))

(declare-fun b!1267609 () Bool)

(declare-fun e!722142 () Bool)

(assert (=> b!1267609 (= e!722141 e!722142)))

(declare-fun res!843815 () Bool)

(assert (=> b!1267609 (=> (not res!843815) (not e!722142))))

(assert (=> b!1267609 (= res!843815 (and (or (not (is-Cons!28365 (t!41896 l!874))) (bvsle (_1!10647 (h!29574 (t!41896 l!874))) key!235)) (is-Cons!28365 (t!41896 l!874)) (bvslt (_1!10647 (h!29574 (t!41896 l!874))) key!235)))))

(declare-fun b!1267610 () Bool)

(assert (=> b!1267610 (= e!722142 (containsKey!685 (t!41896 (t!41896 l!874)) key!235))))

(assert (= (and d!139513 (not res!843814)) b!1267609))

(assert (= (and b!1267609 res!843815) b!1267610))

(declare-fun m!1166803 () Bool)

(assert (=> b!1267610 m!1166803))

(assert (=> b!1267513 d!139513))

(declare-fun b!1267621 () Bool)

(declare-fun e!722149 () Bool)

(declare-fun tp!96634 () Bool)

(assert (=> b!1267621 (= e!722149 (and tp_is_empty!32605 tp!96634))))

(assert (=> b!1267516 (= tp!96623 e!722149)))

(assert (= (and b!1267516 (is-Cons!28365 (t!41896 l!874))) b!1267621))

(push 1)

(assert (not b!1267610))

(assert (not b!1267586))

(assert (not b!1267570))

(assert (not b!1267621))

(assert (not b!1267606))

(assert (not b!1267604))

(assert tp_is_empty!32605)

(assert (not b!1267590))

(check-sat)

(pop 1)

