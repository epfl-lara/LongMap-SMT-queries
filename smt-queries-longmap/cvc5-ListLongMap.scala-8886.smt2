; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107912 () Bool)

(assert start!107912)

(declare-fun b!1275197 () Bool)

(declare-fun e!727884 () Bool)

(declare-fun e!727882 () Bool)

(assert (=> b!1275197 (= e!727884 e!727882)))

(declare-fun res!847651 () Bool)

(assert (=> b!1275197 (=> res!847651 e!727882)))

(declare-datatypes ((B!2186 0))(
  ( (B!2187 (val!16689 Int)) )
))
(declare-datatypes ((tuple2!21460 0))(
  ( (tuple2!21461 (_1!10741 (_ BitVec 64)) (_2!10741 B!2186)) )
))
(declare-datatypes ((List!28615 0))(
  ( (Nil!28612) (Cons!28611 (h!29820 tuple2!21460) (t!42151 List!28615)) )
))
(declare-fun lt!575325 () List!28615)

(declare-fun isStrictlySorted!867 (List!28615) Bool)

(assert (=> b!1275197 (= res!847651 (not (isStrictlySorted!867 lt!575325)))))

(declare-fun err!126 () List!28615)

(assert (=> b!1275197 (= lt!575325 err!126)))

(assert (=> b!1275197 true))

(declare-fun e!727883 () Bool)

(assert (=> b!1275197 e!727883))

(declare-fun res!847650 () Bool)

(assert (=> start!107912 (=> (not res!847650) (not e!727884))))

(declare-fun l!595 () List!28615)

(assert (=> start!107912 (= res!847650 (isStrictlySorted!867 l!595))))

(assert (=> start!107912 e!727884))

(declare-fun e!727885 () Bool)

(assert (=> start!107912 e!727885))

(assert (=> start!107912 true))

(declare-fun b!1275198 () Bool)

(declare-fun key!173 () (_ BitVec 64))

(declare-fun containsKey!709 (List!28615 (_ BitVec 64)) Bool)

(assert (=> b!1275198 (= e!727882 (containsKey!709 lt!575325 key!173))))

(declare-fun b!1275199 () Bool)

(declare-fun tp_is_empty!33229 () Bool)

(declare-fun tp!98107 () Bool)

(assert (=> b!1275199 (= e!727885 (and tp_is_empty!33229 tp!98107))))

(declare-fun b!1275200 () Bool)

(declare-fun tp!98108 () Bool)

(assert (=> b!1275200 (= e!727883 (and tp_is_empty!33229 tp!98108))))

(declare-fun b!1275201 () Bool)

(declare-fun res!847649 () Bool)

(assert (=> b!1275201 (=> (not res!847649) (not e!727884))))

(assert (=> b!1275201 (= res!847649 (and (or (not (is-Cons!28611 l!595)) (not (= (_1!10741 (h!29820 l!595)) key!173))) (or (not (is-Cons!28611 l!595)) (= (_1!10741 (h!29820 l!595)) key!173)) (not (is-Nil!28612 l!595))))))

(assert (= (and start!107912 res!847650) b!1275201))

(assert (= (and b!1275201 res!847649) b!1275197))

(assert (= (and b!1275197 (is-Cons!28611 err!126)) b!1275200))

(assert (= (and b!1275197 (not res!847651)) b!1275198))

(assert (= (and start!107912 (is-Cons!28611 l!595)) b!1275199))

(declare-fun m!1171549 () Bool)

(assert (=> b!1275197 m!1171549))

(declare-fun m!1171551 () Bool)

(assert (=> start!107912 m!1171551))

(declare-fun m!1171553 () Bool)

(assert (=> b!1275198 m!1171553))

(push 1)

(assert (not b!1275198))

(assert (not start!107912))

(assert (not b!1275197))

(assert tp_is_empty!33229)

(assert (not b!1275200))

(assert (not b!1275199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

