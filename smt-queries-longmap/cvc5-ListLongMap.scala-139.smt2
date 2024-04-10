; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2490 () Bool)

(assert start!2490)

(declare-fun b_free!511 () Bool)

(declare-fun b_next!511 () Bool)

(assert (=> start!2490 (= b_free!511 (not b_next!511))))

(declare-fun tp!2633 () Bool)

(declare-fun b_and!957 () Bool)

(assert (=> start!2490 (= tp!2633 b_and!957)))

(declare-fun res!11721 () Bool)

(declare-fun e!9445 () Bool)

(assert (=> start!2490 (=> (not res!11721) (not e!9445))))

(declare-datatypes ((B!632 0))(
  ( (B!633 (val!414 Int)) )
))
(declare-datatypes ((tuple2!628 0))(
  ( (tuple2!629 (_1!314 (_ BitVec 64)) (_2!314 B!632)) )
))
(declare-datatypes ((List!487 0))(
  ( (Nil!484) (Cons!483 (h!1049 tuple2!628) (t!2925 List!487)) )
))
(declare-datatypes ((ListLongMap!459 0))(
  ( (ListLongMap!460 (toList!245 List!487)) )
))
(declare-fun lm!238 () ListLongMap!459)

(declare-fun p!262 () Int)

(declare-fun forall!119 (List!487 Int) Bool)

(assert (=> start!2490 (= res!11721 (forall!119 (toList!245 lm!238) p!262))))

(assert (=> start!2490 e!9445))

(declare-fun e!9446 () Bool)

(declare-fun inv!816 (ListLongMap!459) Bool)

(assert (=> start!2490 (and (inv!816 lm!238) e!9446)))

(assert (=> start!2490 tp!2633))

(assert (=> start!2490 true))

(declare-fun b!15522 () Bool)

(declare-fun res!11722 () Bool)

(assert (=> b!15522 (=> (not res!11722) (not e!9445))))

(declare-datatypes ((List!488 0))(
  ( (Nil!485) (Cons!484 (h!1050 (_ BitVec 64)) (t!2926 List!488)) )
))
(declare-fun l!1612 () List!488)

(declare-fun isEmpty!129 (List!488) Bool)

(assert (=> b!15522 (= res!11722 (not (isEmpty!129 l!1612)))))

(declare-fun b!15523 () Bool)

(assert (=> b!15523 (= e!9445 (not true))))

(declare-fun lt!3782 () (_ BitVec 64))

(declare-fun -!18 (ListLongMap!459 (_ BitVec 64)) ListLongMap!459)

(assert (=> b!15523 (forall!119 (toList!245 (-!18 lm!238 lt!3782)) p!262)))

(declare-datatypes ((Unit!300 0))(
  ( (Unit!301) )
))
(declare-fun lt!3783 () Unit!300)

(declare-fun removeValidProp!11 (ListLongMap!459 Int (_ BitVec 64)) Unit!300)

(assert (=> b!15523 (= lt!3783 (removeValidProp!11 lm!238 p!262 lt!3782))))

(declare-fun head!809 (List!488) (_ BitVec 64))

(assert (=> b!15523 (= lt!3782 (head!809 l!1612))))

(declare-fun b!15524 () Bool)

(declare-fun tp!2632 () Bool)

(assert (=> b!15524 (= e!9446 tp!2632)))

(assert (= (and start!2490 res!11721) b!15522))

(assert (= (and b!15522 res!11722) b!15523))

(assert (= start!2490 b!15524))

(declare-fun m!10439 () Bool)

(assert (=> start!2490 m!10439))

(declare-fun m!10441 () Bool)

(assert (=> start!2490 m!10441))

(declare-fun m!10443 () Bool)

(assert (=> b!15522 m!10443))

(declare-fun m!10445 () Bool)

(assert (=> b!15523 m!10445))

(declare-fun m!10447 () Bool)

(assert (=> b!15523 m!10447))

(declare-fun m!10449 () Bool)

(assert (=> b!15523 m!10449))

(declare-fun m!10451 () Bool)

(assert (=> b!15523 m!10451))

(push 1)

(assert (not b!15523))

(assert (not b!15522))

(assert (not b_next!511))

(assert b_and!957)

(assert (not b!15524))

(assert (not start!2490))

(check-sat)

(pop 1)

