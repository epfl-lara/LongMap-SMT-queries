; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2454 () Bool)

(assert start!2454)

(declare-fun b_free!493 () Bool)

(declare-fun b_next!493 () Bool)

(assert (=> start!2454 (= b_free!493 (not b_next!493))))

(declare-fun tp!2570 () Bool)

(declare-fun b_and!933 () Bool)

(assert (=> start!2454 (= tp!2570 b_and!933)))

(declare-fun res!11676 () Bool)

(declare-fun e!9365 () Bool)

(assert (=> start!2454 (=> (not res!11676) (not e!9365))))

(declare-datatypes ((B!614 0))(
  ( (B!615 (val!405 Int)) )
))
(declare-datatypes ((tuple2!606 0))(
  ( (tuple2!607 (_1!303 (_ BitVec 64)) (_2!303 B!614)) )
))
(declare-datatypes ((List!468 0))(
  ( (Nil!465) (Cons!464 (h!1030 tuple2!606) (t!2900 List!468)) )
))
(declare-datatypes ((ListLongMap!437 0))(
  ( (ListLongMap!438 (toList!234 List!468)) )
))
(declare-fun lm!238 () ListLongMap!437)

(declare-fun p!262 () Int)

(declare-fun forall!113 (List!468 Int) Bool)

(assert (=> start!2454 (= res!11676 (forall!113 (toList!234 lm!238) p!262))))

(assert (=> start!2454 e!9365))

(declare-fun e!9364 () Bool)

(declare-fun inv!792 (ListLongMap!437) Bool)

(assert (=> start!2454 (and (inv!792 lm!238) e!9364)))

(assert (=> start!2454 tp!2570))

(assert (=> start!2454 true))

(declare-fun b!15417 () Bool)

(declare-fun res!11677 () Bool)

(assert (=> b!15417 (=> (not res!11677) (not e!9365))))

(declare-datatypes ((List!469 0))(
  ( (Nil!466) (Cons!465 (h!1031 (_ BitVec 64)) (t!2901 List!469)) )
))
(declare-fun l!1612 () List!469)

(declare-fun isEmpty!126 (List!469) Bool)

(assert (=> b!15417 (= res!11677 (not (isEmpty!126 l!1612)))))

(declare-fun b!15418 () Bool)

(assert (=> b!15418 (= e!9365 (not true))))

(declare-fun lt!3756 () (_ BitVec 64))

(declare-fun -!15 (ListLongMap!437 (_ BitVec 64)) ListLongMap!437)

(assert (=> b!15418 (forall!113 (toList!234 (-!15 lm!238 lt!3756)) p!262)))

(declare-datatypes ((Unit!304 0))(
  ( (Unit!305) )
))
(declare-fun lt!3755 () Unit!304)

(declare-fun removeValidProp!8 (ListLongMap!437 Int (_ BitVec 64)) Unit!304)

(assert (=> b!15418 (= lt!3755 (removeValidProp!8 lm!238 p!262 lt!3756))))

(declare-fun head!806 (List!469) (_ BitVec 64))

(assert (=> b!15418 (= lt!3756 (head!806 l!1612))))

(declare-fun b!15419 () Bool)

(declare-fun tp!2569 () Bool)

(assert (=> b!15419 (= e!9364 tp!2569)))

(assert (= (and start!2454 res!11676) b!15417))

(assert (= (and b!15417 res!11677) b!15418))

(assert (= start!2454 b!15419))

(declare-fun m!10341 () Bool)

(assert (=> start!2454 m!10341))

(declare-fun m!10343 () Bool)

(assert (=> start!2454 m!10343))

(declare-fun m!10345 () Bool)

(assert (=> b!15417 m!10345))

(declare-fun m!10347 () Bool)

(assert (=> b!15418 m!10347))

(declare-fun m!10349 () Bool)

(assert (=> b!15418 m!10349))

(declare-fun m!10351 () Bool)

(assert (=> b!15418 m!10351))

(declare-fun m!10353 () Bool)

(assert (=> b!15418 m!10353))

(check-sat (not b_next!493) b_and!933 (not b!15419) (not b!15417) (not b!15418) (not start!2454))
(check-sat b_and!933 (not b_next!493))
