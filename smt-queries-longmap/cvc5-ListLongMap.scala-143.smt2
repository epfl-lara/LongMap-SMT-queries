; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2640 () Bool)

(assert start!2640)

(declare-fun b_free!535 () Bool)

(declare-fun b_next!535 () Bool)

(assert (=> start!2640 (= b_free!535 (not b_next!535))))

(declare-fun tp!2732 () Bool)

(declare-fun b_and!1029 () Bool)

(assert (=> start!2640 (= tp!2732 b_and!1029)))

(assert (=> start!2640 false))

(declare-datatypes ((B!656 0))(
  ( (B!657 (val!426 Int)) )
))
(declare-datatypes ((tuple2!652 0))(
  ( (tuple2!653 (_1!326 (_ BitVec 64)) (_2!326 B!656)) )
))
(declare-datatypes ((List!511 0))(
  ( (Nil!508) (Cons!507 (h!1073 tuple2!652) (t!2997 List!511)) )
))
(declare-datatypes ((ListLongMap!483 0))(
  ( (ListLongMap!484 (toList!257 List!511)) )
))
(declare-fun lm!221 () ListLongMap!483)

(declare-fun e!9659 () Bool)

(declare-fun inv!848 (ListLongMap!483) Bool)

(assert (=> start!2640 (and (inv!848 lm!221) e!9659)))

(assert (=> start!2640 tp!2732))

(declare-fun b!15821 () Bool)

(declare-fun tp!2731 () Bool)

(assert (=> b!15821 (= e!9659 tp!2731)))

(assert (= start!2640 b!15821))

(declare-fun m!10859 () Bool)

(assert (=> start!2640 m!10859))

(push 1)

(assert (not start!2640))

(assert (not b!15821))

(assert b_and!1029)

(assert (not b_next!535))

(check-sat)

(pop 1)

