; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106462 () Bool)

(assert start!106462)

(declare-fun b!1265657 () Bool)

(declare-fun res!842709 () Bool)

(declare-fun e!720806 () Bool)

(assert (=> b!1265657 (=> (not res!842709) (not e!720806))))

(declare-datatypes ((B!1986 0))(
  ( (B!1987 (val!16328 Int)) )
))
(declare-datatypes ((tuple2!21256 0))(
  ( (tuple2!21257 (_1!10639 (_ BitVec 64)) (_2!10639 B!1986)) )
))
(declare-datatypes ((List!28404 0))(
  ( (Nil!28401) (Cons!28400 (h!29609 tuple2!21256) (t!41916 List!28404)) )
))
(declare-fun l!706 () List!28404)

(declare-fun isStrictlySorted!791 (List!28404) Bool)

(assert (=> b!1265657 (= res!842709 (isStrictlySorted!791 (t!41916 l!706)))))

(declare-fun res!842708 () Bool)

(assert (=> start!106462 (=> (not res!842708) (not e!720806))))

(assert (=> start!106462 (= res!842708 (isStrictlySorted!791 l!706))))

(assert (=> start!106462 e!720806))

(declare-fun e!720805 () Bool)

(assert (=> start!106462 e!720805))

(assert (=> start!106462 true))

(declare-fun b!1265658 () Bool)

(declare-fun tp_is_empty!32519 () Bool)

(declare-fun tp!96380 () Bool)

(assert (=> b!1265658 (= e!720805 (and tp_is_empty!32519 tp!96380))))

(declare-fun b!1265659 () Bool)

(declare-fun res!842707 () Bool)

(assert (=> b!1265659 (=> (not res!842707) (not e!720806))))

(assert (=> b!1265659 (= res!842707 (is-Cons!28400 l!706))))

(declare-fun b!1265660 () Bool)

(declare-fun res!842706 () Bool)

(assert (=> b!1265660 (=> (not res!842706) (not e!720806))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!652 (List!28404 (_ BitVec 64)) Bool)

(assert (=> b!1265660 (= res!842706 (not (containsKey!652 l!706 key1!31)))))

(declare-fun b!1265661 () Bool)

(assert (=> b!1265661 (= e!720806 (containsKey!652 (t!41916 l!706) key1!31))))

(assert (= (and start!106462 res!842708) b!1265660))

(assert (= (and b!1265660 res!842706) b!1265659))

(assert (= (and b!1265659 res!842707) b!1265657))

(assert (= (and b!1265657 res!842709) b!1265661))

(assert (= (and start!106462 (is-Cons!28400 l!706)) b!1265658))

(declare-fun m!1165209 () Bool)

(assert (=> b!1265657 m!1165209))

(declare-fun m!1165211 () Bool)

(assert (=> start!106462 m!1165211))

(declare-fun m!1165213 () Bool)

(assert (=> b!1265660 m!1165213))

(declare-fun m!1165215 () Bool)

(assert (=> b!1265661 m!1165215))

(push 1)

(assert (not b!1265658))

(assert (not b!1265661))

(assert (not start!106462))

(assert (not b!1265660))

(assert (not b!1265657))

(assert tp_is_empty!32519)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138835 () Bool)

(declare-fun res!842722 () Bool)

(declare-fun e!720819 () Bool)

(assert (=> d!138835 (=> res!842722 e!720819)))

(assert (=> d!138835 (= res!842722 (or (is-Nil!28401 (t!41916 l!706)) (is-Nil!28401 (t!41916 (t!41916 l!706)))))))

(assert (=> d!138835 (= (isStrictlySorted!791 (t!41916 l!706)) e!720819)))

(declare-fun b!1265674 () Bool)

(declare-fun e!720820 () Bool)

(assert (=> b!1265674 (= e!720819 e!720820)))

(declare-fun res!842723 () Bool)

(assert (=> b!1265674 (=> (not res!842723) (not e!720820))))

(assert (=> b!1265674 (= res!842723 (bvslt (_1!10639 (h!29609 (t!41916 l!706))) (_1!10639 (h!29609 (t!41916 (t!41916 l!706))))))))

(declare-fun b!1265675 () Bool)

(assert (=> b!1265675 (= e!720820 (isStrictlySorted!791 (t!41916 (t!41916 l!706))))))

(assert (= (and d!138835 (not res!842722)) b!1265674))

(assert (= (and b!1265674 res!842723) b!1265675))

(declare-fun m!1165217 () Bool)

(assert (=> b!1265675 m!1165217))

(assert (=> b!1265657 d!138835))

(declare-fun d!138841 () Bool)

(declare-fun res!842742 () Bool)

(declare-fun e!720839 () Bool)

