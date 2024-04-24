; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103880 () Bool)

(assert start!103880)

(assert (=> start!103880 false))

(assert (=> start!103880 true))

(declare-fun e!704537 () Bool)

(assert (=> start!103880 e!704537))

(declare-fun b!1242789 () Bool)

(declare-fun tp_is_empty!31237 () Bool)

(declare-fun tp!92627 () Bool)

(assert (=> b!1242789 (= e!704537 (and tp_is_empty!31237 tp!92627))))

(declare-datatypes ((B!1838 0))(
  ( (B!1839 (val!15681 Int)) )
))
(declare-datatypes ((tuple2!20250 0))(
  ( (tuple2!20251 (_1!10136 (_ BitVec 64)) (_2!10136 B!1838)) )
))
(declare-datatypes ((List!27371 0))(
  ( (Nil!27368) (Cons!27367 (h!28585 tuple2!20250) (t!40826 List!27371)) )
))
(declare-fun l!644 () List!27371)

(get-info :version)

(assert (= (and start!103880 ((_ is Cons!27367) l!644)) b!1242789))

(check-sat (not b!1242789) tp_is_empty!31237)
(check-sat)
