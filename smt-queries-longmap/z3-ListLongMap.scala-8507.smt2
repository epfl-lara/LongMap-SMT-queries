; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103702 () Bool)

(assert start!103702)

(assert (=> start!103702 false))

(assert (=> start!103702 true))

(declare-fun e!703869 () Bool)

(assert (=> start!103702 e!703869))

(declare-fun b!1241758 () Bool)

(declare-fun tp_is_empty!31267 () Bool)

(declare-fun tp!92699 () Bool)

(assert (=> b!1241758 (= e!703869 (and tp_is_empty!31267 tp!92699))))

(declare-datatypes ((B!1868 0))(
  ( (B!1869 (val!15696 Int)) )
))
(declare-datatypes ((tuple2!20348 0))(
  ( (tuple2!20349 (_1!10185 (_ BitVec 64)) (_2!10185 B!1868)) )
))
(declare-datatypes ((List!27423 0))(
  ( (Nil!27420) (Cons!27419 (h!28628 tuple2!20348) (t!40877 List!27423)) )
))
(declare-fun l!644 () List!27423)

(get-info :version)

(assert (= (and start!103702 ((_ is Cons!27419) l!644)) b!1241758))

(check-sat (not b!1241758) tp_is_empty!31267)
(check-sat)
