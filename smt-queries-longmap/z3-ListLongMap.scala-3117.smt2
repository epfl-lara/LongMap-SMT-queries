; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43800 () Bool)

(assert start!43800)

(declare-fun b!484009 () Bool)

(declare-fun res!288411 () Bool)

(declare-fun e!284900 () Bool)

(assert (=> b!484009 (=> (not res!288411) (not e!284900))))

(declare-datatypes ((B!1124 0))(
  ( (B!1125 (val!7014 Int)) )
))
(declare-datatypes ((tuple2!9144 0))(
  ( (tuple2!9145 (_1!4583 (_ BitVec 64)) (_2!4583 B!1124)) )
))
(declare-datatypes ((List!9180 0))(
  ( (Nil!9177) (Cons!9176 (h!10032 tuple2!9144) (t!15394 List!9180)) )
))
(declare-fun l!956 () List!9180)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!380 (List!9180 (_ BitVec 64)) Bool)

(assert (=> b!484009 (= res!288411 (not (containsKey!380 l!956 key!251)))))

(declare-fun b!484012 () Bool)

(declare-fun e!284901 () Bool)

(declare-fun tp_is_empty!13933 () Bool)

(declare-fun tp!43498 () Bool)

(assert (=> b!484012 (= e!284901 (and tp_is_empty!13933 tp!43498))))

(declare-fun b!484010 () Bool)

(declare-fun e!284899 () Bool)

(assert (=> b!484010 (= e!284900 e!284899)))

(declare-fun res!288412 () Bool)

(assert (=> b!484010 (=> (not res!288412) (not e!284899))))

(get-info :version)

(assert (=> b!484010 (= res!288412 (and ((_ is Cons!9176) l!956) (bvslt (_1!4583 (h!10032 l!956)) key!251)))))

(declare-fun value!166 () B!1124)

(declare-fun lt!219355 () List!9180)

(declare-fun insertStrictlySorted!233 (List!9180 (_ BitVec 64) B!1124) List!9180)

(assert (=> b!484010 (= lt!219355 (insertStrictlySorted!233 l!956 key!251 value!166))))

(declare-fun res!288410 () Bool)

(assert (=> start!43800 (=> (not res!288410) (not e!284900))))

(declare-fun isStrictlySorted!405 (List!9180) Bool)

(assert (=> start!43800 (= res!288410 (isStrictlySorted!405 l!956))))

(assert (=> start!43800 e!284900))

(assert (=> start!43800 e!284901))

(assert (=> start!43800 true))

(assert (=> start!43800 tp_is_empty!13933))

(declare-fun b!484011 () Bool)

(assert (=> b!484011 (= e!284899 (not (isStrictlySorted!405 (t!15394 l!956))))))

(assert (= (and start!43800 res!288410) b!484009))

(assert (= (and b!484009 res!288411) b!484010))

(assert (= (and b!484010 res!288412) b!484011))

(assert (= (and start!43800 ((_ is Cons!9176) l!956)) b!484012))

(declare-fun m!465061 () Bool)

(assert (=> b!484009 m!465061))

(declare-fun m!465063 () Bool)

(assert (=> b!484010 m!465063))

(declare-fun m!465065 () Bool)

(assert (=> start!43800 m!465065))

(declare-fun m!465067 () Bool)

(assert (=> b!484011 m!465067))

(check-sat (not b!484009) (not b!484011) (not b!484010) tp_is_empty!13933 (not b!484012) (not start!43800))
(check-sat)
(get-model)

(declare-fun b!484085 () Bool)

(declare-fun e!284952 () List!9180)

(declare-fun call!31062 () List!9180)

(assert (=> b!484085 (= e!284952 call!31062)))

(declare-fun b!484086 () Bool)

(declare-fun e!284956 () List!9180)

(declare-fun call!31063 () List!9180)

(assert (=> b!484086 (= e!284956 call!31063)))

(declare-fun b!484087 () Bool)

(declare-fun e!284953 () List!9180)

(assert (=> b!484087 (= e!284956 e!284953)))

(declare-fun c!58161 () Bool)

(assert (=> b!484087 (= c!58161 (and ((_ is Cons!9176) l!956) (= (_1!4583 (h!10032 l!956)) key!251)))))

(declare-fun bm!31060 () Bool)

(declare-fun call!31064 () List!9180)

(assert (=> bm!31060 (= call!31064 call!31063)))

