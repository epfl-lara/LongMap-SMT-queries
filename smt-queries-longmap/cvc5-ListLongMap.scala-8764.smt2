; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106444 () Bool)

(assert start!106444)

(declare-fun b!1265559 () Bool)

(declare-fun e!720737 () Bool)

(declare-fun tp_is_empty!32513 () Bool)

(declare-fun tp!96362 () Bool)

(assert (=> b!1265559 (= e!720737 (and tp_is_empty!32513 tp!96362))))

(declare-fun b!1265556 () Bool)

(declare-fun res!842629 () Bool)

(declare-fun e!720736 () Bool)

(assert (=> b!1265556 (=> (not res!842629) (not e!720736))))

(declare-datatypes ((B!1980 0))(
  ( (B!1981 (val!16325 Int)) )
))
(declare-datatypes ((tuple2!21250 0))(
  ( (tuple2!21251 (_1!10636 (_ BitVec 64)) (_2!10636 B!1980)) )
))
(declare-datatypes ((List!28401 0))(
  ( (Nil!28398) (Cons!28397 (h!29606 tuple2!21250) (t!41913 List!28401)) )
))
(declare-fun l!706 () List!28401)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!649 (List!28401 (_ BitVec 64)) Bool)

(assert (=> b!1265556 (= res!842629 (not (containsKey!649 l!706 key1!31)))))

(declare-fun b!1265558 () Bool)

(declare-fun isStrictlySorted!788 (List!28401) Bool)

(assert (=> b!1265558 (= e!720736 (not (isStrictlySorted!788 (t!41913 l!706))))))

(declare-fun res!842631 () Bool)

(assert (=> start!106444 (=> (not res!842631) (not e!720736))))

(assert (=> start!106444 (= res!842631 (isStrictlySorted!788 l!706))))

(assert (=> start!106444 e!720736))

(assert (=> start!106444 e!720737))

(assert (=> start!106444 true))

(declare-fun b!1265557 () Bool)

(declare-fun res!842630 () Bool)

(assert (=> b!1265557 (=> (not res!842630) (not e!720736))))

(assert (=> b!1265557 (= res!842630 (is-Cons!28397 l!706))))

(assert (= (and start!106444 res!842631) b!1265556))

(assert (= (and b!1265556 res!842629) b!1265557))

(assert (= (and b!1265557 res!842630) b!1265558))

(assert (= (and start!106444 (is-Cons!28397 l!706)) b!1265559))

(declare-fun m!1165175 () Bool)

(assert (=> b!1265556 m!1165175))

(declare-fun m!1165177 () Bool)

(assert (=> b!1265558 m!1165177))

(declare-fun m!1165179 () Bool)

(assert (=> start!106444 m!1165179))

(push 1)

(assert (not start!106444))

(assert (not b!1265559))

(assert (not b!1265558))

(assert tp_is_empty!32513)

(assert (not b!1265556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138815 () Bool)

(declare-fun res!842645 () Bool)

(declare-fun e!720751 () Bool)

(assert (=> d!138815 (=> res!842645 e!720751)))

(assert (=> d!138815 (= res!842645 (and (is-Cons!28397 l!706) (= (_1!10636 (h!29606 l!706)) key1!31)))))

(assert (=> d!138815 (= (containsKey!649 l!706 key1!31) e!720751)))

(declare-fun b!1265573 () Bool)

(declare-fun e!720753 () Bool)

(assert (=> b!1265573 (= e!720751 e!720753)))

(declare-fun res!842647 () Bool)

(assert (=> b!1265573 (=> (not res!842647) (not e!720753))))

(assert (=> b!1265573 (= res!842647 (and (or (not (is-Cons!28397 l!706)) (bvsle (_1!10636 (h!29606 l!706)) key1!31)) (is-Cons!28397 l!706) (bvslt (_1!10636 (h!29606 l!706)) key1!31)))))

(declare-fun b!1265575 () Bool)

(assert (=> b!1265575 (= e!720753 (containsKey!649 (t!41913 l!706) key1!31))))

(assert (= (and d!138815 (not res!842645)) b!1265573))

(assert (= (and b!1265573 res!842647) b!1265575))

(declare-fun m!1165182 () Bool)

(assert (=> b!1265575 m!1165182))

(assert (=> b!1265556 d!138815))

(declare-fun d!138823 () Bool)

(declare-fun res!842664 () Bool)

(declare-fun e!720770 () Bool)

(assert (=> d!138823 (=> res!842664 e!720770)))

(assert (=> d!138823 (= res!842664 (or (is-Nil!28398 (t!41913 l!706)) (is-Nil!28398 (t!41913 (t!41913 l!706)))))))

(assert (=> d!138823 (= (isStrictlySorted!788 (t!41913 l!706)) e!720770)))

(declare-fun b!1265592 () Bool)

(declare-fun e!720771 () Bool)

(assert (=> b!1265592 (= e!720770 e!720771)))

(declare-fun res!842665 () Bool)

(assert (=> b!1265592 (=> (not res!842665) (not e!720771))))

(assert (=> b!1265592 (= res!842665 (bvslt (_1!10636 (h!29606 (t!41913 l!706))) (_1!10636 (h!29606 (t!41913 (t!41913 l!706))))))))

(declare-fun b!1265593 () Bool)

(assert (=> b!1265593 (= e!720771 (isStrictlySorted!788 (t!41913 (t!41913 l!706))))))

(assert (= (and d!138823 (not res!842664)) b!1265592))

(assert (= (and b!1265592 res!842665) b!1265593))

(declare-fun m!1165189 () Bool)

(assert (=> b!1265593 m!1165189))

(assert (=> b!1265558 d!138823))

(declare-fun d!138829 () Bool)

(declare-fun res!842668 () Bool)

(declare-fun e!720774 () Bool)

(assert (=> d!138829 (=> res!842668 e!720774)))

(assert (=> d!138829 (= res!842668 (or (is-Nil!28398 l!706) (is-Nil!28398 (t!41913 l!706))))))

(assert (=> d!138829 (= (isStrictlySorted!788 l!706) e!720774)))

(declare-fun b!1265596 () Bool)

(declare-fun e!720775 () Bool)

(assert (=> b!1265596 (= e!720774 e!720775)))

(declare-fun res!842669 () Bool)

(assert (=> b!1265596 (=> (not res!842669) (not e!720775))))

(assert (=> b!1265596 (= res!842669 (bvslt (_1!10636 (h!29606 l!706)) (_1!10636 (h!29606 (t!41913 l!706)))))))

(declare-fun b!1265597 () Bool)

(assert (=> b!1265597 (= e!720775 (isStrictlySorted!788 (t!41913 l!706)))))

(assert (= (and d!138829 (not res!842668)) b!1265596))

(assert (= (and b!1265596 res!842669) b!1265597))

(assert (=> b!1265597 m!1165177))

(assert (=> start!106444 d!138829))

(declare-fun b!1265614 () Bool)

(declare-fun e!720786 () Bool)

(declare-fun tp!96369 () Bool)

(assert (=> b!1265614 (= e!720786 (and tp_is_empty!32513 tp!96369))))

(assert (=> b!1265559 (= tp!96362 e!720786)))

(assert (= (and b!1265559 (is-Cons!28397 (t!41913 l!706))) b!1265614))

(push 1)

(assert (not b!1265614))

(assert (not b!1265575))

(assert tp_is_empty!32513)

(assert (not b!1265597))

(assert (not b!1265593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

