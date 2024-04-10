; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106462 () Bool)

(assert start!106462)

(declare-fun b!1265709 () Bool)

(declare-fun res!842725 () Bool)

(declare-fun e!720839 () Bool)

(assert (=> b!1265709 (=> (not res!842725) (not e!720839))))

(declare-datatypes ((B!1982 0))(
  ( (B!1983 (val!16326 Int)) )
))
(declare-datatypes ((tuple2!21170 0))(
  ( (tuple2!21171 (_1!10596 (_ BitVec 64)) (_2!10596 B!1982)) )
))
(declare-datatypes ((List!28318 0))(
  ( (Nil!28315) (Cons!28314 (h!29523 tuple2!21170) (t!41839 List!28318)) )
))
(declare-fun l!706 () List!28318)

(assert (=> b!1265709 (= res!842725 (is-Cons!28314 l!706))))

(declare-fun b!1265710 () Bool)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!652 (List!28318 (_ BitVec 64)) Bool)

(assert (=> b!1265710 (= e!720839 (containsKey!652 (t!41839 l!706) key1!31))))

(declare-fun b!1265711 () Bool)

(declare-fun e!720838 () Bool)

(declare-fun tp_is_empty!32515 () Bool)

(declare-fun tp!96374 () Bool)

(assert (=> b!1265711 (= e!720838 (and tp_is_empty!32515 tp!96374))))

(declare-fun b!1265712 () Bool)

(declare-fun res!842723 () Bool)

(assert (=> b!1265712 (=> (not res!842723) (not e!720839))))

(assert (=> b!1265712 (= res!842723 (not (containsKey!652 l!706 key1!31)))))

(declare-fun b!1265713 () Bool)

(declare-fun res!842722 () Bool)

(assert (=> b!1265713 (=> (not res!842722) (not e!720839))))

(declare-fun isStrictlySorted!793 (List!28318) Bool)

(assert (=> b!1265713 (= res!842722 (isStrictlySorted!793 (t!41839 l!706)))))

(declare-fun res!842724 () Bool)

(assert (=> start!106462 (=> (not res!842724) (not e!720839))))

(assert (=> start!106462 (= res!842724 (isStrictlySorted!793 l!706))))

(assert (=> start!106462 e!720839))

(assert (=> start!106462 e!720838))

(assert (=> start!106462 true))

(assert (= (and start!106462 res!842724) b!1265712))

(assert (= (and b!1265712 res!842723) b!1265709))

(assert (= (and b!1265709 res!842725) b!1265713))

(assert (= (and b!1265713 res!842722) b!1265710))

(assert (= (and start!106462 (is-Cons!28314 l!706)) b!1265711))

(declare-fun m!1165713 () Bool)

(assert (=> b!1265710 m!1165713))

(declare-fun m!1165715 () Bool)

(assert (=> b!1265712 m!1165715))

(declare-fun m!1165717 () Bool)

(assert (=> b!1265713 m!1165717))

(declare-fun m!1165719 () Bool)

(assert (=> start!106462 m!1165719))

(push 1)

(assert (not b!1265710))

(assert (not start!106462))

(assert (not b!1265711))

(assert tp_is_empty!32515)

(assert (not b!1265712))

