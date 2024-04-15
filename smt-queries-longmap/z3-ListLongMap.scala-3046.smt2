; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42724 () Bool)

(assert start!42724)

(declare-fun b_free!12085 () Bool)

(declare-fun b_next!12085 () Bool)

(assert (=> start!42724 (= b_free!12085 (not b_next!12085))))

(declare-fun tp!42310 () Bool)

(declare-fun b_and!20601 () Bool)

(assert (=> start!42724 (= tp!42310 b_and!20601)))

(declare-fun res!284332 () Bool)

(declare-fun e!279723 () Bool)

(assert (=> start!42724 (=> (not res!284332) (not e!279723))))

(declare-datatypes ((B!1034 0))(
  ( (B!1035 (val!6801 Int)) )
))
(declare-datatypes ((tuple2!9034 0))(
  ( (tuple2!9035 (_1!4528 (_ BitVec 64)) (_2!4528 B!1034)) )
))
(declare-datatypes ((List!9089 0))(
  ( (Nil!9086) (Cons!9085 (h!9941 tuple2!9034) (t!15072 List!9089)) )
))
(declare-datatypes ((ListLongMap!7937 0))(
  ( (ListLongMap!7938 (toList!3984 List!9089)) )
))
(declare-fun lm!215 () ListLongMap!7937)

(declare-fun p!166 () Int)

(declare-fun forall!188 (List!9089 Int) Bool)

(assert (=> start!42724 (= res!284332 (forall!188 (toList!3984 lm!215) p!166))))

(assert (=> start!42724 e!279723))

(declare-fun e!279724 () Bool)

(declare-fun inv!15471 (ListLongMap!7937) Bool)

(assert (=> start!42724 (and (inv!15471 lm!215) e!279724)))

(assert (=> start!42724 tp!42310))

(assert (=> start!42724 true))

(declare-fun tp_is_empty!13507 () Bool)

(assert (=> start!42724 tp_is_empty!13507))

(declare-fun b!476265 () Bool)

(declare-fun res!284331 () Bool)

(assert (=> b!476265 (=> (not res!284331) (not e!279723))))

(declare-fun b!85 () B!1034)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!938 (Int tuple2!9034) Bool)

(assert (=> b!476265 (= res!284331 (dynLambda!938 p!166 (tuple2!9035 a!501 b!85)))))

(declare-fun b!476266 () Bool)

(declare-fun size!15134 (List!9089) Int)

(assert (=> b!476266 (= e!279723 (< (size!15134 (toList!3984 lm!215)) 0))))

(declare-fun b!476267 () Bool)

(declare-fun tp!42309 () Bool)

(assert (=> b!476267 (= e!279724 tp!42309)))

(assert (= (and start!42724 res!284332) b!476265))

(assert (= (and b!476265 res!284331) b!476266))

(assert (= start!42724 b!476267))

(declare-fun b_lambda!10353 () Bool)

(assert (=> (not b_lambda!10353) (not b!476265)))

(declare-fun t!15071 () Bool)

(declare-fun tb!3941 () Bool)

(assert (=> (and start!42724 (= p!166 p!166) t!15071) tb!3941))

(declare-fun result!7485 () Bool)

(assert (=> tb!3941 (= result!7485 true)))

(assert (=> b!476265 t!15071))

(declare-fun b_and!20603 () Bool)

(assert (= b_and!20601 (and (=> t!15071 result!7485) b_and!20603)))

(declare-fun m!458105 () Bool)

(assert (=> start!42724 m!458105))

(declare-fun m!458107 () Bool)

(assert (=> start!42724 m!458107))

(declare-fun m!458109 () Bool)

(assert (=> b!476265 m!458109))

(declare-fun m!458111 () Bool)

(assert (=> b!476266 m!458111))

(check-sat (not b!476266) tp_is_empty!13507 (not b!476267) b_and!20603 (not b_next!12085) (not b_lambda!10353) (not start!42724))
(check-sat b_and!20603 (not b_next!12085))
(get-model)

(declare-fun b_lambda!10363 () Bool)

(assert (= b_lambda!10353 (or (and start!42724 b_free!12085) b_lambda!10363)))

(check-sat (not b_lambda!10363) (not b!476266) tp_is_empty!13507 (not b!476267) b_and!20603 (not b_next!12085) (not start!42724))
(check-sat b_and!20603 (not b_next!12085))
(get-model)

