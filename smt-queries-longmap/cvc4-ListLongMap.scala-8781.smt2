; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106790 () Bool)

(assert start!106790)

(declare-fun b!1267431 () Bool)

(declare-fun res!843686 () Bool)

(declare-fun e!722021 () Bool)

(assert (=> b!1267431 (=> (not res!843686) (not e!722021))))

(declare-datatypes ((B!2082 0))(
  ( (B!2083 (val!16376 Int)) )
))
(declare-datatypes ((tuple2!21270 0))(
  ( (tuple2!21271 (_1!10646 (_ BitVec 64)) (_2!10646 B!2082)) )
))
(declare-datatypes ((List!28368 0))(
  ( (Nil!28365) (Cons!28364 (h!29573 tuple2!21270) (t!41895 List!28368)) )
))
(declare-fun l!874 () List!28368)

(declare-fun isStrictlySorted!825 (List!28368) Bool)

(assert (=> b!1267431 (= res!843686 (isStrictlySorted!825 (t!41895 l!874)))))

(declare-fun b!1267432 () Bool)

(declare-fun res!843688 () Bool)

(assert (=> b!1267432 (=> (not res!843688) (not e!722021))))

(assert (=> b!1267432 (= res!843688 (is-Cons!28364 l!874))))

(declare-fun b!1267433 () Bool)

(declare-fun e!722020 () Bool)

(declare-fun tp_is_empty!32603 () Bool)

(declare-fun tp!96611 () Bool)

(assert (=> b!1267433 (= e!722020 (and tp_is_empty!32603 tp!96611))))

(declare-fun b!1267434 () Bool)

(declare-fun res!843687 () Bool)

(assert (=> b!1267434 (=> (not res!843687) (not e!722021))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!684 (List!28368 (_ BitVec 64)) Bool)

(assert (=> b!1267434 (= res!843687 (not (containsKey!684 l!874 key!235)))))

(declare-fun res!843685 () Bool)

(assert (=> start!106790 (=> (not res!843685) (not e!722021))))

(assert (=> start!106790 (= res!843685 (isStrictlySorted!825 l!874))))

(assert (=> start!106790 e!722021))

(assert (=> start!106790 e!722020))

(assert (=> start!106790 true))

(declare-fun b!1267435 () Bool)

(assert (=> b!1267435 (= e!722021 (containsKey!684 (t!41895 l!874) key!235))))

(assert (= (and start!106790 res!843685) b!1267434))

(assert (= (and b!1267434 res!843687) b!1267432))

(assert (= (and b!1267432 res!843688) b!1267431))

(assert (= (and b!1267431 res!843686) b!1267435))

(assert (= (and start!106790 (is-Cons!28364 l!874)) b!1267433))

(declare-fun m!1166737 () Bool)

(assert (=> b!1267431 m!1166737))

(declare-fun m!1166739 () Bool)

(assert (=> b!1267434 m!1166739))

(declare-fun m!1166741 () Bool)

(assert (=> start!106790 m!1166741))

(declare-fun m!1166743 () Bool)

(assert (=> b!1267435 m!1166743))

(push 1)

(assert (not b!1267433))

(assert (not b!1267434))

(assert (not b!1267435))

(assert (not b!1267431))

(assert (not start!106790))

(assert tp_is_empty!32603)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139477 () Bool)

(declare-fun res!843725 () Bool)

(declare-fun e!722064 () Bool)

(assert (=> d!139477 (=> res!843725 e!722064)))

(assert (=> d!139477 (= res!843725 (or (is-Nil!28365 (t!41895 l!874)) (is-Nil!28365 (t!41895 (t!41895 l!874)))))))

(assert (=> d!139477 (= (isStrictlySorted!825 (t!41895 l!874)) e!722064)))

(declare-fun b!1267482 () Bool)

(declare-fun e!722065 () Bool)

(assert (=> b!1267482 (= e!722064 e!722065)))

(declare-fun res!843726 () Bool)

(assert (=> b!1267482 (=> (not res!843726) (not e!722065))))

(assert (=> b!1267482 (= res!843726 (bvslt (_1!10646 (h!29573 (t!41895 l!874))) (_1!10646 (h!29573 (t!41895 (t!41895 l!874))))))))

(declare-fun b!1267483 () Bool)

(assert (=> b!1267483 (= e!722065 (isStrictlySorted!825 (t!41895 (t!41895 l!874))))))

(assert (= (and d!139477 (not res!843725)) b!1267482))

(assert (= (and b!1267482 res!843726) b!1267483))

(declare-fun m!1166753 () Bool)

(assert (=> b!1267483 m!1166753))

(assert (=> b!1267431 d!139477))

(declare-fun d!139479 () Bool)

(declare-fun res!843731 () Bool)

