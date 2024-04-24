; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88810 () Bool)

(assert start!88810)

(assert (=> start!88810 false))

(declare-fun e!573747 () Bool)

(assert (=> start!88810 e!573747))

(declare-fun b!1019544 () Bool)

(declare-fun tp_is_empty!23683 () Bool)

(declare-fun tp!70993 () Bool)

(assert (=> b!1019544 (= e!573747 (and tp_is_empty!23683 tp!70993))))

(declare-datatypes ((B!1616 0))(
  ( (B!1617 (val!11892 Int)) )
))
(declare-datatypes ((tuple2!15334 0))(
  ( (tuple2!15335 (_1!7678 (_ BitVec 64)) (_2!7678 B!1616)) )
))
(declare-datatypes ((List!21569 0))(
  ( (Nil!21566) (Cons!21565 (h!22772 tuple2!15334) (t!30562 List!21569)) )
))
(declare-fun l!996 () List!21569)

(get-info :version)

(assert (= (and start!88810 ((_ is Cons!21565) l!996)) b!1019544))

(check-sat (not b!1019544) tp_is_empty!23683)
(check-sat)
