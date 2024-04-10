; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103646 () Bool)

(assert start!103646)

(assert (=> start!103646 false))

(assert (=> start!103646 true))

(declare-fun e!703677 () Bool)

(assert (=> start!103646 e!703677))

(declare-fun b!1241468 () Bool)

(declare-fun tp_is_empty!31239 () Bool)

(declare-fun tp!92630 () Bool)

(assert (=> b!1241468 (= e!703677 (and tp_is_empty!31239 tp!92630))))

(declare-datatypes ((B!1840 0))(
  ( (B!1841 (val!15682 Int)) )
))
(declare-datatypes ((tuple2!20236 0))(
  ( (tuple2!20237 (_1!10129 (_ BitVec 64)) (_2!10129 B!1840)) )
))
(declare-datatypes ((List!27347 0))(
  ( (Nil!27344) (Cons!27343 (h!28552 tuple2!20236) (t!40810 List!27347)) )
))
(declare-fun l!644 () List!27347)

(get-info :version)

(assert (= (and start!103646 ((_ is Cons!27343) l!644)) b!1241468))

(check-sat (not b!1241468) tp_is_empty!31239)
(check-sat)