(declare-fun e!722070 () Bool)

(assert (=> d!139479 (=> res!843731 e!722070)))

(assert (=> d!139479 (= res!843731 (and (is-Cons!28364 l!874) (= (_1!10646 (h!29573 l!874)) key!235)))))

(assert (=> d!139479 (= (containsKey!684 l!874 key!235) e!722070)))

(declare-fun b!1267488 () Bool)

(declare-fun e!722071 () Bool)

(assert (=> b!1267488 (= e!722070 e!722071)))

(declare-fun res!843732 () Bool)

(assert (=> b!1267488 (=> (not res!843732) (not e!722071))))

(assert (=> b!1267488 (= res!843732 (and (or (not (is-Cons!28364 l!874)) (bvsle (_1!10646 (h!29573 l!874)) key!235)) (is-Cons!28364 l!874) (bvslt (_1!10646 (h!29573 l!874)) key!235)))))

(declare-fun b!1267489 () Bool)

(assert (=> b!1267489 (= e!722071 (containsKey!684 (t!41895 l!874) key!235))))

(assert (= (and d!139479 (not res!843731)) b!1267488))

(assert (= (and b!1267488 res!843732) b!1267489))

(assert (=> b!1267489 m!1166743))

(assert (=> b!1267434 d!139479))

(declare-fun d!139481 () Bool)

(declare-fun res!843733 () Bool)

(declare-fun e!722072 () Bool)

(assert (=> d!139481 (=> res!843733 e!722072)))

(assert (=> d!139481 (= res!843733 (or (is-Nil!28365 l!874) (is-Nil!28365 (t!41895 l!874))))))

(assert (=> d!139481 (= (isStrictlySorted!825 l!874) e!722072)))

(declare-fun b!1267490 () Bool)

(declare-fun e!722073 () Bool)

(assert (=> b!1267490 (= e!722072 e!722073)))

(declare-fun res!843734 () Bool)

(assert (=> b!1267490 (=> (not res!843734) (not e!722073))))

(assert (=> b!1267490 (= res!843734 (bvslt (_1!10646 (h!29573 l!874)) (_1!10646 (h!29573 (t!41895 l!874)))))))

(declare-fun b!1267491 () Bool)

(assert (=> b!1267491 (= e!722073 (isStrictlySorted!825 (t!41895 l!874)))))

(assert (= (and d!139481 (not res!843733)) b!1267490))

(assert (= (and b!1267490 res!843734) b!1267491))

(assert (=> b!1267491 m!1166737))

(assert (=> start!106790 d!139481))

(declare-fun d!139483 () Bool)

(declare-fun res!843735 () Bool)

(declare-fun e!722074 () Bool)

(assert (=> d!139483 (=> res!843735 e!722074)))

(assert (=> d!139483 (= res!843735 (and (is-Cons!28364 (t!41895 l!874)) (= (_1!10646 (h!29573 (t!41895 l!874))) key!235)))))

(assert (=> d!139483 (= (containsKey!684 (t!41895 l!874) key!235) e!722074)))

(declare-fun b!1267492 () Bool)

(declare-fun e!722075 () Bool)

(assert (=> b!1267492 (= e!722074 e!722075)))

(declare-fun res!843736 () Bool)

(assert (=> b!1267492 (=> (not res!843736) (not e!722075))))

(assert (=> b!1267492 (= res!843736 (and (or (not (is-Cons!28364 (t!41895 l!874))) (bvsle (_1!10646 (h!29573 (t!41895 l!874))) key!235)) (is-Cons!28364 (t!41895 l!874)) (bvslt (_1!10646 (h!29573 (t!41895 l!874))) key!235)))))

(declare-fun b!1267493 () Bool)

(assert (=> b!1267493 (= e!722075 (containsKey!684 (t!41895 (t!41895 l!874)) key!235))))

(assert (= (and d!139483 (not res!843735)) b!1267492))

(assert (= (and b!1267492 res!843736) b!1267493))

(declare-fun m!1166755 () Bool)

(assert (=> b!1267493 m!1166755))

(assert (=> b!1267435 d!139483))

(declare-fun b!1267498 () Bool)

(declare-fun e!722078 () Bool)

(declare-fun tp!96620 () Bool)

(assert (=> b!1267498 (= e!722078 (and tp_is_empty!32603 tp!96620))))

(assert (=> b!1267433 (= tp!96611 e!722078)))

(assert (= (and b!1267433 (is-Cons!28364 (t!41895 l!874))) b!1267498))

(push 1)

(assert (not b!1267493))

(assert (not b!1267491))

(assert (not b!1267483))

(assert (not b!1267489))

(assert (not b!1267498))

(assert tp_is_empty!32603)

(check-sat)

