; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106420 () Bool)

(assert start!106420)

(declare-fun res!842596 () Bool)

(declare-fun e!720698 () Bool)

(assert (=> start!106420 (=> (not res!842596) (not e!720698))))

(declare-datatypes ((B!1970 0))(
  ( (B!1971 (val!16320 Int)) )
))
(declare-datatypes ((tuple2!21158 0))(
  ( (tuple2!21159 (_1!10590 (_ BitVec 64)) (_2!10590 B!1970)) )
))
(declare-datatypes ((List!28312 0))(
  ( (Nil!28309) (Cons!28308 (h!29517 tuple2!21158) (t!41833 List!28312)) )
))
(declare-fun l!706 () List!28312)

(declare-fun isStrictlySorted!787 (List!28312) Bool)

(assert (=> start!106420 (= res!842596 (isStrictlySorted!787 l!706))))

(assert (=> start!106420 e!720698))

(declare-fun e!720697 () Bool)

(assert (=> start!106420 e!720697))

(assert (=> start!106420 true))

(declare-fun b!1265516 () Bool)

(declare-fun res!842595 () Bool)

(assert (=> b!1265516 (=> (not res!842595) (not e!720698))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!646 (List!28312 (_ BitVec 64)) Bool)

(assert (=> b!1265516 (= res!842595 (not (containsKey!646 l!706 key1!31)))))

(declare-fun b!1265517 () Bool)

(declare-fun ListPrimitiveSize!151 (List!28312) Int)

(assert (=> b!1265517 (= e!720698 (< (ListPrimitiveSize!151 l!706) 0))))

(declare-fun b!1265518 () Bool)

(declare-fun tp_is_empty!32503 () Bool)

(declare-fun tp!96338 () Bool)

(assert (=> b!1265518 (= e!720697 (and tp_is_empty!32503 tp!96338))))

(assert (= (and start!106420 res!842596) b!1265516))

(assert (= (and b!1265516 res!842595) b!1265517))

(assert (= (and start!106420 (is-Cons!28308 l!706)) b!1265518))

(declare-fun m!1165647 () Bool)

(assert (=> start!106420 m!1165647))

(declare-fun m!1165649 () Bool)

(assert (=> b!1265516 m!1165649))

(declare-fun m!1165651 () Bool)

(assert (=> b!1265517 m!1165651))

(push 1)

(assert (not start!106420))

(assert (not b!1265517))

(assert (not b!1265518))

(assert tp_is_empty!32503)

(assert (not b!1265516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138931 () Bool)

(declare-fun lt!574053 () Int)

(assert (=> d!138931 (>= lt!574053 0)))

(declare-fun e!720721 () Int)

(assert (=> d!138931 (= lt!574053 e!720721)))

(declare-fun c!123322 () Bool)

(assert (=> d!138931 (= c!123322 (is-Nil!28309 l!706))))

(assert (=> d!138931 (= (ListPrimitiveSize!151 l!706) lt!574053)))

(declare-fun b!1265549 () Bool)

(assert (=> b!1265549 (= e!720721 0)))

(declare-fun b!1265550 () Bool)

(assert (=> b!1265550 (= e!720721 (+ 1 (ListPrimitiveSize!151 (t!41833 l!706))))))

(assert (= (and d!138931 c!123322) b!1265549))

(assert (= (and d!138931 (not c!123322)) b!1265550))

(declare-fun m!1165665 () Bool)

(assert (=> b!1265550 m!1165665))

(assert (=> b!1265517 d!138931))

(declare-fun d!138933 () Bool)

(declare-fun res!842625 () Bool)

(declare-fun e!720736 () Bool)

(assert (=> d!138933 (=> res!842625 e!720736)))

(assert (=> d!138933 (= res!842625 (and (is-Cons!28308 l!706) (= (_1!10590 (h!29517 l!706)) key1!31)))))

(assert (=> d!138933 (= (containsKey!646 l!706 key1!31) e!720736)))

(declare-fun b!1265571 () Bool)

(declare-fun e!720737 () Bool)

(assert (=> b!1265571 (= e!720736 e!720737)))

(declare-fun res!842626 () Bool)

(assert (=> b!1265571 (=> (not res!842626) (not e!720737))))

(assert (=> b!1265571 (= res!842626 (and (or (not (is-Cons!28308 l!706)) (bvsle (_1!10590 (h!29517 l!706)) key1!31)) (is-Cons!28308 l!706) (bvslt (_1!10590 (h!29517 l!706)) key1!31)))))

(declare-fun b!1265572 () Bool)

(assert (=> b!1265572 (= e!720737 (containsKey!646 (t!41833 l!706) key1!31))))

(assert (= (and d!138933 (not res!842625)) b!1265571))

(assert (= (and b!1265571 res!842626) b!1265572))

(declare-fun m!1165675 () Bool)

(assert (=> b!1265572 m!1165675))

(assert (=> b!1265516 d!138933))

(declare-fun d!138943 () Bool)

(declare-fun res!842643 () Bool)

(declare-fun e!720754 () Bool)

(assert (=> d!138943 (=> res!842643 e!720754)))

(assert (=> d!138943 (= res!842643 (or (is-Nil!28309 l!706) (is-Nil!28309 (t!41833 l!706))))))

(assert (=> d!138943 (= (isStrictlySorted!787 l!706) e!720754)))

(declare-fun b!1265591 () Bool)

(declare-fun e!720755 () Bool)

(assert (=> b!1265591 (= e!720754 e!720755)))

(declare-fun res!842644 () Bool)

(assert (=> b!1265591 (=> (not res!842644) (not e!720755))))

(assert (=> b!1265591 (= res!842644 (bvslt (_1!10590 (h!29517 l!706)) (_1!10590 (h!29517 (t!41833 l!706)))))))

(declare-fun b!1265592 () Bool)

(assert (=> b!1265592 (= e!720755 (isStrictlySorted!787 (t!41833 l!706)))))

(assert (= (and d!138943 (not res!842643)) b!1265591))

(assert (= (and b!1265591 res!842644) b!1265592))

(declare-fun m!1165681 () Bool)

(assert (=> b!1265592 m!1165681))

(assert (=> start!106420 d!138943))

(declare-fun b!1265605 () Bool)

(declare-fun e!720764 () Bool)

(declare-fun tp!96353 () Bool)

(assert (=> b!1265605 (= e!720764 (and tp_is_empty!32503 tp!96353))))

(assert (=> b!1265518 (= tp!96338 e!720764)))

(assert (= (and b!1265518 (is-Cons!28308 (t!41833 l!706))) b!1265605))

(push 1)

