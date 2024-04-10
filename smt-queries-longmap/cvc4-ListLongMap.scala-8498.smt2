; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103576 () Bool)

(assert start!103576)

(declare-fun b!1240828 () Bool)

(declare-fun res!827881 () Bool)

(declare-fun e!703323 () Bool)

(assert (=> b!1240828 (=> (not res!827881) (not e!703323))))

(declare-datatypes ((B!1818 0))(
  ( (B!1819 (val!15671 Int)) )
))
(declare-datatypes ((tuple2!20214 0))(
  ( (tuple2!20215 (_1!10118 (_ BitVec 64)) (_2!10118 B!1818)) )
))
(declare-datatypes ((List!27336 0))(
  ( (Nil!27333) (Cons!27332 (h!28541 tuple2!20214) (t!40799 List!27336)) )
))
(declare-fun l!644 () List!27336)

(declare-fun isStrictlySorted!738 (List!27336) Bool)

(assert (=> b!1240828 (= res!827881 (isStrictlySorted!738 (t!40799 l!644)))))

(declare-fun b!1240829 () Bool)

(declare-fun res!827879 () Bool)

(assert (=> b!1240829 (=> (not res!827879) (not e!703323))))

(assert (=> b!1240829 (= res!827879 (is-Cons!27332 l!644))))

(declare-fun res!827880 () Bool)

(assert (=> start!103576 (=> (not res!827880) (not e!703323))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103576 (= res!827880 (not (= key1!25 key2!15)))))

(assert (=> start!103576 e!703323))

(assert (=> start!103576 true))

(declare-fun e!703322 () Bool)

(assert (=> start!103576 e!703322))

(declare-fun tp_is_empty!31217 () Bool)

(assert (=> start!103576 tp_is_empty!31217))

(declare-fun b!1240830 () Bool)

(assert (=> b!1240830 (= e!703323 (not true))))

(declare-fun v1!20 () B!1818)

(declare-fun insertStrictlySorted!424 (List!27336 (_ BitVec 64) B!1818) List!27336)

(declare-fun removeStrictlySorted!117 (List!27336 (_ BitVec 64)) List!27336)

(assert (=> b!1240830 (= (insertStrictlySorted!424 (removeStrictlySorted!117 (t!40799 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!117 (insertStrictlySorted!424 (t!40799 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41241 0))(
  ( (Unit!41242) )
))
(declare-fun lt!562043 () Unit!41241)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!6 (List!27336 (_ BitVec 64) B!1818 (_ BitVec 64)) Unit!41241)

(assert (=> b!1240830 (= lt!562043 (lemmaInsertAndRemoveStrictlySortedCommutative!6 (t!40799 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1240831 () Bool)

(declare-fun tp!92579 () Bool)

(assert (=> b!1240831 (= e!703322 (and tp_is_empty!31217 tp!92579))))

(declare-fun b!1240832 () Bool)

(declare-fun res!827878 () Bool)

(assert (=> b!1240832 (=> (not res!827878) (not e!703323))))

(assert (=> b!1240832 (= res!827878 (isStrictlySorted!738 l!644))))

(assert (= (and start!103576 res!827880) b!1240832))

(assert (= (and b!1240832 res!827878) b!1240829))

(assert (= (and b!1240829 res!827879) b!1240828))

(assert (= (and b!1240828 res!827881) b!1240830))

(assert (= (and start!103576 (is-Cons!27332 l!644)) b!1240831))

(declare-fun m!1144079 () Bool)

(assert (=> b!1240828 m!1144079))

(declare-fun m!1144081 () Bool)

(assert (=> b!1240830 m!1144081))

(declare-fun m!1144083 () Bool)

(assert (=> b!1240830 m!1144083))

(assert (=> b!1240830 m!1144081))

(declare-fun m!1144085 () Bool)

(assert (=> b!1240830 m!1144085))

(declare-fun m!1144087 () Bool)

(assert (=> b!1240830 m!1144087))

(assert (=> b!1240830 m!1144085))

(declare-fun m!1144089 () Bool)

(assert (=> b!1240830 m!1144089))

(declare-fun m!1144091 () Bool)

(assert (=> b!1240832 m!1144091))

(push 1)

(assert tp_is_empty!31217)

(assert (not b!1240832))

(assert (not b!1240830))

(assert (not b!1240831))

(assert (not b!1240828))

(check-sat)

