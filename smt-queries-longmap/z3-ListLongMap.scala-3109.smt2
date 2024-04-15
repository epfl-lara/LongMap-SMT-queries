; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43734 () Bool)

(assert start!43734)

(assert (=> start!43734 false))

(declare-fun e!284571 () Bool)

(assert (=> start!43734 e!284571))

(declare-fun b!483517 () Bool)

(declare-fun tp_is_empty!13885 () Bool)

(declare-fun tp!43417 () Bool)

(assert (=> b!483517 (= e!284571 (and tp_is_empty!13885 tp!43417))))

(declare-datatypes ((B!1076 0))(
  ( (B!1077 (val!6990 Int)) )
))
(declare-datatypes ((tuple2!9232 0))(
  ( (tuple2!9233 (_1!4627 (_ BitVec 64)) (_2!4627 B!1076)) )
))
(declare-datatypes ((List!9292 0))(
  ( (Nil!9289) (Cons!9288 (h!10144 tuple2!9232) (t!15505 List!9292)) )
))
(declare-fun l!956 () List!9292)

(get-info :version)

(assert (= (and start!43734 ((_ is Cons!9288) l!956)) b!483517))

(check-sat (not b!483517) tp_is_empty!13885)
(check-sat)
