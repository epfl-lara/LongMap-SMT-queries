; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107998 () Bool)

(assert start!107998)

(declare-fun res!847793 () Bool)

(declare-fun e!728212 () Bool)

(assert (=> start!107998 (=> (not res!847793) (not e!728212))))

(declare-datatypes ((B!2126 0))(
  ( (B!2127 (val!16659 Int)) )
))
(declare-datatypes ((tuple2!21408 0))(
  ( (tuple2!21409 (_1!10715 (_ BitVec 64)) (_2!10715 B!2126)) )
))
(declare-datatypes ((List!28613 0))(
  ( (Nil!28610) (Cons!28609 (h!29827 tuple2!21408) (t!42138 List!28613)) )
))
(declare-fun l!595 () List!28613)

(declare-fun isStrictlySorted!832 (List!28613) Bool)

(assert (=> start!107998 (= res!847793 (isStrictlySorted!832 l!595))))

(assert (=> start!107998 e!728212))

(declare-fun e!728213 () Bool)

(assert (=> start!107998 e!728213))

(assert (=> start!107998 true))

(declare-fun b!1275850 () Bool)

(declare-fun res!847792 () Bool)

(assert (=> b!1275850 (=> (not res!847792) (not e!728212))))

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1275850 (= res!847792 (and (not (= (_1!10715 (h!29827 l!595)) key!173)) ((_ is Cons!28609) l!595)))))

(declare-fun b!1275851 () Bool)

(assert (=> b!1275851 (= e!728212 (not (isStrictlySorted!832 (t!42138 l!595))))))

(declare-fun b!1275852 () Bool)

(declare-fun tp_is_empty!33169 () Bool)

(declare-fun tp!97958 () Bool)

(assert (=> b!1275852 (= e!728213 (and tp_is_empty!33169 tp!97958))))

(assert (= (and start!107998 res!847793) b!1275850))

(assert (= (and b!1275850 res!847792) b!1275851))

(assert (= (and start!107998 ((_ is Cons!28609) l!595)) b!1275852))

(declare-fun m!1172879 () Bool)

(assert (=> start!107998 m!1172879))

(declare-fun m!1172881 () Bool)

(assert (=> b!1275851 m!1172881))

(check-sat (not start!107998) (not b!1275851) (not b!1275852) tp_is_empty!33169)
(check-sat)
(get-model)

(declare-fun d!140619 () Bool)

(declare-fun res!847810 () Bool)

(declare-fun e!728230 () Bool)

(assert (=> d!140619 (=> res!847810 e!728230)))

(assert (=> d!140619 (= res!847810 (or ((_ is Nil!28610) l!595) ((_ is Nil!28610) (t!42138 l!595))))))

(assert (=> d!140619 (= (isStrictlySorted!832 l!595) e!728230)))

(declare-fun b!1275875 () Bool)

(declare-fun e!728231 () Bool)

(assert (=> b!1275875 (= e!728230 e!728231)))

(declare-fun res!847811 () Bool)

(assert (=> b!1275875 (=> (not res!847811) (not e!728231))))

(assert (=> b!1275875 (= res!847811 (bvslt (_1!10715 (h!29827 l!595)) (_1!10715 (h!29827 (t!42138 l!595)))))))

(declare-fun b!1275876 () Bool)

(assert (=> b!1275876 (= e!728231 (isStrictlySorted!832 (t!42138 l!595)))))

(assert (= (and d!140619 (not res!847810)) b!1275875))

(assert (= (and b!1275875 res!847811) b!1275876))

(assert (=> b!1275876 m!1172881))

(assert (=> start!107998 d!140619))

(declare-fun d!140625 () Bool)

(declare-fun res!847814 () Bool)

(declare-fun e!728234 () Bool)

(assert (=> d!140625 (=> res!847814 e!728234)))

(assert (=> d!140625 (= res!847814 (or ((_ is Nil!28610) (t!42138 l!595)) ((_ is Nil!28610) (t!42138 (t!42138 l!595)))))))

(assert (=> d!140625 (= (isStrictlySorted!832 (t!42138 l!595)) e!728234)))

(declare-fun b!1275879 () Bool)

(declare-fun e!728235 () Bool)

(assert (=> b!1275879 (= e!728234 e!728235)))

(declare-fun res!847815 () Bool)

(assert (=> b!1275879 (=> (not res!847815) (not e!728235))))

(assert (=> b!1275879 (= res!847815 (bvslt (_1!10715 (h!29827 (t!42138 l!595))) (_1!10715 (h!29827 (t!42138 (t!42138 l!595))))))))

(declare-fun b!1275880 () Bool)

(assert (=> b!1275880 (= e!728235 (isStrictlySorted!832 (t!42138 (t!42138 l!595))))))

(assert (= (and d!140625 (not res!847814)) b!1275879))

(assert (= (and b!1275879 res!847815) b!1275880))

(declare-fun m!1172891 () Bool)

(assert (=> b!1275880 m!1172891))

(assert (=> b!1275851 d!140625))

(declare-fun b!1275891 () Bool)

(declare-fun e!728244 () Bool)

(declare-fun tp!97967 () Bool)

(assert (=> b!1275891 (= e!728244 (and tp_is_empty!33169 tp!97967))))

(assert (=> b!1275852 (= tp!97958 e!728244)))

(assert (= (and b!1275852 ((_ is Cons!28609) (t!42138 l!595))) b!1275891))

(check-sat (not b!1275880) (not b!1275876) (not b!1275891) tp_is_empty!33169)
(check-sat)
