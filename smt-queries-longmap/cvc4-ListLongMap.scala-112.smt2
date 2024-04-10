; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1942 () Bool)

(assert start!1942)

(declare-fun b!13102 () Bool)

(assert (=> b!13102 true))

(declare-fun b!13098 () Bool)

(declare-fun res!10378 () Bool)

(declare-fun e!7849 () Bool)

(assert (=> b!13098 (=> (not res!10378) (not e!7849))))

(declare-datatypes ((B!474 0))(
  ( (B!475 (val!335 Int)) )
))
(declare-datatypes ((tuple2!470 0))(
  ( (tuple2!471 (_1!235 (_ BitVec 64)) (_2!235 B!474)) )
))
(declare-datatypes ((List!390 0))(
  ( (Nil!387) (Cons!386 (h!952 tuple2!470) (t!2783 List!390)) )
))
(declare-fun l!522 () List!390)

(declare-fun value!159 () B!474)

(assert (=> b!13098 (= res!10378 (and (is-Cons!386 l!522) (= (_2!235 (h!952 l!522)) value!159)))))

(declare-fun b!13099 () Bool)

(declare-fun e!7848 () Bool)

(assert (=> b!13099 (= e!7849 e!7848)))

(declare-fun res!10376 () Bool)

(assert (=> b!13099 (=> (not res!10376) (not e!7848))))

(declare-fun lt!3489 () List!390)

(declare-fun isStrictlySorted!77 (List!390) Bool)

(assert (=> b!13099 (= res!10376 (isStrictlySorted!77 lt!3489))))

(declare-fun $colon$colon!11 (List!390 tuple2!470) List!390)

(declare-fun filterByValue!3 (List!390 B!474) List!390)

(assert (=> b!13099 (= lt!3489 ($colon$colon!11 (filterByValue!3 (t!2783 l!522) value!159) (h!952 l!522)))))

(declare-fun b!13100 () Bool)

(declare-fun e!7850 () Bool)

(declare-fun tp_is_empty!653 () Bool)

(declare-fun tp!2147 () Bool)

(assert (=> b!13100 (= e!7850 (and tp_is_empty!653 tp!2147))))

(declare-fun b!13101 () Bool)

(declare-fun res!10375 () Bool)

(assert (=> b!13101 (=> (not res!10375) (not e!7848))))

(declare-fun isEmpty!77 (List!390) Bool)

(assert (=> b!13101 (= res!10375 (not (isEmpty!77 l!522)))))

(declare-fun res!10374 () Bool)

(assert (=> start!1942 (=> (not res!10374) (not e!7849))))

(assert (=> start!1942 (= res!10374 (isStrictlySorted!77 l!522))))

(assert (=> start!1942 e!7849))

(assert (=> start!1942 e!7850))

(assert (=> start!1942 tp_is_empty!653))

(declare-fun res!10373 () Bool)

(assert (=> b!13102 (=> (not res!10373) (not e!7848))))

(declare-fun lambda!50 () Int)

(declare-fun forall!70 (List!390 Int) Bool)

(assert (=> b!13102 (= res!10373 (forall!70 lt!3489 lambda!50))))

(declare-fun b!13103 () Bool)

(declare-fun res!10377 () Bool)

(assert (=> b!13103 (=> (not res!10377) (not e!7848))))

(assert (=> b!13103 (= res!10377 (not (isEmpty!77 lt!3489)))))

(declare-fun b!13104 () Bool)

(assert (=> b!13104 (= e!7848 (= lt!3489 Nil!387))))

(assert (= (and start!1942 res!10374) b!13098))

(assert (= (and b!13098 res!10378) b!13099))

(assert (= (and b!13099 res!10376) b!13102))

(assert (= (and b!13102 res!10373) b!13101))

(assert (= (and b!13101 res!10375) b!13103))

(assert (= (and b!13103 res!10377) b!13104))

(assert (= (and start!1942 (is-Cons!386 l!522)) b!13100))

(declare-fun m!8955 () Bool)

(assert (=> b!13102 m!8955))

(declare-fun m!8957 () Bool)

(assert (=> start!1942 m!8957))

(declare-fun m!8959 () Bool)

(assert (=> b!13101 m!8959))

(declare-fun m!8961 () Bool)

(assert (=> b!13103 m!8961))

(declare-fun m!8963 () Bool)

(assert (=> b!13099 m!8963))

(declare-fun m!8965 () Bool)

(assert (=> b!13099 m!8965))

(assert (=> b!13099 m!8965))

(declare-fun m!8967 () Bool)

(assert (=> b!13099 m!8967))

(push 1)

(assert (not b!13103))

(assert (not b!13099))

(assert (not b!13102))

