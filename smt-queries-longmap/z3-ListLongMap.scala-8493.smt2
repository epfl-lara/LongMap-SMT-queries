; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103724 () Bool)

(assert start!103724)

(assert (=> start!103724 false))

(assert (=> start!103724 true))

(declare-datatypes ((B!1784 0))(
  ( (B!1785 (val!15654 Int)) )
))
(declare-datatypes ((tuple2!20196 0))(
  ( (tuple2!20197 (_1!10109 (_ BitVec 64)) (_2!10109 B!1784)) )
))
(declare-datatypes ((List!27344 0))(
  ( (Nil!27341) (Cons!27340 (h!28558 tuple2!20196) (t!40799 List!27344)) )
))
(declare-datatypes ((ListLongMap!18173 0))(
  ( (ListLongMap!18174 (toList!9102 List!27344)) )
))
(declare-fun lm!211 () ListLongMap!18173)

(declare-fun e!703946 () Bool)

(declare-fun inv!42757 (ListLongMap!18173) Bool)

(assert (=> start!103724 (and (inv!42757 lm!211) e!703946)))

(declare-fun b!1241772 () Bool)

(declare-fun tp!92510 () Bool)

(assert (=> b!1241772 (= e!703946 tp!92510)))

(assert (= start!103724 b!1241772))

(declare-fun m!1145383 () Bool)

(assert (=> start!103724 m!1145383))

(check-sat (not start!103724) (not b!1241772))
(check-sat)
