; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43812 () Bool)

(assert start!43812)

(declare-fun b!484071 () Bool)

(declare-fun e!284939 () Bool)

(declare-fun e!284938 () Bool)

(assert (=> b!484071 (= e!284939 e!284938)))

(declare-fun res!288417 () Bool)

(assert (=> b!484071 (=> (not res!288417) (not e!284938))))

(declare-datatypes ((B!1124 0))(
  ( (B!1125 (val!7014 Int)) )
))
(declare-datatypes ((tuple2!9230 0))(
  ( (tuple2!9231 (_1!4626 (_ BitVec 64)) (_2!4626 B!1124)) )
))
(declare-datatypes ((List!9278 0))(
  ( (Nil!9275) (Cons!9274 (h!10130 tuple2!9230) (t!15500 List!9278)) )
))
(declare-fun l!956 () List!9278)

(declare-fun key!251 () (_ BitVec 64))

(assert (=> b!484071 (= res!288417 (and (is-Cons!9274 l!956) (bvslt (_1!4626 (h!10130 l!956)) key!251)))))

(declare-fun value!166 () B!1124)

(declare-fun lt!219343 () List!9278)

(declare-fun insertStrictlySorted!232 (List!9278 (_ BitVec 64) B!1124) List!9278)

(assert (=> b!484071 (= lt!219343 (insertStrictlySorted!232 l!956 key!251 value!166))))

(declare-fun b!484072 () Bool)

(declare-fun isStrictlySorted!417 (List!9278) Bool)

(assert (=> b!484072 (= e!284938 (not (isStrictlySorted!417 (t!15500 l!956))))))

(declare-fun res!288418 () Bool)

(assert (=> start!43812 (=> (not res!288418) (not e!284939))))

(assert (=> start!43812 (= res!288418 (isStrictlySorted!417 l!956))))

(assert (=> start!43812 e!284939))

(declare-fun e!284940 () Bool)

(assert (=> start!43812 e!284940))

(assert (=> start!43812 true))

(declare-fun tp_is_empty!13933 () Bool)

(assert (=> start!43812 tp_is_empty!13933))

(declare-fun b!484073 () Bool)

(declare-fun tp!43498 () Bool)

(assert (=> b!484073 (= e!284940 (and tp_is_empty!13933 tp!43498))))

(declare-fun b!484070 () Bool)

(declare-fun res!288419 () Bool)

(assert (=> b!484070 (=> (not res!288419) (not e!284939))))

(declare-fun containsKey!380 (List!9278 (_ BitVec 64)) Bool)

(assert (=> b!484070 (= res!288419 (not (containsKey!380 l!956 key!251)))))

(assert (= (and start!43812 res!288418) b!484070))

(assert (= (and b!484070 res!288419) b!484071))

(assert (= (and b!484071 res!288417) b!484072))

(assert (= (and start!43812 (is-Cons!9274 l!956)) b!484073))

(declare-fun m!464877 () Bool)

(assert (=> b!484071 m!464877))

(declare-fun m!464879 () Bool)

(assert (=> b!484072 m!464879))

(declare-fun m!464881 () Bool)

(assert (=> start!43812 m!464881))

(declare-fun m!464883 () Bool)

(assert (=> b!484070 m!464883))

(push 1)

(assert (not b!484070))

(assert (not start!43812))

(assert tp_is_empty!13933)

(assert (not b!484073))

(assert (not b!484072))

