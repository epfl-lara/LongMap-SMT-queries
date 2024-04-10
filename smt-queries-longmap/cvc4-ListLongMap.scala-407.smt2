; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7616 () Bool)

(assert start!7616)

(declare-fun res!28220 () Bool)

(declare-fun e!31194 () Bool)

(assert (=> start!7616 (=> (not res!28220) (not e!31194))))

(declare-datatypes ((B!960 0))(
  ( (B!961 (val!1100 Int)) )
))
(declare-datatypes ((tuple2!1782 0))(
  ( (tuple2!1783 (_1!902 (_ BitVec 64)) (_2!902 B!960)) )
))
(declare-datatypes ((List!1297 0))(
  ( (Nil!1294) (Cons!1293 (h!1873 tuple2!1782) (t!4325 List!1297)) )
))
(declare-fun l!1333 () List!1297)

(declare-fun isStrictlySorted!264 (List!1297) Bool)

(assert (=> start!7616 (= res!28220 (isStrictlySorted!264 l!1333))))

(assert (=> start!7616 e!31194))

(declare-fun e!31195 () Bool)

(assert (=> start!7616 e!31195))

(assert (=> start!7616 true))

(declare-fun tp_is_empty!2111 () Bool)

(assert (=> start!7616 tp_is_empty!2111))

(declare-fun b!48595 () Bool)

(assert (=> b!48595 (= e!31194 false)))

(declare-datatypes ((Unit!1367 0))(
  ( (Unit!1368) )
))
(declare-fun lt!20672 () Unit!1367)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun newValue!147 () B!960)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!6 (List!1297 (_ BitVec 64) B!960) Unit!1367)

(assert (=> b!48595 (= lt!20672 (lemmaInsertStrictlySortedNotContainedContent!6 (t!4325 l!1333) newKey!147 newValue!147))))

(declare-fun b!48596 () Bool)

(declare-fun tp!6425 () Bool)

(assert (=> b!48596 (= e!31195 (and tp_is_empty!2111 tp!6425))))

(declare-fun b!48593 () Bool)

(declare-fun res!28219 () Bool)

(assert (=> b!48593 (=> (not res!28219) (not e!31194))))

(declare-fun containsKey!113 (List!1297 (_ BitVec 64)) Bool)

(assert (=> b!48593 (= res!28219 (not (containsKey!113 l!1333 newKey!147)))))

(declare-fun b!48594 () Bool)

(declare-fun res!28218 () Bool)

(assert (=> b!48594 (=> (not res!28218) (not e!31194))))

(assert (=> b!48594 (= res!28218 (not (is-Nil!1294 l!1333)))))

(assert (= (and start!7616 res!28220) b!48593))

(assert (= (and b!48593 res!28219) b!48594))

(assert (= (and b!48594 res!28218) b!48595))

(assert (= (and start!7616 (is-Cons!1293 l!1333)) b!48596))

(declare-fun m!42327 () Bool)

(assert (=> start!7616 m!42327))

(declare-fun m!42329 () Bool)

(assert (=> b!48595 m!42329))

(declare-fun m!42331 () Bool)

(assert (=> b!48593 m!42331))

(push 1)

(assert (not b!48593))

(assert tp_is_empty!2111)

(assert (not start!7616))

(assert (not b!48596))

(assert (not b!48595))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

