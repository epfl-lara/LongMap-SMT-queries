; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75024 () Bool)

(assert start!75024)

(assert (=> start!75024 false))

(declare-datatypes ((B!1222 0))(
  ( (B!1223 (val!8917 Int)) )
))
(declare-datatypes ((tuple2!11828 0))(
  ( (tuple2!11829 (_1!5925 (_ BitVec 64)) (_2!5925 B!1222)) )
))
(declare-datatypes ((List!17633 0))(
  ( (Nil!17630) (Cons!17629 (h!18760 tuple2!11828) (t!24910 List!17633)) )
))
(declare-datatypes ((ListLongMap!10597 0))(
  ( (ListLongMap!10598 (toList!5314 List!17633)) )
))
(declare-fun lm!210 () ListLongMap!10597)

(declare-fun e!492501 () Bool)

(declare-fun inv!29354 (ListLongMap!10597) Bool)

(assert (=> start!75024 (and (inv!29354 lm!210) e!492501)))

(declare-fun b!884971 () Bool)

(declare-fun tp!54188 () Bool)

(assert (=> b!884971 (= e!492501 tp!54188)))

(assert (= start!75024 b!884971))

(declare-fun m!825231 () Bool)

(assert (=> start!75024 m!825231))

(check-sat (not start!75024) (not b!884971))
(check-sat)
