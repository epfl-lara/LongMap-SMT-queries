; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106834 () Bool)

(assert start!106834)

(declare-fun res!843824 () Bool)

(declare-fun e!722402 () Bool)

(assert (=> start!106834 (=> (not res!843824) (not e!722402))))

(declare-datatypes ((B!2016 0))(
  ( (B!2017 (val!16343 Int)) )
))
(declare-datatypes ((tuple2!21214 0))(
  ( (tuple2!21215 (_1!10618 (_ BitVec 64)) (_2!10618 B!2016)) )
))
(declare-datatypes ((List!28371 0))(
  ( (Nil!28368) (Cons!28367 (h!29585 tuple2!21214) (t!41890 List!28371)) )
))
(declare-datatypes ((ListLongMap!19017 0))(
  ( (ListLongMap!19018 (toList!9524 List!28371)) )
))
(declare-fun lm!209 () ListLongMap!19017)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7676 (ListLongMap!19017 (_ BitVec 64)) Bool)

(assert (=> start!106834 (= res!843824 (not (contains!7676 lm!209 a!499)))))

(assert (=> start!106834 e!722402))

(declare-fun e!722403 () Bool)

(declare-fun inv!44171 (ListLongMap!19017) Bool)

(assert (=> start!106834 (and (inv!44171 lm!209) e!722403)))

(assert (=> start!106834 true))

(declare-fun b!1268073 () Bool)

(assert (=> b!1268073 (= e!722402 false)))

(declare-fun b!1268074 () Bool)

(declare-fun tp!96467 () Bool)

(assert (=> b!1268074 (= e!722403 tp!96467)))

(assert (= (and start!106834 res!843824) b!1268073))

(assert (= start!106834 b!1268074))

(declare-fun m!1168017 () Bool)

(assert (=> start!106834 m!1168017))

(declare-fun m!1168019 () Bool)

(assert (=> start!106834 m!1168019))

(push 1)

(assert (not start!106834))

(assert (not b!1268074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

