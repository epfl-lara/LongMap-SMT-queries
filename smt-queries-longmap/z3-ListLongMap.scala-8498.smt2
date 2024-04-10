; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103574 () Bool)

(assert start!103574)

(declare-fun res!827866 () Bool)

(declare-fun e!703316 () Bool)

(assert (=> start!103574 (=> (not res!827866) (not e!703316))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103574 (= res!827866 (not (= key1!25 key2!15)))))

(assert (=> start!103574 e!703316))

(assert (=> start!103574 true))

(declare-fun e!703317 () Bool)

(assert (=> start!103574 e!703317))

(declare-fun tp_is_empty!31215 () Bool)

(assert (=> start!103574 tp_is_empty!31215))

(declare-fun b!1240813 () Bool)

(declare-fun res!827867 () Bool)

(assert (=> b!1240813 (=> (not res!827867) (not e!703316))))

(declare-datatypes ((B!1816 0))(
  ( (B!1817 (val!15670 Int)) )
))
(declare-datatypes ((tuple2!20212 0))(
  ( (tuple2!20213 (_1!10117 (_ BitVec 64)) (_2!10117 B!1816)) )
))
(declare-datatypes ((List!27335 0))(
  ( (Nil!27332) (Cons!27331 (h!28540 tuple2!20212) (t!40798 List!27335)) )
))
(declare-fun l!644 () List!27335)

(declare-fun isStrictlySorted!737 (List!27335) Bool)

(assert (=> b!1240813 (= res!827867 (isStrictlySorted!737 (t!40798 l!644)))))

(declare-fun b!1240814 () Bool)

(declare-fun res!827868 () Bool)

(assert (=> b!1240814 (=> (not res!827868) (not e!703316))))

(assert (=> b!1240814 (= res!827868 (isStrictlySorted!737 l!644))))

(declare-fun b!1240815 () Bool)

(assert (=> b!1240815 (= e!703316 (not true))))

(declare-fun v1!20 () B!1816)

(declare-fun insertStrictlySorted!423 (List!27335 (_ BitVec 64) B!1816) List!27335)

(declare-fun removeStrictlySorted!116 (List!27335 (_ BitVec 64)) List!27335)

(assert (=> b!1240815 (= (insertStrictlySorted!423 (removeStrictlySorted!116 (t!40798 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!116 (insertStrictlySorted!423 (t!40798 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41239 0))(
  ( (Unit!41240) )
))
(declare-fun lt!562040 () Unit!41239)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!5 (List!27335 (_ BitVec 64) B!1816 (_ BitVec 64)) Unit!41239)

(assert (=> b!1240815 (= lt!562040 (lemmaInsertAndRemoveStrictlySortedCommutative!5 (t!40798 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1240816 () Bool)

(declare-fun res!827869 () Bool)

(assert (=> b!1240816 (=> (not res!827869) (not e!703316))))

(get-info :version)

(assert (=> b!1240816 (= res!827869 ((_ is Cons!27331) l!644))))

(declare-fun b!1240817 () Bool)

(declare-fun tp!92576 () Bool)

(assert (=> b!1240817 (= e!703317 (and tp_is_empty!31215 tp!92576))))

(assert (= (and start!103574 res!827866) b!1240814))

(assert (= (and b!1240814 res!827868) b!1240816))

(assert (= (and b!1240816 res!827869) b!1240813))

(assert (= (and b!1240813 res!827867) b!1240815))

(assert (= (and start!103574 ((_ is Cons!27331) l!644)) b!1240817))

(declare-fun m!1144065 () Bool)

(assert (=> b!1240813 m!1144065))

(declare-fun m!1144067 () Bool)

(assert (=> b!1240814 m!1144067))

(declare-fun m!1144069 () Bool)

(assert (=> b!1240815 m!1144069))

(declare-fun m!1144071 () Bool)

(assert (=> b!1240815 m!1144071))

(assert (=> b!1240815 m!1144069))

(declare-fun m!1144073 () Bool)

(assert (=> b!1240815 m!1144073))

(declare-fun m!1144075 () Bool)

(assert (=> b!1240815 m!1144075))

(assert (=> b!1240815 m!1144073))

(declare-fun m!1144077 () Bool)

(assert (=> b!1240815 m!1144077))

(check-sat (not b!1240817) (not b!1240815) (not b!1240814) (not b!1240813) tp_is_empty!31215)
(check-sat)
