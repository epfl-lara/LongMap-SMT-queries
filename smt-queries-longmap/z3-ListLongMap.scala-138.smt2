; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2486 () Bool)

(assert start!2486)

(declare-fun b_free!507 () Bool)

(declare-fun b_next!507 () Bool)

(assert (=> start!2486 (= b_free!507 (not b_next!507))))

(declare-fun tp!2621 () Bool)

(declare-fun b_and!953 () Bool)

(assert (=> start!2486 (= tp!2621 b_and!953)))

(assert (=> start!2486 false))

(declare-datatypes ((B!628 0))(
  ( (B!629 (val!412 Int)) )
))
(declare-datatypes ((tuple2!624 0))(
  ( (tuple2!625 (_1!312 (_ BitVec 64)) (_2!312 B!628)) )
))
(declare-datatypes ((List!485 0))(
  ( (Nil!482) (Cons!481 (h!1047 tuple2!624) (t!2923 List!485)) )
))
(declare-datatypes ((ListLongMap!455 0))(
  ( (ListLongMap!456 (toList!243 List!485)) )
))
(declare-fun lm!238 () ListLongMap!455)

(declare-fun e!9437 () Bool)

(declare-fun inv!809 (ListLongMap!455) Bool)

(assert (=> start!2486 (and (inv!809 lm!238) e!9437)))

(assert (=> start!2486 tp!2621))

(declare-fun b!15512 () Bool)

(declare-fun tp!2620 () Bool)

(assert (=> b!15512 (= e!9437 tp!2620)))

(assert (= start!2486 b!15512))

(declare-fun m!10435 () Bool)

(assert (=> start!2486 m!10435))

(check-sat (not start!2486) (not b!15512) b_and!953 (not b_next!507))
(check-sat b_and!953 (not b_next!507))
