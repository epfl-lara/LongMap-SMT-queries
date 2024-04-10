; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43814 () Bool)

(assert start!43814)

(declare-fun b!484083 () Bool)

(declare-fun e!284949 () Bool)

(declare-fun e!284948 () Bool)

(assert (=> b!484083 (= e!284949 e!284948)))

(declare-fun res!288428 () Bool)

(assert (=> b!484083 (=> (not res!288428) (not e!284948))))

(declare-datatypes ((B!1126 0))(
  ( (B!1127 (val!7015 Int)) )
))
(declare-datatypes ((tuple2!9232 0))(
  ( (tuple2!9233 (_1!4627 (_ BitVec 64)) (_2!4627 B!1126)) )
))
(declare-datatypes ((List!9279 0))(
  ( (Nil!9276) (Cons!9275 (h!10131 tuple2!9232) (t!15501 List!9279)) )
))
(declare-fun l!956 () List!9279)

(declare-fun key!251 () (_ BitVec 64))

(get-info :version)

(assert (=> b!484083 (= res!288428 (and ((_ is Cons!9275) l!956) (bvslt (_1!4627 (h!10131 l!956)) key!251)))))

(declare-fun value!166 () B!1126)

(declare-fun lt!219346 () List!9279)

(declare-fun insertStrictlySorted!233 (List!9279 (_ BitVec 64) B!1126) List!9279)

(assert (=> b!484083 (= lt!219346 (insertStrictlySorted!233 l!956 key!251 value!166))))

(declare-fun b!484085 () Bool)

(declare-fun e!284947 () Bool)

(declare-fun tp_is_empty!13935 () Bool)

(declare-fun tp!43501 () Bool)

(assert (=> b!484085 (= e!284947 (and tp_is_empty!13935 tp!43501))))

(declare-fun b!484084 () Bool)

(declare-fun isStrictlySorted!418 (List!9279) Bool)

(assert (=> b!484084 (= e!284948 (not (isStrictlySorted!418 (t!15501 l!956))))))

(declare-fun res!288427 () Bool)

(assert (=> start!43814 (=> (not res!288427) (not e!284949))))

(assert (=> start!43814 (= res!288427 (isStrictlySorted!418 l!956))))

(assert (=> start!43814 e!284949))

(assert (=> start!43814 e!284947))

(assert (=> start!43814 true))

(assert (=> start!43814 tp_is_empty!13935))

(declare-fun b!484082 () Bool)

(declare-fun res!288426 () Bool)

(assert (=> b!484082 (=> (not res!288426) (not e!284949))))

(declare-fun containsKey!381 (List!9279 (_ BitVec 64)) Bool)

(assert (=> b!484082 (= res!288426 (not (containsKey!381 l!956 key!251)))))

(assert (= (and start!43814 res!288427) b!484082))

(assert (= (and b!484082 res!288426) b!484083))

(assert (= (and b!484083 res!288428) b!484084))

(assert (= (and start!43814 ((_ is Cons!9275) l!956)) b!484085))

(declare-fun m!464885 () Bool)

(assert (=> b!484083 m!464885))

(declare-fun m!464887 () Bool)

(assert (=> b!484084 m!464887))

(declare-fun m!464889 () Bool)

(assert (=> start!43814 m!464889))

(declare-fun m!464891 () Bool)

(assert (=> b!484082 m!464891))

(check-sat (not b!484084) (not start!43814) (not b!484085) (not b!484083) tp_is_empty!13935 (not b!484082))
(check-sat)
(get-model)

(declare-fun d!77045 () Bool)

(declare-fun res!288442 () Bool)

(declare-fun e!284963 () Bool)

(assert (=> d!77045 (=> res!288442 e!284963)))

(assert (=> d!77045 (= res!288442 (and ((_ is Cons!9275) l!956) (= (_1!4627 (h!10131 l!956)) key!251)))))

(assert (=> d!77045 (= (containsKey!381 l!956 key!251) e!284963)))

(declare-fun b!484102 () Bool)

(declare-fun e!284964 () Bool)

(assert (=> b!484102 (= e!284963 e!284964)))

(declare-fun res!288443 () Bool)

(assert (=> b!484102 (=> (not res!288443) (not e!284964))))

(assert (=> b!484102 (= res!288443 (and (or (not ((_ is Cons!9275) l!956)) (bvsle (_1!4627 (h!10131 l!956)) key!251)) ((_ is Cons!9275) l!956) (bvslt (_1!4627 (h!10131 l!956)) key!251)))))

