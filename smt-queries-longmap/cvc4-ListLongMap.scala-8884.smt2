; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107892 () Bool)

(assert start!107892)

(declare-fun res!847596 () Bool)

(declare-fun e!727809 () Bool)

(assert (=> start!107892 (=> (not res!847596) (not e!727809))))

(declare-datatypes ((B!2178 0))(
  ( (B!2179 (val!16685 Int)) )
))
(declare-datatypes ((tuple2!21452 0))(
  ( (tuple2!21453 (_1!10737 (_ BitVec 64)) (_2!10737 B!2178)) )
))
(declare-datatypes ((List!28611 0))(
  ( (Nil!28608) (Cons!28607 (h!29816 tuple2!21452) (t!42147 List!28611)) )
))
(declare-fun l!595 () List!28611)

(declare-fun isStrictlySorted!863 (List!28611) Bool)

(assert (=> start!107892 (= res!847596 (isStrictlySorted!863 l!595))))

(assert (=> start!107892 e!727809))

(declare-fun e!727810 () Bool)

(assert (=> start!107892 e!727810))

(assert (=> start!107892 true))

(declare-fun b!1275114 () Bool)

(declare-fun res!847597 () Bool)

(assert (=> b!1275114 (=> (not res!847597) (not e!727809))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1275114 (= res!847597 (and (or (not (is-Cons!28607 l!595)) (not (= (_1!10737 (h!29816 l!595)) key!173))) (or (not (is-Cons!28607 l!595)) (= (_1!10737 (h!29816 l!595)) key!173)) (is-Nil!28608 l!595)))))

(declare-fun b!1275117 () Bool)

(declare-fun tp_is_empty!33221 () Bool)

(declare-fun tp!98084 () Bool)

(assert (=> b!1275117 (= e!727810 (and tp_is_empty!33221 tp!98084))))

(declare-fun b!1275115 () Bool)

(declare-fun e!727808 () Bool)

(assert (=> b!1275115 (= e!727809 e!727808)))

(declare-fun res!847595 () Bool)

(assert (=> b!1275115 (=> res!847595 e!727808)))

(assert (=> b!1275115 (= res!847595 false)))

(declare-fun b!1275116 () Bool)

(declare-fun containsKey!708 (List!28611 (_ BitVec 64)) Bool)

(assert (=> b!1275116 (= e!727808 (containsKey!708 Nil!28608 key!173))))

(assert (= (and start!107892 res!847596) b!1275114))

(assert (= (and b!1275114 res!847597) b!1275115))

(assert (= (and b!1275115 (not res!847595)) b!1275116))

(assert (= (and start!107892 (is-Cons!28607 l!595)) b!1275117))

(declare-fun m!1171527 () Bool)

(assert (=> start!107892 m!1171527))

(declare-fun m!1171529 () Bool)

(assert (=> b!1275116 m!1171529))

(push 1)

(assert (not start!107892))

(assert (not b!1275116))

(assert (not b!1275117))

(assert tp_is_empty!33221)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140319 () Bool)

(declare-fun res!847606 () Bool)

(declare-fun e!727819 () Bool)

(assert (=> d!140319 (=> res!847606 e!727819)))

(assert (=> d!140319 (= res!847606 (or (is-Nil!28608 l!595) (is-Nil!28608 (t!42147 l!595))))))

(assert (=> d!140319 (= (isStrictlySorted!863 l!595) e!727819)))

(declare-fun b!1275126 () Bool)

(declare-fun e!727820 () Bool)

(assert (=> b!1275126 (= e!727819 e!727820)))

(declare-fun res!847607 () Bool)

(assert (=> b!1275126 (=> (not res!847607) (not e!727820))))

(assert (=> b!1275126 (= res!847607 (bvslt (_1!10737 (h!29816 l!595)) (_1!10737 (h!29816 (t!42147 l!595)))))))

(declare-fun b!1275127 () Bool)

(assert (=> b!1275127 (= e!727820 (isStrictlySorted!863 (t!42147 l!595)))))

(assert (= (and d!140319 (not res!847606)) b!1275126))

(assert (= (and b!1275126 res!847607) b!1275127))

(declare-fun m!1171531 () Bool)

(assert (=> b!1275127 m!1171531))

(assert (=> start!107892 d!140319))

(declare-fun d!140323 () Bool)

(declare-fun res!847618 () Bool)

(declare-fun e!727831 () Bool)

(assert (=> d!140323 (=> res!847618 e!727831)))

(assert (=> d!140323 (= res!847618 (and (is-Cons!28607 Nil!28608) (= (_1!10737 (h!29816 Nil!28608)) key!173)))))

(assert (=> d!140323 (= (containsKey!708 Nil!28608 key!173) e!727831)))

(declare-fun b!1275138 () Bool)

(declare-fun e!727832 () Bool)

(assert (=> b!1275138 (= e!727831 e!727832)))

(declare-fun res!847619 () Bool)

(assert (=> b!1275138 (=> (not res!847619) (not e!727832))))

(assert (=> b!1275138 (= res!847619 (and (or (not (is-Cons!28607 Nil!28608)) (bvsle (_1!10737 (h!29816 Nil!28608)) key!173)) (is-Cons!28607 Nil!28608) (bvslt (_1!10737 (h!29816 Nil!28608)) key!173)))))

(declare-fun b!1275139 () Bool)

(assert (=> b!1275139 (= e!727832 (containsKey!708 (t!42147 Nil!28608) key!173))))

(assert (= (and d!140323 (not res!847618)) b!1275138))

(assert (= (and b!1275138 res!847619) b!1275139))

(declare-fun m!1171535 () Bool)

(assert (=> b!1275139 m!1171535))

(assert (=> b!1275116 d!140323))

(declare-fun b!1275150 () Bool)

(declare-fun e!727839 () Bool)

(declare-fun tp!98089 () Bool)

(assert (=> b!1275150 (= e!727839 (and tp_is_empty!33221 tp!98089))))

(assert (=> b!1275117 (= tp!98084 e!727839)))

(assert (= (and b!1275117 (is-Cons!28607 (t!42147 l!595))) b!1275150))

(push 1)

