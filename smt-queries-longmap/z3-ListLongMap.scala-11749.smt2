; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138206 () Bool)

(assert start!138206)

(declare-fun b!1585304 () Bool)

(declare-fun res!1082198 () Bool)

(declare-fun e!884971 () Bool)

(assert (=> b!1585304 (=> (not res!1082198) (not e!884971))))

(declare-datatypes ((B!2822 0))(
  ( (B!2823 (val!19773 Int)) )
))
(declare-datatypes ((tuple2!25774 0))(
  ( (tuple2!25775 (_1!12898 (_ BitVec 64)) (_2!12898 B!2822)) )
))
(declare-datatypes ((List!36925 0))(
  ( (Nil!36922) (Cons!36921 (h!38482 tuple2!25774) (t!51831 List!36925)) )
))
(declare-fun l!1065 () List!36925)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!974 (List!36925 (_ BitVec 64)) Bool)

(assert (=> b!1585304 (= res!1082198 (containsKey!974 l!1065 key!287))))

(declare-fun b!1585305 () Bool)

(declare-fun res!1082195 () Bool)

(assert (=> b!1585305 (=> (not res!1082195) (not e!884971))))

(get-info :version)

(assert (=> b!1585305 (= res!1082195 (and ((_ is Cons!36921) l!1065) (not (= (_1!12898 (h!38482 l!1065)) key!287))))))

(declare-fun res!1082196 () Bool)

(assert (=> start!138206 (=> (not res!1082196) (not e!884971))))

(declare-fun isStrictlySorted!1115 (List!36925) Bool)

(assert (=> start!138206 (= res!1082196 (isStrictlySorted!1115 l!1065))))

(assert (=> start!138206 e!884971))

(declare-fun e!884972 () Bool)

(assert (=> start!138206 e!884972))

(assert (=> start!138206 true))

(declare-fun b!1585306 () Bool)

(declare-fun e!884970 () Bool)

(assert (=> b!1585306 (= e!884970 (not (containsKey!974 (t!51831 l!1065) key!287)))))

(declare-fun b!1585307 () Bool)

(declare-fun tp_is_empty!39355 () Bool)

(declare-fun tp!114858 () Bool)

(assert (=> b!1585307 (= e!884972 (and tp_is_empty!39355 tp!114858))))

(declare-fun b!1585308 () Bool)

(assert (=> b!1585308 (= e!884971 e!884970)))

(declare-fun res!1082197 () Bool)

(assert (=> b!1585308 (=> res!1082197 e!884970)))

(assert (=> b!1585308 (= res!1082197 (not (isStrictlySorted!1115 (t!51831 l!1065))))))

(assert (= (and start!138206 res!1082196) b!1585304))

(assert (= (and b!1585304 res!1082198) b!1585305))

(assert (= (and b!1585305 res!1082195) b!1585308))

(assert (= (and b!1585308 (not res!1082197)) b!1585306))

(assert (= (and start!138206 ((_ is Cons!36921) l!1065)) b!1585307))

(declare-fun m!1455369 () Bool)

(assert (=> b!1585304 m!1455369))

(declare-fun m!1455371 () Bool)

(assert (=> start!138206 m!1455371))

(declare-fun m!1455373 () Bool)

(assert (=> b!1585306 m!1455373))

(declare-fun m!1455375 () Bool)

(assert (=> b!1585308 m!1455375))

(check-sat tp_is_empty!39355 (not b!1585308) (not b!1585306) (not b!1585304) (not b!1585307) (not start!138206))
(check-sat)
(get-model)

(declare-fun d!167783 () Bool)

(declare-fun res!1082231 () Bool)

(declare-fun e!884999 () Bool)

(assert (=> d!167783 (=> res!1082231 e!884999)))

(assert (=> d!167783 (= res!1082231 (and ((_ is Cons!36921) l!1065) (= (_1!12898 (h!38482 l!1065)) key!287)))))

(assert (=> d!167783 (= (containsKey!974 l!1065 key!287) e!884999)))

(declare-fun b!1585347 () Bool)

(declare-fun e!885000 () Bool)

(assert (=> b!1585347 (= e!884999 e!885000)))

(declare-fun res!1082232 () Bool)

(assert (=> b!1585347 (=> (not res!1082232) (not e!885000))))

(assert (=> b!1585347 (= res!1082232 (and (or (not ((_ is Cons!36921) l!1065)) (bvsle (_1!12898 (h!38482 l!1065)) key!287)) ((_ is Cons!36921) l!1065) (bvslt (_1!12898 (h!38482 l!1065)) key!287)))))

(declare-fun b!1585348 () Bool)

(assert (=> b!1585348 (= e!885000 (containsKey!974 (t!51831 l!1065) key!287))))

(assert (= (and d!167783 (not res!1082231)) b!1585347))

(assert (= (and b!1585347 res!1082232) b!1585348))

(assert (=> b!1585348 m!1455373))

(assert (=> b!1585304 d!167783))

