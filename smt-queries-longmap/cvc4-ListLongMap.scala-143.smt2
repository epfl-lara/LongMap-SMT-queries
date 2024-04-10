; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2644 () Bool)

(assert start!2644)

(declare-fun b_free!539 () Bool)

(declare-fun b_next!539 () Bool)

(assert (=> start!2644 (= b_free!539 (not b_next!539))))

(declare-fun tp!2744 () Bool)

(declare-fun b_and!1033 () Bool)

(assert (=> start!2644 (= tp!2744 b_and!1033)))

(assert (=> start!2644 false))

(declare-datatypes ((B!660 0))(
  ( (B!661 (val!428 Int)) )
))
(declare-datatypes ((tuple2!656 0))(
  ( (tuple2!657 (_1!328 (_ BitVec 64)) (_2!328 B!660)) )
))
(declare-datatypes ((List!513 0))(
  ( (Nil!510) (Cons!509 (h!1075 tuple2!656) (t!2999 List!513)) )
))
(declare-datatypes ((ListLongMap!487 0))(
  ( (ListLongMap!488 (toList!259 List!513)) )
))
(declare-fun lm!221 () ListLongMap!487)

(declare-fun e!9665 () Bool)

(declare-fun inv!850 (ListLongMap!487) Bool)

(assert (=> start!2644 (and (inv!850 lm!221) e!9665)))

(assert (=> start!2644 tp!2744))

(declare-fun b!15827 () Bool)

(declare-fun tp!2743 () Bool)

(assert (=> b!15827 (= e!9665 tp!2743)))

(assert (= start!2644 b!15827))

(declare-fun m!10863 () Bool)

(assert (=> start!2644 m!10863))

(push 1)

(assert (not start!2644))

(assert (not b!15827))

(assert b_and!1033)

(assert (not b_next!539))

(check-sat)

