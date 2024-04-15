; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103660 () Bool)

(assert start!103660)

(assert (=> start!103660 false))

(assert (=> start!103660 true))

(declare-fun e!703710 () Bool)

(assert (=> start!103660 e!703710))

(declare-fun b!1241506 () Bool)

(declare-fun tp_is_empty!31249 () Bool)

(declare-fun tp!92654 () Bool)

(assert (=> b!1241506 (= e!703710 (and tp_is_empty!31249 tp!92654))))

(declare-datatypes ((B!1850 0))(
  ( (B!1851 (val!15687 Int)) )
))
(declare-datatypes ((tuple2!20330 0))(
  ( (tuple2!20331 (_1!10176 (_ BitVec 64)) (_2!10176 B!1850)) )
))
(declare-datatypes ((List!27414 0))(
  ( (Nil!27411) (Cons!27410 (h!28619 tuple2!20330) (t!40868 List!27414)) )
))
(declare-fun l!644 () List!27414)

(get-info :version)

(assert (= (and start!103660 ((_ is Cons!27410) l!644)) b!1241506))

(check-sat (not b!1241506) tp_is_empty!31249)
(check-sat)
