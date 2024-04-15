; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1152 () Bool)

(assert start!1152)

(assert (=> start!1152 false))

(declare-datatypes ((B!290 0))(
  ( (B!291 (val!240 Int)) )
))
(declare-datatypes ((tuple2!276 0))(
  ( (tuple2!277 (_1!138 (_ BitVec 64)) (_2!138 B!290)) )
))
(declare-datatypes ((List!288 0))(
  ( (Nil!285) (Cons!284 (h!850 tuple2!276) (t!2435 List!288)) )
))
(declare-datatypes ((ListLongMap!281 0))(
  ( (ListLongMap!282 (toList!156 List!288)) )
))
(declare-fun lm!213 () ListLongMap!281)

(declare-fun e!5795 () Bool)

(declare-fun inv!442 (ListLongMap!281) Bool)

(assert (=> start!1152 (and (inv!442 lm!213) e!5795)))

(declare-fun b!10097 () Bool)

(declare-fun tp!1418 () Bool)

(assert (=> b!10097 (= e!5795 tp!1418)))

(assert (= start!1152 b!10097))

(declare-fun m!6449 () Bool)

(assert (=> start!1152 m!6449))

(check-sat (not start!1152) (not b!10097))
(check-sat)
