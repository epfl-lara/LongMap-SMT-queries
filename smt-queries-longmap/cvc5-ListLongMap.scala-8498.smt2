; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103572 () Bool)

(assert start!103572)

(declare-fun res!827856 () Bool)

(declare-fun e!703310 () Bool)

(assert (=> start!103572 (=> (not res!827856) (not e!703310))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103572 (= res!827856 (not (= key1!25 key2!15)))))

(assert (=> start!103572 e!703310))

(assert (=> start!103572 true))

(declare-fun e!703311 () Bool)

(assert (=> start!103572 e!703311))

(declare-fun tp_is_empty!31213 () Bool)

(assert (=> start!103572 tp_is_empty!31213))

(declare-fun b!1240798 () Bool)

(declare-fun res!827855 () Bool)

(assert (=> b!1240798 (=> (not res!827855) (not e!703310))))

(declare-datatypes ((B!1814 0))(
  ( (B!1815 (val!15669 Int)) )
))
(declare-datatypes ((tuple2!20210 0))(
  ( (tuple2!20211 (_1!10116 (_ BitVec 64)) (_2!10116 B!1814)) )
))
(declare-datatypes ((List!27334 0))(
  ( (Nil!27331) (Cons!27330 (h!28539 tuple2!20210) (t!40797 List!27334)) )
))
(declare-fun l!644 () List!27334)

(assert (=> b!1240798 (= res!827855 (is-Cons!27330 l!644))))

(declare-fun b!1240799 () Bool)

(declare-fun tp!92573 () Bool)

(assert (=> b!1240799 (= e!703311 (and tp_is_empty!31213 tp!92573))))

(declare-fun b!1240800 () Bool)

(assert (=> b!1240800 (= e!703310 (not true))))

(declare-fun v1!20 () B!1814)

(declare-fun insertStrictlySorted!422 (List!27334 (_ BitVec 64) B!1814) List!27334)

(declare-fun removeStrictlySorted!115 (List!27334 (_ BitVec 64)) List!27334)

(assert (=> b!1240800 (= (insertStrictlySorted!422 (removeStrictlySorted!115 (t!40797 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!115 (insertStrictlySorted!422 (t!40797 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41237 0))(
  ( (Unit!41238) )
))
(declare-fun lt!562037 () Unit!41237)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!4 (List!27334 (_ BitVec 64) B!1814 (_ BitVec 64)) Unit!41237)

(assert (=> b!1240800 (= lt!562037 (lemmaInsertAndRemoveStrictlySortedCommutative!4 (t!40797 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1240801 () Bool)

(declare-fun res!827854 () Bool)

(assert (=> b!1240801 (=> (not res!827854) (not e!703310))))

(declare-fun isStrictlySorted!736 (List!27334) Bool)

(assert (=> b!1240801 (= res!827854 (isStrictlySorted!736 (t!40797 l!644)))))

(declare-fun b!1240802 () Bool)

(declare-fun res!827857 () Bool)

(assert (=> b!1240802 (=> (not res!827857) (not e!703310))))

(assert (=> b!1240802 (= res!827857 (isStrictlySorted!736 l!644))))

(assert (= (and start!103572 res!827856) b!1240802))

(assert (= (and b!1240802 res!827857) b!1240798))

(assert (= (and b!1240798 res!827855) b!1240801))

(assert (= (and b!1240801 res!827854) b!1240800))

(assert (= (and start!103572 (is-Cons!27330 l!644)) b!1240799))

(declare-fun m!1144051 () Bool)

(assert (=> b!1240800 m!1144051))

(declare-fun m!1144053 () Bool)

(assert (=> b!1240800 m!1144053))

(assert (=> b!1240800 m!1144051))

(declare-fun m!1144055 () Bool)

(assert (=> b!1240800 m!1144055))

(declare-fun m!1144057 () Bool)

(assert (=> b!1240800 m!1144057))

(assert (=> b!1240800 m!1144055))

(declare-fun m!1144059 () Bool)

(assert (=> b!1240800 m!1144059))

(declare-fun m!1144061 () Bool)

(assert (=> b!1240801 m!1144061))

(declare-fun m!1144063 () Bool)

(assert (=> b!1240802 m!1144063))

(push 1)

(assert (not b!1240801))

(assert (not b!1240799))

(assert (not b!1240802))

(assert (not b!1240800))

(assert tp_is_empty!31213)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

