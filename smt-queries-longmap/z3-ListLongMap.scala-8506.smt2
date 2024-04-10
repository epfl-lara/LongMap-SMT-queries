; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103694 () Bool)

(assert start!103694)

(declare-fun res!828271 () Bool)

(declare-fun e!703875 () Bool)

(assert (=> start!103694 (=> (not res!828271) (not e!703875))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103694 (= res!828271 (not (= key1!25 key2!15)))))

(assert (=> start!103694 e!703875))

(assert (=> start!103694 true))

(declare-fun e!703874 () Bool)

(assert (=> start!103694 e!703874))

(declare-fun b!1241781 () Bool)

(declare-fun res!828270 () Bool)

(assert (=> b!1241781 (=> (not res!828270) (not e!703875))))

(declare-datatypes ((B!1864 0))(
  ( (B!1865 (val!15694 Int)) )
))
(declare-datatypes ((tuple2!20260 0))(
  ( (tuple2!20261 (_1!10141 (_ BitVec 64)) (_2!10141 B!1864)) )
))
(declare-datatypes ((List!27359 0))(
  ( (Nil!27356) (Cons!27355 (h!28564 tuple2!20260) (t!40822 List!27359)) )
))
(declare-fun l!644 () List!27359)

(declare-fun isStrictlySorted!755 (List!27359) Bool)

(assert (=> b!1241781 (= res!828270 (isStrictlySorted!755 l!644))))

(declare-fun b!1241782 () Bool)

(declare-fun ListPrimitiveSize!146 (List!27359) Int)

(assert (=> b!1241782 (= e!703875 (< (ListPrimitiveSize!146 l!644) 0))))

(declare-fun b!1241783 () Bool)

(declare-fun tp_is_empty!31263 () Bool)

(declare-fun tp!92684 () Bool)

(assert (=> b!1241783 (= e!703874 (and tp_is_empty!31263 tp!92684))))

(assert (= (and start!103694 res!828271) b!1241781))

(assert (= (and b!1241781 res!828270) b!1241782))

(get-info :version)

(assert (= (and start!103694 ((_ is Cons!27355) l!644)) b!1241783))

(declare-fun m!1144679 () Bool)

(assert (=> b!1241781 m!1144679))

(declare-fun m!1144681 () Bool)

(assert (=> b!1241782 m!1144681))

(check-sat (not b!1241782) (not b!1241781) (not b!1241783) tp_is_empty!31263)
(check-sat)
(get-model)

(declare-fun d!136535 () Bool)

(declare-fun lt!562168 () Int)

(assert (=> d!136535 (>= lt!562168 0)))

(declare-fun e!703904 () Int)

(assert (=> d!136535 (= lt!562168 e!703904)))

(declare-fun c!121512 () Bool)

(assert (=> d!136535 (= c!121512 ((_ is Nil!27356) l!644))))

(assert (=> d!136535 (= (ListPrimitiveSize!146 l!644) lt!562168)))

(declare-fun b!1241824 () Bool)

