; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106444 () Bool)

(assert start!106444)

(declare-fun b!1265616 () Bool)

(declare-fun e!720770 () Bool)

(declare-datatypes ((B!1976 0))(
  ( (B!1977 (val!16323 Int)) )
))
(declare-datatypes ((tuple2!21164 0))(
  ( (tuple2!21165 (_1!10593 (_ BitVec 64)) (_2!10593 B!1976)) )
))
(declare-datatypes ((List!28315 0))(
  ( (Nil!28312) (Cons!28311 (h!29520 tuple2!21164) (t!41836 List!28315)) )
))
(declare-fun l!706 () List!28315)

(declare-fun isStrictlySorted!790 (List!28315) Bool)

(assert (=> b!1265616 (= e!720770 (not (isStrictlySorted!790 (t!41836 l!706))))))

(declare-fun res!842652 () Bool)

(assert (=> start!106444 (=> (not res!842652) (not e!720770))))

(assert (=> start!106444 (= res!842652 (isStrictlySorted!790 l!706))))

(assert (=> start!106444 e!720770))

(declare-fun e!720769 () Bool)

(assert (=> start!106444 e!720769))

(assert (=> start!106444 true))

(declare-fun b!1265614 () Bool)

(declare-fun res!842653 () Bool)

(assert (=> b!1265614 (=> (not res!842653) (not e!720770))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!649 (List!28315 (_ BitVec 64)) Bool)

(assert (=> b!1265614 (= res!842653 (not (containsKey!649 l!706 key1!31)))))

(declare-fun b!1265615 () Bool)

(declare-fun res!842651 () Bool)

(assert (=> b!1265615 (=> (not res!842651) (not e!720770))))

(assert (=> b!1265615 (= res!842651 (is-Cons!28311 l!706))))

(declare-fun b!1265617 () Bool)

(declare-fun tp_is_empty!32509 () Bool)

(declare-fun tp!96356 () Bool)

(assert (=> b!1265617 (= e!720769 (and tp_is_empty!32509 tp!96356))))

(assert (= (and start!106444 res!842652) b!1265614))

(assert (= (and b!1265614 res!842653) b!1265615))

(assert (= (and b!1265615 res!842651) b!1265616))

(assert (= (and start!106444 (is-Cons!28311 l!706)) b!1265617))

(declare-fun m!1165683 () Bool)

(assert (=> b!1265616 m!1165683))

(declare-fun m!1165685 () Bool)

(assert (=> start!106444 m!1165685))

(declare-fun m!1165687 () Bool)

(assert (=> b!1265614 m!1165687))

(push 1)

(assert tp_is_empty!32509)

(assert (not b!1265617))

(assert (not b!1265616))

(assert (not start!106444))

(assert (not b!1265614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138949 () Bool)

(declare-fun res!842686 () Bool)

(declare-fun e!720797 () Bool)

(assert (=> d!138949 (=> res!842686 e!720797)))

(assert (=> d!138949 (= res!842686 (or (is-Nil!28312 l!706) (is-Nil!28312 (t!41836 l!706))))))

(assert (=> d!138949 (= (isStrictlySorted!790 l!706) e!720797)))

(declare-fun b!1265656 () Bool)

(declare-fun e!720798 () Bool)

(assert (=> b!1265656 (= e!720797 e!720798)))

(declare-fun res!842687 () Bool)

(assert (=> b!1265656 (=> (not res!842687) (not e!720798))))

(assert (=> b!1265656 (= res!842687 (bvslt (_1!10593 (h!29520 l!706)) (_1!10593 (h!29520 (t!41836 l!706)))))))

(declare-fun b!1265657 () Bool)

(assert (=> b!1265657 (= e!720798 (isStrictlySorted!790 (t!41836 l!706)))))

(assert (= (and d!138949 (not res!842686)) b!1265656))

(assert (= (and b!1265656 res!842687) b!1265657))

(assert (=> b!1265657 m!1165683))

(assert (=> start!106444 d!138949))

(declare-fun d!138955 () Bool)

(declare-fun res!842688 () Bool)

(declare-fun e!720799 () Bool)

(assert (=> d!138955 (=> res!842688 e!720799)))

(assert (=> d!138955 (= res!842688 (or (is-Nil!28312 (t!41836 l!706)) (is-Nil!28312 (t!41836 (t!41836 l!706)))))))

(assert (=> d!138955 (= (isStrictlySorted!790 (t!41836 l!706)) e!720799)))

(declare-fun b!1265658 () Bool)

(declare-fun e!720800 () Bool)

(assert (=> b!1265658 (= e!720799 e!720800)))

(declare-fun res!842689 () Bool)

(assert (=> b!1265658 (=> (not res!842689) (not e!720800))))

(assert (=> b!1265658 (= res!842689 (bvslt (_1!10593 (h!29520 (t!41836 l!706))) (_1!10593 (h!29520 (t!41836 (t!41836 l!706))))))))

(declare-fun b!1265659 () Bool)

(assert (=> b!1265659 (= e!720800 (isStrictlySorted!790 (t!41836 (t!41836 l!706))))))

(assert (= (and d!138955 (not res!842688)) b!1265658))

(assert (= (and b!1265658 res!842689) b!1265659))

(declare-fun m!1165703 () Bool)

(assert (=> b!1265659 m!1165703))

(assert (=> b!1265616 d!138955))

(declare-fun d!138957 () Bool)

(declare-fun res!842712 () Bool)

(declare-fun e!720826 () Bool)

(assert (=> d!138957 (=> res!842712 e!720826)))

(assert (=> d!138957 (= res!842712 (and (is-Cons!28311 l!706) (= (_1!10593 (h!29520 l!706)) key1!31)))))

(assert (=> d!138957 (= (containsKey!649 l!706 key1!31) e!720826)))

(declare-fun b!1265687 () Bool)

(declare-fun e!720827 () Bool)

(assert (=> b!1265687 (= e!720826 e!720827)))

(declare-fun res!842713 () Bool)

(assert (=> b!1265687 (=> (not res!842713) (not e!720827))))

(assert (=> b!1265687 (= res!842713 (and (or (not (is-Cons!28311 l!706)) (bvsle (_1!10593 (h!29520 l!706)) key1!31)) (is-Cons!28311 l!706) (bvslt (_1!10593 (h!29520 l!706)) key1!31)))))

(declare-fun b!1265688 () Bool)

(assert (=> b!1265688 (= e!720827 (containsKey!649 (t!41836 l!706) key1!31))))

(assert (= (and d!138957 (not res!842712)) b!1265687))

(assert (= (and b!1265687 res!842713) b!1265688))

(declare-fun m!1165711 () Bool)

(assert (=> b!1265688 m!1165711))

