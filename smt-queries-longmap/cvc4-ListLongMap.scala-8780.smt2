; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106772 () Bool)

(assert start!106772)

(declare-fun b!1267333 () Bool)

(declare-fun e!721952 () Bool)

(declare-fun tp_is_empty!32597 () Bool)

(declare-fun tp!96593 () Bool)

(assert (=> b!1267333 (= e!721952 (and tp_is_empty!32597 tp!96593))))

(declare-fun b!1267331 () Bool)

(declare-fun res!843610 () Bool)

(declare-fun e!721951 () Bool)

(assert (=> b!1267331 (=> (not res!843610) (not e!721951))))

(declare-datatypes ((B!2076 0))(
  ( (B!2077 (val!16373 Int)) )
))
(declare-datatypes ((tuple2!21264 0))(
  ( (tuple2!21265 (_1!10643 (_ BitVec 64)) (_2!10643 B!2076)) )
))
(declare-datatypes ((List!28365 0))(
  ( (Nil!28362) (Cons!28361 (h!29570 tuple2!21264) (t!41892 List!28365)) )
))
(declare-fun l!874 () List!28365)

(assert (=> b!1267331 (= res!843610 (is-Cons!28361 l!874))))

(declare-fun b!1267332 () Bool)

(declare-fun isStrictlySorted!822 (List!28365) Bool)

(assert (=> b!1267332 (= e!721951 (not (isStrictlySorted!822 (t!41892 l!874))))))

(declare-fun b!1267330 () Bool)

(declare-fun res!843609 () Bool)

(assert (=> b!1267330 (=> (not res!843609) (not e!721951))))

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!681 (List!28365 (_ BitVec 64)) Bool)

(assert (=> b!1267330 (= res!843609 (not (containsKey!681 l!874 key!235)))))

(declare-fun res!843608 () Bool)

(assert (=> start!106772 (=> (not res!843608) (not e!721951))))

(assert (=> start!106772 (= res!843608 (isStrictlySorted!822 l!874))))

(assert (=> start!106772 e!721951))

(assert (=> start!106772 e!721952))

(assert (=> start!106772 true))

(assert (= (and start!106772 res!843608) b!1267330))

(assert (= (and b!1267330 res!843609) b!1267331))

(assert (= (and b!1267331 res!843610) b!1267332))

(assert (= (and start!106772 (is-Cons!28361 l!874)) b!1267333))

(declare-fun m!1166703 () Bool)

(assert (=> b!1267332 m!1166703))

(declare-fun m!1166705 () Bool)

(assert (=> b!1267330 m!1166705))

(declare-fun m!1166707 () Bool)

(assert (=> start!106772 m!1166707))

(push 1)

(assert (not start!106772))

(assert (not b!1267333))

(assert (not b!1267330))

(assert (not b!1267332))

(assert tp_is_empty!32597)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139443 () Bool)

(declare-fun res!843621 () Bool)

(declare-fun e!721963 () Bool)

(assert (=> d!139443 (=> res!843621 e!721963)))

(assert (=> d!139443 (= res!843621 (and (is-Cons!28361 l!874) (= (_1!10643 (h!29570 l!874)) key!235)))))

(assert (=> d!139443 (= (containsKey!681 l!874 key!235) e!721963)))

(declare-fun b!1267344 () Bool)

(declare-fun e!721964 () Bool)

(assert (=> b!1267344 (= e!721963 e!721964)))

(declare-fun res!843622 () Bool)

(assert (=> b!1267344 (=> (not res!843622) (not e!721964))))

(assert (=> b!1267344 (= res!843622 (and (or (not (is-Cons!28361 l!874)) (bvsle (_1!10643 (h!29570 l!874)) key!235)) (is-Cons!28361 l!874) (bvslt (_1!10643 (h!29570 l!874)) key!235)))))

(declare-fun b!1267345 () Bool)

(assert (=> b!1267345 (= e!721964 (containsKey!681 (t!41892 l!874) key!235))))

(assert (= (and d!139443 (not res!843621)) b!1267344))

(assert (= (and b!1267344 res!843622) b!1267345))

(declare-fun m!1166711 () Bool)

(assert (=> b!1267345 m!1166711))

(assert (=> b!1267330 d!139443))

(declare-fun d!139449 () Bool)

(declare-fun res!843633 () Bool)

(declare-fun e!721975 () Bool)

(assert (=> d!139449 (=> res!843633 e!721975)))

(assert (=> d!139449 (= res!843633 (or (is-Nil!28362 (t!41892 l!874)) (is-Nil!28362 (t!41892 (t!41892 l!874)))))))

(assert (=> d!139449 (= (isStrictlySorted!822 (t!41892 l!874)) e!721975)))

(declare-fun b!1267356 () Bool)

(declare-fun e!721976 () Bool)

(assert (=> b!1267356 (= e!721975 e!721976)))

(declare-fun res!843634 () Bool)

(assert (=> b!1267356 (=> (not res!843634) (not e!721976))))

(assert (=> b!1267356 (= res!843634 (bvslt (_1!10643 (h!29570 (t!41892 l!874))) (_1!10643 (h!29570 (t!41892 (t!41892 l!874))))))))

(declare-fun b!1267357 () Bool)

(assert (=> b!1267357 (= e!721976 (isStrictlySorted!822 (t!41892 (t!41892 l!874))))))

(assert (= (and d!139449 (not res!843633)) b!1267356))

(assert (= (and b!1267356 res!843634) b!1267357))

(declare-fun m!1166715 () Bool)

(assert (=> b!1267357 m!1166715))

(assert (=> b!1267332 d!139449))

(declare-fun d!139453 () Bool)

(declare-fun res!843639 () Bool)

(declare-fun e!721981 () Bool)

(assert (=> d!139453 (=> res!843639 e!721981)))

(assert (=> d!139453 (= res!843639 (or (is-Nil!28362 l!874) (is-Nil!28362 (t!41892 l!874))))))

(assert (=> d!139453 (= (isStrictlySorted!822 l!874) e!721981)))

(declare-fun b!1267362 () Bool)

(declare-fun e!721982 () Bool)

(assert (=> b!1267362 (= e!721981 e!721982)))

(declare-fun res!843640 () Bool)

(assert (=> b!1267362 (=> (not res!843640) (not e!721982))))

(assert (=> b!1267362 (= res!843640 (bvslt (_1!10643 (h!29570 l!874)) (_1!10643 (h!29570 (t!41892 l!874)))))))

(declare-fun b!1267363 () Bool)

(assert (=> b!1267363 (= e!721982 (isStrictlySorted!822 (t!41892 l!874)))))

(assert (= (and d!139453 (not res!843639)) b!1267362))

(assert (= (and b!1267362 res!843640) b!1267363))

(assert (=> b!1267363 m!1166703))

(assert (=> start!106772 d!139453))

(declare-fun b!1267375 () Bool)

(declare-fun e!721990 () Bool)

(declare-fun tp!96599 () Bool)

(assert (=> b!1267375 (= e!721990 (and tp_is_empty!32597 tp!96599))))

(assert (=> b!1267333 (= tp!96593 e!721990)))

(assert (= (and b!1267333 (is-Cons!28361 (t!41892 l!874))) b!1267375))

(push 1)

