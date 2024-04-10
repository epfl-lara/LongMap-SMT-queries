; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2494 () Bool)

(assert start!2494)

(declare-fun b_free!515 () Bool)

(declare-fun b_next!515 () Bool)

(assert (=> start!2494 (= b_free!515 (not b_next!515))))

(declare-fun tp!2645 () Bool)

(declare-fun b_and!961 () Bool)

(assert (=> start!2494 (= tp!2645 b_and!961)))

(declare-fun res!11733 () Bool)

(declare-fun e!9458 () Bool)

(assert (=> start!2494 (=> (not res!11733) (not e!9458))))

(declare-datatypes ((B!636 0))(
  ( (B!637 (val!416 Int)) )
))
(declare-datatypes ((tuple2!632 0))(
  ( (tuple2!633 (_1!316 (_ BitVec 64)) (_2!316 B!636)) )
))
(declare-datatypes ((List!491 0))(
  ( (Nil!488) (Cons!487 (h!1053 tuple2!632) (t!2929 List!491)) )
))
(declare-datatypes ((ListLongMap!463 0))(
  ( (ListLongMap!464 (toList!247 List!491)) )
))
(declare-fun lm!238 () ListLongMap!463)

(declare-fun p!262 () Int)

(declare-fun forall!121 (List!491 Int) Bool)

(assert (=> start!2494 (= res!11733 (forall!121 (toList!247 lm!238) p!262))))

(assert (=> start!2494 e!9458))

(declare-fun e!9457 () Bool)

(declare-fun inv!818 (ListLongMap!463) Bool)

(assert (=> start!2494 (and (inv!818 lm!238) e!9457)))

(assert (=> start!2494 tp!2645))

(assert (=> start!2494 true))

(declare-fun b!15540 () Bool)

(declare-fun res!11734 () Bool)

(assert (=> b!15540 (=> (not res!11734) (not e!9458))))

(declare-datatypes ((List!492 0))(
  ( (Nil!489) (Cons!488 (h!1054 (_ BitVec 64)) (t!2930 List!492)) )
))
(declare-fun l!1612 () List!492)

(declare-fun isEmpty!131 (List!492) Bool)

(assert (=> b!15540 (= res!11734 (not (isEmpty!131 l!1612)))))

(declare-fun b!15541 () Bool)

(assert (=> b!15541 (= e!9458 (not true))))

(declare-fun lt!3794 () (_ BitVec 64))

(declare-fun -!20 (ListLongMap!463 (_ BitVec 64)) ListLongMap!463)

(assert (=> b!15541 (forall!121 (toList!247 (-!20 lm!238 lt!3794)) p!262)))

(declare-datatypes ((Unit!304 0))(
  ( (Unit!305) )
))
(declare-fun lt!3795 () Unit!304)

(declare-fun removeValidProp!13 (ListLongMap!463 Int (_ BitVec 64)) Unit!304)

(assert (=> b!15541 (= lt!3795 (removeValidProp!13 lm!238 p!262 lt!3794))))

(declare-fun head!811 (List!492) (_ BitVec 64))

(assert (=> b!15541 (= lt!3794 (head!811 l!1612))))

(declare-fun b!15542 () Bool)

(declare-fun tp!2644 () Bool)

(assert (=> b!15542 (= e!9457 tp!2644)))

(assert (= (and start!2494 res!11733) b!15540))

(assert (= (and b!15540 res!11734) b!15541))

(assert (= start!2494 b!15542))

(declare-fun m!10467 () Bool)

(assert (=> start!2494 m!10467))

(declare-fun m!10469 () Bool)

(assert (=> start!2494 m!10469))

(declare-fun m!10471 () Bool)

(assert (=> b!15540 m!10471))

(declare-fun m!10473 () Bool)

(assert (=> b!15541 m!10473))

(declare-fun m!10475 () Bool)

(assert (=> b!15541 m!10475))

(declare-fun m!10477 () Bool)

(assert (=> b!15541 m!10477))

(declare-fun m!10479 () Bool)

(assert (=> b!15541 m!10479))

(push 1)

(assert (not start!2494))

(assert (not b!15540))

(assert b_and!961)

(assert (not b!15542))

(assert (not b_next!515))

(assert (not b!15541))

(check-sat)

(pop 1)

(push 1)

