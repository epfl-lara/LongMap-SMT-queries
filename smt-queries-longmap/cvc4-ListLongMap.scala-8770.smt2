; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106610 () Bool)

(assert start!106610)

(declare-fun res!843304 () Bool)

(declare-fun e!721555 () Bool)

(assert (=> start!106610 (=> (not res!843304) (not e!721555))))

(declare-datatypes ((B!2016 0))(
  ( (B!2017 (val!16343 Int)) )
))
(declare-datatypes ((tuple2!21204 0))(
  ( (tuple2!21205 (_1!10613 (_ BitVec 64)) (_2!10613 B!2016)) )
))
(declare-datatypes ((List!28335 0))(
  ( (Nil!28332) (Cons!28331 (h!29540 tuple2!21204) (t!41862 List!28335)) )
))
(declare-datatypes ((ListLongMap!18999 0))(
  ( (ListLongMap!19000 (toList!9515 List!28335)) )
))
(declare-fun lm!209 () ListLongMap!18999)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7651 (ListLongMap!18999 (_ BitVec 64)) Bool)

(assert (=> start!106610 (= res!843304 (not (contains!7651 lm!209 a!499)))))

(assert (=> start!106610 e!721555))

(declare-fun e!721556 () Bool)

(declare-fun inv!44171 (ListLongMap!18999) Bool)

(assert (=> start!106610 (and (inv!44171 lm!209) e!721556)))

(assert (=> start!106610 true))

(declare-fun b!1266768 () Bool)

(assert (=> b!1266768 (= e!721555 false)))

(declare-fun b!1266769 () Bool)

(declare-fun tp!96467 () Bool)

(assert (=> b!1266769 (= e!721556 tp!96467)))

(assert (= (and start!106610 res!843304) b!1266768))

(assert (= start!106610 b!1266769))

(declare-fun m!1166405 () Bool)

(assert (=> start!106610 m!1166405))

(declare-fun m!1166407 () Bool)

(assert (=> start!106610 m!1166407))

(push 1)

(assert (not start!106610))

(assert (not b!1266769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

