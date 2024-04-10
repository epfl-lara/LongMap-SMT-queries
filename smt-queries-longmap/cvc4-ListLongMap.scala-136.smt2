; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2458 () Bool)

(assert start!2458)

(declare-fun b_free!497 () Bool)

(declare-fun b_next!497 () Bool)

(assert (=> start!2458 (= b_free!497 (not b_next!497))))

(declare-fun tp!2581 () Bool)

(declare-fun b_and!937 () Bool)

(assert (=> start!2458 (= tp!2581 b_and!937)))

(declare-fun res!11689 () Bool)

(declare-fun e!9377 () Bool)

(assert (=> start!2458 (=> (not res!11689) (not e!9377))))

(declare-datatypes ((B!618 0))(
  ( (B!619 (val!407 Int)) )
))
(declare-datatypes ((tuple2!614 0))(
  ( (tuple2!615 (_1!307 (_ BitVec 64)) (_2!307 B!618)) )
))
(declare-datatypes ((List!476 0))(
  ( (Nil!473) (Cons!472 (h!1038 tuple2!614) (t!2908 List!476)) )
))
(declare-datatypes ((ListLongMap!445 0))(
  ( (ListLongMap!446 (toList!238 List!476)) )
))
(declare-fun lm!238 () ListLongMap!445)

(declare-fun p!262 () Int)

(declare-fun forall!115 (List!476 Int) Bool)

(assert (=> start!2458 (= res!11689 (forall!115 (toList!238 lm!238) p!262))))

(assert (=> start!2458 e!9377))

(declare-fun e!9376 () Bool)

(declare-fun inv!794 (ListLongMap!445) Bool)

(assert (=> start!2458 (and (inv!794 lm!238) e!9376)))

(assert (=> start!2458 tp!2581))

(assert (=> start!2458 true))

(declare-fun b!15435 () Bool)

(declare-fun res!11688 () Bool)

(assert (=> b!15435 (=> (not res!11688) (not e!9377))))

(declare-datatypes ((List!477 0))(
  ( (Nil!474) (Cons!473 (h!1039 (_ BitVec 64)) (t!2909 List!477)) )
))
(declare-fun l!1612 () List!477)

(declare-fun isEmpty!128 (List!477) Bool)

(assert (=> b!15435 (= res!11688 (not (isEmpty!128 l!1612)))))

(declare-fun b!15436 () Bool)

(assert (=> b!15436 (= e!9377 (not true))))

(declare-fun lt!3768 () (_ BitVec 64))

(declare-fun -!17 (ListLongMap!445 (_ BitVec 64)) ListLongMap!445)

(assert (=> b!15436 (forall!115 (toList!238 (-!17 lm!238 lt!3768)) p!262)))

(declare-datatypes ((Unit!298 0))(
  ( (Unit!299) )
))
(declare-fun lt!3767 () Unit!298)

(declare-fun removeValidProp!10 (ListLongMap!445 Int (_ BitVec 64)) Unit!298)

(assert (=> b!15436 (= lt!3767 (removeValidProp!10 lm!238 p!262 lt!3768))))

(declare-fun head!808 (List!477) (_ BitVec 64))

(assert (=> b!15436 (= lt!3768 (head!808 l!1612))))

(declare-fun b!15437 () Bool)

(declare-fun tp!2582 () Bool)

(assert (=> b!15437 (= e!9376 tp!2582)))

(assert (= (and start!2458 res!11689) b!15435))

(assert (= (and b!15435 res!11688) b!15436))

(assert (= start!2458 b!15437))

(declare-fun m!10377 () Bool)

(assert (=> start!2458 m!10377))

(declare-fun m!10379 () Bool)

(assert (=> start!2458 m!10379))

(declare-fun m!10381 () Bool)

(assert (=> b!15435 m!10381))

(declare-fun m!10383 () Bool)

(assert (=> b!15436 m!10383))

(declare-fun m!10385 () Bool)

(assert (=> b!15436 m!10385))

(declare-fun m!10387 () Bool)

(assert (=> b!15436 m!10387))

(declare-fun m!10389 () Bool)

(assert (=> b!15436 m!10389))

(push 1)

(assert (not b!15435))

(assert (not b!15437))

(assert (not b!15436))

(assert (not start!2458))

(assert (not b_next!497))

(assert b_and!937)

(check-sat)

(pop 1)

