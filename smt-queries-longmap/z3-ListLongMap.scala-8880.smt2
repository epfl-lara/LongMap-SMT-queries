; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107806 () Bool)

(assert start!107806)

(declare-fun res!847333 () Bool)

(declare-fun e!727458 () Bool)

(assert (=> start!107806 (=> (not res!847333) (not e!727458))))

(declare-datatypes ((B!2152 0))(
  ( (B!2153 (val!16672 Int)) )
))
(declare-datatypes ((tuple2!21426 0))(
  ( (tuple2!21427 (_1!10724 (_ BitVec 64)) (_2!10724 B!2152)) )
))
(declare-datatypes ((List!28598 0))(
  ( (Nil!28595) (Cons!28594 (h!29803 tuple2!21426) (t!42131 List!28598)) )
))
(declare-fun l!595 () List!28598)

(declare-fun isStrictlySorted!850 (List!28598) Bool)

(assert (=> start!107806 (= res!847333 (isStrictlySorted!850 l!595))))

(assert (=> start!107806 e!727458))

(declare-fun e!727459 () Bool)

(assert (=> start!107806 e!727459))

(declare-fun b!1274660 () Bool)

(declare-fun ListPrimitiveSize!164 (List!28598) Int)

(assert (=> b!1274660 (= e!727458 (< (ListPrimitiveSize!164 l!595) 0))))

(declare-fun b!1274661 () Bool)

(declare-fun tp_is_empty!33195 () Bool)

(declare-fun tp!98006 () Bool)

(assert (=> b!1274661 (= e!727459 (and tp_is_empty!33195 tp!98006))))

(assert (= (and start!107806 res!847333) b!1274660))

(get-info :version)

(assert (= (and start!107806 ((_ is Cons!28594) l!595)) b!1274661))

(declare-fun m!1171313 () Bool)

(assert (=> start!107806 m!1171313))

(declare-fun m!1171315 () Bool)

(assert (=> b!1274660 m!1171315))

(check-sat (not b!1274660) (not start!107806) (not b!1274661) tp_is_empty!33195)
(check-sat)
(get-model)

(declare-fun d!140193 () Bool)

(declare-fun lt!575283 () Int)

(assert (=> d!140193 (>= lt!575283 0)))

(declare-fun e!727478 () Int)

(assert (=> d!140193 (= lt!575283 e!727478)))

(declare-fun c!123873 () Bool)

(assert (=> d!140193 (= c!123873 ((_ is Nil!28595) l!595))))

(assert (=> d!140193 (= (ListPrimitiveSize!164 l!595) lt!575283)))

(declare-fun b!1274680 () Bool)

(assert (=> b!1274680 (= e!727478 0)))

(declare-fun b!1274681 () Bool)

(assert (=> b!1274681 (= e!727478 (+ 1 (ListPrimitiveSize!164 (t!42131 l!595))))))

(assert (= (and d!140193 c!123873) b!1274680))

(assert (= (and d!140193 (not c!123873)) b!1274681))

(declare-fun m!1171323 () Bool)

(assert (=> b!1274681 m!1171323))

(assert (=> b!1274660 d!140193))

(declare-fun d!140199 () Bool)

(declare-fun res!847353 () Bool)

(declare-fun e!727493 () Bool)

(assert (=> d!140199 (=> res!847353 e!727493)))

(assert (=> d!140199 (= res!847353 (or ((_ is Nil!28595) l!595) ((_ is Nil!28595) (t!42131 l!595))))))

(assert (=> d!140199 (= (isStrictlySorted!850 l!595) e!727493)))

(declare-fun b!1274705 () Bool)

(declare-fun e!727494 () Bool)

(assert (=> b!1274705 (= e!727493 e!727494)))

(declare-fun res!847354 () Bool)

(assert (=> b!1274705 (=> (not res!847354) (not e!727494))))

(assert (=> b!1274705 (= res!847354 (bvslt (_1!10724 (h!29803 l!595)) (_1!10724 (h!29803 (t!42131 l!595)))))))

(declare-fun b!1274706 () Bool)

(assert (=> b!1274706 (= e!727494 (isStrictlySorted!850 (t!42131 l!595)))))

(assert (= (and d!140199 (not res!847353)) b!1274705))

(assert (= (and b!1274705 res!847354) b!1274706))

(declare-fun m!1171329 () Bool)

(assert (=> b!1274706 m!1171329))

(assert (=> start!107806 d!140199))

(declare-fun b!1274713 () Bool)

(declare-fun e!727498 () Bool)

(declare-fun tp!98015 () Bool)

(assert (=> b!1274713 (= e!727498 (and tp_is_empty!33195 tp!98015))))

(assert (=> b!1274661 (= tp!98006 e!727498)))

(assert (= (and b!1274661 ((_ is Cons!28594) (t!42131 l!595))) b!1274713))

(check-sat (not b!1274706) (not b!1274681) (not b!1274713) tp_is_empty!33195)
(check-sat)
