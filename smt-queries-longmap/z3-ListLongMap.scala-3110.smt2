; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43740 () Bool)

(assert start!43740)

(assert (=> start!43740 false))

(declare-fun e!284580 () Bool)

(assert (=> start!43740 e!284580))

(assert (=> start!43740 true))

(declare-fun b!483526 () Bool)

(declare-fun tp_is_empty!13891 () Bool)

(declare-fun tp!43426 () Bool)

(assert (=> b!483526 (= e!284580 (and tp_is_empty!13891 tp!43426))))

(declare-datatypes ((B!1082 0))(
  ( (B!1083 (val!6993 Int)) )
))
(declare-datatypes ((tuple2!9238 0))(
  ( (tuple2!9239 (_1!4630 (_ BitVec 64)) (_2!4630 B!1082)) )
))
(declare-datatypes ((List!9295 0))(
  ( (Nil!9292) (Cons!9291 (h!10147 tuple2!9238) (t!15508 List!9295)) )
))
(declare-fun l!956 () List!9295)

(get-info :version)

(assert (= (and start!43740 ((_ is Cons!9291) l!956)) b!483526))

(check-sat (not b!483526) tp_is_empty!13891)
(check-sat)
