; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106208 () Bool)

(assert start!106208)

(declare-fun res!842101 () Bool)

(declare-fun e!720031 () Bool)

(assert (=> start!106208 (=> (not res!842101) (not e!720031))))

(declare-datatypes ((B!1902 0))(
  ( (B!1903 (val!16286 Int)) )
))
(declare-datatypes ((tuple2!21090 0))(
  ( (tuple2!21091 (_1!10556 (_ BitVec 64)) (_2!10556 B!1902)) )
))
(declare-datatypes ((List!28278 0))(
  ( (Nil!28275) (Cons!28274 (h!29483 tuple2!21090) (t!41799 List!28278)) )
))
(declare-datatypes ((ListLongMap!18963 0))(
  ( (ListLongMap!18964 (toList!9497 List!28278)) )
))
(declare-fun lm!212 () ListLongMap!18963)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7618 (ListLongMap!18963 (_ BitVec 64)) Bool)

(assert (=> start!106208 (= res!842101 (not (contains!7618 lm!212 a1!67)))))

(assert (=> start!106208 e!720031))

(declare-fun e!720032 () Bool)

(declare-fun inv!44058 (ListLongMap!18963) Bool)

(assert (=> start!106208 (and (inv!44058 lm!212) e!720032)))

(assert (=> start!106208 true))

(declare-fun b!1264479 () Bool)

(assert (=> b!1264479 (= e!720031 false)))

(declare-fun b!1264480 () Bool)

(declare-fun tp!96191 () Bool)

(assert (=> b!1264480 (= e!720032 tp!96191)))

(assert (= (and start!106208 res!842101) b!1264479))

(assert (= start!106208 b!1264480))

(declare-fun m!1165055 () Bool)

(assert (=> start!106208 m!1165055))

(declare-fun m!1165057 () Bool)

(assert (=> start!106208 m!1165057))

(push 1)

(assert (not start!106208))

(assert (not b!1264480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

