; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106206 () Bool)

(assert start!106206)

(declare-fun res!842098 () Bool)

(declare-fun e!720025 () Bool)

(assert (=> start!106206 (=> (not res!842098) (not e!720025))))

(declare-datatypes ((B!1900 0))(
  ( (B!1901 (val!16285 Int)) )
))
(declare-datatypes ((tuple2!21088 0))(
  ( (tuple2!21089 (_1!10555 (_ BitVec 64)) (_2!10555 B!1900)) )
))
(declare-datatypes ((List!28277 0))(
  ( (Nil!28274) (Cons!28273 (h!29482 tuple2!21088) (t!41798 List!28277)) )
))
(declare-datatypes ((ListLongMap!18961 0))(
  ( (ListLongMap!18962 (toList!9496 List!28277)) )
))
(declare-fun lm!212 () ListLongMap!18961)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7617 (ListLongMap!18961 (_ BitVec 64)) Bool)

(assert (=> start!106206 (= res!842098 (not (contains!7617 lm!212 a1!67)))))

(assert (=> start!106206 e!720025))

(declare-fun e!720026 () Bool)

(declare-fun inv!44057 (ListLongMap!18961) Bool)

(assert (=> start!106206 (and (inv!44057 lm!212) e!720026)))

(assert (=> start!106206 true))

(declare-fun b!1264473 () Bool)

(assert (=> b!1264473 (= e!720025 false)))

(declare-fun b!1264474 () Bool)

(declare-fun tp!96188 () Bool)

(assert (=> b!1264474 (= e!720026 tp!96188)))

(assert (= (and start!106206 res!842098) b!1264473))

(assert (= start!106206 b!1264474))

(declare-fun m!1165051 () Bool)

(assert (=> start!106206 m!1165051))

(declare-fun m!1165053 () Bool)

(assert (=> start!106206 m!1165053))

(check-sat (not start!106206) (not b!1264474))
(check-sat)
