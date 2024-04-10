; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103482 () Bool)

(assert start!103482)

(assert (=> start!103482 false))

(assert (=> start!103482 true))

(declare-datatypes ((B!1778 0))(
  ( (B!1779 (val!15651 Int)) )
))
(declare-datatypes ((tuple2!20174 0))(
  ( (tuple2!20175 (_1!10098 (_ BitVec 64)) (_2!10098 B!1778)) )
))
(declare-datatypes ((List!27316 0))(
  ( (Nil!27313) (Cons!27312 (h!28521 tuple2!20174) (t!40779 List!27316)) )
))
(declare-datatypes ((ListLongMap!18143 0))(
  ( (ListLongMap!18144 (toList!9087 List!27316)) )
))
(declare-fun lm!211 () ListLongMap!18143)

(declare-fun e!703074 () Bool)

(declare-fun inv!42749 (ListLongMap!18143) Bool)

(assert (=> start!103482 (and (inv!42749 lm!211) e!703074)))

(declare-fun b!1240439 () Bool)

(declare-fun tp!92501 () Bool)

(assert (=> b!1240439 (= e!703074 tp!92501)))

(assert (= start!103482 b!1240439))

(declare-fun m!1143733 () Bool)

(assert (=> start!103482 m!1143733))

(push 1)

(assert (not start!103482))

(assert (not b!1240439))

(check-sat)

(pop 1)

