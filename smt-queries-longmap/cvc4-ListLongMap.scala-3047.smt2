; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42766 () Bool)

(assert start!42766)

(declare-fun b_free!12095 () Bool)

(declare-fun b_next!12095 () Bool)

(assert (=> start!42766 (= b_free!12095 (not b_next!12095))))

(declare-fun tp!42348 () Bool)

(declare-fun b_and!20653 () Bool)

(assert (=> start!42766 (= tp!42348 b_and!20653)))

(declare-fun res!284517 () Bool)

(declare-fun e!279963 () Bool)

(assert (=> start!42766 (=> (not res!284517) (not e!279963))))

(declare-datatypes ((B!1044 0))(
  ( (B!1045 (val!6806 Int)) )
))
(declare-datatypes ((tuple2!8984 0))(
  ( (tuple2!8985 (_1!4503 (_ BitVec 64)) (_2!4503 B!1044)) )
))
(declare-datatypes ((List!9049 0))(
  ( (Nil!9046) (Cons!9045 (h!9901 tuple2!8984) (t!15057 List!9049)) )
))
(declare-datatypes ((ListLongMap!7897 0))(
  ( (ListLongMap!7898 (toList!3964 List!9049)) )
))
(declare-fun lm!215 () ListLongMap!7897)

(declare-fun p!166 () Int)

(declare-fun forall!193 (List!9049 Int) Bool)

(assert (=> start!42766 (= res!284517 (forall!193 (toList!3964 lm!215) p!166))))

(assert (=> start!42766 e!279963))

(declare-fun e!279964 () Bool)

(declare-fun inv!15481 (ListLongMap!7897) Bool)

(assert (=> start!42766 (and (inv!15481 lm!215) e!279964)))

(assert (=> start!42766 tp!42348))

(assert (=> start!42766 true))

(declare-fun tp_is_empty!13517 () Bool)

(assert (=> start!42766 tp_is_empty!13517))

(declare-fun b!476643 () Bool)

(declare-fun tp!42349 () Bool)

(assert (=> b!476643 (= e!279964 tp!42349)))

(declare-fun b!476640 () Bool)

(declare-fun res!284518 () Bool)

(assert (=> b!476640 (=> (not res!284518) (not e!279963))))

(declare-fun b!85 () B!1044)

(declare-fun a!501 () (_ BitVec 64))

(declare-fun dynLambda!940 (Int tuple2!8984) Bool)

(assert (=> b!476640 (= res!284518 (dynLambda!940 p!166 (tuple2!8985 a!501 b!85)))))

(declare-fun b!476642 () Bool)

(declare-fun tail!115 (ListLongMap!7897) ListLongMap!7897)

(assert (=> b!476642 (= e!279963 (not (forall!193 (toList!3964 (tail!115 lm!215)) p!166)))))

(declare-fun b!476641 () Bool)

(declare-fun res!284516 () Bool)

(assert (=> b!476641 (=> (not res!284516) (not e!279963))))

(declare-fun isEmpty!591 (ListLongMap!7897) Bool)

(assert (=> b!476641 (= res!284516 (not (isEmpty!591 lm!215)))))

(assert (= (and start!42766 res!284517) b!476640))

(assert (= (and b!476640 res!284518) b!476641))

(assert (= (and b!476641 res!284516) b!476642))

(assert (= start!42766 b!476643))

(declare-fun b_lambda!10399 () Bool)

(assert (=> (not b_lambda!10399) (not b!476640)))

(declare-fun t!15056 () Bool)

(declare-fun tb!3965 () Bool)

(assert (=> (and start!42766 (= p!166 p!166) t!15056) tb!3965))

(declare-fun result!7515 () Bool)

(assert (=> tb!3965 (= result!7515 true)))

(assert (=> b!476640 t!15056))

(declare-fun b_and!20655 () Bool)

(assert (= b_and!20653 (and (=> t!15056 result!7515) b_and!20655)))

(declare-fun m!458911 () Bool)

(assert (=> start!42766 m!458911))

(declare-fun m!458913 () Bool)

(assert (=> start!42766 m!458913))

(declare-fun m!458915 () Bool)

