; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43748 () Bool)

(assert start!43748)

(assert (=> start!43748 false))

(declare-fun e!284748 () Bool)

(assert (=> start!43748 e!284748))

(declare-fun b!483791 () Bool)

(declare-fun tp_is_empty!13887 () Bool)

(declare-fun tp!43420 () Bool)

(assert (=> b!483791 (= e!284748 (and tp_is_empty!13887 tp!43420))))

(declare-datatypes ((B!1078 0))(
  ( (B!1079 (val!6991 Int)) )
))
(declare-datatypes ((tuple2!9184 0))(
  ( (tuple2!9185 (_1!4603 (_ BitVec 64)) (_2!4603 B!1078)) )
))
(declare-datatypes ((List!9255 0))(
  ( (Nil!9252) (Cons!9251 (h!10107 tuple2!9184) (t!15477 List!9255)) )
))
(declare-fun l!956 () List!9255)

(get-info :version)

(assert (= (and start!43748 ((_ is Cons!9251) l!956)) b!483791))

(check-sat (not b!483791) tp_is_empty!13887)
(check-sat)
