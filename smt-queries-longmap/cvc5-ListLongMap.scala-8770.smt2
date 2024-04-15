; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106606 () Bool)

(assert start!106606)

(declare-fun res!843264 () Bool)

(declare-fun e!721510 () Bool)

(assert (=> start!106606 (=> (not res!843264) (not e!721510))))

(declare-datatypes ((B!2016 0))(
  ( (B!2017 (val!16343 Int)) )
))
(declare-datatypes ((tuple2!21286 0))(
  ( (tuple2!21287 (_1!10654 (_ BitVec 64)) (_2!10654 B!2016)) )
))
(declare-datatypes ((List!28419 0))(
  ( (Nil!28416) (Cons!28415 (h!29624 tuple2!21286) (t!41937 List!28419)) )
))
(declare-datatypes ((ListLongMap!19081 0))(
  ( (ListLongMap!19082 (toList!9556 List!28419)) )
))
(declare-fun lm!209 () ListLongMap!19081)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7620 (ListLongMap!19081 (_ BitVec 64)) Bool)

(assert (=> start!106606 (= res!843264 (not (contains!7620 lm!209 a!499)))))

(assert (=> start!106606 e!721510))

(declare-fun e!721511 () Bool)

(declare-fun inv!44171 (ListLongMap!19081) Bool)

(assert (=> start!106606 (and (inv!44171 lm!209) e!721511)))

(assert (=> start!106606 true))

(declare-fun b!1266686 () Bool)

(assert (=> b!1266686 (= e!721510 false)))

(declare-fun b!1266687 () Bool)

(declare-fun tp!96467 () Bool)

(assert (=> b!1266687 (= e!721511 tp!96467)))

(assert (= (and start!106606 res!843264) b!1266686))

(assert (= start!106606 b!1266687))

(declare-fun m!1165885 () Bool)

(assert (=> start!106606 m!1165885))

(declare-fun m!1165887 () Bool)

(assert (=> start!106606 m!1165887))

(push 1)

(assert (not start!106606))

(assert (not b!1266687))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

