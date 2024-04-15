; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106786 () Bool)

(assert start!106786)

(declare-fun b!1267349 () Bool)

(declare-fun e!721976 () Bool)

(declare-datatypes ((B!2082 0))(
  ( (B!2083 (val!16376 Int)) )
))
(declare-datatypes ((tuple2!21352 0))(
  ( (tuple2!21353 (_1!10687 (_ BitVec 64)) (_2!10687 B!2082)) )
))
(declare-datatypes ((List!28452 0))(
  ( (Nil!28449) (Cons!28448 (h!29657 tuple2!21352) (t!41970 List!28452)) )
))
(declare-fun l!874 () List!28452)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!682 (List!28452 (_ BitVec 64)) Bool)

(assert (=> b!1267349 (= e!721976 (containsKey!682 (t!41970 l!874) key!235))))

(declare-fun b!1267350 () Bool)

(declare-fun e!721975 () Bool)

(declare-fun tp_is_empty!32603 () Bool)

(declare-fun tp!96611 () Bool)

(assert (=> b!1267350 (= e!721975 (and tp_is_empty!32603 tp!96611))))

(declare-fun b!1267352 () Bool)

(declare-fun res!843648 () Bool)

(assert (=> b!1267352 (=> (not res!843648) (not e!721976))))

(assert (=> b!1267352 (= res!843648 (not (containsKey!682 l!874 key!235)))))

(declare-fun b!1267353 () Bool)

(declare-fun res!843647 () Bool)

(assert (=> b!1267353 (=> (not res!843647) (not e!721976))))

(assert (=> b!1267353 (= res!843647 (is-Cons!28448 l!874))))

(declare-fun b!1267351 () Bool)

(declare-fun res!843646 () Bool)

(assert (=> b!1267351 (=> (not res!843646) (not e!721976))))

(declare-fun isStrictlySorted!821 (List!28452) Bool)

(assert (=> b!1267351 (= res!843646 (isStrictlySorted!821 (t!41970 l!874)))))

(declare-fun res!843645 () Bool)

(assert (=> start!106786 (=> (not res!843645) (not e!721976))))

(assert (=> start!106786 (= res!843645 (isStrictlySorted!821 l!874))))

(assert (=> start!106786 e!721976))

(assert (=> start!106786 e!721975))

(assert (=> start!106786 true))

(assert (= (and start!106786 res!843645) b!1267352))

(assert (= (and b!1267352 res!843648) b!1267353))

(assert (= (and b!1267353 res!843647) b!1267351))

(assert (= (and b!1267351 res!843646) b!1267349))

(assert (= (and start!106786 (is-Cons!28448 l!874)) b!1267350))

(declare-fun m!1166217 () Bool)

(assert (=> b!1267349 m!1166217))

(declare-fun m!1166219 () Bool)

(assert (=> b!1267352 m!1166219))

(declare-fun m!1166221 () Bool)

(assert (=> b!1267351 m!1166221))

(declare-fun m!1166223 () Bool)

(assert (=> start!106786 m!1166223))

(push 1)

(assert (not b!1267349))

(assert tp_is_empty!32603)

(assert (not b!1267352))

(assert (not b!1267351))

(assert (not b!1267350))