(assert (not b!484071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77047 () Bool)

(declare-fun res!288452 () Bool)

(declare-fun e!284973 () Bool)

(assert (=> d!77047 (=> res!288452 e!284973)))

(assert (=> d!77047 (= res!288452 (or (is-Nil!9275 l!956) (is-Nil!9275 (t!15500 l!956))))))

(assert (=> d!77047 (= (isStrictlySorted!417 l!956) e!284973)))

(declare-fun b!484112 () Bool)

(declare-fun e!284974 () Bool)

(assert (=> b!484112 (= e!284973 e!284974)))

(declare-fun res!288453 () Bool)

(assert (=> b!484112 (=> (not res!288453) (not e!284974))))

(assert (=> b!484112 (= res!288453 (bvslt (_1!4626 (h!10130 l!956)) (_1!4626 (h!10130 (t!15500 l!956)))))))

(declare-fun b!484113 () Bool)

(assert (=> b!484113 (= e!284974 (isStrictlySorted!417 (t!15500 l!956)))))

(assert (= (and d!77047 (not res!288452)) b!484112))

(assert (= (and b!484112 res!288453) b!484113))

(assert (=> b!484113 m!464879))

(assert (=> start!43812 d!77047))

(declare-fun e!285014 () List!9278)

(declare-fun b!484188 () Bool)

(assert (=> b!484188 (= e!285014 (insertStrictlySorted!232 (t!15500 l!956) key!251 value!166))))

(declare-fun b!484189 () Bool)

(declare-fun e!285015 () List!9278)

(declare-fun call!31090 () List!9278)

(assert (=> b!484189 (= e!285015 call!31090)))

(declare-fun b!484190 () Bool)

(declare-fun c!58201 () Bool)

(declare-fun c!58204 () Bool)

(assert (=> b!484190 (= e!285014 (ite c!58204 (t!15500 l!956) (ite c!58201 (Cons!9274 (h!10130 l!956) (t!15500 l!956)) Nil!9275)))))

(declare-fun d!77053 () Bool)

(declare-fun e!285017 () Bool)

(assert (=> d!77053 e!285017))

(declare-fun res!288472 () Bool)

(assert (=> d!77053 (=> (not res!288472) (not e!285017))))

(declare-fun lt!219357 () List!9278)

(assert (=> d!77053 (= res!288472 (isStrictlySorted!417 lt!219357))))

(declare-fun e!285018 () List!9278)

(assert (=> d!77053 (= lt!219357 e!285018)))

(declare-fun c!58203 () Bool)

(assert (=> d!77053 (= c!58203 (and (is-Cons!9274 l!956) (bvslt (_1!4626 (h!10130 l!956)) key!251)))))

(assert (=> d!77053 (isStrictlySorted!417 l!956)))

(assert (=> d!77053 (= (insertStrictlySorted!232 l!956 key!251 value!166) lt!219357)))

(declare-fun b!484191 () Bool)

(declare-fun res!288473 () Bool)

(assert (=> b!484191 (=> (not res!288473) (not e!285017))))

(assert (=> b!484191 (= res!288473 (containsKey!380 lt!219357 key!251))))

(declare-fun b!484192 () Bool)

(assert (=> b!484192 (= e!285015 call!31090)))

(declare-fun b!484193 () Bool)

(declare-fun e!285016 () List!9278)

(declare-fun call!31089 () List!9278)

(assert (=> b!484193 (= e!285016 call!31089)))

(declare-fun bm!31086 () Bool)

(declare-fun call!31091 () List!9278)

(declare-fun $colon$colon!116 (List!9278 tuple2!9230) List!9278)

(assert (=> bm!31086 (= call!31091 ($colon$colon!116 e!285014 (ite c!58203 (h!10130 l!956) (tuple2!9231 key!251 value!166))))))

(declare-fun c!58202 () Bool)

(assert (=> bm!31086 (= c!58202 c!58203)))

(declare-fun b!484194 () Bool)

(assert (=> b!484194 (= e!285018 call!31091)))

(declare-fun bm!31087 () Bool)

(assert (=> bm!31087 (= call!31089 call!31091)))

(declare-fun b!484195 () Bool)

(declare-fun contains!2677 (List!9278 tuple2!9230) Bool)

(assert (=> b!484195 (= e!285017 (contains!2677 lt!219357 (tuple2!9231 key!251 value!166)))))

(declare-fun b!484196 () Bool)

(assert (=> b!484196 (= c!58201 (and (is-Cons!9274 l!956) (bvsgt (_1!4626 (h!10130 l!956)) key!251)))))

(assert (=> b!484196 (= e!285016 e!285015)))

(declare-fun b!484197 () Bool)

(assert (=> b!484197 (= e!285018 e!285016)))

(assert (=> b!484197 (= c!58204 (and (is-Cons!9274 l!956) (= (_1!4626 (h!10130 l!956)) key!251)))))

(declare-fun bm!31088 () Bool)

(assert (=> bm!31088 (= call!31090 call!31089)))

(assert (= (and d!77053 c!58203) b!484194))

(assert (= (and d!77053 (not c!58203)) b!484197))

(assert (= (and b!484197 c!58204) b!484193))

(assert (= (and b!484197 (not c!58204)) b!484196))

(assert (= (and b!484196 c!58201) b!484192))

(assert (= (and b!484196 (not c!58201)) b!484189))

(assert (= (or b!484192 b!484189) bm!31088))

(assert (= (or b!484193 bm!31088) bm!31087))

(assert (= (or b!484194 bm!31087) bm!31086))

(assert (= (and bm!31086 c!58202) b!484188))

(assert (= (and bm!31086 (not c!58202)) b!484190))

(assert (= (and d!77053 res!288472) b!484191))

(assert (= (and b!484191 res!288473) b!484195))

(declare-fun m!464913 () Bool)

(assert (=> b!484195 m!464913))

(declare-fun m!464917 () Bool)

(assert (=> b!484188 m!464917))

(declare-fun m!464919 () Bool)

(assert (=> b!484191 m!464919))

(declare-fun m!464921 () Bool)

(assert (=> bm!31086 m!464921))

(declare-fun m!464923 () Bool)

(assert (=> d!77053 m!464923))

(assert (=> d!77053 m!464881))

(assert (=> b!484071 d!77053))

(declare-fun d!77061 () Bool)

(declare-fun res!288476 () Bool)

(declare-fun e!285024 () Bool)

(assert (=> d!77061 (=> res!288476 e!285024)))

(assert (=> d!77061 (= res!288476 (or (is-Nil!9275 (t!15500 l!956)) (is-Nil!9275 (t!15500 (t!15500 l!956)))))))

(assert (=> d!77061 (= (isStrictlySorted!417 (t!15500 l!956)) e!285024)))

(declare-fun b!484208 () Bool)

(declare-fun e!285025 () Bool)

(assert (=> b!484208 (= e!285024 e!285025)))

(declare-fun res!288477 () Bool)

(assert (=> b!484208 (=> (not res!288477) (not e!285025))))

(assert (=> b!484208 (= res!288477 (bvslt (_1!4626 (h!10130 (t!15500 l!956))) (_1!4626 (h!10130 (t!15500 (t!15500 l!956))))))))

(declare-fun b!484209 () Bool)

(assert (=> b!484209 (= e!285025 (isStrictlySorted!417 (t!15500 (t!15500 l!956))))))

(assert (= (and d!77061 (not res!288476)) b!484208))

(assert (= (and b!484208 res!288477) b!484209))

(declare-fun m!464925 () Bool)

(assert (=> b!484209 m!464925))

(assert (=> b!484072 d!77061))

(declare-fun d!77063 () Bool)

(declare-fun res!288488 () Bool)

(declare-fun e!285039 () Bool)

(assert (=> d!77063 (=> res!288488 e!285039)))

(assert (=> d!77063 (= res!288488 (and (is-Cons!9274 l!956) (= (_1!4626 (h!10130 l!956)) key!251)))))

(assert (=> d!77063 (= (containsKey!380 l!956 key!251) e!285039)))

(declare-fun b!484225 () Bool)

(declare-fun e!285040 () Bool)

(assert (=> b!484225 (= e!285039 e!285040)))

(declare-fun res!288489 () Bool)

(assert (=> b!484225 (=> (not res!288489) (not e!285040))))

