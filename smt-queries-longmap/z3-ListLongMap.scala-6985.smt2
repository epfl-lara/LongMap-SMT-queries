; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88578 () Bool)

(assert start!88578)

(assert (=> start!88578 false))

(declare-fun e!572904 () Bool)

(assert (=> start!88578 e!572904))

(declare-fun b!1018226 () Bool)

(declare-fun tp_is_empty!23685 () Bool)

(declare-fun tp!70996 () Bool)

(assert (=> b!1018226 (= e!572904 (and tp_is_empty!23685 tp!70996))))

(declare-datatypes ((B!1618 0))(
  ( (B!1619 (val!11893 Int)) )
))
(declare-datatypes ((tuple2!15332 0))(
  ( (tuple2!15333 (_1!7677 (_ BitVec 64)) (_2!7677 B!1618)) )
))
(declare-datatypes ((List!21581 0))(
  ( (Nil!21578) (Cons!21577 (h!22775 tuple2!15332) (t!30582 List!21581)) )
))
(declare-fun l!996 () List!21581)

(get-info :version)

(assert (= (and start!88578 ((_ is Cons!21577) l!996)) b!1018226))

(check-sat (not b!1018226) tp_is_empty!23685)
(check-sat)
