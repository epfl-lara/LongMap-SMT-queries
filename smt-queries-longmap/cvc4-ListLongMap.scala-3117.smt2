; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43816 () Bool)

(assert start!43816)

(declare-fun b!484095 () Bool)

(declare-fun e!284958 () Bool)

(declare-fun e!284957 () Bool)

(assert (=> b!484095 (= e!284958 e!284957)))

(declare-fun res!288437 () Bool)

(assert (=> b!484095 (=> (not res!288437) (not e!284957))))

(declare-datatypes ((B!1128 0))(
  ( (B!1129 (val!7016 Int)) )
))
(declare-datatypes ((tuple2!9234 0))(
  ( (tuple2!9235 (_1!4628 (_ BitVec 64)) (_2!4628 B!1128)) )
))
(declare-datatypes ((List!9280 0))(
  ( (Nil!9277) (Cons!9276 (h!10132 tuple2!9234) (t!15502 List!9280)) )
))
(declare-fun l!956 () List!9280)

(declare-fun key!251 () (_ BitVec 64))

(assert (=> b!484095 (= res!288437 (and (is-Cons!9276 l!956) (bvslt (_1!4628 (h!10132 l!956)) key!251)))))

(declare-fun lt!219349 () List!9280)

(declare-fun value!166 () B!1128)

(declare-fun insertStrictlySorted!234 (List!9280 (_ BitVec 64) B!1128) List!9280)

(assert (=> b!484095 (= lt!219349 (insertStrictlySorted!234 l!956 key!251 value!166))))

(declare-fun b!484096 () Bool)

(declare-fun isStrictlySorted!419 (List!9280) Bool)

(assert (=> b!484096 (= e!284957 (not (isStrictlySorted!419 (t!15502 l!956))))))

(declare-fun b!484094 () Bool)

(declare-fun res!288436 () Bool)

(assert (=> b!484094 (=> (not res!288436) (not e!284958))))

(declare-fun containsKey!382 (List!9280 (_ BitVec 64)) Bool)

(assert (=> b!484094 (= res!288436 (not (containsKey!382 l!956 key!251)))))

(declare-fun res!288435 () Bool)

(assert (=> start!43816 (=> (not res!288435) (not e!284958))))

(assert (=> start!43816 (= res!288435 (isStrictlySorted!419 l!956))))

(assert (=> start!43816 e!284958))

(declare-fun e!284956 () Bool)

(assert (=> start!43816 e!284956))

(assert (=> start!43816 true))

(declare-fun tp_is_empty!13937 () Bool)

(assert (=> start!43816 tp_is_empty!13937))

(declare-fun b!484097 () Bool)

(declare-fun tp!43504 () Bool)

(assert (=> b!484097 (= e!284956 (and tp_is_empty!13937 tp!43504))))

(assert (= (and start!43816 res!288435) b!484094))

(assert (= (and b!484094 res!288436) b!484095))

(assert (= (and b!484095 res!288437) b!484096))

(assert (= (and start!43816 (is-Cons!9276 l!956)) b!484097))

(declare-fun m!464893 () Bool)

(assert (=> b!484095 m!464893))

(declare-fun m!464895 () Bool)

(assert (=> b!484096 m!464895))

(declare-fun m!464897 () Bool)

(assert (=> b!484094 m!464897))

(declare-fun m!464899 () Bool)

(assert (=> start!43816 m!464899))

(push 1)

(assert (not start!43816))

(assert (not b!484097))

(assert (not b!484096))

(assert tp_is_empty!13937)

(assert (not b!484094))

(assert (not b!484095))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!484178 () Bool)

(declare-fun e!285013 () List!9280)

(declare-fun call!31088 () List!9280)

(assert (=> b!484178 (= e!285013 call!31088)))

(declare-fun b!484179 () Bool)

(declare-fun e!285012 () List!9280)

(assert (=> b!484179 (= e!285012 (insertStrictlySorted!234 (t!15502 l!956) key!251 value!166))))

(declare-fun c!58200 () Bool)

(declare-fun c!58197 () Bool)

(declare-fun b!484180 () Bool)

(assert (=> b!484180 (= e!285012 (ite c!58200 (t!15502 l!956) (ite c!58197 (Cons!9276 (h!10132 l!956) (t!15502 l!956)) Nil!9277)))))

(declare-fun b!484181 () Bool)

(declare-fun lt!219356 () List!9280)

(declare-fun e!285010 () Bool)

(declare-fun contains!2675 (List!9280 tuple2!9234) Bool)

(assert (=> b!484181 (= e!285010 (contains!2675 lt!219356 (tuple2!9235 key!251 value!166)))))

(declare-fun b!484182 () Bool)

(declare-fun e!285009 () List!9280)

(declare-fun call!31087 () List!9280)

(assert (=> b!484182 (= e!285009 call!31087)))

(declare-fun b!484183 () Bool)

(declare-fun e!285011 () List!9280)

(declare-fun call!31086 () List!9280)

(assert (=> b!484183 (= e!285011 call!31086)))

(declare-fun b!484184 () Bool)

(declare-fun res!288471 () Bool)

(assert (=> b!484184 (=> (not res!288471) (not e!285010))))

(assert (=> b!484184 (= res!288471 (containsKey!382 lt!219356 key!251))))

(declare-fun d!77051 () Bool)

