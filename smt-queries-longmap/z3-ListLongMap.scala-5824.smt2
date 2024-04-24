; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75292 () Bool)

(assert start!75292)

(assert (=> start!75292 false))

(declare-fun e!493452 () Bool)

(assert (=> start!75292 e!493452))

(declare-fun b!886495 () Bool)

(declare-fun tp_is_empty!17773 () Bool)

(declare-fun tp!54276 () Bool)

(assert (=> b!886495 (= e!493452 (and tp_is_empty!17773 tp!54276))))

(declare-datatypes ((B!1262 0))(
  ( (B!1263 (val!8937 Int)) )
))
(declare-datatypes ((tuple2!11798 0))(
  ( (tuple2!11799 (_1!5910 (_ BitVec 64)) (_2!5910 B!1262)) )
))
(declare-datatypes ((List!17608 0))(
  ( (Nil!17605) (Cons!17604 (h!18741 tuple2!11798) (t!24877 List!17608)) )
))
(declare-fun l!906 () List!17608)

(get-info :version)

(assert (= (and start!75292 ((_ is Cons!17604) l!906)) b!886495))

(check-sat (not b!886495) tp_is_empty!17773)
(check-sat)
