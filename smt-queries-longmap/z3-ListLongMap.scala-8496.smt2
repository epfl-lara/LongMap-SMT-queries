; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103552 () Bool)

(assert start!103552)

(assert (=> start!103552 false))

(assert (=> start!103552 true))

(declare-fun e!703239 () Bool)

(assert (=> start!103552 e!703239))

(declare-fun b!1240684 () Bool)

(declare-fun tp_is_empty!31201 () Bool)

(declare-fun tp!92555 () Bool)

(assert (=> b!1240684 (= e!703239 (and tp_is_empty!31201 tp!92555))))

(declare-datatypes ((B!1802 0))(
  ( (B!1803 (val!15663 Int)) )
))
(declare-datatypes ((tuple2!20282 0))(
  ( (tuple2!20283 (_1!10152 (_ BitVec 64)) (_2!10152 B!1802)) )
))
(declare-datatypes ((List!27390 0))(
  ( (Nil!27387) (Cons!27386 (h!28595 tuple2!20282) (t!40844 List!27390)) )
))
(declare-fun l!644 () List!27390)

(get-info :version)

(assert (= (and start!103552 ((_ is Cons!27386) l!644)) b!1240684))

(check-sat (not b!1240684) tp_is_empty!31201)
(check-sat)
