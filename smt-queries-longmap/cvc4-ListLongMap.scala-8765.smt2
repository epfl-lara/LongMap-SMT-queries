; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106466 () Bool)

(assert start!106466)

(declare-fun b!1265740 () Bool)

(declare-fun res!842746 () Bool)

(declare-fun e!720851 () Bool)

(assert (=> b!1265740 (=> (not res!842746) (not e!720851))))

(declare-datatypes ((B!1986 0))(
  ( (B!1987 (val!16328 Int)) )
))
(declare-datatypes ((tuple2!21174 0))(
  ( (tuple2!21175 (_1!10598 (_ BitVec 64)) (_2!10598 B!1986)) )
))
(declare-datatypes ((List!28320 0))(
  ( (Nil!28317) (Cons!28316 (h!29525 tuple2!21174) (t!41841 List!28320)) )
))
(declare-fun l!706 () List!28320)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!654 (List!28320 (_ BitVec 64)) Bool)

(assert (=> b!1265740 (= res!842746 (not (containsKey!654 l!706 key1!31)))))

(declare-fun b!1265741 () Bool)

(declare-fun res!842748 () Bool)

(assert (=> b!1265741 (=> (not res!842748) (not e!720851))))

(assert (=> b!1265741 (= res!842748 (is-Cons!28316 l!706))))

(declare-fun b!1265742 () Bool)

(declare-fun e!720850 () Bool)

(declare-fun tp_is_empty!32519 () Bool)

(declare-fun tp!96380 () Bool)

(assert (=> b!1265742 (= e!720850 (and tp_is_empty!32519 tp!96380))))

(declare-fun b!1265743 () Bool)

(declare-fun res!842747 () Bool)

(assert (=> b!1265743 (=> (not res!842747) (not e!720851))))

(declare-fun isStrictlySorted!795 (List!28320) Bool)

(assert (=> b!1265743 (= res!842747 (isStrictlySorted!795 (t!41841 l!706)))))

(declare-fun res!842749 () Bool)

(assert (=> start!106466 (=> (not res!842749) (not e!720851))))

(assert (=> start!106466 (= res!842749 (isStrictlySorted!795 l!706))))

(assert (=> start!106466 e!720851))

(assert (=> start!106466 e!720850))

(assert (=> start!106466 true))

(declare-fun b!1265739 () Bool)

(assert (=> b!1265739 (= e!720851 (containsKey!654 (t!41841 l!706) key1!31))))

(assert (= (and start!106466 res!842749) b!1265740))

(assert (= (and b!1265740 res!842746) b!1265741))

(assert (= (and b!1265741 res!842748) b!1265743))

(assert (= (and b!1265743 res!842747) b!1265739))

(assert (= (and start!106466 (is-Cons!28316 l!706)) b!1265742))

(declare-fun m!1165729 () Bool)

(assert (=> b!1265740 m!1165729))

(declare-fun m!1165731 () Bool)

(assert (=> b!1265743 m!1165731))

(declare-fun m!1165733 () Bool)

(assert (=> start!106466 m!1165733))

(declare-fun m!1165735 () Bool)

(assert (=> b!1265739 m!1165735))

(push 1)

(assert (not b!1265743))

(assert tp_is_empty!32519)

(assert (not b!1265739))

(assert (not b!1265740))

(assert (not start!106466))

