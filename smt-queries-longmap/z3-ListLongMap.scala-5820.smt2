; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75250 () Bool)

(assert start!75250)

(assert (=> start!75250 false))

(declare-fun e!493260 () Bool)

(assert (=> start!75250 e!493260))

(assert (=> start!75250 true))

(declare-fun b!886153 () Bool)

(declare-fun tp_is_empty!17749 () Bool)

(declare-fun tp!54231 () Bool)

(assert (=> b!886153 (= e!493260 (and tp_is_empty!17749 tp!54231))))

(declare-datatypes ((B!1238 0))(
  ( (B!1239 (val!8925 Int)) )
))
(declare-datatypes ((tuple2!11774 0))(
  ( (tuple2!11775 (_1!5898 (_ BitVec 64)) (_2!5898 B!1238)) )
))
(declare-datatypes ((List!17596 0))(
  ( (Nil!17593) (Cons!17592 (h!18729 tuple2!11774) (t!24865 List!17596)) )
))
(declare-fun l!906 () List!17596)

(get-info :version)

(assert (= (and start!75250 ((_ is Cons!17592) l!906)) b!886153))

(check-sat (not b!886153) tp_is_empty!17749)
(check-sat)