(assert (=> b!476640 m!458915))

(declare-fun m!458917 () Bool)

(assert (=> b!476642 m!458917))

(declare-fun m!458919 () Bool)

(assert (=> b!476642 m!458919))

(declare-fun m!458921 () Bool)

(assert (=> b!476641 m!458921))

(push 1)

(assert (not b_lambda!10399))

(assert (not start!42766))

(assert (not b!476643))

(assert (not b_next!12095))

(assert (not b!476642))

(assert b_and!20655)

(assert (not b!476641))

(assert tp_is_empty!13517)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20655)

(assert (not b_next!12095))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10403 () Bool)

(assert (= b_lambda!10399 (or (and start!42766 b_free!12095) b_lambda!10403)))

(push 1)

(assert (not b_lambda!10403))

(assert (not start!42766))

(assert (not b!476643))

(assert (not b_next!12095))

(assert (not b!476642))

(assert b_and!20655)

(assert (not b!476641))

(assert tp_is_empty!13517)

(check-sat)

(pop 1)

(push 1)

(assert b_and!20655)

(assert (not b_next!12095))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75765 () Bool)

(declare-fun res!284531 () Bool)

(declare-fun e!279977 () Bool)

(assert (=> d!75765 (=> res!284531 e!279977)))

(assert (=> d!75765 (= res!284531 (is-Nil!9046 (toList!3964 (tail!115 lm!215))))))

(assert (=> d!75765 (= (forall!193 (toList!3964 (tail!115 lm!215)) p!166) e!279977)))

(declare-fun b!476656 () Bool)

(declare-fun e!279978 () Bool)

(assert (=> b!476656 (= e!279977 e!279978)))

(declare-fun res!284532 () Bool)

(assert (=> b!476656 (=> (not res!284532) (not e!279978))))

(assert (=> b!476656 (= res!284532 (dynLambda!940 p!166 (h!9901 (toList!3964 (tail!115 lm!215)))))))

(declare-fun b!476657 () Bool)

(assert (=> b!476657 (= e!279978 (forall!193 (t!15057 (toList!3964 (tail!115 lm!215))) p!166))))

(assert (= (and d!75765 (not res!284531)) b!476656))

(assert (= (and b!476656 res!284532) b!476657))

(declare-fun b_lambda!10411 () Bool)

(assert (=> (not b_lambda!10411) (not b!476656)))

(declare-fun t!15063 () Bool)

(declare-fun tb!3971 () Bool)

(assert (=> (and start!42766 (= p!166 p!166) t!15063) tb!3971))

(declare-fun result!7521 () Bool)

(assert (=> tb!3971 (= result!7521 true)))

(assert (=> b!476656 t!15063))

(declare-fun b_and!20661 () Bool)

(assert (= b_and!20655 (and (=> t!15063 result!7521) b_and!20661)))

(declare-fun m!458937 () Bool)

(assert (=> b!476656 m!458937))

(declare-fun m!458939 () Bool)

(assert (=> b!476657 m!458939))

(assert (=> b!476642 d!75765))

(declare-fun d!75777 () Bool)

(declare-fun tail!117 (List!9049) List!9049)

(assert (=> d!75777 (= (tail!115 lm!215) (ListLongMap!7898 (tail!117 (toList!3964 lm!215))))))

(declare-fun bs!15139 () Bool)

(assert (= bs!15139 d!75777))

(declare-fun m!458943 () Bool)

(assert (=> bs!15139 m!458943))

(assert (=> b!476642 d!75777))

(declare-fun d!75779 () Bool)

(declare-fun isEmpty!594 (List!9049) Bool)

(assert (=> d!75779 (= (isEmpty!591 lm!215) (isEmpty!594 (toList!3964 lm!215)))))

(declare-fun bs!15140 () Bool)

(assert (= bs!15140 d!75779))

(declare-fun m!458945 () Bool)

(assert (=> bs!15140 m!458945))

(assert (=> b!476641 d!75779))

(declare-fun d!75781 () Bool)

(declare-fun res!284539 () Bool)

(declare-fun e!279988 () Bool)

(assert (=> d!75781 (=> res!284539 e!279988)))

