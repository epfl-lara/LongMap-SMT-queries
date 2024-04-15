; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

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
(declare-datatypes ((tuple2!648 0))(
  ( (tuple2!649 (_1!324 (_ BitVec 64)) (_2!324 B!656)) )
))
(declare-datatypes ((List!507 0))(
  ( (Nil!504) (Cons!503 (h!1069 tuple2!648) (t!2993 List!507)) )
))
(declare-datatypes ((ListLongMap!479 0))(
  ( (ListLongMap!480 (toList!255 List!507)) )
))
(declare-fun lm!221 () ListLongMap!479)

(declare-fun e!9659 () Bool)

(declare-fun inv!848 (ListLongMap!479) Bool)

(assert (=> start!2640 (and (inv!848 lm!221) e!9659)))

(assert (=> start!2640 tp!2732))

(declare-fun b!15821 () Bool)

(declare-fun tp!2731 () Bool)

(assert (=> b!15821 (= e!9659 tp!2731)))

(assert (= start!2640 b!15821))

(declare-fun m!10851 () Bool)

(assert (=> start!2640 m!10851))

(check-sat (not start!2640) (not b!15821) b_and!1029 (not b_next!535))
(check-sat b_and!1029 (not b_next!535))
