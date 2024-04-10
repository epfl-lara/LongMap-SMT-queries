; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2456 () Bool)

(assert start!2456)

(declare-fun b_free!495 () Bool)

(declare-fun b_next!495 () Bool)

(assert (=> start!2456 (= b_free!495 (not b_next!495))))

(declare-fun tp!2576 () Bool)

(declare-fun b_and!935 () Bool)

(assert (=> start!2456 (= tp!2576 b_and!935)))

(declare-fun res!11683 () Bool)

(declare-fun e!9370 () Bool)

(assert (=> start!2456 (=> (not res!11683) (not e!9370))))

(declare-datatypes ((B!616 0))(
  ( (B!617 (val!406 Int)) )
))
(declare-datatypes ((tuple2!612 0))(
  ( (tuple2!613 (_1!306 (_ BitVec 64)) (_2!306 B!616)) )
))
(declare-datatypes ((List!474 0))(
  ( (Nil!471) (Cons!470 (h!1036 tuple2!612) (t!2906 List!474)) )
))
(declare-datatypes ((ListLongMap!443 0))(
  ( (ListLongMap!444 (toList!237 List!474)) )
))
(declare-fun lm!238 () ListLongMap!443)

(declare-fun p!262 () Int)

(declare-fun forall!114 (List!474 Int) Bool)

(assert (=> start!2456 (= res!11683 (forall!114 (toList!237 lm!238) p!262))))

(assert (=> start!2456 e!9370))

(declare-fun e!9371 () Bool)

(declare-fun inv!793 (ListLongMap!443) Bool)

(assert (=> start!2456 (and (inv!793 lm!238) e!9371)))

(assert (=> start!2456 tp!2576))

(assert (=> start!2456 true))

(declare-fun b!15426 () Bool)

(declare-fun res!11682 () Bool)

(assert (=> b!15426 (=> (not res!11682) (not e!9370))))

(declare-datatypes ((List!475 0))(
  ( (Nil!472) (Cons!471 (h!1037 (_ BitVec 64)) (t!2907 List!475)) )
))
(declare-fun l!1612 () List!475)

(declare-fun isEmpty!127 (List!475) Bool)

(assert (=> b!15426 (= res!11682 (not (isEmpty!127 l!1612)))))

(declare-fun b!15427 () Bool)

(assert (=> b!15427 (= e!9370 (not true))))

(declare-fun lt!3762 () (_ BitVec 64))

(declare-fun -!16 (ListLongMap!443 (_ BitVec 64)) ListLongMap!443)

(assert (=> b!15427 (forall!114 (toList!237 (-!16 lm!238 lt!3762)) p!262)))

(declare-datatypes ((Unit!296 0))(
  ( (Unit!297) )
))
(declare-fun lt!3761 () Unit!296)

(declare-fun removeValidProp!9 (ListLongMap!443 Int (_ BitVec 64)) Unit!296)

(assert (=> b!15427 (= lt!3761 (removeValidProp!9 lm!238 p!262 lt!3762))))

(declare-fun head!807 (List!475) (_ BitVec 64))

(assert (=> b!15427 (= lt!3762 (head!807 l!1612))))

(declare-fun b!15428 () Bool)

(declare-fun tp!2575 () Bool)

(assert (=> b!15428 (= e!9371 tp!2575)))

(assert (= (and start!2456 res!11683) b!15426))

(assert (= (and b!15426 res!11682) b!15427))

(assert (= start!2456 b!15428))

(declare-fun m!10363 () Bool)

(assert (=> start!2456 m!10363))

(declare-fun m!10365 () Bool)

(assert (=> start!2456 m!10365))

(declare-fun m!10367 () Bool)

(assert (=> b!15426 m!10367))

(declare-fun m!10369 () Bool)

(assert (=> b!15427 m!10369))

(declare-fun m!10371 () Bool)

(assert (=> b!15427 m!10371))

(declare-fun m!10373 () Bool)

(assert (=> b!15427 m!10373))

(declare-fun m!10375 () Bool)

(assert (=> b!15427 m!10375))

(check-sat b_and!935 (not b!15428) (not b_next!495) (not b!15427) (not b!15426) (not start!2456))
(check-sat b_and!935 (not b_next!495))
