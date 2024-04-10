; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103484 () Bool)

(assert start!103484)

(assert (=> start!103484 false))

(assert (=> start!103484 true))

(declare-datatypes ((B!1780 0))(
  ( (B!1781 (val!15652 Int)) )
))
(declare-datatypes ((tuple2!20176 0))(
  ( (tuple2!20177 (_1!10099 (_ BitVec 64)) (_2!10099 B!1780)) )
))
(declare-datatypes ((List!27317 0))(
  ( (Nil!27314) (Cons!27313 (h!28522 tuple2!20176) (t!40780 List!27317)) )
))
(declare-datatypes ((ListLongMap!18145 0))(
  ( (ListLongMap!18146 (toList!9088 List!27317)) )
))
(declare-fun lm!211 () ListLongMap!18145)

(declare-fun e!703077 () Bool)

(declare-fun inv!42750 (ListLongMap!18145) Bool)

(assert (=> start!103484 (and (inv!42750 lm!211) e!703077)))

(declare-fun b!1240442 () Bool)

(declare-fun tp!92504 () Bool)

(assert (=> b!1240442 (= e!703077 tp!92504)))

(assert (= start!103484 b!1240442))

(declare-fun m!1143735 () Bool)

(assert (=> start!103484 m!1143735))

(check-sat (not start!103484) (not b!1240442))
(check-sat)
