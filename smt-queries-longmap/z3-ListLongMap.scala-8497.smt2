; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103558 () Bool)

(assert start!103558)

(assert (=> start!103558 false))

(assert (=> start!103558 true))

(declare-fun e!703248 () Bool)

(assert (=> start!103558 e!703248))

(declare-fun b!1240693 () Bool)

(declare-fun tp_is_empty!31207 () Bool)

(declare-fun tp!92564 () Bool)

(assert (=> b!1240693 (= e!703248 (and tp_is_empty!31207 tp!92564))))

(declare-datatypes ((B!1808 0))(
  ( (B!1809 (val!15666 Int)) )
))
(declare-datatypes ((tuple2!20288 0))(
  ( (tuple2!20289 (_1!10155 (_ BitVec 64)) (_2!10155 B!1808)) )
))
(declare-datatypes ((List!27393 0))(
  ( (Nil!27390) (Cons!27389 (h!28598 tuple2!20288) (t!40847 List!27393)) )
))
(declare-fun l!644 () List!27393)

(get-info :version)

(assert (= (and start!103558 ((_ is Cons!27389) l!644)) b!1240693))

(check-sat (not b!1240693) tp_is_empty!31207)
(check-sat)
