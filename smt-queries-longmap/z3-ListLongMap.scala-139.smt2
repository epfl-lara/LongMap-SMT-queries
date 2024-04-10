; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2492 () Bool)

(assert start!2492)

(declare-fun b_free!513 () Bool)

(declare-fun b_next!513 () Bool)

(assert (=> start!2492 (= b_free!513 (not b_next!513))))

(declare-fun tp!2638 () Bool)

(declare-fun b_and!959 () Bool)

(assert (=> start!2492 (= tp!2638 b_and!959)))

(declare-fun res!11728 () Bool)

(declare-fun e!9451 () Bool)

(assert (=> start!2492 (=> (not res!11728) (not e!9451))))

(declare-datatypes ((B!634 0))(
  ( (B!635 (val!415 Int)) )
))
(declare-datatypes ((tuple2!630 0))(
  ( (tuple2!631 (_1!315 (_ BitVec 64)) (_2!315 B!634)) )
))
(declare-datatypes ((List!489 0))(
  ( (Nil!486) (Cons!485 (h!1051 tuple2!630) (t!2927 List!489)) )
))
(declare-datatypes ((ListLongMap!461 0))(
  ( (ListLongMap!462 (toList!246 List!489)) )
))
(declare-fun lm!238 () ListLongMap!461)

(declare-fun p!262 () Int)

(declare-fun forall!120 (List!489 Int) Bool)

(assert (=> start!2492 (= res!11728 (forall!120 (toList!246 lm!238) p!262))))

(assert (=> start!2492 e!9451))

(declare-fun e!9452 () Bool)

(declare-fun inv!817 (ListLongMap!461) Bool)

(assert (=> start!2492 (and (inv!817 lm!238) e!9452)))

(assert (=> start!2492 tp!2638))

(assert (=> start!2492 true))

(declare-fun b!15531 () Bool)

(declare-fun res!11727 () Bool)

(assert (=> b!15531 (=> (not res!11727) (not e!9451))))

(declare-datatypes ((List!490 0))(
  ( (Nil!487) (Cons!486 (h!1052 (_ BitVec 64)) (t!2928 List!490)) )
))
(declare-fun l!1612 () List!490)

(declare-fun isEmpty!130 (List!490) Bool)

(assert (=> b!15531 (= res!11727 (not (isEmpty!130 l!1612)))))

(declare-fun b!15532 () Bool)

(assert (=> b!15532 (= e!9451 (not true))))

(declare-fun lt!3788 () (_ BitVec 64))

(declare-fun -!19 (ListLongMap!461 (_ BitVec 64)) ListLongMap!461)

(assert (=> b!15532 (forall!120 (toList!246 (-!19 lm!238 lt!3788)) p!262)))

(declare-datatypes ((Unit!302 0))(
  ( (Unit!303) )
))
(declare-fun lt!3789 () Unit!302)

(declare-fun removeValidProp!12 (ListLongMap!461 Int (_ BitVec 64)) Unit!302)

(assert (=> b!15532 (= lt!3789 (removeValidProp!12 lm!238 p!262 lt!3788))))

(declare-fun head!810 (List!490) (_ BitVec 64))

(assert (=> b!15532 (= lt!3788 (head!810 l!1612))))

(declare-fun b!15533 () Bool)

(declare-fun tp!2639 () Bool)

(assert (=> b!15533 (= e!9452 tp!2639)))

(assert (= (and start!2492 res!11728) b!15531))

(assert (= (and b!15531 res!11727) b!15532))

(assert (= start!2492 b!15533))

(declare-fun m!10453 () Bool)

(assert (=> start!2492 m!10453))

(declare-fun m!10455 () Bool)

(assert (=> start!2492 m!10455))

(declare-fun m!10457 () Bool)

(assert (=> b!15531 m!10457))

(declare-fun m!10459 () Bool)

(assert (=> b!15532 m!10459))

(declare-fun m!10461 () Bool)

(assert (=> b!15532 m!10461))

(declare-fun m!10463 () Bool)

(assert (=> b!15532 m!10463))

(declare-fun m!10465 () Bool)

(assert (=> b!15532 m!10465))

(check-sat (not b!15533) (not b!15532) b_and!959 (not start!2492) (not b!15531) (not b_next!513))
(check-sat b_and!959 (not b_next!513))
