; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103568 () Bool)

(assert start!103568)

(assert (=> start!103568 false))

(assert (=> start!103568 true))

(declare-fun e!703302 () Bool)

(assert (=> start!103568 e!703302))

(declare-fun b!1240784 () Bool)

(declare-fun tp_is_empty!31209 () Bool)

(declare-fun tp!92567 () Bool)

(assert (=> b!1240784 (= e!703302 (and tp_is_empty!31209 tp!92567))))

(declare-datatypes ((B!1810 0))(
  ( (B!1811 (val!15667 Int)) )
))
(declare-datatypes ((tuple2!20206 0))(
  ( (tuple2!20207 (_1!10114 (_ BitVec 64)) (_2!10114 B!1810)) )
))
(declare-datatypes ((List!27332 0))(
  ( (Nil!27329) (Cons!27328 (h!28537 tuple2!20206) (t!40795 List!27332)) )
))
(declare-fun l!644 () List!27332)

(get-info :version)

(assert (= (and start!103568 ((_ is Cons!27328) l!644)) b!1240784))

(check-sat (not b!1240784) tp_is_empty!31209)
(check-sat)
