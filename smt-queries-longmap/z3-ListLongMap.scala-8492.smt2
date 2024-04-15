; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103474 () Bool)

(assert start!103474)

(assert (=> start!103474 false))

(assert (=> start!103474 true))

(declare-datatypes ((B!1778 0))(
  ( (B!1779 (val!15651 Int)) )
))
(declare-datatypes ((tuple2!20258 0))(
  ( (tuple2!20259 (_1!10140 (_ BitVec 64)) (_2!10140 B!1778)) )
))
(declare-datatypes ((List!27378 0))(
  ( (Nil!27375) (Cons!27374 (h!28583 tuple2!20258) (t!40832 List!27378)) )
))
(declare-datatypes ((ListLongMap!18227 0))(
  ( (ListLongMap!18228 (toList!9129 List!27378)) )
))
(declare-fun lm!211 () ListLongMap!18227)

(declare-fun e!703023 () Bool)

(declare-fun inv!42749 (ListLongMap!18227) Bool)

(assert (=> start!103474 (and (inv!42749 lm!211) e!703023)))

(declare-fun b!1240351 () Bool)

(declare-fun tp!92501 () Bool)

(assert (=> b!1240351 (= e!703023 tp!92501)))

(assert (= start!103474 b!1240351))

(declare-fun m!1143201 () Bool)

(assert (=> start!103474 m!1143201))

(check-sat (not start!103474) (not b!1240351))
(check-sat)
