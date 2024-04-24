; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7624 () Bool)

(assert start!7624)

(assert (=> start!7624 false))

(declare-fun e!31161 () Bool)

(assert (=> start!7624 e!31161))

(assert (=> start!7624 true))

(declare-fun b!48542 () Bool)

(declare-fun tp_is_empty!2113 () Bool)

(declare-fun tp!6428 () Bool)

(assert (=> b!48542 (= e!31161 (and tp_is_empty!2113 tp!6428))))

(declare-datatypes ((B!962 0))(
  ( (B!963 (val!1101 Int)) )
))
(declare-datatypes ((tuple2!1766 0))(
  ( (tuple2!1767 (_1!894 (_ BitVec 64)) (_2!894 B!962)) )
))
(declare-datatypes ((List!1284 0))(
  ( (Nil!1281) (Cons!1280 (h!1860 tuple2!1766) (t!4312 List!1284)) )
))
(declare-fun l!1333 () List!1284)

(get-info :version)

(assert (= (and start!7624 ((_ is Cons!1280) l!1333)) b!48542))

(check-sat (not b!48542) tp_is_empty!2113)
(check-sat)
