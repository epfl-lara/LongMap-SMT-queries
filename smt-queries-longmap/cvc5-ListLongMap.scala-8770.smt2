; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106606 () Bool)

(assert start!106606)

(declare-fun res!843298 () Bool)

(declare-fun e!721543 () Bool)

(assert (=> start!106606 (=> (not res!843298) (not e!721543))))

(declare-datatypes ((B!2012 0))(
  ( (B!2013 (val!16341 Int)) )
))
(declare-datatypes ((tuple2!21200 0))(
  ( (tuple2!21201 (_1!10611 (_ BitVec 64)) (_2!10611 B!2012)) )
))
(declare-datatypes ((List!28333 0))(
  ( (Nil!28330) (Cons!28329 (h!29538 tuple2!21200) (t!41860 List!28333)) )
))
(declare-datatypes ((ListLongMap!18995 0))(
  ( (ListLongMap!18996 (toList!9513 List!28333)) )
))
(declare-fun lm!209 () ListLongMap!18995)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7649 (ListLongMap!18995 (_ BitVec 64)) Bool)

(assert (=> start!106606 (= res!843298 (not (contains!7649 lm!209 a!499)))))

(assert (=> start!106606 e!721543))

(declare-fun e!721544 () Bool)

(declare-fun inv!44169 (ListLongMap!18995) Bool)

(assert (=> start!106606 (and (inv!44169 lm!209) e!721544)))

(assert (=> start!106606 true))

(declare-fun b!1266756 () Bool)

(assert (=> b!1266756 (= e!721543 false)))

(declare-fun b!1266757 () Bool)

(declare-fun tp!96461 () Bool)

(assert (=> b!1266757 (= e!721544 tp!96461)))

(assert (= (and start!106606 res!843298) b!1266756))

(assert (= start!106606 b!1266757))

(declare-fun m!1166397 () Bool)

(assert (=> start!106606 m!1166397))

(declare-fun m!1166399 () Bool)

(assert (=> start!106606 m!1166399))

(push 1)

(assert (not start!106606))

(assert (not b!1266757))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

