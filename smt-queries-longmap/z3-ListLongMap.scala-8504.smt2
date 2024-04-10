; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103670 () Bool)

(assert start!103670)

(assert (=> start!103670 false))

(assert (=> start!103670 true))

(declare-fun e!703764 () Bool)

(assert (=> start!103670 e!703764))

(declare-fun b!1241597 () Bool)

(declare-fun tp_is_empty!31251 () Bool)

(declare-fun tp!92657 () Bool)

(assert (=> b!1241597 (= e!703764 (and tp_is_empty!31251 tp!92657))))

(declare-datatypes ((B!1852 0))(
  ( (B!1853 (val!15688 Int)) )
))
(declare-datatypes ((tuple2!20248 0))(
  ( (tuple2!20249 (_1!10135 (_ BitVec 64)) (_2!10135 B!1852)) )
))
(declare-datatypes ((List!27353 0))(
  ( (Nil!27350) (Cons!27349 (h!28558 tuple2!20248) (t!40816 List!27353)) )
))
(declare-fun l!644 () List!27353)

(get-info :version)

(assert (= (and start!103670 ((_ is Cons!27349) l!644)) b!1241597))

(check-sat (not b!1241597) tp_is_empty!31251)
(check-sat)