(declare-fun b!484088 () Bool)

(declare-fun e!284954 () Bool)

(declare-fun lt!219366 () List!9180)

(declare-fun contains!2651 (List!9180 tuple2!9144) Bool)

(assert (=> b!484088 (= e!284954 (contains!2651 lt!219366 (tuple2!9145 key!251 value!166)))))

(declare-fun bm!31061 () Bool)

(assert (=> bm!31061 (= call!31062 call!31064)))

(declare-fun b!484089 () Bool)

(declare-fun res!288452 () Bool)

(assert (=> b!484089 (=> (not res!288452) (not e!284954))))

(assert (=> b!484089 (= res!288452 (containsKey!380 lt!219366 key!251))))

(declare-fun bm!31059 () Bool)

(declare-fun e!284955 () List!9180)

(declare-fun c!58163 () Bool)

(declare-fun $colon$colon!115 (List!9180 tuple2!9144) List!9180)

(assert (=> bm!31059 (= call!31063 ($colon$colon!115 e!284955 (ite c!58163 (h!10032 l!956) (tuple2!9145 key!251 value!166))))))

(declare-fun c!58162 () Bool)

(assert (=> bm!31059 (= c!58162 c!58163)))

(declare-fun d!77075 () Bool)

(assert (=> d!77075 e!284954))

(declare-fun res!288451 () Bool)

(assert (=> d!77075 (=> (not res!288451) (not e!284954))))

(assert (=> d!77075 (= res!288451 (isStrictlySorted!405 lt!219366))))

(assert (=> d!77075 (= lt!219366 e!284956)))

(assert (=> d!77075 (= c!58163 (and ((_ is Cons!9176) l!956) (bvslt (_1!4583 (h!10032 l!956)) key!251)))))

(assert (=> d!77075 (isStrictlySorted!405 l!956)))

(assert (=> d!77075 (= (insertStrictlySorted!233 l!956 key!251 value!166) lt!219366)))

(declare-fun b!484090 () Bool)

(assert (=> b!484090 (= e!284952 call!31062)))

(declare-fun b!484091 () Bool)

(assert (=> b!484091 (= e!284955 (insertStrictlySorted!233 (t!15394 l!956) key!251 value!166))))

(declare-fun b!484092 () Bool)

(declare-fun c!58160 () Bool)

(assert (=> b!484092 (= c!58160 (and ((_ is Cons!9176) l!956) (bvsgt (_1!4583 (h!10032 l!956)) key!251)))))

(assert (=> b!484092 (= e!284953 e!284952)))

(declare-fun b!484093 () Bool)

(assert (=> b!484093 (= e!284953 call!31064)))

(declare-fun b!484094 () Bool)

(assert (=> b!484094 (= e!284955 (ite c!58161 (t!15394 l!956) (ite c!58160 (Cons!9176 (h!10032 l!956) (t!15394 l!956)) Nil!9177)))))

(assert (= (and d!77075 c!58163) b!484086))

(assert (= (and d!77075 (not c!58163)) b!484087))

(assert (= (and b!484087 c!58161) b!484093))

(assert (= (and b!484087 (not c!58161)) b!484092))

(assert (= (and b!484092 c!58160) b!484090))

(assert (= (and b!484092 (not c!58160)) b!484085))

(assert (= (or b!484090 b!484085) bm!31061))

(assert (= (or b!484093 bm!31061) bm!31060))

(assert (= (or b!484086 bm!31060) bm!31059))

(assert (= (and bm!31059 c!58162) b!484091))

(assert (= (and bm!31059 (not c!58162)) b!484094))

(assert (= (and d!77075 res!288451) b!484089))

(assert (= (and b!484089 res!288452) b!484088))

(declare-fun m!465089 () Bool)

(assert (=> b!484089 m!465089))

(declare-fun m!465091 () Bool)

(assert (=> bm!31059 m!465091))

(declare-fun m!465093 () Bool)

(assert (=> d!77075 m!465093))

(assert (=> d!77075 m!465065))

(declare-fun m!465095 () Bool)

(assert (=> b!484088 m!465095))

(declare-fun m!465097 () Bool)

(assert (=> b!484091 m!465097))

(assert (=> b!484010 d!77075))

(declare-fun d!77089 () Bool)

(declare-fun res!288461 () Bool)

(declare-fun e!284971 () Bool)

(assert (=> d!77089 (=> res!288461 e!284971)))

