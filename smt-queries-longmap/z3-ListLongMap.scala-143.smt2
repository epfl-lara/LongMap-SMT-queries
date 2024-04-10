; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2642 () Bool)

(assert start!2642)

(declare-fun b_free!537 () Bool)

(declare-fun b_next!537 () Bool)

(assert (=> start!2642 (= b_free!537 (not b_next!537))))

(declare-fun tp!2738 () Bool)

(declare-fun b_and!1031 () Bool)

(assert (=> start!2642 (= tp!2738 b_and!1031)))

(assert (=> start!2642 false))

(declare-datatypes ((B!658 0))(
  ( (B!659 (val!427 Int)) )
))
(declare-datatypes ((tuple2!654 0))(
  ( (tuple2!655 (_1!327 (_ BitVec 64)) (_2!327 B!658)) )
))
(declare-datatypes ((List!512 0))(
  ( (Nil!509) (Cons!508 (h!1074 tuple2!654) (t!2998 List!512)) )
))
(declare-datatypes ((ListLongMap!485 0))(
  ( (ListLongMap!486 (toList!258 List!512)) )
))
(declare-fun lm!221 () ListLongMap!485)

(declare-fun e!9662 () Bool)

(declare-fun inv!849 (ListLongMap!485) Bool)

(assert (=> start!2642 (and (inv!849 lm!221) e!9662)))

(assert (=> start!2642 tp!2738))

(declare-fun b!15824 () Bool)

(declare-fun tp!2737 () Bool)

(assert (=> b!15824 (= e!9662 tp!2737)))

(assert (= start!2642 b!15824))

(declare-fun m!10861 () Bool)

(assert (=> start!2642 m!10861))

(check-sat (not start!2642) (not b!15824) b_and!1031 (not b_next!537))
(check-sat b_and!1031 (not b_next!537))
