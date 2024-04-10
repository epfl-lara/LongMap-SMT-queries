; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75084 () Bool)

(assert start!75084)

(assert (=> start!75084 false))

(declare-fun e!492681 () Bool)

(assert (=> start!75084 e!492681))

(assert (=> start!75084 true))

(declare-fun b!885253 () Bool)

(declare-fun tp_is_empty!17751 () Bool)

(declare-fun tp!54233 () Bool)

(assert (=> b!885253 (= e!492681 (and tp_is_empty!17751 tp!54233))))

(declare-datatypes ((B!1240 0))(
  ( (B!1241 (val!8926 Int)) )
))
(declare-datatypes ((tuple2!11846 0))(
  ( (tuple2!11847 (_1!5934 (_ BitVec 64)) (_2!5934 B!1240)) )
))
(declare-datatypes ((List!17642 0))(
  ( (Nil!17639) (Cons!17638 (h!18769 tuple2!11846) (t!24919 List!17642)) )
))
(declare-fun l!906 () List!17642)

(get-info :version)

(assert (= (and start!75084 ((_ is Cons!17638) l!906)) b!885253))

(check-sat (not b!885253) tp_is_empty!17751)
(check-sat)
