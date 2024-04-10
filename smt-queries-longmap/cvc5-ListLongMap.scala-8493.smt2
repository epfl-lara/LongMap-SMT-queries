; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103488 () Bool)

(assert start!103488)

(assert (=> start!103488 false))

(assert (=> start!103488 true))

(declare-datatypes ((B!1784 0))(
  ( (B!1785 (val!15654 Int)) )
))
(declare-datatypes ((tuple2!20180 0))(
  ( (tuple2!20181 (_1!10101 (_ BitVec 64)) (_2!10101 B!1784)) )
))
(declare-datatypes ((List!27319 0))(
  ( (Nil!27316) (Cons!27315 (h!28524 tuple2!20180) (t!40782 List!27319)) )
))
(declare-datatypes ((ListLongMap!18149 0))(
  ( (ListLongMap!18150 (toList!9090 List!27319)) )
))
(declare-fun lm!211 () ListLongMap!18149)

(declare-fun e!703083 () Bool)

(declare-fun inv!42757 (ListLongMap!18149) Bool)

(assert (=> start!103488 (and (inv!42757 lm!211) e!703083)))

(declare-fun b!1240448 () Bool)

(declare-fun tp!92510 () Bool)

(assert (=> b!1240448 (= e!703083 tp!92510)))

(assert (= start!103488 b!1240448))

(declare-fun m!1143739 () Bool)

(assert (=> start!103488 m!1143739))

(push 1)

(assert (not start!103488))

(assert (not b!1240448))

(check-sat)

(pop 1)

