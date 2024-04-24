; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75316 () Bool)

(assert start!75316)

(assert (=> start!75316 false))

(declare-fun e!493557 () Bool)

(assert (=> start!75316 e!493557))

(declare-fun b!886660 () Bool)

(declare-fun tp_is_empty!17785 () Bool)

(declare-fun tp!54303 () Bool)

(assert (=> b!886660 (= e!493557 (and tp_is_empty!17785 tp!54303))))

(declare-datatypes ((B!1274 0))(
  ( (B!1275 (val!8943 Int)) )
))
(declare-datatypes ((tuple2!11810 0))(
  ( (tuple2!11811 (_1!5916 (_ BitVec 64)) (_2!5916 B!1274)) )
))
(declare-datatypes ((List!17614 0))(
  ( (Nil!17611) (Cons!17610 (h!18747 tuple2!11810) (t!24883 List!17614)) )
))
(declare-fun l!906 () List!17614)

(get-info :version)

(assert (= (and start!75316 ((_ is Cons!17610) l!906)) b!886660))

(check-sat (not b!886660) tp_is_empty!17785)
(check-sat)