(declare-fun b!484103 () Bool)

(assert (=> b!484103 (= e!284964 (containsKey!381 (t!15501 l!956) key!251))))

(assert (= (and d!77045 (not res!288442)) b!484102))

(assert (= (and b!484102 res!288443) b!484103))

(declare-fun m!464901 () Bool)

(assert (=> b!484103 m!464901))

(assert (=> b!484082 d!77045))

(declare-fun d!77049 () Bool)

(declare-fun res!288454 () Bool)

(declare-fun e!284975 () Bool)

(assert (=> d!77049 (=> res!288454 e!284975)))

(assert (=> d!77049 (= res!288454 (or ((_ is Nil!9276) l!956) ((_ is Nil!9276) (t!15501 l!956))))))

(assert (=> d!77049 (= (isStrictlySorted!418 l!956) e!284975)))

(declare-fun b!484114 () Bool)

(declare-fun e!284976 () Bool)

(assert (=> b!484114 (= e!284975 e!284976)))

(declare-fun res!288455 () Bool)

(assert (=> b!484114 (=> (not res!288455) (not e!284976))))

(assert (=> b!484114 (= res!288455 (bvslt (_1!4627 (h!10131 l!956)) (_1!4627 (h!10131 (t!15501 l!956)))))))

(declare-fun b!484115 () Bool)

(assert (=> b!484115 (= e!284976 (isStrictlySorted!418 (t!15501 l!956)))))

(assert (= (and d!77049 (not res!288454)) b!484114))

(assert (= (and b!484114 res!288455) b!484115))

(assert (=> b!484115 m!464887))

(assert (=> start!43814 d!77049))

(declare-fun d!77055 () Bool)

(declare-fun res!288456 () Bool)

(declare-fun e!284977 () Bool)

(assert (=> d!77055 (=> res!288456 e!284977)))

(assert (=> d!77055 (= res!288456 (or ((_ is Nil!9276) (t!15501 l!956)) ((_ is Nil!9276) (t!15501 (t!15501 l!956)))))))

(assert (=> d!77055 (= (isStrictlySorted!418 (t!15501 l!956)) e!284977)))

(declare-fun b!484116 () Bool)

(declare-fun e!284978 () Bool)

(assert (=> b!484116 (= e!284977 e!284978)))

(declare-fun res!288457 () Bool)

(assert (=> b!484116 (=> (not res!288457) (not e!284978))))

(assert (=> b!484116 (= res!288457 (bvslt (_1!4627 (h!10131 (t!15501 l!956))) (_1!4627 (h!10131 (t!15501 (t!15501 l!956))))))))

(declare-fun b!484117 () Bool)

(assert (=> b!484117 (= e!284978 (isStrictlySorted!418 (t!15501 (t!15501 l!956))))))

(assert (= (and d!77055 (not res!288456)) b!484116))

(assert (= (and b!484116 res!288457) b!484117))

(declare-fun m!464903 () Bool)

(assert (=> b!484117 m!464903))

(assert (=> b!484084 d!77055))

(declare-fun b!484198 () Bool)

(declare-fun e!285021 () List!9279)

(declare-fun call!31094 () List!9279)

(assert (=> b!484198 (= e!285021 call!31094)))

(declare-fun e!285023 () List!9279)

(declare-fun b!484199 () Bool)

(assert (=> b!484199 (= e!285023 (insertStrictlySorted!233 (t!15501 l!956) key!251 value!166))))

(declare-fun d!77057 () Bool)

(declare-fun e!285019 () Bool)

(assert (=> d!77057 e!285019))

(declare-fun res!288475 () Bool)

(assert (=> d!77057 (=> (not res!288475) (not e!285019))))

(declare-fun lt!219358 () List!9279)

(assert (=> d!77057 (= res!288475 (isStrictlySorted!418 lt!219358))))

(declare-fun e!285020 () List!9279)

(assert (=> d!77057 (= lt!219358 e!285020)))

(declare-fun c!58206 () Bool)

(assert (=> d!77057 (= c!58206 (and ((_ is Cons!9275) l!956) (bvslt (_1!4627 (h!10131 l!956)) key!251)))))

(assert (=> d!77057 (isStrictlySorted!418 l!956)))

(assert (=> d!77057 (= (insertStrictlySorted!233 l!956 key!251 value!166) lt!219358)))

