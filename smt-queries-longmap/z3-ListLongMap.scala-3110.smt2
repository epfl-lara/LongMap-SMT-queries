; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43754 () Bool)

(assert start!43754)

(assert (=> start!43754 false))

(declare-fun e!284757 () Bool)

(assert (=> start!43754 e!284757))

(assert (=> start!43754 true))

(declare-fun b!483800 () Bool)

(declare-fun tp_is_empty!13893 () Bool)

(declare-fun tp!43429 () Bool)

(assert (=> b!483800 (= e!284757 (and tp_is_empty!13893 tp!43429))))

(declare-datatypes ((B!1084 0))(
  ( (B!1085 (val!6994 Int)) )
))
(declare-datatypes ((tuple2!9190 0))(
  ( (tuple2!9191 (_1!4606 (_ BitVec 64)) (_2!4606 B!1084)) )
))
(declare-datatypes ((List!9258 0))(
  ( (Nil!9255) (Cons!9254 (h!10110 tuple2!9190) (t!15480 List!9258)) )
))
(declare-fun l!956 () List!9258)

(get-info :version)

(assert (= (and start!43754 ((_ is Cons!9254) l!956)) b!483800))

(check-sat (not b!483800) tp_is_empty!13893)
(check-sat)
