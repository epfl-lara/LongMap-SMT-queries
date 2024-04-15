; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1686 () Bool)

(assert start!1686)

(assert (=> start!1686 false))

(declare-fun e!7124 () Bool)

(assert (=> start!1686 e!7124))

(declare-fun b!11963 () Bool)

(declare-fun tp_is_empty!595 () Bool)

(declare-fun tp!2006 () Bool)

(assert (=> b!11963 (= e!7124 (and tp_is_empty!595 tp!2006))))

(declare-datatypes ((B!422 0))(
  ( (B!423 (val!306 Int)) )
))
(declare-datatypes ((tuple2!408 0))(
  ( (tuple2!409 (_1!204 (_ BitVec 64)) (_2!204 B!422)) )
))
(declare-datatypes ((List!354 0))(
  ( (Nil!351) (Cons!350 (h!916 tuple2!408) (t!2741 List!354)) )
))
(declare-fun l!1094 () List!354)

(get-info :version)

(assert (= (and start!1686 ((_ is Cons!350) l!1094)) b!11963))

(check-sat (not b!11963) tp_is_empty!595)
(check-sat)
