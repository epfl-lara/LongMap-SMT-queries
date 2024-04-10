; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103486 () Bool)

(assert start!103486)

(assert (=> start!103486 false))

(assert (=> start!103486 true))

(declare-datatypes ((B!1782 0))(
  ( (B!1783 (val!15653 Int)) )
))
(declare-datatypes ((tuple2!20178 0))(
  ( (tuple2!20179 (_1!10100 (_ BitVec 64)) (_2!10100 B!1782)) )
))
(declare-datatypes ((List!27318 0))(
  ( (Nil!27315) (Cons!27314 (h!28523 tuple2!20178) (t!40781 List!27318)) )
))
(declare-datatypes ((ListLongMap!18147 0))(
  ( (ListLongMap!18148 (toList!9089 List!27318)) )
))
(declare-fun lm!211 () ListLongMap!18147)

(declare-fun e!703080 () Bool)

(declare-fun inv!42751 (ListLongMap!18147) Bool)

(assert (=> start!103486 (and (inv!42751 lm!211) e!703080)))

(declare-fun b!1240445 () Bool)

(declare-fun tp!92507 () Bool)

(assert (=> b!1240445 (= e!703080 tp!92507)))

(assert (= start!103486 b!1240445))

(declare-fun m!1143737 () Bool)

(assert (=> start!103486 m!1143737))

(push 1)

(assert (not start!103486))

(assert (not b!1240445))

