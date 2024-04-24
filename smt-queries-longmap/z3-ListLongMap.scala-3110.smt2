; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43740 () Bool)

(assert start!43740)

(assert (=> start!43740 false))

(declare-fun e!284715 () Bool)

(assert (=> start!43740 e!284715))

(assert (=> start!43740 true))

(declare-fun b!483736 () Bool)

(declare-fun tp_is_empty!13891 () Bool)

(declare-fun tp!43426 () Bool)

(assert (=> b!483736 (= e!284715 (and tp_is_empty!13891 tp!43426))))

(declare-datatypes ((B!1082 0))(
  ( (B!1083 (val!6993 Int)) )
))
(declare-datatypes ((tuple2!9102 0))(
  ( (tuple2!9103 (_1!4562 (_ BitVec 64)) (_2!4562 B!1082)) )
))
(declare-datatypes ((List!9159 0))(
  ( (Nil!9156) (Cons!9155 (h!10011 tuple2!9102) (t!15373 List!9159)) )
))
(declare-fun l!956 () List!9159)

(get-info :version)

(assert (= (and start!43740 ((_ is Cons!9155) l!956)) b!483736))

(check-sat (not b!483736) tp_is_empty!13891)
(check-sat)
