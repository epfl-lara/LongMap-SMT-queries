; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42718 () Bool)

(assert start!42718)

(declare-fun b_free!12079 () Bool)

(declare-fun b_next!12079 () Bool)

(assert (=> start!42718 (= b_free!12079 (not b_next!12079))))

(declare-fun tp!42292 () Bool)

(declare-fun b_and!20589 () Bool)

(assert (=> start!42718 (= tp!42292 b_and!20589)))

(declare-fun res!284308 () Bool)

(declare-fun e!279705 () Bool)

(assert (=> start!42718 (=> (not res!284308) (not e!279705))))

(declare-datatypes ((B!1028 0))(
  ( (B!1029 (val!6798 Int)) )
))
(declare-datatypes ((tuple2!9028 0))(
  ( (tuple2!9029 (_1!4525 (_ BitVec 64)) (_2!4525 B!1028)) )
))
(declare-datatypes ((List!9086 0))(
  ( (Nil!9083) (Cons!9082 (h!9938 tuple2!9028) (t!15063 List!9086)) )
))
(declare-datatypes ((ListLongMap!7931 0))(
  ( (ListLongMap!7932 (toList!3981 List!9086)) )
))
(declare-fun lm!215 () ListLongMap!7931)

(declare-fun p!166 () Int)

(declare-fun forall!185 (List!9086 Int) Bool)

(assert (=> start!42718 (= res!284308 (forall!185 (toList!3981 lm!215) p!166))))

(assert (=> start!42718 e!279705))

(declare-fun e!279706 () Bool)

(declare-fun inv!15463 (ListLongMap!7931) Bool)

(assert (=> start!42718 (and (inv!15463 lm!215) e!279706)))

(assert (=> start!42718 tp!42292))

(assert (=> start!42718 true))

(declare-fun tp_is_empty!13501 () Bool)

(assert (=> start!42718 tp_is_empty!13501))

(declare-fun b!476231 () Bool)

(declare-fun res!284306 () Bool)

(assert (=> b!476231 (=> (not res!284306) (not e!279705))))

(declare-fun b!85 () B!1028)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!935 (Int tuple2!9028) Bool)

(assert (=> b!476231 (= res!284306 (dynLambda!935 p!166 (tuple2!9029 a!501 b!85)))))

(declare-fun b!476233 () Bool)

(assert (=> b!476233 (= e!279705 false)))

(declare-fun lt!217059 () Bool)

(declare-fun tail!110 (ListLongMap!7931) ListLongMap!7931)

(assert (=> b!476233 (= lt!217059 (forall!185 (toList!3981 (tail!110 lm!215)) p!166))))

(declare-fun b!476234 () Bool)

(declare-fun tp!42291 () Bool)

(assert (=> b!476234 (= e!279706 tp!42291)))

(declare-fun b!476232 () Bool)

(declare-fun res!284307 () Bool)

(assert (=> b!476232 (=> (not res!284307) (not e!279705))))

(declare-fun isEmpty!590 (ListLongMap!7931) Bool)

(assert (=> b!476232 (= res!284307 (not (isEmpty!590 lm!215)))))

(assert (= (and start!42718 res!284308) b!476231))

(assert (= (and b!476231 res!284306) b!476232))

(assert (= (and b!476232 res!284307) b!476233))

(assert (= start!42718 b!476234))

(declare-fun b_lambda!10347 () Bool)

(assert (=> (not b_lambda!10347) (not b!476231)))

(declare-fun t!15062 () Bool)

(declare-fun tb!3935 () Bool)

(assert (=> (and start!42718 (= p!166 p!166) t!15062) tb!3935))

(declare-fun result!7479 () Bool)

(assert (=> tb!3935 (= result!7479 true)))

(assert (=> b!476231 t!15062))

(declare-fun b_and!20591 () Bool)

(assert (= b_and!20589 (and (=> t!15062 result!7479) b_and!20591)))

(declare-fun m!458069 () Bool)

(assert (=> start!42718 m!458069))

(declare-fun m!458071 () Bool)

(assert (=> start!42718 m!458071))

(declare-fun m!458073 () Bool)

(assert (=> b!476231 m!458073))

(declare-fun m!458075 () Bool)

(assert (=> b!476233 m!458075))

(declare-fun m!458077 () Bool)

(assert (=> b!476233 m!458077))

(declare-fun m!458079 () Bool)

(assert (=> b!476232 m!458079))

(check-sat (not b!476232) (not b_next!12079) tp_is_empty!13501 (not b_lambda!10347) (not b!476234) b_and!20591 (not b!476233) (not start!42718))
(check-sat b_and!20591 (not b_next!12079))
