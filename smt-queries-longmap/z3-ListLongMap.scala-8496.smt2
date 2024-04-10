; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103562 () Bool)

(assert start!103562)

(assert (=> start!103562 false))

(assert (=> start!103562 true))

(declare-fun e!703293 () Bool)

(assert (=> start!103562 e!703293))

(declare-fun b!1240775 () Bool)

(declare-fun tp_is_empty!31203 () Bool)

(declare-fun tp!92558 () Bool)

(assert (=> b!1240775 (= e!703293 (and tp_is_empty!31203 tp!92558))))

(declare-datatypes ((B!1804 0))(
  ( (B!1805 (val!15664 Int)) )
))
(declare-datatypes ((tuple2!20200 0))(
  ( (tuple2!20201 (_1!10111 (_ BitVec 64)) (_2!10111 B!1804)) )
))
(declare-datatypes ((List!27329 0))(
  ( (Nil!27326) (Cons!27325 (h!28534 tuple2!20200) (t!40792 List!27329)) )
))
(declare-fun l!644 () List!27329)

(get-info :version)

(assert (= (and start!103562 ((_ is Cons!27325) l!644)) b!1240775))

(check-sat (not b!1240775) tp_is_empty!31203)
