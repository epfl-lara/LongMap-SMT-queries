; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43734 () Bool)

(assert start!43734)

(assert (=> start!43734 false))

(declare-fun e!284706 () Bool)

(assert (=> start!43734 e!284706))

(declare-fun b!483727 () Bool)

(declare-fun tp_is_empty!13885 () Bool)

(declare-fun tp!43417 () Bool)

(assert (=> b!483727 (= e!284706 (and tp_is_empty!13885 tp!43417))))

(declare-datatypes ((B!1076 0))(
  ( (B!1077 (val!6990 Int)) )
))
(declare-datatypes ((tuple2!9096 0))(
  ( (tuple2!9097 (_1!4559 (_ BitVec 64)) (_2!4559 B!1076)) )
))
(declare-datatypes ((List!9156 0))(
  ( (Nil!9153) (Cons!9152 (h!10008 tuple2!9096) (t!15370 List!9156)) )
))
(declare-fun l!956 () List!9156)

(get-info :version)

(assert (= (and start!43734 ((_ is Cons!9152) l!956)) b!483727))

(check-sat (not b!483727) tp_is_empty!13885)
(check-sat)
