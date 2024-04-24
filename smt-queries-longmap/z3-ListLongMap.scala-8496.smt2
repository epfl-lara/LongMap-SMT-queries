; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103796 () Bool)

(assert start!103796)

(assert (=> start!103796 false))

(assert (=> start!103796 true))

(declare-fun e!704153 () Bool)

(assert (=> start!103796 e!704153))

(declare-fun b!1242096 () Bool)

(declare-fun tp_is_empty!31201 () Bool)

(declare-fun tp!92555 () Bool)

(assert (=> b!1242096 (= e!704153 (and tp_is_empty!31201 tp!92555))))

(declare-datatypes ((B!1802 0))(
  ( (B!1803 (val!15663 Int)) )
))
(declare-datatypes ((tuple2!20214 0))(
  ( (tuple2!20215 (_1!10118 (_ BitVec 64)) (_2!10118 B!1802)) )
))
(declare-datatypes ((List!27353 0))(
  ( (Nil!27350) (Cons!27349 (h!28567 tuple2!20214) (t!40808 List!27353)) )
))
(declare-fun l!644 () List!27353)

(get-info :version)

(assert (= (and start!103796 ((_ is Cons!27349) l!644)) b!1242096))

(check-sat (not b!1242096) tp_is_empty!31201)
(check-sat)
