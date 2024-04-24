; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107014 () Bool)

(assert start!107014)

(declare-fun b!1268736 () Bool)

(declare-fun res!844205 () Bool)

(declare-fun e!722868 () Bool)

(assert (=> b!1268736 (=> (not res!844205) (not e!722868))))

(declare-datatypes ((B!2082 0))(
  ( (B!2083 (val!16376 Int)) )
))
(declare-datatypes ((tuple2!21280 0))(
  ( (tuple2!21281 (_1!10651 (_ BitVec 64)) (_2!10651 B!2082)) )
))
(declare-datatypes ((List!28404 0))(
  ( (Nil!28401) (Cons!28400 (h!29618 tuple2!21280) (t!41923 List!28404)) )
))
(declare-fun l!874 () List!28404)

(declare-fun isStrictlySorted!813 (List!28404) Bool)

(assert (=> b!1268736 (= res!844205 (isStrictlySorted!813 (t!41923 l!874)))))

(declare-fun res!844206 () Bool)

(assert (=> start!107014 (=> (not res!844206) (not e!722868))))

(assert (=> start!107014 (= res!844206 (isStrictlySorted!813 l!874))))

(assert (=> start!107014 e!722868))

(declare-fun e!722867 () Bool)

(assert (=> start!107014 e!722867))

(assert (=> start!107014 true))

(declare-fun b!1268737 () Bool)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!684 (List!28404 (_ BitVec 64)) Bool)

(assert (=> b!1268737 (= e!722868 (containsKey!684 (t!41923 l!874) key!235))))

(declare-fun b!1268738 () Bool)

(declare-fun res!844207 () Bool)

(assert (=> b!1268738 (=> (not res!844207) (not e!722868))))

(assert (=> b!1268738 (= res!844207 (not (containsKey!684 l!874 key!235)))))

(declare-fun b!1268739 () Bool)

(declare-fun res!844208 () Bool)

(assert (=> b!1268739 (=> (not res!844208) (not e!722868))))

(assert (=> b!1268739 (= res!844208 (is-Cons!28400 l!874))))

(declare-fun b!1268740 () Bool)

(declare-fun tp_is_empty!32603 () Bool)

(declare-fun tp!96611 () Bool)

(assert (=> b!1268740 (= e!722867 (and tp_is_empty!32603 tp!96611))))

(assert (= (and start!107014 res!844206) b!1268738))

(assert (= (and b!1268738 res!844207) b!1268739))

(assert (= (and b!1268739 res!844208) b!1268736))

(assert (= (and b!1268736 res!844205) b!1268737))

(assert (= (and start!107014 (is-Cons!28400 l!874)) b!1268740))

(declare-fun m!1168349 () Bool)

(assert (=> b!1268736 m!1168349))

(declare-fun m!1168351 () Bool)

(assert (=> start!107014 m!1168351))

(declare-fun m!1168353 () Bool)

(assert (=> b!1268737 m!1168353))

(declare-fun m!1168355 () Bool)

(assert (=> b!1268738 m!1168355))

(push 1)

(assert (not b!1268736))

(assert (not b!1268740))

(assert (not start!107014))

(assert (not b!1268738))

(assert (not b!1268737))

(assert tp_is_empty!32603)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139911 () Bool)

(declare-fun res!844221 () Bool)

(declare-fun e!722881 () Bool)

(assert (=> d!139911 (=> res!844221 e!722881)))

(assert (=> d!139911 (= res!844221 (or (is-Nil!28401 (t!41923 l!874)) (is-Nil!28401 (t!41923 (t!41923 l!874)))))))

(assert (=> d!139911 (= (isStrictlySorted!813 (t!41923 l!874)) e!722881)))

(declare-fun b!1268753 () Bool)

(declare-fun e!722882 () Bool)

(assert (=> b!1268753 (= e!722881 e!722882)))

(declare-fun res!844222 () Bool)

(assert (=> b!1268753 (=> (not res!844222) (not e!722882))))

(assert (=> b!1268753 (= res!844222 (bvslt (_1!10651 (h!29618 (t!41923 l!874))) (_1!10651 (h!29618 (t!41923 (t!41923 l!874))))))))

(declare-fun b!1268754 () Bool)

(assert (=> b!1268754 (= e!722882 (isStrictlySorted!813 (t!41923 (t!41923 l!874))))))

(assert (= (and d!139911 (not res!844221)) b!1268753))

(assert (= (and b!1268753 res!844222) b!1268754))

(declare-fun m!1168357 () Bool)

(assert (=> b!1268754 m!1168357))

(assert (=> b!1268736 d!139911))

(declare-fun d!139915 () Bool)

(declare-fun res!844241 () Bool)

