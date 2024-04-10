; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87908 () Bool)

(assert start!87908)

(assert (=> start!87908 false))

(declare-fun e!571291 () Bool)

(assert (=> start!87908 e!571291))

(declare-fun b!1015517 () Bool)

(declare-fun tp_is_empty!23547 () Bool)

(declare-fun tp!70649 () Bool)

(assert (=> b!1015517 (= e!571291 (and tp_is_empty!23547 tp!70649))))

(declare-datatypes ((B!1480 0))(
  ( (B!1481 (val!11824 Int)) )
))
(declare-datatypes ((tuple2!15194 0))(
  ( (tuple2!15195 (_1!7608 (_ BitVec 64)) (_2!7608 B!1480)) )
))
(declare-datatypes ((List!21476 0))(
  ( (Nil!21473) (Cons!21472 (h!22670 tuple2!15194) (t!30477 List!21476)) )
))
(declare-fun l!1114 () List!21476)

(get-info :version)

(assert (= (and start!87908 ((_ is Cons!21472) l!1114)) b!1015517))

(check-sat (not b!1015517) tp_is_empty!23547)
(check-sat)
