; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88816 () Bool)

(assert start!88816)

(assert (=> start!88816 false))

(declare-fun e!573756 () Bool)

(assert (=> start!88816 e!573756))

(assert (=> start!88816 true))

(declare-fun b!1019553 () Bool)

(declare-fun tp_is_empty!23689 () Bool)

(declare-fun tp!71002 () Bool)

(assert (=> b!1019553 (= e!573756 (and tp_is_empty!23689 tp!71002))))

(declare-datatypes ((B!1622 0))(
  ( (B!1623 (val!11895 Int)) )
))
(declare-datatypes ((tuple2!15340 0))(
  ( (tuple2!15341 (_1!7681 (_ BitVec 64)) (_2!7681 B!1622)) )
))
(declare-datatypes ((List!21572 0))(
  ( (Nil!21569) (Cons!21568 (h!22775 tuple2!15340) (t!30565 List!21572)) )
))
(declare-fun l!996 () List!21572)

(get-info :version)

(assert (= (and start!88816 ((_ is Cons!21568) l!996)) b!1019553))

(check-sat (not b!1019553) tp_is_empty!23689)
(check-sat)