(assert (not start!106786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139329 () Bool)

(declare-fun res!843662 () Bool)

(declare-fun e!721990 () Bool)

(assert (=> d!139329 (=> res!843662 e!721990)))

(assert (=> d!139329 (= res!843662 (and (is-Cons!28448 (t!41970 l!874)) (= (_1!10687 (h!29657 (t!41970 l!874))) key!235)))))

(assert (=> d!139329 (= (containsKey!682 (t!41970 l!874) key!235) e!721990)))

(declare-fun b!1267367 () Bool)

(declare-fun e!721992 () Bool)

(assert (=> b!1267367 (= e!721990 e!721992)))

(declare-fun res!843664 () Bool)

(assert (=> b!1267367 (=> (not res!843664) (not e!721992))))

(assert (=> b!1267367 (= res!843664 (and (or (not (is-Cons!28448 (t!41970 l!874))) (bvsle (_1!10687 (h!29657 (t!41970 l!874))) key!235)) (is-Cons!28448 (t!41970 l!874)) (bvslt (_1!10687 (h!29657 (t!41970 l!874))) key!235)))))

(declare-fun b!1267369 () Bool)

(assert (=> b!1267369 (= e!721992 (containsKey!682 (t!41970 (t!41970 l!874)) key!235))))

(assert (= (and d!139329 (not res!843662)) b!1267367))

(assert (= (and b!1267367 res!843664) b!1267369))

(declare-fun m!1166225 () Bool)

(assert (=> b!1267369 m!1166225))

(assert (=> b!1267349 d!139329))

(declare-fun d!139335 () Bool)

(declare-fun res!843681 () Bool)

(declare-fun e!722009 () Bool)

(assert (=> d!139335 (=> res!843681 e!722009)))

(assert (=> d!139335 (= res!843681 (or (is-Nil!28449 (t!41970 l!874)) (is-Nil!28449 (t!41970 (t!41970 l!874)))))))

(assert (=> d!139335 (= (isStrictlySorted!821 (t!41970 l!874)) e!722009)))

(declare-fun b!1267386 () Bool)

(declare-fun e!722010 () Bool)

(assert (=> b!1267386 (= e!722009 e!722010)))

(declare-fun res!843682 () Bool)

(assert (=> b!1267386 (=> (not res!843682) (not e!722010))))

(assert (=> b!1267386 (= res!843682 (bvslt (_1!10687 (h!29657 (t!41970 l!874))) (_1!10687 (h!29657 (t!41970 (t!41970 l!874))))))))

(declare-fun b!1267387 () Bool)

(assert (=> b!1267387 (= e!722010 (isStrictlySorted!821 (t!41970 (t!41970 l!874))))))

(assert (= (and d!139335 (not res!843681)) b!1267386))

(assert (= (and b!1267386 res!843682) b!1267387))

(declare-fun m!1166229 () Bool)

(assert (=> b!1267387 m!1166229))

(assert (=> b!1267351 d!139335))

(declare-fun d!139343 () Bool)

(declare-fun res!843685 () Bool)

(declare-fun e!722013 () Bool)

(assert (=> d!139343 (=> res!843685 e!722013)))

(assert (=> d!139343 (= res!843685 (or (is-Nil!28449 l!874) (is-Nil!28449 (t!41970 l!874))))))

(assert (=> d!139343 (= (isStrictlySorted!821 l!874) e!722013)))

(declare-fun b!1267390 () Bool)

(declare-fun e!722014 () Bool)

(assert (=> b!1267390 (= e!722013 e!722014)))

(declare-fun res!843686 () Bool)

(assert (=> b!1267390 (=> (not res!843686) (not e!722014))))

(assert (=> b!1267390 (= res!843686 (bvslt (_1!10687 (h!29657 l!874)) (_1!10687 (h!29657 (t!41970 l!874)))))))

(declare-fun b!1267391 () Bool)

(assert (=> b!1267391 (= e!722014 (isStrictlySorted!821 (t!41970 l!874)))))

(assert (= (and d!139343 (not res!843685)) b!1267390))

(assert (= (and b!1267390 res!843686) b!1267391))

(assert (=> b!1267391 m!1166221))

(assert (=> start!106786 d!139343))

(declare-fun d!139347 () Bool)

(declare-fun res!843691 () Bool)

(declare-fun e!722019 () Bool)

(assert (=> d!139347 (=> res!843691 e!722019)))

(assert (=> d!139347 (= res!843691 (and (is-Cons!28448 l!874) (= (_1!10687 (h!29657 l!874)) key!235)))))

(assert (=> d!139347 (= (containsKey!682 l!874 key!235) e!722019)))

(declare-fun b!1267396 () Bool)

(declare-fun e!722020 () Bool)

(assert (=> b!1267396 (= e!722019 e!722020)))

(declare-fun res!843692 () Bool)

(assert (=> b!1267396 (=> (not res!843692) (not e!722020))))

(assert (=> b!1267396 (= res!843692 (and (or (not (is-Cons!28448 l!874)) (bvsle (_1!10687 (h!29657 l!874)) key!235)) (is-Cons!28448 l!874) (bvslt (_1!10687 (h!29657 l!874)) key!235)))))

(declare-fun b!1267397 () Bool)

(assert (=> b!1267397 (= e!722020 (containsKey!682 (t!41970 l!874) key!235))))

(assert (= (and d!139347 (not res!843691)) b!1267396))

(assert (= (and b!1267396 res!843692) b!1267397))

(assert (=> b!1267397 m!1166217))

(assert (=> b!1267352 d!139347))

(declare-fun b!1267415 () Bool)

(declare-fun e!722032 () Bool)

(declare-fun tp!96619 () Bool)

(assert (=> b!1267415 (= e!722032 (and tp_is_empty!32603 tp!96619))))

(assert (=> b!1267350 (= tp!96611 e!722032)))

(assert (= (and b!1267350 (is-Cons!28448 (t!41970 l!874))) b!1267415))

(push 1)

(assert (not b!1267415))

(assert (not b!1267387))

(assert (not b!1267369))

(assert tp_is_empty!32603)

(assert (not b!1267391))

(assert (not b!1267397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

