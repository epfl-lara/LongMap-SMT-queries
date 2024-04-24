; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103718 () Bool)

(assert start!103718)

(assert (=> start!103718 false))

(assert (=> start!103718 true))

(declare-datatypes ((B!1778 0))(
  ( (B!1779 (val!15651 Int)) )
))
(declare-datatypes ((tuple2!20190 0))(
  ( (tuple2!20191 (_1!10106 (_ BitVec 64)) (_2!10106 B!1778)) )
))
(declare-datatypes ((List!27341 0))(
  ( (Nil!27338) (Cons!27337 (h!28555 tuple2!20190) (t!40796 List!27341)) )
))
(declare-datatypes ((ListLongMap!18167 0))(
  ( (ListLongMap!18168 (toList!9099 List!27341)) )
))
(declare-fun lm!211 () ListLongMap!18167)

(declare-fun e!703937 () Bool)

(declare-fun inv!42749 (ListLongMap!18167) Bool)

(assert (=> start!103718 (and (inv!42749 lm!211) e!703937)))

(declare-fun b!1241763 () Bool)

(declare-fun tp!92501 () Bool)

(assert (=> b!1241763 (= e!703937 tp!92501)))

(assert (= start!103718 b!1241763))

(declare-fun m!1145377 () Bool)

(assert (=> start!103718 m!1145377))

(check-sat (not start!103718) (not b!1241763))
(check-sat)
