; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103480 () Bool)

(assert start!103480)

(assert (=> start!103480 false))

(assert (=> start!103480 true))

(declare-datatypes ((B!1784 0))(
  ( (B!1785 (val!15654 Int)) )
))
(declare-datatypes ((tuple2!20264 0))(
  ( (tuple2!20265 (_1!10143 (_ BitVec 64)) (_2!10143 B!1784)) )
))
(declare-datatypes ((List!27381 0))(
  ( (Nil!27378) (Cons!27377 (h!28586 tuple2!20264) (t!40835 List!27381)) )
))
(declare-datatypes ((ListLongMap!18233 0))(
  ( (ListLongMap!18234 (toList!9132 List!27381)) )
))
(declare-fun lm!211 () ListLongMap!18233)

(declare-fun e!703032 () Bool)

(declare-fun inv!42757 (ListLongMap!18233) Bool)

(assert (=> start!103480 (and (inv!42757 lm!211) e!703032)))

(declare-fun b!1240360 () Bool)

(declare-fun tp!92510 () Bool)

(assert (=> b!1240360 (= e!703032 tp!92510)))

(assert (= start!103480 b!1240360))

(declare-fun m!1143207 () Bool)

(assert (=> start!103480 m!1143207))

(check-sat (not start!103480) (not b!1240360))
(check-sat)
