; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103636 () Bool)

(assert start!103636)

(assert (=> start!103636 false))

(assert (=> start!103636 true))

(declare-fun e!703623 () Bool)

(assert (=> start!103636 e!703623))

(declare-fun b!1241377 () Bool)

(declare-fun tp_is_empty!31237 () Bool)

(declare-fun tp!92627 () Bool)

(assert (=> b!1241377 (= e!703623 (and tp_is_empty!31237 tp!92627))))

(declare-datatypes ((B!1838 0))(
  ( (B!1839 (val!15681 Int)) )
))
(declare-datatypes ((tuple2!20318 0))(
  ( (tuple2!20319 (_1!10170 (_ BitVec 64)) (_2!10170 B!1838)) )
))
(declare-datatypes ((List!27408 0))(
  ( (Nil!27405) (Cons!27404 (h!28613 tuple2!20318) (t!40862 List!27408)) )
))
(declare-fun l!644 () List!27408)

(get-info :version)

(assert (= (and start!103636 ((_ is Cons!27404) l!644)) b!1241377))

(check-sat (not b!1241377) tp_is_empty!31237)
(check-sat)