(assert (not b!1265713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138967 () Bool)

(declare-fun res!842758 () Bool)

(declare-fun e!720860 () Bool)

(assert (=> d!138967 (=> res!842758 e!720860)))

(assert (=> d!138967 (= res!842758 (or (is-Nil!28315 l!706) (is-Nil!28315 (t!41839 l!706))))))

(assert (=> d!138967 (= (isStrictlySorted!793 l!706) e!720860)))

(declare-fun b!1265752 () Bool)

(declare-fun e!720861 () Bool)

(assert (=> b!1265752 (= e!720860 e!720861)))

(declare-fun res!842759 () Bool)

(assert (=> b!1265752 (=> (not res!842759) (not e!720861))))

(assert (=> b!1265752 (= res!842759 (bvslt (_1!10596 (h!29523 l!706)) (_1!10596 (h!29523 (t!41839 l!706)))))))

(declare-fun b!1265753 () Bool)

(assert (=> b!1265753 (= e!720861 (isStrictlySorted!793 (t!41839 l!706)))))

(assert (= (and d!138967 (not res!842758)) b!1265752))

(assert (= (and b!1265752 res!842759) b!1265753))

(assert (=> b!1265753 m!1165717))

(assert (=> start!106462 d!138967))

(declare-fun d!138973 () Bool)

(declare-fun res!842772 () Bool)

(declare-fun e!720874 () Bool)

(assert (=> d!138973 (=> res!842772 e!720874)))

(assert (=> d!138973 (= res!842772 (and (is-Cons!28314 l!706) (= (_1!10596 (h!29523 l!706)) key1!31)))))

(assert (=> d!138973 (= (containsKey!652 l!706 key1!31) e!720874)))

(declare-fun b!1265766 () Bool)

(declare-fun e!720875 () Bool)

(assert (=> b!1265766 (= e!720874 e!720875)))

(declare-fun res!842773 () Bool)

(assert (=> b!1265766 (=> (not res!842773) (not e!720875))))

(assert (=> b!1265766 (= res!842773 (and (or (not (is-Cons!28314 l!706)) (bvsle (_1!10596 (h!29523 l!706)) key1!31)) (is-Cons!28314 l!706) (bvslt (_1!10596 (h!29523 l!706)) key1!31)))))

(declare-fun b!1265767 () Bool)

(assert (=> b!1265767 (= e!720875 (containsKey!652 (t!41839 l!706) key1!31))))

(assert (= (and d!138973 (not res!842772)) b!1265766))

(assert (= (and b!1265766 res!842773) b!1265767))

(assert (=> b!1265767 m!1165713))

(assert (=> b!1265712 d!138973))

(declare-fun d!138979 () Bool)

(declare-fun res!842774 () Bool)

(declare-fun e!720876 () Bool)

(assert (=> d!138979 (=> res!842774 e!720876)))

(assert (=> d!138979 (= res!842774 (or (is-Nil!28315 (t!41839 l!706)) (is-Nil!28315 (t!41839 (t!41839 l!706)))))))

(assert (=> d!138979 (= (isStrictlySorted!793 (t!41839 l!706)) e!720876)))

(declare-fun b!1265768 () Bool)

(declare-fun e!720877 () Bool)

(assert (=> b!1265768 (= e!720876 e!720877)))

(declare-fun res!842775 () Bool)

(assert (=> b!1265768 (=> (not res!842775) (not e!720877))))

(assert (=> b!1265768 (= res!842775 (bvslt (_1!10596 (h!29523 (t!41839 l!706))) (_1!10596 (h!29523 (t!41839 (t!41839 l!706))))))))

(declare-fun b!1265769 () Bool)

(assert (=> b!1265769 (= e!720877 (isStrictlySorted!793 (t!41839 (t!41839 l!706))))))

(assert (= (and d!138979 (not res!842774)) b!1265768))

(assert (= (and b!1265768 res!842775) b!1265769))

(declare-fun m!1165739 () Bool)

(assert (=> b!1265769 m!1165739))

(assert (=> b!1265713 d!138979))

(declare-fun d!138981 () Bool)

(declare-fun res!842776 () Bool)

(declare-fun e!720878 () Bool)

(assert (=> d!138981 (=> res!842776 e!720878)))

(assert (=> d!138981 (= res!842776 (and (is-Cons!28314 (t!41839 l!706)) (= (_1!10596 (h!29523 (t!41839 l!706))) key1!31)))))

(assert (=> d!138981 (= (containsKey!652 (t!41839 l!706) key1!31) e!720878)))

(declare-fun b!1265770 () Bool)

(declare-fun e!720879 () Bool)

(assert (=> b!1265770 (= e!720878 e!720879)))

(declare-fun res!842777 () Bool)

(assert (=> b!1265770 (=> (not res!842777) (not e!720879))))

(assert (=> b!1265770 (= res!842777 (and (or (not (is-Cons!28314 (t!41839 l!706))) (bvsle (_1!10596 (h!29523 (t!41839 l!706))) key1!31)) (is-Cons!28314 (t!41839 l!706)) (bvslt (_1!10596 (h!29523 (t!41839 l!706))) key1!31)))))

(declare-fun b!1265771 () Bool)

(assert (=> b!1265771 (= e!720879 (containsKey!652 (t!41839 (t!41839 l!706)) key1!31))))

(assert (= (and d!138981 (not res!842776)) b!1265770))

(assert (= (and b!1265770 res!842777) b!1265771))

(declare-fun m!1165741 () Bool)

(assert (=> b!1265771 m!1165741))

(assert (=> b!1265710 d!138981))

(declare-fun b!1265784 () Bool)

(declare-fun e!720890 () Bool)

(declare-fun tp!96383 () Bool)

(assert (=> b!1265784 (= e!720890 (and tp_is_empty!32515 tp!96383))))

(assert (=> b!1265711 (= tp!96374 e!720890)))

(assert (= (and b!1265711 (is-Cons!28314 (t!41839 l!706))) b!1265784))

(push 1)

(assert (not b!1265767))

(assert (not b!1265771))

(assert (not b!1265769))

(assert (not b!1265753))

(assert (not b!1265784))

(assert tp_is_empty!32515)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

