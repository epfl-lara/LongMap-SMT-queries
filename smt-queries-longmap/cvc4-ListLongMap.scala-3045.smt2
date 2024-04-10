; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42736 () Bool)

(assert start!42736)

(declare-fun b_free!12083 () Bool)

(declare-fun b_next!12083 () Bool)

(assert (=> start!42736 (= b_free!12083 (not b_next!12083))))

(declare-fun tp!42304 () Bool)

(declare-fun b_and!20623 () Bool)

(assert (=> start!42736 (= tp!42304 b_and!20623)))

(declare-fun b!476527 () Bool)

(declare-fun res!284454 () Bool)

(declare-fun e!279891 () Bool)

(assert (=> b!476527 (=> (not res!284454) (not e!279891))))

(declare-datatypes ((B!1032 0))(
  ( (B!1033 (val!6800 Int)) )
))
(declare-datatypes ((tuple2!8972 0))(
  ( (tuple2!8973 (_1!4497 (_ BitVec 64)) (_2!4497 B!1032)) )
))
(declare-datatypes ((List!9043 0))(
  ( (Nil!9040) (Cons!9039 (h!9895 tuple2!8972) (t!15033 List!9043)) )
))
(declare-datatypes ((ListLongMap!7885 0))(
  ( (ListLongMap!7886 (toList!3958 List!9043)) )
))
(declare-fun lm!215 () ListLongMap!7885)

(declare-fun isEmpty!588 (ListLongMap!7885) Bool)

(assert (=> b!476527 (= res!284454 (not (isEmpty!588 lm!215)))))

(declare-fun b!476526 () Bool)

(declare-fun res!284455 () Bool)

(assert (=> b!476526 (=> (not res!284455) (not e!279891))))

(declare-fun b!85 () B!1032)

(declare-fun p!166 () Int)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!934 (Int tuple2!8972) Bool)

(assert (=> b!476526 (= res!284455 (dynLambda!934 p!166 (tuple2!8973 a!501 b!85)))))

(declare-fun b!476529 () Bool)

(declare-fun e!279892 () Bool)

(declare-fun tp!42303 () Bool)

(assert (=> b!476529 (= e!279892 tp!42303)))

(declare-fun res!284453 () Bool)

(assert (=> start!42736 (=> (not res!284453) (not e!279891))))

(declare-fun forall!187 (List!9043 Int) Bool)

(assert (=> start!42736 (= res!284453 (forall!187 (toList!3958 lm!215) p!166))))

(assert (=> start!42736 e!279891))

(declare-fun inv!15465 (ListLongMap!7885) Bool)

(assert (=> start!42736 (and (inv!15465 lm!215) e!279892)))

(assert (=> start!42736 tp!42304))

(assert (=> start!42736 true))

(declare-fun tp_is_empty!13505 () Bool)

(assert (=> start!42736 tp_is_empty!13505))

(declare-fun b!476528 () Bool)

(assert (=> b!476528 (= e!279891 false)))

(declare-fun lt!217299 () Bool)

(declare-fun tail!112 (ListLongMap!7885) ListLongMap!7885)

(assert (=> b!476528 (= lt!217299 (forall!187 (toList!3958 (tail!112 lm!215)) p!166))))

(assert (= (and start!42736 res!284453) b!476526))

(assert (= (and b!476526 res!284455) b!476527))

(assert (= (and b!476527 res!284454) b!476528))

(assert (= start!42736 b!476529))

(declare-fun b_lambda!10369 () Bool)

(assert (=> (not b_lambda!10369) (not b!476526)))

(declare-fun t!15032 () Bool)

(declare-fun tb!3947 () Bool)

(assert (=> (and start!42736 (= p!166 p!166) t!15032) tb!3947))

(declare-fun result!7491 () Bool)

(assert (=> tb!3947 (= result!7491 true)))

(assert (=> b!476526 t!15032))

(declare-fun b_and!20625 () Bool)

(assert (= b_and!20623 (and (=> t!15032 result!7491) b_and!20625)))

(declare-fun m!458827 () Bool)

(assert (=> b!476527 m!458827))

(declare-fun m!458829 () Bool)

(assert (=> b!476526 m!458829))

(declare-fun m!458831 () Bool)

(assert (=> start!42736 m!458831))

(declare-fun m!458833 () Bool)

(assert (=> start!42736 m!458833))

(declare-fun m!458835 () Bool)

(assert (=> b!476528 m!458835))

(declare-fun m!458837 () Bool)

(assert (=> b!476528 m!458837))

(push 1)

(assert (not b_next!12083))

(assert (not b!476528))

(assert b_and!20625)

(assert (not start!42736))

(assert (not b!476527))

(assert (not b!476529))

(assert (not b_lambda!10369))

(assert tp_is_empty!13505)

(check-sat)

