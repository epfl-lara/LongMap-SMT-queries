; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2650 () Bool)

(assert start!2650)

(declare-fun b_free!545 () Bool)

(declare-fun b_next!545 () Bool)

(assert (=> start!2650 (= b_free!545 (not b_next!545))))

(declare-fun tp!2762 () Bool)

(declare-fun b_and!1039 () Bool)

(assert (=> start!2650 (= tp!2762 b_and!1039)))

(declare-fun res!11890 () Bool)

(declare-fun e!9683 () Bool)

(assert (=> start!2650 (=> (not res!11890) (not e!9683))))

(declare-datatypes ((B!666 0))(
  ( (B!667 (val!431 Int)) )
))
(declare-datatypes ((tuple2!662 0))(
  ( (tuple2!663 (_1!331 (_ BitVec 64)) (_2!331 B!666)) )
))
(declare-datatypes ((List!516 0))(
  ( (Nil!513) (Cons!512 (h!1078 tuple2!662) (t!3002 List!516)) )
))
(declare-datatypes ((ListLongMap!493 0))(
  ( (ListLongMap!494 (toList!262 List!516)) )
))
(declare-fun lm!221 () ListLongMap!493)

(declare-fun p!191 () Int)

(declare-fun forall!133 (List!516 Int) Bool)

(assert (=> start!2650 (= res!11890 (forall!133 (toList!262 lm!221) p!191))))

(assert (=> start!2650 e!9683))

(declare-fun e!9682 () Bool)

(declare-fun inv!858 (ListLongMap!493) Bool)

(assert (=> start!2650 (and (inv!858 lm!221) e!9682)))

(assert (=> start!2650 tp!2762))

(declare-fun b!15852 () Bool)

(declare-fun res!11889 () Bool)

(assert (=> b!15852 (=> (not res!11889) (not e!9683))))

(declare-fun isEmpty!143 (ListLongMap!493) Bool)

(assert (=> b!15852 (= res!11889 (not (isEmpty!143 lm!221)))))

(declare-fun b!15853 () Bool)

(assert (=> b!15853 (= e!9683 false)))

(declare-fun lt!3924 () Bool)

(declare-fun tail!67 (ListLongMap!493) ListLongMap!493)

(assert (=> b!15853 (= lt!3924 (forall!133 (toList!262 (tail!67 lm!221)) p!191))))

(declare-fun b!15854 () Bool)

(declare-fun tp!2761 () Bool)

(assert (=> b!15854 (= e!9682 tp!2761)))

(assert (= (and start!2650 res!11890) b!15852))

(assert (= (and b!15852 res!11889) b!15853))

(assert (= start!2650 b!15854))

(declare-fun m!10885 () Bool)

(assert (=> start!2650 m!10885))

(declare-fun m!10887 () Bool)

(assert (=> start!2650 m!10887))

(declare-fun m!10889 () Bool)

(assert (=> b!15852 m!10889))

(declare-fun m!10891 () Bool)

(assert (=> b!15853 m!10891))

(declare-fun m!10893 () Bool)

(assert (=> b!15853 m!10893))

(push 1)

(assert (not b_next!545))

(assert (not b!15853))

(assert b_and!1039)

(assert (not start!2650))

(assert (not b!15854))

(assert (not b!15852))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1039)

