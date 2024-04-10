; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106210 () Bool)

(assert start!106210)

(declare-fun res!842104 () Bool)

(declare-fun e!720037 () Bool)

(assert (=> start!106210 (=> (not res!842104) (not e!720037))))

(declare-datatypes ((B!1904 0))(
  ( (B!1905 (val!16287 Int)) )
))
(declare-datatypes ((tuple2!21092 0))(
  ( (tuple2!21093 (_1!10557 (_ BitVec 64)) (_2!10557 B!1904)) )
))
(declare-datatypes ((List!28279 0))(
  ( (Nil!28276) (Cons!28275 (h!29484 tuple2!21092) (t!41800 List!28279)) )
))
(declare-datatypes ((ListLongMap!18965 0))(
  ( (ListLongMap!18966 (toList!9498 List!28279)) )
))
(declare-fun lm!212 () ListLongMap!18965)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7619 (ListLongMap!18965 (_ BitVec 64)) Bool)

(assert (=> start!106210 (= res!842104 (not (contains!7619 lm!212 a1!67)))))

(assert (=> start!106210 e!720037))

(declare-fun e!720038 () Bool)

(declare-fun inv!44064 (ListLongMap!18965) Bool)

(assert (=> start!106210 (and (inv!44064 lm!212) e!720038)))

(assert (=> start!106210 true))

(declare-fun b!1264485 () Bool)

(assert (=> b!1264485 (= e!720037 false)))

(declare-fun b!1264486 () Bool)

(declare-fun tp!96194 () Bool)

(assert (=> b!1264486 (= e!720038 tp!96194)))

(assert (= (and start!106210 res!842104) b!1264485))

(assert (= start!106210 b!1264486))

(declare-fun m!1165059 () Bool)

(assert (=> start!106210 m!1165059))

(declare-fun m!1165061 () Bool)

(assert (=> start!106210 m!1165061))

(push 1)

(assert (not start!106210))

(assert (not b!1264486))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

