; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106600 () Bool)

(assert start!106600)

(declare-fun res!843289 () Bool)

(declare-fun e!721525 () Bool)

(assert (=> start!106600 (=> (not res!843289) (not e!721525))))

(declare-datatypes ((B!2006 0))(
  ( (B!2007 (val!16338 Int)) )
))
(declare-datatypes ((tuple2!21194 0))(
  ( (tuple2!21195 (_1!10608 (_ BitVec 64)) (_2!10608 B!2006)) )
))
(declare-datatypes ((List!28330 0))(
  ( (Nil!28327) (Cons!28326 (h!29535 tuple2!21194) (t!41857 List!28330)) )
))
(declare-datatypes ((ListLongMap!18989 0))(
  ( (ListLongMap!18990 (toList!9510 List!28330)) )
))
(declare-fun lm!209 () ListLongMap!18989)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7646 (ListLongMap!18989 (_ BitVec 64)) Bool)

(assert (=> start!106600 (= res!843289 (not (contains!7646 lm!209 a!499)))))

(assert (=> start!106600 e!721525))

(declare-fun e!721526 () Bool)

(declare-fun inv!44161 (ListLongMap!18989) Bool)

(assert (=> start!106600 (and (inv!44161 lm!209) e!721526)))

(assert (=> start!106600 true))

(declare-fun b!1266738 () Bool)

(assert (=> b!1266738 (= e!721525 false)))

(declare-fun b!1266739 () Bool)

(declare-fun tp!96452 () Bool)

(assert (=> b!1266739 (= e!721526 tp!96452)))

(assert (= (and start!106600 res!843289) b!1266738))

(assert (= start!106600 b!1266739))

(declare-fun m!1166385 () Bool)

(assert (=> start!106600 m!1166385))

(declare-fun m!1166387 () Bool)

(assert (=> start!106600 m!1166387))

(push 1)

(assert (not start!106600))

(assert (not b!1266739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

