; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103600 () Bool)

(assert start!103600)

(declare-fun b!1241040 () Bool)

(declare-fun res!827952 () Bool)

(declare-fun e!703440 () Bool)

(assert (=> b!1241040 (=> (not res!827952) (not e!703440))))

(declare-datatypes ((B!1826 0))(
  ( (B!1827 (val!15675 Int)) )
))
(declare-datatypes ((tuple2!20306 0))(
  ( (tuple2!20307 (_1!10164 (_ BitVec 64)) (_2!10164 B!1826)) )
))
(declare-datatypes ((List!27402 0))(
  ( (Nil!27399) (Cons!27398 (h!28607 tuple2!20306) (t!40856 List!27402)) )
))
(declare-fun l!644 () List!27402)

(declare-fun isStrictlySorted!738 (List!27402) Bool)

(assert (=> b!1241040 (= res!827952 (isStrictlySorted!738 l!644))))

(declare-fun res!827950 () Bool)

(assert (=> start!103600 (=> (not res!827950) (not e!703440))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103600 (= res!827950 (not (= key1!25 key2!15)))))

(assert (=> start!103600 e!703440))

(assert (=> start!103600 true))

(declare-fun e!703439 () Bool)

(assert (=> start!103600 e!703439))

(declare-fun tp_is_empty!31225 () Bool)

(assert (=> start!103600 tp_is_empty!31225))

(declare-fun b!1241041 () Bool)

(assert (=> b!1241041 (= e!703440 (not true))))

(declare-fun v1!20 () B!1826)

(declare-fun insertStrictlySorted!429 (List!27402 (_ BitVec 64) B!1826) List!27402)

(declare-fun removeStrictlySorted!121 (List!27402 (_ BitVec 64)) List!27402)

(assert (=> b!1241041 (= (insertStrictlySorted!429 (removeStrictlySorted!121 (t!40856 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!121 (insertStrictlySorted!429 (t!40856 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41094 0))(
  ( (Unit!41095) )
))
(declare-fun lt!561912 () Unit!41094)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!10 (List!27402 (_ BitVec 64) B!1826 (_ BitVec 64)) Unit!41094)

(assert (=> b!1241041 (= lt!561912 (lemmaInsertAndRemoveStrictlySortedCommutative!10 (t!40856 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1241042 () Bool)

(declare-fun res!827951 () Bool)

(assert (=> b!1241042 (=> (not res!827951) (not e!703440))))

(get-info :version)

(assert (=> b!1241042 (= res!827951 ((_ is Cons!27398) l!644))))

(declare-fun b!1241043 () Bool)

(declare-fun res!827949 () Bool)

(assert (=> b!1241043 (=> (not res!827949) (not e!703440))))

(assert (=> b!1241043 (= res!827949 (isStrictlySorted!738 (t!40856 l!644)))))

(declare-fun b!1241044 () Bool)

(declare-fun tp!92600 () Bool)

(assert (=> b!1241044 (= e!703439 (and tp_is_empty!31225 tp!92600))))

(assert (= (and start!103600 res!827950) b!1241040))

(assert (= (and b!1241040 res!827952) b!1241042))

(assert (= (and b!1241042 res!827951) b!1241043))

(assert (= (and b!1241043 res!827949) b!1241041))

(assert (= (and start!103600 ((_ is Cons!27398) l!644)) b!1241044))

(declare-fun m!1143771 () Bool)

(assert (=> b!1241040 m!1143771))

(declare-fun m!1143773 () Bool)

(assert (=> b!1241041 m!1143773))

(declare-fun m!1143775 () Bool)

(assert (=> b!1241041 m!1143775))

(assert (=> b!1241041 m!1143773))

(declare-fun m!1143777 () Bool)

(assert (=> b!1241041 m!1143777))

(declare-fun m!1143779 () Bool)

(assert (=> b!1241041 m!1143779))

(assert (=> b!1241041 m!1143777))

(declare-fun m!1143781 () Bool)

(assert (=> b!1241041 m!1143781))

(declare-fun m!1143783 () Bool)

(assert (=> b!1241043 m!1143783))

(check-sat tp_is_empty!31225 (not b!1241041) (not b!1241044) (not b!1241043) (not b!1241040))
(check-sat)