(declare-fun d!167787 () Bool)

(declare-fun res!1082247 () Bool)

(declare-fun e!885015 () Bool)

(assert (=> d!167787 (=> res!1082247 e!885015)))

(assert (=> d!167787 (= res!1082247 (or ((_ is Nil!36922) l!1065) ((_ is Nil!36922) (t!51831 l!1065))))))

(assert (=> d!167787 (= (isStrictlySorted!1115 l!1065) e!885015)))

(declare-fun b!1585363 () Bool)

(declare-fun e!885016 () Bool)

(assert (=> b!1585363 (= e!885015 e!885016)))

(declare-fun res!1082248 () Bool)

(assert (=> b!1585363 (=> (not res!1082248) (not e!885016))))

(assert (=> b!1585363 (= res!1082248 (bvslt (_1!12898 (h!38482 l!1065)) (_1!12898 (h!38482 (t!51831 l!1065)))))))

(declare-fun b!1585364 () Bool)

(assert (=> b!1585364 (= e!885016 (isStrictlySorted!1115 (t!51831 l!1065)))))

(assert (= (and d!167787 (not res!1082247)) b!1585363))

(assert (= (and b!1585363 res!1082248) b!1585364))

(assert (=> b!1585364 m!1455375))

(assert (=> start!138206 d!167787))

(declare-fun d!167793 () Bool)

(declare-fun res!1082249 () Bool)

(declare-fun e!885017 () Bool)

(assert (=> d!167793 (=> res!1082249 e!885017)))

(assert (=> d!167793 (= res!1082249 (or ((_ is Nil!36922) (t!51831 l!1065)) ((_ is Nil!36922) (t!51831 (t!51831 l!1065)))))))

(assert (=> d!167793 (= (isStrictlySorted!1115 (t!51831 l!1065)) e!885017)))

(declare-fun b!1585365 () Bool)

(declare-fun e!885018 () Bool)

(assert (=> b!1585365 (= e!885017 e!885018)))

(declare-fun res!1082250 () Bool)

(assert (=> b!1585365 (=> (not res!1082250) (not e!885018))))

(assert (=> b!1585365 (= res!1082250 (bvslt (_1!12898 (h!38482 (t!51831 l!1065))) (_1!12898 (h!38482 (t!51831 (t!51831 l!1065))))))))

(declare-fun b!1585366 () Bool)

(assert (=> b!1585366 (= e!885018 (isStrictlySorted!1115 (t!51831 (t!51831 l!1065))))))

(assert (= (and d!167793 (not res!1082249)) b!1585365))

(assert (= (and b!1585365 res!1082250) b!1585366))

(declare-fun m!1455393 () Bool)

(assert (=> b!1585366 m!1455393))

(assert (=> b!1585308 d!167793))

(declare-fun d!167795 () Bool)

(declare-fun res!1082253 () Bool)

(declare-fun e!885021 () Bool)

(assert (=> d!167795 (=> res!1082253 e!885021)))

(assert (=> d!167795 (= res!1082253 (and ((_ is Cons!36921) (t!51831 l!1065)) (= (_1!12898 (h!38482 (t!51831 l!1065))) key!287)))))

(assert (=> d!167795 (= (containsKey!974 (t!51831 l!1065) key!287) e!885021)))

(declare-fun b!1585369 () Bool)

(declare-fun e!885022 () Bool)

(assert (=> b!1585369 (= e!885021 e!885022)))

(declare-fun res!1082254 () Bool)

(assert (=> b!1585369 (=> (not res!1082254) (not e!885022))))

(assert (=> b!1585369 (= res!1082254 (and (or (not ((_ is Cons!36921) (t!51831 l!1065))) (bvsle (_1!12898 (h!38482 (t!51831 l!1065))) key!287)) ((_ is Cons!36921) (t!51831 l!1065)) (bvslt (_1!12898 (h!38482 (t!51831 l!1065))) key!287)))))

(declare-fun b!1585370 () Bool)

(assert (=> b!1585370 (= e!885022 (containsKey!974 (t!51831 (t!51831 l!1065)) key!287))))

(assert (= (and d!167795 (not res!1082253)) b!1585369))

(assert (= (and b!1585369 res!1082254) b!1585370))

(declare-fun m!1455397 () Bool)

(assert (=> b!1585370 m!1455397))

(assert (=> b!1585306 d!167795))

(declare-fun b!1585383 () Bool)

(declare-fun e!885033 () Bool)

(declare-fun tp!114867 () Bool)

(assert (=> b!1585383 (= e!885033 (and tp_is_empty!39355 tp!114867))))

(assert (=> b!1585307 (= tp!114858 e!885033)))

(assert (= (and b!1585307 ((_ is Cons!36921) (t!51831 l!1065))) b!1585383))

(check-sat (not b!1585383) (not b!1585364) (not b!1585348) (not b!1585370) tp_is_empty!39355 (not b!1585366))
(check-sat)