(assert (=> d!75781 (= res!284539 (is-Nil!9046 (toList!3964 lm!215)))))

(assert (=> d!75781 (= (forall!193 (toList!3964 lm!215) p!166) e!279988)))

(declare-fun b!476669 () Bool)

(declare-fun e!279989 () Bool)

(assert (=> b!476669 (= e!279988 e!279989)))

(declare-fun res!284540 () Bool)

(assert (=> b!476669 (=> (not res!284540) (not e!279989))))

(assert (=> b!476669 (= res!284540 (dynLambda!940 p!166 (h!9901 (toList!3964 lm!215))))))

(declare-fun b!476670 () Bool)

(assert (=> b!476670 (= e!279989 (forall!193 (t!15057 (toList!3964 lm!215)) p!166))))

(assert (= (and d!75781 (not res!284539)) b!476669))

(assert (= (and b!476669 res!284540) b!476670))

(declare-fun b_lambda!10419 () Bool)

(assert (=> (not b_lambda!10419) (not b!476669)))

(declare-fun t!15067 () Bool)

(declare-fun tb!3975 () Bool)

(assert (=> (and start!42766 (= p!166 p!166) t!15067) tb!3975))

(declare-fun result!7527 () Bool)

(assert (=> tb!3975 (= result!7527 true)))

(assert (=> b!476669 t!15067))

(declare-fun b_and!20665 () Bool)

(assert (= b_and!20661 (and (=> t!15067 result!7527) b_and!20665)))

(declare-fun m!458951 () Bool)

(assert (=> b!476669 m!458951))

(declare-fun m!458953 () Bool)

(assert (=> b!476670 m!458953))

(assert (=> start!42766 d!75781))

(declare-fun d!75785 () Bool)

(declare-fun isStrictlySorted!383 (List!9049) Bool)

(assert (=> d!75785 (= (inv!15481 lm!215) (isStrictlySorted!383 (toList!3964 lm!215)))))

(declare-fun bs!15142 () Bool)

(assert (= bs!15142 d!75785))

(declare-fun m!458957 () Bool)

(assert (=> bs!15142 m!458957))

(assert (=> start!42766 d!75785))

(declare-fun b!476677 () Bool)

(declare-fun e!279994 () Bool)

(declare-fun tp!42355 () Bool)

(assert (=> b!476677 (= e!279994 (and tp_is_empty!13517 tp!42355))))

(assert (=> b!476643 (= tp!42349 e!279994)))

(assert (= (and b!476643 (is-Cons!9045 (toList!3964 lm!215))) b!476677))

(declare-fun b_lambda!10423 () Bool)

(assert (= b_lambda!10411 (or (and start!42766 b_free!12095) b_lambda!10423)))

(declare-fun b_lambda!10425 () Bool)

(assert (= b_lambda!10419 (or (and start!42766 b_free!12095) b_lambda!10425)))

(push 1)

(assert (not b_lambda!10425))

(assert (not b_lambda!10403))

(assert tp_is_empty!13517)

(assert (not b!476657))

(assert (not d!75785))

(assert (not b_lambda!10423))

(assert (not b_next!12095))

(assert (not d!75779))

(assert (not d!75777))

(assert (not b!476677))

(assert b_and!20665)

(assert (not b!476670))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20665)

(assert (not b_next!12095))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!75811 () Bool)

(declare-fun res!284563 () Bool)

(declare-fun e!280020 () Bool)

(assert (=> d!75811 (=> res!284563 e!280020)))

(assert (=> d!75811 (= res!284563 (is-Nil!9046 (t!15057 (toList!3964 lm!215))))))

(assert (=> d!75811 (= (forall!193 (t!15057 (toList!3964 lm!215)) p!166) e!280020)))

(declare-fun b!476705 () Bool)

(declare-fun e!280021 () Bool)

(assert (=> b!476705 (= e!280020 e!280021)))

(declare-fun res!284564 () Bool)

(assert (=> b!476705 (=> (not res!284564) (not e!280021))))

(assert (=> b!476705 (= res!284564 (dynLambda!940 p!166 (h!9901 (t!15057 (toList!3964 lm!215)))))))

