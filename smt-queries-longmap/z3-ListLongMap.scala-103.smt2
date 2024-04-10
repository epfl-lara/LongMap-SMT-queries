; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1688 () Bool)

(assert start!1688)

(assert (=> start!1688 false))

(declare-fun e!7127 () Bool)

(assert (=> start!1688 e!7127))

(declare-fun b!11966 () Bool)

(declare-fun tp_is_empty!597 () Bool)

(declare-fun tp!2009 () Bool)

(assert (=> b!11966 (= e!7127 (and tp_is_empty!597 tp!2009))))

(declare-datatypes ((B!424 0))(
  ( (B!425 (val!307 Int)) )
))
(declare-datatypes ((tuple2!414 0))(
  ( (tuple2!415 (_1!207 (_ BitVec 64)) (_2!207 B!424)) )
))
(declare-datatypes ((List!359 0))(
  ( (Nil!356) (Cons!355 (h!921 tuple2!414) (t!2746 List!359)) )
))
(declare-fun l!1094 () List!359)

(get-info :version)

(assert (= (and start!1688 ((_ is Cons!355) l!1094)) b!11966))

(check-sat (not b!11966) tp_is_empty!597)
(check-sat)
