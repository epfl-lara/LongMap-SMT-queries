; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106204 () Bool)

(assert start!106204)

(declare-fun res!842095 () Bool)

(declare-fun e!720019 () Bool)

(assert (=> start!106204 (=> (not res!842095) (not e!720019))))

(declare-datatypes ((B!1898 0))(
  ( (B!1899 (val!16284 Int)) )
))
(declare-datatypes ((tuple2!21086 0))(
  ( (tuple2!21087 (_1!10554 (_ BitVec 64)) (_2!10554 B!1898)) )
))
(declare-datatypes ((List!28276 0))(
  ( (Nil!28273) (Cons!28272 (h!29481 tuple2!21086) (t!41797 List!28276)) )
))
(declare-datatypes ((ListLongMap!18959 0))(
  ( (ListLongMap!18960 (toList!9495 List!28276)) )
))
(declare-fun lm!212 () ListLongMap!18959)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7616 (ListLongMap!18959 (_ BitVec 64)) Bool)

(assert (=> start!106204 (= res!842095 (not (contains!7616 lm!212 a1!67)))))

(assert (=> start!106204 e!720019))

(declare-fun e!720020 () Bool)

(declare-fun inv!44056 (ListLongMap!18959) Bool)

(assert (=> start!106204 (and (inv!44056 lm!212) e!720020)))

(assert (=> start!106204 true))

(declare-fun b!1264467 () Bool)

(assert (=> b!1264467 (= e!720019 false)))

(declare-fun b!1264468 () Bool)

(declare-fun tp!96185 () Bool)

(assert (=> b!1264468 (= e!720020 tp!96185)))

(assert (= (and start!106204 res!842095) b!1264467))

(assert (= start!106204 b!1264468))

(declare-fun m!1165047 () Bool)

(assert (=> start!106204 m!1165047))

(declare-fun m!1165049 () Bool)

(assert (=> start!106204 m!1165049))

(push 1)

(assert (not start!106204))

(assert (not b!1264468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

