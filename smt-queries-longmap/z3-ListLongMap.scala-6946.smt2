; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87468 () Bool)

(assert start!87468)

(assert (=> start!87468 false))

(declare-fun e!569822 () Bool)

(assert (=> start!87468 e!569822))

(declare-fun b!1012993 () Bool)

(declare-fun tp_is_empty!23449 () Bool)

(declare-fun tp!70383 () Bool)

(assert (=> b!1012993 (= e!569822 (and tp_is_empty!23449 tp!70383))))

(declare-datatypes ((B!1382 0))(
  ( (B!1383 (val!11775 Int)) )
))
(declare-datatypes ((tuple2!15176 0))(
  ( (tuple2!15177 (_1!7599 (_ BitVec 64)) (_2!7599 B!1382)) )
))
(declare-datatypes ((List!21429 0))(
  ( (Nil!21426) (Cons!21425 (h!22623 tuple2!15176) (t!30421 List!21429)) )
))
(declare-fun l!412 () List!21429)

(get-info :version)

(assert (= (and start!87468 ((_ is Cons!21425) l!412)) b!1012993))

(check-sat (not b!1012993) tp_is_empty!23449)
(check-sat)
