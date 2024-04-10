; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1154 () Bool)

(assert start!1154)

(assert (=> start!1154 false))

(declare-datatypes ((B!292 0))(
  ( (B!293 (val!241 Int)) )
))
(declare-datatypes ((tuple2!282 0))(
  ( (tuple2!283 (_1!141 (_ BitVec 64)) (_2!141 B!292)) )
))
(declare-datatypes ((List!293 0))(
  ( (Nil!290) (Cons!289 (h!855 tuple2!282) (t!2440 List!293)) )
))
(declare-datatypes ((ListLongMap!287 0))(
  ( (ListLongMap!288 (toList!159 List!293)) )
))
(declare-fun lm!213 () ListLongMap!287)

(declare-fun e!5798 () Bool)

(declare-fun inv!443 (ListLongMap!287) Bool)

(assert (=> start!1154 (and (inv!443 lm!213) e!5798)))

(declare-fun b!10100 () Bool)

(declare-fun tp!1421 () Bool)

(assert (=> b!10100 (= e!5798 tp!1421)))

(assert (= start!1154 b!10100))

(declare-fun m!6451 () Bool)

(assert (=> start!1154 m!6451))

(check-sat (not start!1154) (not b!10100))
(check-sat)
