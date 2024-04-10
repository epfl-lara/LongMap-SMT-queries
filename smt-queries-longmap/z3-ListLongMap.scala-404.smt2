; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7572 () Bool)

(assert start!7572)

(assert (=> start!7572 false))

(declare-fun e!31030 () Bool)

(assert (=> start!7572 e!31030))

(assert (=> start!7572 true))

(declare-fun b!48356 () Bool)

(declare-fun tp_is_empty!2091 () Bool)

(declare-fun tp!6377 () Bool)

(assert (=> b!48356 (= e!31030 (and tp_is_empty!2091 tp!6377))))

(declare-datatypes ((B!940 0))(
  ( (B!941 (val!1090 Int)) )
))
(declare-datatypes ((tuple2!1762 0))(
  ( (tuple2!1763 (_1!892 (_ BitVec 64)) (_2!892 B!940)) )
))
(declare-datatypes ((List!1287 0))(
  ( (Nil!1284) (Cons!1283 (h!1863 tuple2!1762) (t!4315 List!1287)) )
))
(declare-fun l!1333 () List!1287)

(get-info :version)

(assert (= (and start!7572 ((_ is Cons!1283) l!1333)) b!48356))

(check-sat (not b!48356) tp_is_empty!2091)
(check-sat)
