; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2490 () Bool)

(assert start!2490)

(declare-fun b_free!511 () Bool)

(declare-fun b_next!511 () Bool)

(assert (=> start!2490 (= b_free!511 (not b_next!511))))

(declare-fun tp!2632 () Bool)

(declare-fun b_and!957 () Bool)

(assert (=> start!2490 (= tp!2632 b_and!957)))

(declare-fun res!11720 () Bool)

(declare-fun e!9441 () Bool)

(assert (=> start!2490 (=> (not res!11720) (not e!9441))))

(declare-datatypes ((B!632 0))(
  ( (B!633 (val!414 Int)) )
))
(declare-datatypes ((tuple2!624 0))(
  ( (tuple2!625 (_1!312 (_ BitVec 64)) (_2!312 B!632)) )
))
(declare-datatypes ((List!483 0))(
  ( (Nil!480) (Cons!479 (h!1045 tuple2!624) (t!2921 List!483)) )
))
(declare-datatypes ((ListLongMap!455 0))(
  ( (ListLongMap!456 (toList!243 List!483)) )
))
(declare-fun lm!238 () ListLongMap!455)

(declare-fun p!262 () Int)

(declare-fun forall!119 (List!483 Int) Bool)

(assert (=> start!2490 (= res!11720 (forall!119 (toList!243 lm!238) p!262))))

(assert (=> start!2490 e!9441))

(declare-fun e!9442 () Bool)

(declare-fun inv!816 (ListLongMap!455) Bool)

(assert (=> start!2490 (and (inv!816 lm!238) e!9442)))

(assert (=> start!2490 tp!2632))

(assert (=> start!2490 true))

(declare-fun b!15516 () Bool)

(declare-fun res!11719 () Bool)

(assert (=> b!15516 (=> (not res!11719) (not e!9441))))

(declare-datatypes ((List!484 0))(
  ( (Nil!481) (Cons!480 (h!1046 (_ BitVec 64)) (t!2922 List!484)) )
))
(declare-fun l!1612 () List!484)

(declare-fun isEmpty!129 (List!484) Bool)

(assert (=> b!15516 (= res!11719 (not (isEmpty!129 l!1612)))))

(declare-fun b!15517 () Bool)

(assert (=> b!15517 (= e!9441 (not true))))

(declare-fun lt!3782 () (_ BitVec 64))

(declare-fun -!18 (ListLongMap!455 (_ BitVec 64)) ListLongMap!455)

(assert (=> b!15517 (forall!119 (toList!243 (-!18 lm!238 lt!3782)) p!262)))

(declare-datatypes ((Unit!310 0))(
  ( (Unit!311) )
))
(declare-fun lt!3783 () Unit!310)

(declare-fun removeValidProp!11 (ListLongMap!455 Int (_ BitVec 64)) Unit!310)

(assert (=> b!15517 (= lt!3783 (removeValidProp!11 lm!238 p!262 lt!3782))))

(declare-fun head!807 (List!484) (_ BitVec 64))

(assert (=> b!15517 (= lt!3782 (head!807 l!1612))))

(declare-fun b!15518 () Bool)

(declare-fun tp!2633 () Bool)

(assert (=> b!15518 (= e!9442 tp!2633)))

(assert (= (and start!2490 res!11720) b!15516))

(assert (= (and b!15516 res!11719) b!15517))

(assert (= start!2490 b!15518))

(declare-fun m!10431 () Bool)

(assert (=> start!2490 m!10431))

(declare-fun m!10433 () Bool)

(assert (=> start!2490 m!10433))

(declare-fun m!10435 () Bool)

(assert (=> b!15516 m!10435))

(declare-fun m!10437 () Bool)

(assert (=> b!15517 m!10437))

(declare-fun m!10439 () Bool)

(assert (=> b!15517 m!10439))

(declare-fun m!10441 () Bool)

(assert (=> b!15517 m!10441))

(declare-fun m!10443 () Bool)

(assert (=> b!15517 m!10443))

(check-sat (not start!2490) (not b!15516) (not b_next!511) b_and!957 (not b!15518) (not b!15517))
(check-sat b_and!957 (not b_next!511))