(declare-fun d!75541 () Bool)

(declare-fun res!284359 () Bool)

(declare-fun e!279754 () Bool)

(assert (=> d!75541 (=> res!284359 e!279754)))

(get-info :version)

(assert (=> d!75541 (= res!284359 ((_ is Nil!9086) (toList!3984 lm!215)))))

(assert (=> d!75541 (= (forall!188 (toList!3984 lm!215) p!166) e!279754)))

(declare-fun b!476306 () Bool)

(declare-fun e!279755 () Bool)

(assert (=> b!476306 (= e!279754 e!279755)))

(declare-fun res!284360 () Bool)

(assert (=> b!476306 (=> (not res!284360) (not e!279755))))

(assert (=> b!476306 (= res!284360 (dynLambda!938 p!166 (h!9941 (toList!3984 lm!215))))))

(declare-fun b!476307 () Bool)

(assert (=> b!476307 (= e!279755 (forall!188 (t!15072 (toList!3984 lm!215)) p!166))))

(assert (= (and d!75541 (not res!284359)) b!476306))

(assert (= (and b!476306 res!284360) b!476307))

(declare-fun b_lambda!10367 () Bool)

(assert (=> (not b_lambda!10367) (not b!476306)))

(declare-fun t!15082 () Bool)

(declare-fun tb!3949 () Bool)

(assert (=> (and start!42724 (= p!166 p!166) t!15082) tb!3949))

(declare-fun result!7493 () Bool)

(assert (=> tb!3949 (= result!7493 true)))

(assert (=> b!476306 t!15082))

(declare-fun b_and!20615 () Bool)

(assert (= b_and!20603 (and (=> t!15082 result!7493) b_and!20615)))

(declare-fun m!458137 () Bool)

(assert (=> b!476306 m!458137))

(declare-fun m!458139 () Bool)

(assert (=> b!476307 m!458139))

(assert (=> start!42724 d!75541))

(declare-fun d!75549 () Bool)

(declare-fun isStrictlySorted!375 (List!9089) Bool)

(assert (=> d!75549 (= (inv!15471 lm!215) (isStrictlySorted!375 (toList!3984 lm!215)))))

(declare-fun bs!15100 () Bool)

(assert (= bs!15100 d!75549))

(declare-fun m!458147 () Bool)

(assert (=> bs!15100 m!458147))

(assert (=> start!42724 d!75549))

(declare-fun d!75553 () Bool)

(declare-fun lt!217074 () Int)

(assert (=> d!75553 (>= lt!217074 0)))

(declare-fun e!279769 () Int)

(assert (=> d!75553 (= lt!217074 e!279769)))

(declare-fun c!57284 () Bool)

(assert (=> d!75553 (= c!57284 ((_ is Nil!9086) (toList!3984 lm!215)))))

(assert (=> d!75553 (= (size!15134 (toList!3984 lm!215)) lt!217074)))

(declare-fun b!476330 () Bool)

(assert (=> b!476330 (= e!279769 0)))

(declare-fun b!476331 () Bool)

(assert (=> b!476331 (= e!279769 (+ 1 (size!15134 (t!15072 (toList!3984 lm!215)))))))

(assert (= (and d!75553 c!57284) b!476330))

(assert (= (and d!75553 (not c!57284)) b!476331))

(declare-fun m!458151 () Bool)

(assert (=> b!476331 m!458151))

(assert (=> b!476266 d!75553))

(declare-fun b!476336 () Bool)

(declare-fun e!279772 () Bool)

(declare-fun tp!42331 () Bool)

(assert (=> b!476336 (= e!279772 (and tp_is_empty!13507 tp!42331))))

(assert (=> b!476267 (= tp!42309 e!279772)))

(assert (= (and b!476267 ((_ is Cons!9085) (toList!3984 lm!215))) b!476336))

(declare-fun b_lambda!10375 () Bool)

(assert (= b_lambda!10367 (or (and start!42724 b_free!12085) b_lambda!10375)))

(check-sat (not b!476307) (not b_lambda!10363) tp_is_empty!13507 (not b_lambda!10375) (not b!476336) (not b_next!12085) (not d!75549) (not b!476331) b_and!20615)
(check-sat b_and!20615 (not b_next!12085))