(assert (not start!1942))

(assert tp_is_empty!653)

(assert (not b!13100))

(assert (not b!13101))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1951 () Bool)

(assert (=> d!1951 (= (isEmpty!77 l!522) (is-Nil!387 l!522))))

(assert (=> b!13101 d!1951))

(declare-fun d!1955 () Bool)

(declare-fun res!10393 () Bool)

(declare-fun e!7865 () Bool)

(assert (=> d!1955 (=> res!10393 e!7865)))

(assert (=> d!1955 (= res!10393 (is-Nil!387 lt!3489))))

(assert (=> d!1955 (= (forall!70 lt!3489 lambda!50) e!7865)))

(declare-fun b!13121 () Bool)

(declare-fun e!7866 () Bool)

(assert (=> b!13121 (= e!7865 e!7866)))

(declare-fun res!10394 () Bool)

(assert (=> b!13121 (=> (not res!10394) (not e!7866))))

(declare-fun dynLambda!83 (Int tuple2!470) Bool)

(assert (=> b!13121 (= res!10394 (dynLambda!83 lambda!50 (h!952 lt!3489)))))

(declare-fun b!13122 () Bool)

(assert (=> b!13122 (= e!7866 (forall!70 (t!2783 lt!3489) lambda!50))))

(assert (= (and d!1955 (not res!10393)) b!13121))

(assert (= (and b!13121 res!10394) b!13122))

(declare-fun b_lambda!865 () Bool)

(assert (=> (not b_lambda!865) (not b!13121)))

(declare-fun m!8973 () Bool)

(assert (=> b!13121 m!8973))

(declare-fun m!8975 () Bool)

(assert (=> b!13122 m!8975))

(assert (=> b!13102 d!1955))

(declare-fun d!1959 () Bool)

(declare-fun res!10410 () Bool)

(declare-fun e!7882 () Bool)

(assert (=> d!1959 (=> res!10410 e!7882)))

(assert (=> d!1959 (= res!10410 (or (is-Nil!387 l!522) (is-Nil!387 (t!2783 l!522))))))

(assert (=> d!1959 (= (isStrictlySorted!77 l!522) e!7882)))

(declare-fun b!13139 () Bool)

(declare-fun e!7884 () Bool)

(assert (=> b!13139 (= e!7882 e!7884)))

(declare-fun res!10412 () Bool)

(assert (=> b!13139 (=> (not res!10412) (not e!7884))))

(assert (=> b!13139 (= res!10412 (bvslt (_1!235 (h!952 l!522)) (_1!235 (h!952 (t!2783 l!522)))))))

(declare-fun b!13140 () Bool)

(assert (=> b!13140 (= e!7884 (isStrictlySorted!77 (t!2783 l!522)))))

(assert (= (and d!1959 (not res!10410)) b!13139))

(assert (= (and b!13139 res!10412) b!13140))

(declare-fun m!8979 () Bool)

(assert (=> b!13140 m!8979))

(assert (=> start!1942 d!1959))

(declare-fun d!1969 () Bool)

(assert (=> d!1969 (= (isEmpty!77 lt!3489) (is-Nil!387 lt!3489))))

(assert (=> b!13103 d!1969))

(declare-fun d!1971 () Bool)

(declare-fun res!10415 () Bool)

(declare-fun e!7887 () Bool)

(assert (=> d!1971 (=> res!10415 e!7887)))

(assert (=> d!1971 (= res!10415 (or (is-Nil!387 lt!3489) (is-Nil!387 (t!2783 lt!3489))))))

(assert (=> d!1971 (= (isStrictlySorted!77 lt!3489) e!7887)))

(declare-fun b!13143 () Bool)

(declare-fun e!7888 () Bool)

(assert (=> b!13143 (= e!7887 e!7888)))

(declare-fun res!10416 () Bool)

(assert (=> b!13143 (=> (not res!10416) (not e!7888))))

(assert (=> b!13143 (= res!10416 (bvslt (_1!235 (h!952 lt!3489)) (_1!235 (h!952 (t!2783 lt!3489)))))))

(declare-fun b!13144 () Bool)

(assert (=> b!13144 (= e!7888 (isStrictlySorted!77 (t!2783 lt!3489)))))

(assert (= (and d!1971 (not res!10415)) b!13143))

(assert (= (and b!13143 res!10416) b!13144))

(declare-fun m!8987 () Bool)

(assert (=> b!13144 m!8987))

(assert (=> b!13099 d!1971))

(declare-fun d!1977 () Bool)

(assert (=> d!1977 (= ($colon$colon!11 (filterByValue!3 (t!2783 l!522) value!159) (h!952 l!522)) (Cons!386 (h!952 l!522) (filterByValue!3 (t!2783 l!522) value!159)))))

