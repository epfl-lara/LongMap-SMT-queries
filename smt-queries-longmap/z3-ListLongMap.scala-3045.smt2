; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42734 () Bool)

(assert start!42734)

(declare-fun b_free!12081 () Bool)

(declare-fun b_next!12081 () Bool)

(assert (=> start!42734 (= b_free!12081 (not b_next!12081))))

(declare-fun tp!42298 () Bool)

(declare-fun b_and!20619 () Bool)

(assert (=> start!42734 (= tp!42298 b_and!20619)))

(declare-fun b!476516 () Bool)

(declare-fun e!279885 () Bool)

(assert (=> b!476516 (= e!279885 false)))

(declare-fun lt!217296 () Bool)

(declare-datatypes ((B!1030 0))(
  ( (B!1031 (val!6799 Int)) )
))
(declare-datatypes ((tuple2!8970 0))(
  ( (tuple2!8971 (_1!4496 (_ BitVec 64)) (_2!4496 B!1030)) )
))
(declare-datatypes ((List!9042 0))(
  ( (Nil!9039) (Cons!9038 (h!9894 tuple2!8970) (t!15030 List!9042)) )
))
(declare-datatypes ((ListLongMap!7883 0))(
  ( (ListLongMap!7884 (toList!3957 List!9042)) )
))
(declare-fun lm!215 () ListLongMap!7883)

(declare-fun p!166 () Int)

(declare-fun forall!186 (List!9042 Int) Bool)

(declare-fun tail!111 (ListLongMap!7883) ListLongMap!7883)

(assert (=> b!476516 (= lt!217296 (forall!186 (toList!3957 (tail!111 lm!215)) p!166))))

(declare-fun b!476517 () Bool)

(declare-fun e!279886 () Bool)

(declare-fun tp!42297 () Bool)

(assert (=> b!476517 (= e!279886 tp!42297)))

(declare-fun b!476514 () Bool)

(declare-fun res!284445 () Bool)

(assert (=> b!476514 (=> (not res!284445) (not e!279885))))

(declare-fun b!85 () B!1030)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!933 (Int tuple2!8970) Bool)

(assert (=> b!476514 (= res!284445 (dynLambda!933 p!166 (tuple2!8971 a!501 b!85)))))

(declare-fun res!284446 () Bool)

(assert (=> start!42734 (=> (not res!284446) (not e!279885))))

(assert (=> start!42734 (= res!284446 (forall!186 (toList!3957 lm!215) p!166))))

(assert (=> start!42734 e!279885))

(declare-fun inv!15464 (ListLongMap!7883) Bool)

(assert (=> start!42734 (and (inv!15464 lm!215) e!279886)))

(assert (=> start!42734 tp!42298))

(assert (=> start!42734 true))

(declare-fun tp_is_empty!13503 () Bool)

(assert (=> start!42734 tp_is_empty!13503))

(declare-fun b!476515 () Bool)

(declare-fun res!284444 () Bool)

(assert (=> b!476515 (=> (not res!284444) (not e!279885))))

(declare-fun isEmpty!587 (ListLongMap!7883) Bool)

(assert (=> b!476515 (= res!284444 (not (isEmpty!587 lm!215)))))

(assert (= (and start!42734 res!284446) b!476514))

(assert (= (and b!476514 res!284445) b!476515))

(assert (= (and b!476515 res!284444) b!476516))

(assert (= start!42734 b!476517))

(declare-fun b_lambda!10367 () Bool)

(assert (=> (not b_lambda!10367) (not b!476514)))

(declare-fun t!15029 () Bool)

(declare-fun tb!3945 () Bool)

(assert (=> (and start!42734 (= p!166 p!166) t!15029) tb!3945))

(declare-fun result!7489 () Bool)

(assert (=> tb!3945 (= result!7489 true)))

(assert (=> b!476514 t!15029))

(declare-fun b_and!20621 () Bool)

(assert (= b_and!20619 (and (=> t!15029 result!7489) b_and!20621)))

(declare-fun m!458815 () Bool)

(assert (=> b!476516 m!458815))

(declare-fun m!458817 () Bool)

(assert (=> b!476516 m!458817))

(declare-fun m!458819 () Bool)

(assert (=> b!476514 m!458819))

(declare-fun m!458821 () Bool)

(assert (=> start!42734 m!458821))

(declare-fun m!458823 () Bool)

(assert (=> start!42734 m!458823))

(declare-fun m!458825 () Bool)

(assert (=> b!476515 m!458825))

(check-sat (not b!476516) (not start!42734) b_and!20621 (not b!476515) (not b!476517) (not b_lambda!10367) (not b_next!12081) tp_is_empty!13503)
(check-sat b_and!20621 (not b_next!12081))