(assert (not b!1265742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138971 () Bool)

(declare-fun res!842768 () Bool)

(declare-fun e!720870 () Bool)

(assert (=> d!138971 (=> res!842768 e!720870)))

(assert (=> d!138971 (= res!842768 (and (is-Cons!28316 l!706) (= (_1!10598 (h!29525 l!706)) key1!31)))))

(assert (=> d!138971 (= (containsKey!654 l!706 key1!31) e!720870)))

(declare-fun b!1265760 () Bool)

(declare-fun e!720871 () Bool)

(assert (=> b!1265760 (= e!720870 e!720871)))

(declare-fun res!842769 () Bool)

(assert (=> b!1265760 (=> (not res!842769) (not e!720871))))

(assert (=> b!1265760 (= res!842769 (and (or (not (is-Cons!28316 l!706)) (bvsle (_1!10598 (h!29525 l!706)) key1!31)) (is-Cons!28316 l!706) (bvslt (_1!10598 (h!29525 l!706)) key1!31)))))

(declare-fun b!1265761 () Bool)

(assert (=> b!1265761 (= e!720871 (containsKey!654 (t!41841 l!706) key1!31))))

(assert (= (and d!138971 (not res!842768)) b!1265760))

(assert (= (and b!1265760 res!842769) b!1265761))

(assert (=> b!1265761 m!1165735))

(assert (=> b!1265740 d!138971))

(declare-fun d!138977 () Bool)

(declare-fun res!842786 () Bool)

(declare-fun e!720891 () Bool)

(assert (=> d!138977 (=> res!842786 e!720891)))

(assert (=> d!138977 (= res!842786 (or (is-Nil!28317 l!706) (is-Nil!28317 (t!41841 l!706))))))

(assert (=> d!138977 (= (isStrictlySorted!795 l!706) e!720891)))

(declare-fun b!1265785 () Bool)

(declare-fun e!720892 () Bool)

(assert (=> b!1265785 (= e!720891 e!720892)))

(declare-fun res!842787 () Bool)

(assert (=> b!1265785 (=> (not res!842787) (not e!720892))))

(assert (=> b!1265785 (= res!842787 (bvslt (_1!10598 (h!29525 l!706)) (_1!10598 (h!29525 (t!41841 l!706)))))))

(declare-fun b!1265786 () Bool)

(assert (=> b!1265786 (= e!720892 (isStrictlySorted!795 (t!41841 l!706)))))

(assert (= (and d!138977 (not res!842786)) b!1265785))

(assert (= (and b!1265785 res!842787) b!1265786))

(assert (=> b!1265786 m!1165731))

(assert (=> start!106466 d!138977))

(declare-fun d!138983 () Bool)

(declare-fun res!842790 () Bool)

(declare-fun e!720895 () Bool)

(assert (=> d!138983 (=> res!842790 e!720895)))

(assert (=> d!138983 (= res!842790 (or (is-Nil!28317 (t!41841 l!706)) (is-Nil!28317 (t!41841 (t!41841 l!706)))))))

(assert (=> d!138983 (= (isStrictlySorted!795 (t!41841 l!706)) e!720895)))

(declare-fun b!1265789 () Bool)

(declare-fun e!720896 () Bool)

(assert (=> b!1265789 (= e!720895 e!720896)))

(declare-fun res!842791 () Bool)

(assert (=> b!1265789 (=> (not res!842791) (not e!720896))))

(assert (=> b!1265789 (= res!842791 (bvslt (_1!10598 (h!29525 (t!41841 l!706))) (_1!10598 (h!29525 (t!41841 (t!41841 l!706))))))))

(declare-fun b!1265790 () Bool)

(assert (=> b!1265790 (= e!720896 (isStrictlySorted!795 (t!41841 (t!41841 l!706))))))

(assert (= (and d!138983 (not res!842790)) b!1265789))

(assert (= (and b!1265789 res!842791) b!1265790))

(declare-fun m!1165745 () Bool)

(assert (=> b!1265790 m!1165745))

(assert (=> b!1265743 d!138983))

(declare-fun d!138987 () Bool)

(declare-fun res!842794 () Bool)

(declare-fun e!720899 () Bool)

(assert (=> d!138987 (=> res!842794 e!720899)))

(assert (=> d!138987 (= res!842794 (and (is-Cons!28316 (t!41841 l!706)) (= (_1!10598 (h!29525 (t!41841 l!706))) key1!31)))))

(assert (=> d!138987 (= (containsKey!654 (t!41841 l!706) key1!31) e!720899)))

(declare-fun b!1265793 () Bool)

(declare-fun e!720900 () Bool)

(assert (=> b!1265793 (= e!720899 e!720900)))

(declare-fun res!842795 () Bool)

(assert (=> b!1265793 (=> (not res!842795) (not e!720900))))

(assert (=> b!1265793 (= res!842795 (and (or (not (is-Cons!28316 (t!41841 l!706))) (bvsle (_1!10598 (h!29525 (t!41841 l!706))) key1!31)) (is-Cons!28316 (t!41841 l!706)) (bvslt (_1!10598 (h!29525 (t!41841 l!706))) key1!31)))))

(declare-fun b!1265794 () Bool)

(assert (=> b!1265794 (= e!720900 (containsKey!654 (t!41841 (t!41841 l!706)) key1!31))))

(assert (= (and d!138987 (not res!842794)) b!1265793))

(assert (= (and b!1265793 res!842795) b!1265794))

(declare-fun m!1165747 () Bool)

(assert (=> b!1265794 m!1165747))

(assert (=> b!1265739 d!138987))

(declare-fun b!1265805 () Bool)

(declare-fun e!720907 () Bool)

(declare-fun tp!96388 () Bool)

(assert (=> b!1265805 (= e!720907 (and tp_is_empty!32519 tp!96388))))

(assert (=> b!1265742 (= tp!96380 e!720907)))

(assert (= (and b!1265742 (is-Cons!28316 (t!41841 l!706))) b!1265805))

(push 1)

(assert (not b!1265805))

(assert (not b!1265761))

(assert (not b!1265794))

(assert tp_is_empty!32519)

(assert (not b!1265790))

(assert (not b!1265786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

