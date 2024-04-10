; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137766 () Bool)

(assert start!137766)

(declare-fun b!1582797 () Bool)

(declare-fun res!1081276 () Bool)

(declare-fun e!883413 () Bool)

(assert (=> b!1582797 (=> (not res!1081276) (not e!883413))))

(declare-datatypes ((B!2822 0))(
  ( (B!2823 (val!19773 Int)) )
))
(declare-datatypes ((tuple2!25714 0))(
  ( (tuple2!25715 (_1!12868 (_ BitVec 64)) (_2!12868 B!2822)) )
))
(declare-datatypes ((List!36893 0))(
  ( (Nil!36890) (Cons!36889 (h!38432 tuple2!25714) (t!51807 List!36893)) )
))
(declare-fun l!1065 () List!36893)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!973 (List!36893 (_ BitVec 64)) Bool)

(assert (=> b!1582797 (= res!1081276 (containsKey!973 l!1065 key!287))))

(declare-fun res!1081275 () Bool)

(assert (=> start!137766 (=> (not res!1081275) (not e!883413))))

(declare-fun isStrictlySorted!1127 (List!36893) Bool)

(assert (=> start!137766 (= res!1081275 (isStrictlySorted!1127 l!1065))))

(assert (=> start!137766 e!883413))

(declare-fun e!883415 () Bool)

(assert (=> start!137766 e!883415))

(assert (=> start!137766 true))

(declare-fun b!1582798 () Bool)

(declare-fun e!883414 () Bool)

(assert (=> b!1582798 (= e!883413 e!883414)))

(declare-fun res!1081277 () Bool)

(assert (=> b!1582798 (=> res!1081277 e!883414)))

(assert (=> b!1582798 (= res!1081277 (not (isStrictlySorted!1127 (t!51807 l!1065))))))

(declare-fun b!1582799 () Bool)

(declare-fun tp_is_empty!39355 () Bool)

(declare-fun tp!114857 () Bool)

(assert (=> b!1582799 (= e!883415 (and tp_is_empty!39355 tp!114857))))

(declare-fun b!1582800 () Bool)

(declare-fun res!1081278 () Bool)

(assert (=> b!1582800 (=> (not res!1081278) (not e!883413))))

(assert (=> b!1582800 (= res!1081278 (and (is-Cons!36889 l!1065) (not (= (_1!12868 (h!38432 l!1065)) key!287))))))

(declare-fun b!1582801 () Bool)

(assert (=> b!1582801 (= e!883414 (not (containsKey!973 (t!51807 l!1065) key!287)))))

(assert (= (and start!137766 res!1081275) b!1582797))

(assert (= (and b!1582797 res!1081276) b!1582800))

(assert (= (and b!1582800 res!1081278) b!1582798))

(assert (= (and b!1582798 (not res!1081277)) b!1582801))

(assert (= (and start!137766 (is-Cons!36889 l!1065)) b!1582799))

(declare-fun m!1453043 () Bool)

(assert (=> b!1582797 m!1453043))

(declare-fun m!1453045 () Bool)

(assert (=> start!137766 m!1453045))

(declare-fun m!1453047 () Bool)

(assert (=> b!1582798 m!1453047))

(declare-fun m!1453049 () Bool)

(assert (=> b!1582801 m!1453049))

(push 1)

(assert (not b!1582801))

(assert (not b!1582799))

(assert (not b!1582797))

(assert (not b!1582798))

(assert tp_is_empty!39355)

(assert (not start!137766))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167061 () Bool)

(declare-fun res!1081329 () Bool)

(declare-fun e!883460 () Bool)

(assert (=> d!167061 (=> res!1081329 e!883460)))

(assert (=> d!167061 (= res!1081329 (or (is-Nil!36890 l!1065) (is-Nil!36890 (t!51807 l!1065))))))

(assert (=> d!167061 (= (isStrictlySorted!1127 l!1065) e!883460)))

(declare-fun b!1582858 () Bool)

(declare-fun e!883461 () Bool)

(assert (=> b!1582858 (= e!883460 e!883461)))

(declare-fun res!1081330 () Bool)

(assert (=> b!1582858 (=> (not res!1081330) (not e!883461))))

(assert (=> b!1582858 (= res!1081330 (bvslt (_1!12868 (h!38432 l!1065)) (_1!12868 (h!38432 (t!51807 l!1065)))))))

(declare-fun b!1582859 () Bool)

(assert (=> b!1582859 (= e!883461 (isStrictlySorted!1127 (t!51807 l!1065)))))

(assert (= (and d!167061 (not res!1081329)) b!1582858))

(assert (= (and b!1582858 res!1081330) b!1582859))

(assert (=> b!1582859 m!1453047))

(assert (=> start!137766 d!167061))

(declare-fun d!167067 () Bool)

(declare-fun res!1081331 () Bool)

(declare-fun e!883462 () Bool)

