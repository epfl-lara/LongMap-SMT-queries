; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2364 () Bool)

(assert start!2364)

(declare-fun b_free!475 () Bool)

(declare-fun b_next!475 () Bool)

(assert (=> start!2364 (= b_free!475 (not b_next!475))))

(declare-fun tp!2498 () Bool)

(declare-fun b_and!891 () Bool)

(assert (=> start!2364 (= tp!2498 b_and!891)))

(assert (=> start!2364 false))

(declare-datatypes ((B!596 0))(
  ( (B!597 (val!396 Int)) )
))
(declare-datatypes ((tuple2!588 0))(
  ( (tuple2!589 (_1!294 (_ BitVec 64)) (_2!294 B!596)) )
))
(declare-datatypes ((List!453 0))(
  ( (Nil!450) (Cons!449 (h!1015 tuple2!588) (t!2861 List!453)) )
))
(declare-datatypes ((ListLongMap!419 0))(
  ( (ListLongMap!420 (toList!225 List!453)) )
))
(declare-fun lm!238 () ListLongMap!419)

(declare-fun e!9247 () Bool)

(declare-fun inv!768 (ListLongMap!419) Bool)

(assert (=> start!2364 (and (inv!768 lm!238) e!9247)))

(assert (=> start!2364 tp!2498))

(declare-fun b!15266 () Bool)

(declare-fun tp!2497 () Bool)

(assert (=> b!15266 (= e!9247 tp!2497)))

(assert (= start!2364 b!15266))

(declare-fun m!10155 () Bool)

(assert (=> start!2364 m!10155))

(check-sat (not start!2364) (not b!15266) b_and!891 (not b_next!475))
(check-sat b_and!891 (not b_next!475))
