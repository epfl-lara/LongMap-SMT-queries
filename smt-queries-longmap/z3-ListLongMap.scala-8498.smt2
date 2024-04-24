; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103808 () Bool)

(assert start!103808)

(declare-fun b!1242123 () Bool)

(declare-fun e!704174 () Bool)

(assert (=> b!1242123 (= e!704174 (not true))))

(declare-datatypes ((B!1814 0))(
  ( (B!1815 (val!15669 Int)) )
))
(declare-fun v1!20 () B!1814)

(declare-fun key1!25 () (_ BitVec 64))

(declare-datatypes ((tuple2!20226 0))(
  ( (tuple2!20227 (_1!10124 (_ BitVec 64)) (_2!10124 B!1814)) )
))
(declare-datatypes ((List!27359 0))(
  ( (Nil!27356) (Cons!27355 (h!28573 tuple2!20226) (t!40814 List!27359)) )
))
(declare-fun l!644 () List!27359)

(declare-fun key2!15 () (_ BitVec 64))

(declare-fun insertStrictlySorted!423 (List!27359 (_ BitVec 64) B!1814) List!27359)

(declare-fun removeStrictlySorted!114 (List!27359 (_ BitVec 64)) List!27359)

(assert (=> b!1242123 (= (insertStrictlySorted!423 (removeStrictlySorted!114 (t!40814 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!114 (insertStrictlySorted!423 (t!40814 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41210 0))(
  ( (Unit!41211) )
))
(declare-fun lt!562523 () Unit!41210)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!4 (List!27359 (_ BitVec 64) B!1814 (_ BitVec 64)) Unit!41210)

(assert (=> b!1242123 (= lt!562523 (lemmaInsertAndRemoveStrictlySortedCommutative!4 (t!40814 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1242124 () Bool)

(declare-fun res!828388 () Bool)

(assert (=> b!1242124 (=> (not res!828388) (not e!704174))))

(declare-fun isStrictlySorted!724 (List!27359) Bool)

(assert (=> b!1242124 (= res!828388 (isStrictlySorted!724 l!644))))

(declare-fun b!1242125 () Bool)

(declare-fun res!828389 () Bool)

(assert (=> b!1242125 (=> (not res!828389) (not e!704174))))

(assert (=> b!1242125 (= res!828389 (isStrictlySorted!724 (t!40814 l!644)))))

(declare-fun b!1242126 () Bool)

(declare-fun res!828387 () Bool)

(assert (=> b!1242126 (=> (not res!828387) (not e!704174))))

(get-info :version)

(assert (=> b!1242126 (= res!828387 ((_ is Cons!27355) l!644))))

(declare-fun res!828390 () Bool)

(assert (=> start!103808 (=> (not res!828390) (not e!704174))))

(assert (=> start!103808 (= res!828390 (not (= key1!25 key2!15)))))

(assert (=> start!103808 e!704174))

(assert (=> start!103808 true))

(declare-fun e!704173 () Bool)

(assert (=> start!103808 e!704173))

(declare-fun tp_is_empty!31213 () Bool)

(assert (=> start!103808 tp_is_empty!31213))

(declare-fun b!1242122 () Bool)

(declare-fun tp!92573 () Bool)

(assert (=> b!1242122 (= e!704173 (and tp_is_empty!31213 tp!92573))))

(assert (= (and start!103808 res!828390) b!1242124))

(assert (= (and b!1242124 res!828388) b!1242126))

(assert (= (and b!1242126 res!828387) b!1242125))

(assert (= (and b!1242125 res!828389) b!1242123))

(assert (= (and start!103808 ((_ is Cons!27355) l!644)) b!1242122))

(declare-fun m!1145693 () Bool)

(assert (=> b!1242123 m!1145693))

(declare-fun m!1145695 () Bool)

(assert (=> b!1242123 m!1145695))

(assert (=> b!1242123 m!1145693))

(declare-fun m!1145697 () Bool)

(assert (=> b!1242123 m!1145697))

(declare-fun m!1145699 () Bool)

(assert (=> b!1242123 m!1145699))

(assert (=> b!1242123 m!1145697))

(declare-fun m!1145701 () Bool)

(assert (=> b!1242123 m!1145701))

(declare-fun m!1145703 () Bool)

(assert (=> b!1242124 m!1145703))

(declare-fun m!1145705 () Bool)

(assert (=> b!1242125 m!1145705))

(check-sat (not b!1242122) (not b!1242124) tp_is_empty!31213 (not b!1242125) (not b!1242123))
(check-sat)