(assert (=> d!77051 e!285010))

(declare-fun res!288470 () Bool)

(assert (=> d!77051 (=> (not res!288470) (not e!285010))))

(assert (=> d!77051 (= res!288470 (isStrictlySorted!419 lt!219356))))

(assert (=> d!77051 (= lt!219356 e!285009)))

(declare-fun c!58198 () Bool)

(assert (=> d!77051 (= c!58198 (and (is-Cons!9276 l!956) (bvslt (_1!4628 (h!10132 l!956)) key!251)))))

(assert (=> d!77051 (isStrictlySorted!419 l!956)))

(assert (=> d!77051 (= (insertStrictlySorted!234 l!956 key!251 value!166) lt!219356)))

(declare-fun b!484185 () Bool)

(assert (=> b!484185 (= e!285009 e!285013)))

(assert (=> b!484185 (= c!58200 (and (is-Cons!9276 l!956) (= (_1!4628 (h!10132 l!956)) key!251)))))

(declare-fun b!484186 () Bool)

(assert (=> b!484186 (= e!285011 call!31086)))

(declare-fun b!484187 () Bool)

(assert (=> b!484187 (= c!58197 (and (is-Cons!9276 l!956) (bvsgt (_1!4628 (h!10132 l!956)) key!251)))))

(assert (=> b!484187 (= e!285013 e!285011)))

(declare-fun bm!31083 () Bool)

(assert (=> bm!31083 (= call!31088 call!31087)))

(declare-fun bm!31084 () Bool)

(assert (=> bm!31084 (= call!31086 call!31088)))

(declare-fun bm!31085 () Bool)

(declare-fun $colon$colon!118 (List!9280 tuple2!9234) List!9280)

(assert (=> bm!31085 (= call!31087 ($colon$colon!118 e!285012 (ite c!58198 (h!10132 l!956) (tuple2!9235 key!251 value!166))))))

(declare-fun c!58199 () Bool)

(assert (=> bm!31085 (= c!58199 c!58198)))

(assert (= (and d!77051 c!58198) b!484182))

(assert (= (and d!77051 (not c!58198)) b!484185))

(assert (= (and b!484185 c!58200) b!484178))

(assert (= (and b!484185 (not c!58200)) b!484187))

(assert (= (and b!484187 c!58197) b!484186))

(assert (= (and b!484187 (not c!58197)) b!484183))

(assert (= (or b!484186 b!484183) bm!31084))

(assert (= (or b!484178 bm!31084) bm!31083))

(assert (= (or b!484182 bm!31083) bm!31085))

(assert (= (and bm!31085 c!58199) b!484179))

(assert (= (and bm!31085 (not c!58199)) b!484180))

(assert (= (and d!77051 res!288470) b!484184))

(assert (= (and b!484184 res!288471) b!484181))

(declare-fun m!464905 () Bool)

(assert (=> bm!31085 m!464905))

(declare-fun m!464907 () Bool)

(assert (=> d!77051 m!464907))

(assert (=> d!77051 m!464899))

(declare-fun m!464909 () Bool)

(assert (=> b!484184 m!464909))

(declare-fun m!464911 () Bool)

(assert (=> b!484179 m!464911))

(declare-fun m!464915 () Bool)

(assert (=> b!484181 m!464915))

(assert (=> b!484095 d!77051))

(declare-fun d!77059 () Bool)

(declare-fun res!288486 () Bool)

(declare-fun e!285037 () Bool)

(assert (=> d!77059 (=> res!288486 e!285037)))

(assert (=> d!77059 (= res!288486 (and (is-Cons!9276 l!956) (= (_1!4628 (h!10132 l!956)) key!251)))))

(assert (=> d!77059 (= (containsKey!382 l!956 key!251) e!285037)))

(declare-fun b!484223 () Bool)

(declare-fun e!285038 () Bool)

(assert (=> b!484223 (= e!285037 e!285038)))

(declare-fun res!288487 () Bool)

(assert (=> b!484223 (=> (not res!288487) (not e!285038))))

(assert (=> b!484223 (= res!288487 (and (or (not (is-Cons!9276 l!956)) (bvsle (_1!4628 (h!10132 l!956)) key!251)) (is-Cons!9276 l!956) (bvslt (_1!4628 (h!10132 l!956)) key!251)))))

(declare-fun b!484224 () Bool)

(assert (=> b!484224 (= e!285038 (containsKey!382 (t!15502 l!956) key!251))))

(assert (= (and d!77059 (not res!288486)) b!484223))

(assert (= (and b!484223 res!288487) b!484224))

(declare-fun m!464937 () Bool)

(assert (=> b!484224 m!464937))

(assert (=> b!484094 d!77059))

(declare-fun d!77065 () Bool)

(declare-fun res!288494 () Bool)

(declare-fun e!285048 () Bool)

(assert (=> d!77065 (=> res!288494 e!285048)))

(assert (=> d!77065 (= res!288494 (or (is-Nil!9277 (t!15502 l!956)) (is-Nil!9277 (t!15502 (t!15502 l!956)))))))

(assert (=> d!77065 (= (isStrictlySorted!419 (t!15502 l!956)) e!285048)))

(declare-fun b!484236 () Bool)

(declare-fun e!285049 () Bool)

(assert (=> b!484236 (= e!285048 e!285049)))

