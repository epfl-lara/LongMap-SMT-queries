; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103904 () Bool)

(assert start!103904)

(assert (=> start!103904 false))

(assert (=> start!103904 true))

(declare-fun e!704624 () Bool)

(assert (=> start!103904 e!704624))

(declare-fun b!1242918 () Bool)

(declare-fun tp_is_empty!31249 () Bool)

(declare-fun tp!92654 () Bool)

(assert (=> b!1242918 (= e!704624 (and tp_is_empty!31249 tp!92654))))

(declare-datatypes ((B!1850 0))(
  ( (B!1851 (val!15687 Int)) )
))
(declare-datatypes ((tuple2!20262 0))(
  ( (tuple2!20263 (_1!10142 (_ BitVec 64)) (_2!10142 B!1850)) )
))
(declare-datatypes ((List!27377 0))(
  ( (Nil!27374) (Cons!27373 (h!28591 tuple2!20262) (t!40832 List!27377)) )
))
(declare-fun l!644 () List!27377)

(get-info :version)

(assert (= (and start!103904 ((_ is Cons!27373) l!644)) b!1242918))

(check-sat (not b!1242918) tp_is_empty!31249)
(check-sat)
