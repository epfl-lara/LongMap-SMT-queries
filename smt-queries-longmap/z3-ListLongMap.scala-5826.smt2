; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75130 () Bool)

(assert start!75130)

(assert (=> start!75130 false))

(declare-fun e!492827 () Bool)

(assert (=> start!75130 e!492827))

(declare-fun b!885518 () Bool)

(declare-fun tp_is_empty!17785 () Bool)

(declare-fun tp!54303 () Bool)

(assert (=> b!885518 (= e!492827 (and tp_is_empty!17785 tp!54303))))

(declare-datatypes ((B!1274 0))(
  ( (B!1275 (val!8943 Int)) )
))
(declare-datatypes ((tuple2!11900 0))(
  ( (tuple2!11901 (_1!5961 (_ BitVec 64)) (_2!5961 B!1274)) )
))
(declare-datatypes ((List!17667 0))(
  ( (Nil!17664) (Cons!17663 (h!18794 tuple2!11900) (t!24935 List!17667)) )
))
(declare-fun l!906 () List!17667)

(get-info :version)

(assert (= (and start!75130 ((_ is Cons!17663) l!906)) b!885518))

(check-sat (not b!885518) tp_is_empty!17785)
(check-sat)
