; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103490 () Bool)

(assert start!103490)

(assert (=> start!103490 false))

(assert (=> start!103490 true))

(declare-datatypes ((B!1786 0))(
  ( (B!1787 (val!15655 Int)) )
))
(declare-datatypes ((tuple2!20182 0))(
  ( (tuple2!20183 (_1!10102 (_ BitVec 64)) (_2!10102 B!1786)) )
))
(declare-datatypes ((List!27320 0))(
  ( (Nil!27317) (Cons!27316 (h!28525 tuple2!20182) (t!40783 List!27320)) )
))
(declare-datatypes ((ListLongMap!18151 0))(
  ( (ListLongMap!18152 (toList!9091 List!27320)) )
))
(declare-fun lm!211 () ListLongMap!18151)

(declare-fun e!703086 () Bool)

(declare-fun inv!42758 (ListLongMap!18151) Bool)

(assert (=> start!103490 (and (inv!42758 lm!211) e!703086)))

(declare-fun b!1240451 () Bool)

(declare-fun tp!92513 () Bool)

(assert (=> b!1240451 (= e!703086 tp!92513)))

(assert (= start!103490 b!1240451))

(declare-fun m!1143741 () Bool)

(assert (=> start!103490 m!1143741))

(check-sat (not start!103490) (not b!1240451))
(check-sat)
