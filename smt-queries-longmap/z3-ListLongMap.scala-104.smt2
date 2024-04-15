; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1692 () Bool)

(assert start!1692)

(assert (=> start!1692 false))

(declare-fun e!7133 () Bool)

(assert (=> start!1692 e!7133))

(assert (=> start!1692 true))

(declare-fun tp_is_empty!601 () Bool)

(assert (=> start!1692 tp_is_empty!601))

(declare-fun b!11972 () Bool)

(declare-fun tp!2015 () Bool)

(assert (=> b!11972 (= e!7133 (and tp_is_empty!601 tp!2015))))

(declare-datatypes ((B!428 0))(
  ( (B!429 (val!309 Int)) )
))
(declare-datatypes ((tuple2!414 0))(
  ( (tuple2!415 (_1!207 (_ BitVec 64)) (_2!207 B!428)) )
))
(declare-datatypes ((List!357 0))(
  ( (Nil!354) (Cons!353 (h!919 tuple2!414) (t!2744 List!357)) )
))
(declare-fun l!1094 () List!357)

(get-info :version)

(assert (= (and start!1692 ((_ is Cons!353) l!1094)) b!11972))

(check-sat (not b!11972) tp_is_empty!601)
(check-sat)