(assert (=> d!138841 (=> res!842742 e!720839)))

(assert (=> d!138841 (= res!842742 (and (is-Cons!28400 l!706) (= (_1!10639 (h!29609 l!706)) key1!31)))))

(assert (=> d!138841 (= (containsKey!652 l!706 key1!31) e!720839)))

(declare-fun b!1265692 () Bool)

(declare-fun e!720840 () Bool)

(assert (=> b!1265692 (= e!720839 e!720840)))

(declare-fun res!842743 () Bool)

(assert (=> b!1265692 (=> (not res!842743) (not e!720840))))

(assert (=> b!1265692 (= res!842743 (and (or (not (is-Cons!28400 l!706)) (bvsle (_1!10639 (h!29609 l!706)) key1!31)) (is-Cons!28400 l!706) (bvslt (_1!10639 (h!29609 l!706)) key1!31)))))

(declare-fun b!1265693 () Bool)

(assert (=> b!1265693 (= e!720840 (containsKey!652 (t!41916 l!706) key1!31))))

(assert (= (and d!138841 (not res!842742)) b!1265692))

(assert (= (and b!1265692 res!842743) b!1265693))

(assert (=> b!1265693 m!1165215))

(assert (=> b!1265660 d!138841))

(declare-fun d!138849 () Bool)

(declare-fun res!842744 () Bool)

(declare-fun e!720841 () Bool)

(assert (=> d!138849 (=> res!842744 e!720841)))

(assert (=> d!138849 (= res!842744 (or (is-Nil!28401 l!706) (is-Nil!28401 (t!41916 l!706))))))

(assert (=> d!138849 (= (isStrictlySorted!791 l!706) e!720841)))

(declare-fun b!1265696 () Bool)

(declare-fun e!720842 () Bool)

(assert (=> b!1265696 (= e!720841 e!720842)))

(declare-fun res!842745 () Bool)

(assert (=> b!1265696 (=> (not res!842745) (not e!720842))))

(assert (=> b!1265696 (= res!842745 (bvslt (_1!10639 (h!29609 l!706)) (_1!10639 (h!29609 (t!41916 l!706)))))))

(declare-fun b!1265697 () Bool)

(assert (=> b!1265697 (= e!720842 (isStrictlySorted!791 (t!41916 l!706)))))

(assert (= (and d!138849 (not res!842744)) b!1265696))

(assert (= (and b!1265696 res!842745) b!1265697))

(assert (=> b!1265697 m!1165209))

(assert (=> start!106462 d!138849))

(declare-fun d!138851 () Bool)

(declare-fun res!842748 () Bool)

(declare-fun e!720845 () Bool)

(assert (=> d!138851 (=> res!842748 e!720845)))

(assert (=> d!138851 (= res!842748 (and (is-Cons!28400 (t!41916 l!706)) (= (_1!10639 (h!29609 (t!41916 l!706))) key1!31)))))

(assert (=> d!138851 (= (containsKey!652 (t!41916 l!706) key1!31) e!720845)))

(declare-fun b!1265700 () Bool)

(declare-fun e!720846 () Bool)

(assert (=> b!1265700 (= e!720845 e!720846)))

(declare-fun res!842749 () Bool)

(assert (=> b!1265700 (=> (not res!842749) (not e!720846))))

(assert (=> b!1265700 (= res!842749 (and (or (not (is-Cons!28400 (t!41916 l!706))) (bvsle (_1!10639 (h!29609 (t!41916 l!706))) key1!31)) (is-Cons!28400 (t!41916 l!706)) (bvslt (_1!10639 (h!29609 (t!41916 l!706))) key1!31)))))

(declare-fun b!1265701 () Bool)

(assert (=> b!1265701 (= e!720846 (containsKey!652 (t!41916 (t!41916 l!706)) key1!31))))

(assert (= (and d!138851 (not res!842748)) b!1265700))

(assert (= (and b!1265700 res!842749) b!1265701))

(declare-fun m!1165223 () Bool)

(assert (=> b!1265701 m!1165223))

(assert (=> b!1265661 d!138851))

(declare-fun b!1265718 () Bool)

(declare-fun e!720859 () Bool)

(declare-fun tp!96385 () Bool)

(assert (=> b!1265718 (= e!720859 (and tp_is_empty!32519 tp!96385))))

(assert (=> b!1265658 (= tp!96380 e!720859)))

(assert (= (and b!1265658 (is-Cons!28400 (t!41916 l!706))) b!1265718))

(push 1)

(assert (not b!1265718))

(assert (not b!1265697))

(assert (not b!1265701))

(assert tp_is_empty!32519)

(assert (not b!1265675))

(assert (not b!1265693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