(assert (=> b!13099 d!1977))

(declare-fun bs!512 () Bool)

(declare-fun b!13203 () Bool)

(assert (= bs!512 (and b!13203 b!13102)))

(declare-fun lambda!58 () Int)

(assert (=> bs!512 (= lambda!58 lambda!50)))

(assert (=> b!13203 true))

(declare-fun res!10440 () Bool)

(declare-fun e!7926 () Bool)

(assert (=> b!13203 (=> (not res!10440) (not e!7926))))

(declare-fun lt!3496 () List!390)

(assert (=> b!13203 (= res!10440 (forall!70 lt!3496 lambda!58))))

(declare-fun b!13204 () Bool)

(declare-fun e!7923 () Bool)

(declare-fun e!7925 () Bool)

(assert (=> b!13204 (= e!7923 e!7925)))

(declare-fun res!10441 () Bool)

(declare-fun call!360 () Bool)

(assert (=> b!13204 (= res!10441 call!360)))

(assert (=> b!13204 (=> res!10441 e!7925)))

(declare-fun b!13205 () Bool)

(assert (=> b!13205 (= e!7923 call!360)))

(declare-fun b!13206 () Bool)

(declare-fun e!7924 () List!390)

(declare-fun call!361 () List!390)

(assert (=> b!13206 (= e!7924 ($colon$colon!11 call!361 (h!952 (t!2783 l!522))))))

(declare-fun bm!357 () Bool)

(assert (=> bm!357 (= call!361 (filterByValue!3 (t!2783 (t!2783 l!522)) value!159))))

(declare-fun b!13207 () Bool)

(declare-fun e!7927 () List!390)

(assert (=> b!13207 (= e!7924 e!7927)))

(declare-fun c!1235 () Bool)

(assert (=> b!13207 (= c!1235 (and (is-Cons!386 (t!2783 l!522)) (not (= (_2!235 (h!952 (t!2783 l!522))) value!159))))))

(declare-fun d!1983 () Bool)

(assert (=> d!1983 e!7926))

(declare-fun res!10439 () Bool)

(assert (=> d!1983 (=> (not res!10439) (not e!7926))))

(assert (=> d!1983 (= res!10439 (isStrictlySorted!77 lt!3496))))

(assert (=> d!1983 (= lt!3496 e!7924)))

(declare-fun c!1233 () Bool)

(assert (=> d!1983 (= c!1233 (and (is-Cons!386 (t!2783 l!522)) (= (_2!235 (h!952 (t!2783 l!522))) value!159)))))

(assert (=> d!1983 (isStrictlySorted!77 (t!2783 l!522))))

(assert (=> d!1983 (= (filterByValue!3 (t!2783 l!522) value!159) lt!3496)))

(declare-fun bm!358 () Bool)

(assert (=> bm!358 (= call!360 (isEmpty!77 lt!3496))))

(declare-fun b!13208 () Bool)

(assert (=> b!13208 (= e!7926 e!7923)))

(declare-fun c!1234 () Bool)

(assert (=> b!13208 (= c!1234 (isEmpty!77 (t!2783 l!522)))))

(declare-fun b!13209 () Bool)

(declare-fun head!784 (List!390) tuple2!470)

(assert (=> b!13209 (= e!7925 (bvsge (_1!235 (head!784 lt!3496)) (_1!235 (head!784 (t!2783 l!522)))))))

(declare-fun b!13210 () Bool)

(assert (=> b!13210 (= e!7927 call!361)))

(declare-fun b!13211 () Bool)

(assert (=> b!13211 (= e!7927 Nil!387)))

(assert (= (and d!1983 c!1233) b!13206))

(assert (= (and d!1983 (not c!1233)) b!13207))

(assert (= (and b!13207 c!1235) b!13210))

(assert (= (and b!13207 (not c!1235)) b!13211))

(assert (= (or b!13206 b!13210) bm!357))

(assert (= (and d!1983 res!10439) b!13203))

(assert (= (and b!13203 res!10440) b!13208))

(assert (= (and b!13208 c!1234) b!13205))

(assert (= (and b!13208 (not c!1234)) b!13204))

(assert (= (and b!13204 (not res!10441)) b!13209))

(assert (= (or b!13205 b!13204) bm!358))

(declare-fun m!8995 () Bool)

(assert (=> b!13203 m!8995))

(declare-fun m!9002 () Bool)

(assert (=> b!13209 m!9002))

(declare-fun m!9007 () Bool)

(assert (=> b!13209 m!9007))

(declare-fun m!9013 () Bool)

(assert (=> b!13206 m!9013))

