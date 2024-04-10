; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107804 () Bool)

(assert start!107804)

(declare-fun res!847330 () Bool)

(declare-fun e!727452 () Bool)

(assert (=> start!107804 (=> (not res!847330) (not e!727452))))

(declare-datatypes ((B!2150 0))(
  ( (B!2151 (val!16671 Int)) )
))
(declare-datatypes ((tuple2!21424 0))(
  ( (tuple2!21425 (_1!10723 (_ BitVec 64)) (_2!10723 B!2150)) )
))
(declare-datatypes ((List!28597 0))(
  ( (Nil!28594) (Cons!28593 (h!29802 tuple2!21424) (t!42130 List!28597)) )
))
(declare-fun l!595 () List!28597)

(declare-fun isStrictlySorted!849 (List!28597) Bool)

(assert (=> start!107804 (= res!847330 (isStrictlySorted!849 l!595))))

(assert (=> start!107804 e!727452))

(declare-fun e!727453 () Bool)

(assert (=> start!107804 e!727453))

(declare-fun b!1274654 () Bool)

(declare-fun ListPrimitiveSize!163 (List!28597) Int)

(assert (=> b!1274654 (= e!727452 (< (ListPrimitiveSize!163 l!595) 0))))

(declare-fun b!1274655 () Bool)

(declare-fun tp_is_empty!33193 () Bool)

(declare-fun tp!98003 () Bool)

(assert (=> b!1274655 (= e!727453 (and tp_is_empty!33193 tp!98003))))

(assert (= (and start!107804 res!847330) b!1274654))

(assert (= (and start!107804 (is-Cons!28593 l!595)) b!1274655))

(declare-fun m!1171309 () Bool)

(assert (=> start!107804 m!1171309))

(declare-fun m!1171311 () Bool)

(assert (=> b!1274654 m!1171311))

(push 1)

(assert (not start!107804))

(assert (not b!1274654))

(assert (not b!1274655))

(assert tp_is_empty!33193)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140191 () Bool)

(declare-fun res!847341 () Bool)

(declare-fun e!727472 () Bool)

(assert (=> d!140191 (=> res!847341 e!727472)))

(assert (=> d!140191 (= res!847341 (or (is-Nil!28594 l!595) (is-Nil!28594 (t!42130 l!595))))))

(assert (=> d!140191 (= (isStrictlySorted!849 l!595) e!727472)))

(declare-fun b!1274676 () Bool)

(declare-fun e!727473 () Bool)

(assert (=> b!1274676 (= e!727472 e!727473)))

(declare-fun res!847342 () Bool)

(assert (=> b!1274676 (=> (not res!847342) (not e!727473))))

(assert (=> b!1274676 (= res!847342 (bvslt (_1!10723 (h!29802 l!595)) (_1!10723 (h!29802 (t!42130 l!595)))))))

(declare-fun b!1274677 () Bool)

(assert (=> b!1274677 (= e!727473 (isStrictlySorted!849 (t!42130 l!595)))))

(assert (= (and d!140191 (not res!847341)) b!1274676))

(assert (= (and b!1274676 res!847342) b!1274677))

(declare-fun m!1171321 () Bool)

(assert (=> b!1274677 m!1171321))

(assert (=> start!107804 d!140191))

(declare-fun d!140197 () Bool)

(declare-fun lt!575286 () Int)

(assert (=> d!140197 (>= lt!575286 0)))

(declare-fun e!727483 () Int)

(assert (=> d!140197 (= lt!575286 e!727483)))

(declare-fun c!123876 () Bool)

(assert (=> d!140197 (= c!123876 (is-Nil!28594 l!595))))

(assert (=> d!140197 (= (ListPrimitiveSize!163 l!595) lt!575286)))

(declare-fun b!1274690 () Bool)

(assert (=> b!1274690 (= e!727483 0)))

(declare-fun b!1274691 () Bool)

(assert (=> b!1274691 (= e!727483 (+ 1 (ListPrimitiveSize!163 (t!42130 l!595))))))

(assert (= (and d!140197 c!123876) b!1274690))

(assert (= (and d!140197 (not c!123876)) b!1274691))

(declare-fun m!1171327 () Bool)

(assert (=> b!1274691 m!1171327))

(assert (=> b!1274654 d!140197))

(declare-fun b!1274696 () Bool)

(declare-fun e!727486 () Bool)

(declare-fun tp!98012 () Bool)

(assert (=> b!1274696 (= e!727486 (and tp_is_empty!33193 tp!98012))))

(assert (=> b!1274655 (= tp!98003 e!727486)))

(assert (= (and b!1274655 (is-Cons!28593 (t!42130 l!595))) b!1274696))

(push 1)

(assert (not b!1274677))

(assert (not b!1274691))

(assert (not b!1274696))

(assert tp_is_empty!33193)

(check-sat)

