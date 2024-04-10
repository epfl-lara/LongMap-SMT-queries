; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103492 () Bool)

(assert start!103492)

(assert (=> start!103492 false))

(assert (=> start!103492 true))

(declare-datatypes ((B!1788 0))(
  ( (B!1789 (val!15656 Int)) )
))
(declare-datatypes ((tuple2!20184 0))(
  ( (tuple2!20185 (_1!10103 (_ BitVec 64)) (_2!10103 B!1788)) )
))
(declare-datatypes ((List!27321 0))(
  ( (Nil!27318) (Cons!27317 (h!28526 tuple2!20184) (t!40784 List!27321)) )
))
(declare-datatypes ((ListLongMap!18153 0))(
  ( (ListLongMap!18154 (toList!9092 List!27321)) )
))
(declare-fun lm!211 () ListLongMap!18153)

(declare-fun e!703089 () Bool)

(declare-fun inv!42759 (ListLongMap!18153) Bool)

(assert (=> start!103492 (and (inv!42759 lm!211) e!703089)))

(declare-fun b!1240454 () Bool)

(declare-fun tp!92516 () Bool)

(assert (=> b!1240454 (= e!703089 tp!92516)))

(assert (= start!103492 b!1240454))

(declare-fun m!1143743 () Bool)

(assert (=> start!103492 m!1143743))

(push 1)

(assert (not start!103492))

(assert (not b!1240454))

(check-sat)

(pop 1)

