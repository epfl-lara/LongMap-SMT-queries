; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2454 () Bool)

(assert start!2454)

(declare-fun b_free!493 () Bool)

(declare-fun b_next!493 () Bool)

(assert (=> start!2454 (= b_free!493 (not b_next!493))))

(declare-fun tp!2570 () Bool)

(declare-fun b_and!933 () Bool)

(assert (=> start!2454 (= tp!2570 b_and!933)))

(declare-fun res!11677 () Bool)

(declare-fun e!9364 () Bool)

(assert (=> start!2454 (=> (not res!11677) (not e!9364))))

(declare-datatypes ((B!614 0))(
  ( (B!615 (val!405 Int)) )
))
(declare-datatypes ((tuple2!610 0))(
  ( (tuple2!611 (_1!305 (_ BitVec 64)) (_2!305 B!614)) )
))
(declare-datatypes ((List!472 0))(
  ( (Nil!469) (Cons!468 (h!1034 tuple2!610) (t!2904 List!472)) )
))
(declare-datatypes ((ListLongMap!441 0))(
  ( (ListLongMap!442 (toList!236 List!472)) )
))
(declare-fun lm!238 () ListLongMap!441)

(declare-fun p!262 () Int)

(declare-fun forall!113 (List!472 Int) Bool)

(assert (=> start!2454 (= res!11677 (forall!113 (toList!236 lm!238) p!262))))

(assert (=> start!2454 e!9364))

(declare-fun e!9365 () Bool)

(declare-fun inv!792 (ListLongMap!441) Bool)

(assert (=> start!2454 (and (inv!792 lm!238) e!9365)))

(assert (=> start!2454 tp!2570))

(assert (=> start!2454 true))

(declare-fun b!15417 () Bool)

(declare-fun res!11676 () Bool)

(assert (=> b!15417 (=> (not res!11676) (not e!9364))))

(declare-datatypes ((List!473 0))(
  ( (Nil!470) (Cons!469 (h!1035 (_ BitVec 64)) (t!2905 List!473)) )
))
(declare-fun l!1612 () List!473)

(declare-fun isEmpty!126 (List!473) Bool)

(assert (=> b!15417 (= res!11676 (not (isEmpty!126 l!1612)))))

(declare-fun b!15418 () Bool)

(assert (=> b!15418 (= e!9364 (not true))))

(declare-fun lt!3756 () (_ BitVec 64))

(declare-fun -!15 (ListLongMap!441 (_ BitVec 64)) ListLongMap!441)

(assert (=> b!15418 (forall!113 (toList!236 (-!15 lm!238 lt!3756)) p!262)))

(declare-datatypes ((Unit!294 0))(
  ( (Unit!295) )
))
(declare-fun lt!3755 () Unit!294)

(declare-fun removeValidProp!8 (ListLongMap!441 Int (_ BitVec 64)) Unit!294)

(assert (=> b!15418 (= lt!3755 (removeValidProp!8 lm!238 p!262 lt!3756))))

(declare-fun head!806 (List!473) (_ BitVec 64))

(assert (=> b!15418 (= lt!3756 (head!806 l!1612))))

(declare-fun b!15419 () Bool)

(declare-fun tp!2569 () Bool)

(assert (=> b!15419 (= e!9365 tp!2569)))

(assert (= (and start!2454 res!11677) b!15417))

(assert (= (and b!15417 res!11676) b!15418))

(assert (= start!2454 b!15419))

(declare-fun m!10349 () Bool)

(assert (=> start!2454 m!10349))

(declare-fun m!10351 () Bool)

(assert (=> start!2454 m!10351))

(declare-fun m!10353 () Bool)

(assert (=> b!15417 m!10353))

(declare-fun m!10355 () Bool)

(assert (=> b!15418 m!10355))

(declare-fun m!10357 () Bool)

(assert (=> b!15418 m!10357))

(declare-fun m!10359 () Bool)

(assert (=> b!15418 m!10359))

(declare-fun m!10361 () Bool)

(assert (=> b!15418 m!10361))

(push 1)

(assert (not b!15417))

(assert (not b_next!493))

(assert (not start!2454))

(assert b_and!933)

(assert (not b!15419))

(assert (not b!15418))

(check-sat)

(pop 1)

(push 1)

(assert b_and!933)

(assert (not b_next!493))

