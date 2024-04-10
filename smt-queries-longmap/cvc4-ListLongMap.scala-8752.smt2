; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106214 () Bool)

(assert start!106214)

(declare-fun res!842110 () Bool)

(declare-fun e!720049 () Bool)

(assert (=> start!106214 (=> (not res!842110) (not e!720049))))

(declare-datatypes ((B!1908 0))(
  ( (B!1909 (val!16289 Int)) )
))
(declare-datatypes ((tuple2!21096 0))(
  ( (tuple2!21097 (_1!10559 (_ BitVec 64)) (_2!10559 B!1908)) )
))
(declare-datatypes ((List!28281 0))(
  ( (Nil!28278) (Cons!28277 (h!29486 tuple2!21096) (t!41802 List!28281)) )
))
(declare-datatypes ((ListLongMap!18969 0))(
  ( (ListLongMap!18970 (toList!9500 List!28281)) )
))
(declare-fun lm!212 () ListLongMap!18969)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7621 (ListLongMap!18969 (_ BitVec 64)) Bool)

(assert (=> start!106214 (= res!842110 (not (contains!7621 lm!212 a1!67)))))

(assert (=> start!106214 e!720049))

(declare-fun e!720050 () Bool)

(declare-fun inv!44066 (ListLongMap!18969) Bool)

(assert (=> start!106214 (and (inv!44066 lm!212) e!720050)))

(assert (=> start!106214 true))

(declare-fun b!1264497 () Bool)

(assert (=> b!1264497 (= e!720049 false)))

(declare-fun b!1264498 () Bool)

(declare-fun tp!96200 () Bool)

(assert (=> b!1264498 (= e!720050 tp!96200)))

(assert (= (and start!106214 res!842110) b!1264497))

(assert (= start!106214 b!1264498))

(declare-fun m!1165067 () Bool)

(assert (=> start!106214 m!1165067))

(declare-fun m!1165069 () Bool)

(assert (=> start!106214 m!1165069))

(push 1)

(assert (not start!106214))

(assert (not b!1264498))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

