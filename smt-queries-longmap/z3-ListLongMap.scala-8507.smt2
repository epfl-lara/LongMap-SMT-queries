; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103946 () Bool)

(assert start!103946)

(assert (=> start!103946 false))

(assert (=> start!103946 true))

(declare-fun e!704783 () Bool)

(assert (=> start!103946 e!704783))

(declare-fun b!1243170 () Bool)

(declare-fun tp_is_empty!31267 () Bool)

(declare-fun tp!92699 () Bool)

(assert (=> b!1243170 (= e!704783 (and tp_is_empty!31267 tp!92699))))

(declare-datatypes ((B!1868 0))(
  ( (B!1869 (val!15696 Int)) )
))
(declare-datatypes ((tuple2!20280 0))(
  ( (tuple2!20281 (_1!10151 (_ BitVec 64)) (_2!10151 B!1868)) )
))
(declare-datatypes ((List!27386 0))(
  ( (Nil!27383) (Cons!27382 (h!28600 tuple2!20280) (t!40841 List!27386)) )
))
(declare-fun l!644 () List!27386)

(get-info :version)

(assert (= (and start!103946 ((_ is Cons!27382) l!644)) b!1243170))

(check-sat (not b!1243170) tp_is_empty!31267)
(check-sat)