(assert (=> d!167067 (=> res!1081331 e!883462)))

(assert (=> d!167067 (= res!1081331 (or (is-Nil!36890 (t!51807 l!1065)) (is-Nil!36890 (t!51807 (t!51807 l!1065)))))))

(assert (=> d!167067 (= (isStrictlySorted!1127 (t!51807 l!1065)) e!883462)))

(declare-fun b!1582860 () Bool)

(declare-fun e!883463 () Bool)

(assert (=> b!1582860 (= e!883462 e!883463)))

(declare-fun res!1081332 () Bool)

(assert (=> b!1582860 (=> (not res!1081332) (not e!883463))))

(assert (=> b!1582860 (= res!1081332 (bvslt (_1!12868 (h!38432 (t!51807 l!1065))) (_1!12868 (h!38432 (t!51807 (t!51807 l!1065))))))))

(declare-fun b!1582861 () Bool)

(assert (=> b!1582861 (= e!883463 (isStrictlySorted!1127 (t!51807 (t!51807 l!1065))))))

(assert (= (and d!167067 (not res!1081331)) b!1582860))

(assert (= (and b!1582860 res!1081332) b!1582861))

(declare-fun m!1453071 () Bool)

(assert (=> b!1582861 m!1453071))

(assert (=> b!1582798 d!167067))

(declare-fun d!167071 () Bool)

(declare-fun res!1081347 () Bool)

(declare-fun e!883484 () Bool)

(assert (=> d!167071 (=> res!1081347 e!883484)))

(assert (=> d!167071 (= res!1081347 (and (is-Cons!36889 (t!51807 l!1065)) (= (_1!12868 (h!38432 (t!51807 l!1065))) key!287)))))

(assert (=> d!167071 (= (containsKey!973 (t!51807 l!1065) key!287) e!883484)))

(declare-fun b!1582886 () Bool)

(declare-fun e!883485 () Bool)

(assert (=> b!1582886 (= e!883484 e!883485)))

(declare-fun res!1081348 () Bool)

(assert (=> b!1582886 (=> (not res!1081348) (not e!883485))))

(assert (=> b!1582886 (= res!1081348 (and (or (not (is-Cons!36889 (t!51807 l!1065))) (bvsle (_1!12868 (h!38432 (t!51807 l!1065))) key!287)) (is-Cons!36889 (t!51807 l!1065)) (bvslt (_1!12868 (h!38432 (t!51807 l!1065))) key!287)))))

(declare-fun b!1582887 () Bool)

(assert (=> b!1582887 (= e!883485 (containsKey!973 (t!51807 (t!51807 l!1065)) key!287))))

(assert (= (and d!167071 (not res!1081347)) b!1582886))

(assert (= (and b!1582886 res!1081348) b!1582887))

(declare-fun m!1453077 () Bool)

(assert (=> b!1582887 m!1453077))

(assert (=> b!1582801 d!167071))

(declare-fun d!167075 () Bool)

(declare-fun res!1081349 () Bool)

(declare-fun e!883486 () Bool)

(assert (=> d!167075 (=> res!1081349 e!883486)))

(assert (=> d!167075 (= res!1081349 (and (is-Cons!36889 l!1065) (= (_1!12868 (h!38432 l!1065)) key!287)))))

(assert (=> d!167075 (= (containsKey!973 l!1065 key!287) e!883486)))

(declare-fun b!1582888 () Bool)

(declare-fun e!883487 () Bool)

(assert (=> b!1582888 (= e!883486 e!883487)))

(declare-fun res!1081350 () Bool)

(assert (=> b!1582888 (=> (not res!1081350) (not e!883487))))

(assert (=> b!1582888 (= res!1081350 (and (or (not (is-Cons!36889 l!1065)) (bvsle (_1!12868 (h!38432 l!1065)) key!287)) (is-Cons!36889 l!1065) (bvslt (_1!12868 (h!38432 l!1065)) key!287)))))

(declare-fun b!1582889 () Bool)

(assert (=> b!1582889 (= e!883487 (containsKey!973 (t!51807 l!1065) key!287))))

(assert (= (and d!167075 (not res!1081349)) b!1582888))

(assert (= (and b!1582888 res!1081350) b!1582889))

(assert (=> b!1582889 m!1453049))

(assert (=> b!1582797 d!167075))

(declare-fun b!1582894 () Bool)

(declare-fun e!883490 () Bool)

(declare-fun tp!114872 () Bool)

(assert (=> b!1582894 (= e!883490 (and tp_is_empty!39355 tp!114872))))

(assert (=> b!1582799 (= tp!114857 e!883490)))

(assert (= (and b!1582799 (is-Cons!36889 (t!51807 l!1065))) b!1582894))

(push 1)

(assert (not b!1582894))

(assert (not b!1582887))

(assert (not b!1582859))

(assert (not b!1582889))

(assert tp_is_empty!39355)

(assert (not b!1582861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

