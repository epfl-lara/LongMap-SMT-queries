; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106604 () Bool)

(assert start!106604)

(declare-fun res!843295 () Bool)

(declare-fun e!721537 () Bool)

(assert (=> start!106604 (=> (not res!843295) (not e!721537))))

(declare-datatypes ((B!2010 0))(
  ( (B!2011 (val!16340 Int)) )
))
(declare-datatypes ((tuple2!21198 0))(
  ( (tuple2!21199 (_1!10610 (_ BitVec 64)) (_2!10610 B!2010)) )
))
(declare-datatypes ((List!28332 0))(
  ( (Nil!28329) (Cons!28328 (h!29537 tuple2!21198) (t!41859 List!28332)) )
))
(declare-datatypes ((ListLongMap!18993 0))(
  ( (ListLongMap!18994 (toList!9512 List!28332)) )
))
(declare-fun lm!209 () ListLongMap!18993)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7648 (ListLongMap!18993 (_ BitVec 64)) Bool)

(assert (=> start!106604 (= res!843295 (not (contains!7648 lm!209 a!499)))))

(assert (=> start!106604 e!721537))

(declare-fun e!721538 () Bool)

(declare-fun inv!44163 (ListLongMap!18993) Bool)

(assert (=> start!106604 (and (inv!44163 lm!209) e!721538)))

(assert (=> start!106604 true))

(declare-fun b!1266750 () Bool)

(assert (=> b!1266750 (= e!721537 false)))

(declare-fun b!1266751 () Bool)

(declare-fun tp!96458 () Bool)

(assert (=> b!1266751 (= e!721538 tp!96458)))

(assert (= (and start!106604 res!843295) b!1266750))

(assert (= start!106604 b!1266751))

(declare-fun m!1166393 () Bool)

(assert (=> start!106604 m!1166393))

(declare-fun m!1166395 () Bool)

(assert (=> start!106604 m!1166395))

(push 1)

(assert (not start!106604))

(assert (not b!1266751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