(declare-fun bm!31089 () Bool)

(declare-fun call!31092 () List!9279)

(assert (=> bm!31089 (= call!31094 call!31092)))

(declare-fun b!484200 () Bool)

(declare-fun e!285022 () List!9279)

(declare-fun call!31093 () List!9279)

(assert (=> b!484200 (= e!285022 call!31093)))

(declare-fun c!58207 () Bool)

(declare-fun c!58205 () Bool)

(declare-fun b!484201 () Bool)

(assert (=> b!484201 (= e!285023 (ite c!58207 (t!15501 l!956) (ite c!58205 (Cons!9275 (h!10131 l!956) (t!15501 l!956)) Nil!9276)))))

(declare-fun b!484202 () Bool)

(declare-fun res!288474 () Bool)

(assert (=> b!484202 (=> (not res!288474) (not e!285019))))

(assert (=> b!484202 (= res!288474 (containsKey!381 lt!219358 key!251))))

(declare-fun b!484203 () Bool)

(assert (=> b!484203 (= e!285020 e!285021)))

(assert (=> b!484203 (= c!58207 (and ((_ is Cons!9275) l!956) (= (_1!4627 (h!10131 l!956)) key!251)))))

(declare-fun b!484204 () Bool)

(declare-fun contains!2676 (List!9279 tuple2!9232) Bool)

(assert (=> b!484204 (= e!285019 (contains!2676 lt!219358 (tuple2!9233 key!251 value!166)))))

(declare-fun b!484205 () Bool)

(assert (=> b!484205 (= e!285020 call!31092)))

(declare-fun b!484206 () Bool)

(assert (=> b!484206 (= e!285022 call!31093)))

(declare-fun b!484207 () Bool)

(assert (=> b!484207 (= c!58205 (and ((_ is Cons!9275) l!956) (bvsgt (_1!4627 (h!10131 l!956)) key!251)))))

(assert (=> b!484207 (= e!285021 e!285022)))

(declare-fun bm!31090 () Bool)

(assert (=> bm!31090 (= call!31093 call!31094)))

(declare-fun bm!31091 () Bool)

(declare-fun $colon$colon!117 (List!9279 tuple2!9232) List!9279)

(assert (=> bm!31091 (= call!31092 ($colon$colon!117 e!285023 (ite c!58206 (h!10131 l!956) (tuple2!9233 key!251 value!166))))))

(declare-fun c!58208 () Bool)

(assert (=> bm!31091 (= c!58208 c!58206)))

(assert (= (and d!77057 c!58206) b!484205))

(assert (= (and d!77057 (not c!58206)) b!484203))

(assert (= (and b!484203 c!58207) b!484198))

(assert (= (and b!484203 (not c!58207)) b!484207))

(assert (= (and b!484207 c!58205) b!484206))

(assert (= (and b!484207 (not c!58205)) b!484200))

(assert (= (or b!484206 b!484200) bm!31090))

(assert (= (or b!484198 bm!31090) bm!31089))

(assert (= (or b!484205 bm!31089) bm!31091))

(assert (= (and bm!31091 c!58208) b!484199))

(assert (= (and bm!31091 (not c!58208)) b!484201))

(assert (= (and d!77057 res!288475) b!484202))

(assert (= (and b!484202 res!288474) b!484204))

(declare-fun m!464927 () Bool)

(assert (=> bm!31091 m!464927))

(declare-fun m!464929 () Bool)

(assert (=> b!484199 m!464929))

(declare-fun m!464931 () Bool)

(assert (=> b!484204 m!464931))

(declare-fun m!464933 () Bool)

(assert (=> b!484202 m!464933))

(declare-fun m!464935 () Bool)

(assert (=> d!77057 m!464935))

(assert (=> d!77057 m!464889))

(assert (=> b!484083 d!77057))

(declare-fun b!484214 () Bool)

(declare-fun e!285030 () Bool)

(declare-fun tp!43507 () Bool)

(assert (=> b!484214 (= e!285030 (and tp_is_empty!13935 tp!43507))))

(assert (=> b!484085 (= tp!43501 e!285030)))

(assert (= (and b!484085 ((_ is Cons!9275) (t!15501 l!956))) b!484214))

(check-sat (not b!484199) (not b!484202) (not b!484204) (not bm!31091) tp_is_empty!13935 (not b!484103) (not b!484115) (not b!484214) (not b!484117) (not d!77057))
(check-sat)