(assert (=> d!77089 (= res!288461 (and ((_ is Cons!9176) l!956) (= (_1!4583 (h!10032 l!956)) key!251)))))

(assert (=> d!77089 (= (containsKey!380 l!956 key!251) e!284971)))

(declare-fun b!484119 () Bool)

(declare-fun e!284972 () Bool)

(assert (=> b!484119 (= e!284971 e!284972)))

(declare-fun res!288462 () Bool)

(assert (=> b!484119 (=> (not res!288462) (not e!284972))))

(assert (=> b!484119 (= res!288462 (and (or (not ((_ is Cons!9176) l!956)) (bvsle (_1!4583 (h!10032 l!956)) key!251)) ((_ is Cons!9176) l!956) (bvslt (_1!4583 (h!10032 l!956)) key!251)))))

(declare-fun b!484120 () Bool)

(assert (=> b!484120 (= e!284972 (containsKey!380 (t!15394 l!956) key!251))))

(assert (= (and d!77089 (not res!288461)) b!484119))

(assert (= (and b!484119 res!288462) b!484120))

(declare-fun m!465099 () Bool)

(assert (=> b!484120 m!465099))

(assert (=> b!484009 d!77089))

(declare-fun d!77091 () Bool)

(declare-fun res!288473 () Bool)

(declare-fun e!284986 () Bool)

(assert (=> d!77091 (=> res!288473 e!284986)))

(assert (=> d!77091 (= res!288473 (or ((_ is Nil!9177) (t!15394 l!956)) ((_ is Nil!9177) (t!15394 (t!15394 l!956)))))))

(assert (=> d!77091 (= (isStrictlySorted!405 (t!15394 l!956)) e!284986)))

(declare-fun b!484143 () Bool)

(declare-fun e!284987 () Bool)

(assert (=> b!484143 (= e!284986 e!284987)))

(declare-fun res!288474 () Bool)

(assert (=> b!484143 (=> (not res!288474) (not e!284987))))

(assert (=> b!484143 (= res!288474 (bvslt (_1!4583 (h!10032 (t!15394 l!956))) (_1!4583 (h!10032 (t!15394 (t!15394 l!956))))))))

(declare-fun b!484144 () Bool)

(assert (=> b!484144 (= e!284987 (isStrictlySorted!405 (t!15394 (t!15394 l!956))))))

(assert (= (and d!77091 (not res!288473)) b!484143))

(assert (= (and b!484143 res!288474) b!484144))

(declare-fun m!465111 () Bool)

(assert (=> b!484144 m!465111))

(assert (=> b!484011 d!77091))

(declare-fun d!77095 () Bool)

(declare-fun res!288475 () Bool)

(declare-fun e!284988 () Bool)

(assert (=> d!77095 (=> res!288475 e!284988)))

(assert (=> d!77095 (= res!288475 (or ((_ is Nil!9177) l!956) ((_ is Nil!9177) (t!15394 l!956))))))

(assert (=> d!77095 (= (isStrictlySorted!405 l!956) e!284988)))

(declare-fun b!484145 () Bool)

(declare-fun e!284989 () Bool)

(assert (=> b!484145 (= e!284988 e!284989)))

(declare-fun res!288476 () Bool)

(assert (=> b!484145 (=> (not res!288476) (not e!284989))))

(assert (=> b!484145 (= res!288476 (bvslt (_1!4583 (h!10032 l!956)) (_1!4583 (h!10032 (t!15394 l!956)))))))

(declare-fun b!484146 () Bool)

(assert (=> b!484146 (= e!284989 (isStrictlySorted!405 (t!15394 l!956)))))

(assert (= (and d!77095 (not res!288475)) b!484145))

(assert (= (and b!484145 res!288476) b!484146))

(assert (=> b!484146 m!465067))

(assert (=> start!43800 d!77095))

(declare-fun b!484153 () Bool)

(declare-fun e!284996 () Bool)

(declare-fun tp!43507 () Bool)

(assert (=> b!484153 (= e!284996 (and tp_is_empty!13933 tp!43507))))

(assert (=> b!484012 (= tp!43498 e!284996)))

(assert (= (and b!484012 ((_ is Cons!9176) (t!15394 l!956))) b!484153))

(check-sat (not b!484120) (not d!77075) (not b!484153) (not b!484088) tp_is_empty!13933 (not b!484089) (not bm!31059) (not b!484144) (not b!484146) (not b!484091))
(check-sat)