(declare-fun e!722901 () Bool)

(assert (=> d!139915 (=> res!844241 e!722901)))

(assert (=> d!139915 (= res!844241 (and (is-Cons!28400 (t!41923 l!874)) (= (_1!10651 (h!29618 (t!41923 l!874))) key!235)))))

(assert (=> d!139915 (= (containsKey!684 (t!41923 l!874) key!235) e!722901)))

(declare-fun b!1268773 () Bool)

(declare-fun e!722902 () Bool)

(assert (=> b!1268773 (= e!722901 e!722902)))

(declare-fun res!844242 () Bool)

(assert (=> b!1268773 (=> (not res!844242) (not e!722902))))

(assert (=> b!1268773 (= res!844242 (and (or (not (is-Cons!28400 (t!41923 l!874))) (bvsle (_1!10651 (h!29618 (t!41923 l!874))) key!235)) (is-Cons!28400 (t!41923 l!874)) (bvslt (_1!10651 (h!29618 (t!41923 l!874))) key!235)))))

(declare-fun b!1268774 () Bool)

(assert (=> b!1268774 (= e!722902 (containsKey!684 (t!41923 (t!41923 l!874)) key!235))))

(assert (= (and d!139915 (not res!844241)) b!1268773))

(assert (= (and b!1268773 res!844242) b!1268774))

(declare-fun m!1168363 () Bool)

(assert (=> b!1268774 m!1168363))

(assert (=> b!1268737 d!139915))

(declare-fun d!139923 () Bool)

(declare-fun res!844243 () Bool)

(declare-fun e!722903 () Bool)

(assert (=> d!139923 (=> res!844243 e!722903)))

(assert (=> d!139923 (= res!844243 (and (is-Cons!28400 l!874) (= (_1!10651 (h!29618 l!874)) key!235)))))

(assert (=> d!139923 (= (containsKey!684 l!874 key!235) e!722903)))

(declare-fun b!1268775 () Bool)

(declare-fun e!722904 () Bool)

(assert (=> b!1268775 (= e!722903 e!722904)))

(declare-fun res!844244 () Bool)

(assert (=> b!1268775 (=> (not res!844244) (not e!722904))))

(assert (=> b!1268775 (= res!844244 (and (or (not (is-Cons!28400 l!874)) (bvsle (_1!10651 (h!29618 l!874)) key!235)) (is-Cons!28400 l!874) (bvslt (_1!10651 (h!29618 l!874)) key!235)))))

(declare-fun b!1268776 () Bool)

(assert (=> b!1268776 (= e!722904 (containsKey!684 (t!41923 l!874) key!235))))

(assert (= (and d!139923 (not res!844243)) b!1268775))

(assert (= (and b!1268775 res!844244) b!1268776))

(assert (=> b!1268776 m!1168353))

(assert (=> b!1268738 d!139923))

(declare-fun d!139925 () Bool)

(declare-fun res!844249 () Bool)

(declare-fun e!722909 () Bool)

(assert (=> d!139925 (=> res!844249 e!722909)))

(assert (=> d!139925 (= res!844249 (or (is-Nil!28401 l!874) (is-Nil!28401 (t!41923 l!874))))))

(assert (=> d!139925 (= (isStrictlySorted!813 l!874) e!722909)))

(declare-fun b!1268781 () Bool)

(declare-fun e!722910 () Bool)

(assert (=> b!1268781 (= e!722909 e!722910)))

(declare-fun res!844250 () Bool)

(assert (=> b!1268781 (=> (not res!844250) (not e!722910))))

(assert (=> b!1268781 (= res!844250 (bvslt (_1!10651 (h!29618 l!874)) (_1!10651 (h!29618 (t!41923 l!874)))))))

(declare-fun b!1268782 () Bool)

(assert (=> b!1268782 (= e!722910 (isStrictlySorted!813 (t!41923 l!874)))))

(assert (= (and d!139925 (not res!844249)) b!1268781))

(assert (= (and b!1268781 res!844250) b!1268782))

(assert (=> b!1268782 m!1168349))

(assert (=> start!107014 d!139925))

(declare-fun b!1268801 () Bool)

(declare-fun e!722923 () Bool)

(declare-fun tp!96618 () Bool)

(assert (=> b!1268801 (= e!722923 (and tp_is_empty!32603 tp!96618))))

(assert (=> b!1268740 (= tp!96611 e!722923)))

(assert (= (and b!1268740 (is-Cons!28400 (t!41923 l!874))) b!1268801))

(push 1)

(assert (not b!1268774))

(assert (not b!1268754))

(assert (not b!1268776))

(assert (not b!1268782))

(assert tp_is_empty!32603)

(assert (not b!1268801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

