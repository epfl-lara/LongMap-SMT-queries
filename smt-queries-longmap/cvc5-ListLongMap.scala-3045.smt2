; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42732 () Bool)

(assert start!42732)

(declare-fun b_free!12079 () Bool)

(declare-fun b_next!12079 () Bool)

(assert (=> start!42732 (= b_free!12079 (not b_next!12079))))

(declare-fun tp!42292 () Bool)

(declare-fun b_and!20615 () Bool)

(assert (=> start!42732 (= tp!42292 b_and!20615)))

(declare-fun res!284435 () Bool)

(declare-fun e!279880 () Bool)

(assert (=> start!42732 (=> (not res!284435) (not e!279880))))

(declare-datatypes ((B!1028 0))(
  ( (B!1029 (val!6798 Int)) )
))
(declare-datatypes ((tuple2!8968 0))(
  ( (tuple2!8969 (_1!4495 (_ BitVec 64)) (_2!4495 B!1028)) )
))
(declare-datatypes ((List!9041 0))(
  ( (Nil!9038) (Cons!9037 (h!9893 tuple2!8968) (t!15027 List!9041)) )
))
(declare-datatypes ((ListLongMap!7881 0))(
  ( (ListLongMap!7882 (toList!3956 List!9041)) )
))
(declare-fun lm!215 () ListLongMap!7881)

(declare-fun p!166 () Int)

(declare-fun forall!185 (List!9041 Int) Bool)

(assert (=> start!42732 (= res!284435 (forall!185 (toList!3956 lm!215) p!166))))

(assert (=> start!42732 e!279880))

(declare-fun e!279879 () Bool)

(declare-fun inv!15463 (ListLongMap!7881) Bool)

(assert (=> start!42732 (and (inv!15463 lm!215) e!279879)))

(assert (=> start!42732 tp!42292))

(assert (=> start!42732 true))

(declare-fun tp_is_empty!13501 () Bool)

(assert (=> start!42732 tp_is_empty!13501))

(declare-fun b!476503 () Bool)

(declare-fun res!284436 () Bool)

(assert (=> b!476503 (=> (not res!284436) (not e!279880))))

(declare-fun isEmpty!586 (ListLongMap!7881) Bool)

(assert (=> b!476503 (= res!284436 (not (isEmpty!586 lm!215)))))

(declare-fun b!476505 () Bool)

(declare-fun tp!42291 () Bool)

(assert (=> b!476505 (= e!279879 tp!42291)))

(declare-fun b!476504 () Bool)

(assert (=> b!476504 (= e!279880 false)))

(declare-fun lt!217293 () Bool)

(declare-fun tail!110 (ListLongMap!7881) ListLongMap!7881)

(assert (=> b!476504 (= lt!217293 (forall!185 (toList!3956 (tail!110 lm!215)) p!166))))

(declare-fun b!476502 () Bool)

(declare-fun res!284437 () Bool)

(assert (=> b!476502 (=> (not res!284437) (not e!279880))))

(declare-fun b!85 () B!1028)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!932 (Int tuple2!8968) Bool)

(assert (=> b!476502 (= res!284437 (dynLambda!932 p!166 (tuple2!8969 a!501 b!85)))))

(assert (= (and start!42732 res!284435) b!476502))

(assert (= (and b!476502 res!284437) b!476503))

(assert (= (and b!476503 res!284436) b!476504))

(assert (= start!42732 b!476505))

(declare-fun b_lambda!10365 () Bool)

(assert (=> (not b_lambda!10365) (not b!476502)))

(declare-fun t!15026 () Bool)

(declare-fun tb!3943 () Bool)

(assert (=> (and start!42732 (= p!166 p!166) t!15026) tb!3943))

(declare-fun result!7487 () Bool)

(assert (=> tb!3943 (= result!7487 true)))

(assert (=> b!476502 t!15026))

(declare-fun b_and!20617 () Bool)

(assert (= b_and!20615 (and (=> t!15026 result!7487) b_and!20617)))

(declare-fun m!458803 () Bool)

(assert (=> start!42732 m!458803))

(declare-fun m!458805 () Bool)

(assert (=> start!42732 m!458805))

(declare-fun m!458807 () Bool)

(assert (=> b!476503 m!458807))

(declare-fun m!458809 () Bool)

(assert (=> b!476504 m!458809))

(declare-fun m!458811 () Bool)

(assert (=> b!476504 m!458811))

(declare-fun m!458813 () Bool)

(assert (=> b!476502 m!458813))

(push 1)

(assert (not b_next!12079))

(assert (not start!42732))

(assert (not b!476504))

(assert b_and!20617)

(assert (not b!476503))

(assert (not b!476505))

(assert (not b_lambda!10365))

(assert tp_is_empty!13501)

(check-sat)

