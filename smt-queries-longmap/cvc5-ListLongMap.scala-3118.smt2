; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43828 () Bool)

(assert start!43828)

(declare-fun b!484014 () Bool)

(declare-fun res!288403 () Bool)

(declare-fun e!284905 () Bool)

(assert (=> b!484014 (=> (not res!288403) (not e!284905))))

(declare-datatypes ((B!1134 0))(
  ( (B!1135 (val!7019 Int)) )
))
(declare-datatypes ((tuple2!9290 0))(
  ( (tuple2!9291 (_1!4656 (_ BitVec 64)) (_2!4656 B!1134)) )
))
(declare-datatypes ((List!9321 0))(
  ( (Nil!9318) (Cons!9317 (h!10173 tuple2!9290) (t!15534 List!9321)) )
))
(declare-fun l!956 () List!9321)

(declare-fun isStrictlySorted!418 (List!9321) Bool)

(assert (=> b!484014 (= res!288403 (isStrictlySorted!418 (t!15534 l!956)))))

(declare-fun res!288401 () Bool)

(declare-fun e!284906 () Bool)

(assert (=> start!43828 (=> (not res!288401) (not e!284906))))

(assert (=> start!43828 (= res!288401 (isStrictlySorted!418 l!956))))

(assert (=> start!43828 e!284906))

(declare-fun e!284907 () Bool)

(assert (=> start!43828 e!284907))

(assert (=> start!43828 true))

(declare-fun tp_is_empty!13943 () Bool)

(assert (=> start!43828 tp_is_empty!13943))

(declare-fun b!484015 () Bool)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!383 (List!9321 (_ BitVec 64)) Bool)

(assert (=> b!484015 (= e!284905 (containsKey!383 (t!15534 l!956) key!251))))

(declare-fun b!484016 () Bool)

(assert (=> b!484016 (= e!284906 e!284905)))

(declare-fun res!288402 () Bool)

(assert (=> b!484016 (=> (not res!288402) (not e!284905))))

(assert (=> b!484016 (= res!288402 (and (is-Cons!9317 l!956) (bvslt (_1!4656 (h!10173 l!956)) key!251)))))

(declare-fun lt!219133 () List!9321)

(declare-fun value!166 () B!1134)

(declare-fun insertStrictlySorted!238 (List!9321 (_ BitVec 64) B!1134) List!9321)

(assert (=> b!484016 (= lt!219133 (insertStrictlySorted!238 l!956 key!251 value!166))))

(declare-fun b!484017 () Bool)

(declare-fun res!288404 () Bool)

(assert (=> b!484017 (=> (not res!288404) (not e!284906))))

(assert (=> b!484017 (= res!288404 (not (containsKey!383 l!956 key!251)))))

(declare-fun b!484018 () Bool)

(declare-fun tp!43522 () Bool)

(assert (=> b!484018 (= e!284907 (and tp_is_empty!13943 tp!43522))))

(assert (= (and start!43828 res!288401) b!484017))

(assert (= (and b!484017 res!288404) b!484016))

(assert (= (and b!484016 res!288402) b!484014))

(assert (= (and b!484014 res!288403) b!484015))

(assert (= (and start!43828 (is-Cons!9317 l!956)) b!484018))

(declare-fun m!464231 () Bool)

(assert (=> b!484016 m!464231))

(declare-fun m!464233 () Bool)

(assert (=> start!43828 m!464233))

(declare-fun m!464235 () Bool)

(assert (=> b!484017 m!464235))

(declare-fun m!464237 () Bool)

(assert (=> b!484014 m!464237))

(declare-fun m!464239 () Bool)

(assert (=> b!484015 m!464239))

(push 1)

(assert (not start!43828))

(assert (not b!484015))

(assert (not b!484018))

(assert (not b!484016))

(assert (not b!484014))

(assert (not b!484017))

(assert tp_is_empty!13943)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76871 () Bool)

(declare-fun res!288409 () Bool)

(declare-fun e!284912 () Bool)

(assert (=> d!76871 (=> res!288409 e!284912)))

(assert (=> d!76871 (= res!288409 (and (is-Cons!9317 l!956) (= (_1!4656 (h!10173 l!956)) key!251)))))

(assert (=> d!76871 (= (containsKey!383 l!956 key!251) e!284912)))

(declare-fun b!484023 () Bool)

(declare-fun e!284913 () Bool)

(assert (=> b!484023 (= e!284912 e!284913)))

(declare-fun res!288410 () Bool)

(assert (=> b!484023 (=> (not res!288410) (not e!284913))))

(assert (=> b!484023 (= res!288410 (and (or (not (is-Cons!9317 l!956)) (bvsle (_1!4656 (h!10173 l!956)) key!251)) (is-Cons!9317 l!956) (bvslt (_1!4656 (h!10173 l!956)) key!251)))))

(declare-fun b!484024 () Bool)

(assert (=> b!484024 (= e!284913 (containsKey!383 (t!15534 l!956) key!251))))

(assert (= (and d!76871 (not res!288409)) b!484023))

(assert (= (and b!484023 res!288410) b!484024))

(assert (=> b!484024 m!464239))

(assert (=> b!484017 d!76871))

(declare-fun d!76875 () Bool)

(declare-fun res!288419 () Bool)

(declare-fun e!284922 () Bool)

(assert (=> d!76875 (=> res!288419 e!284922)))

(assert (=> d!76875 (= res!288419 (or (is-Nil!9318 l!956) (is-Nil!9318 (t!15534 l!956))))))

(assert (=> d!76875 (= (isStrictlySorted!418 l!956) e!284922)))

(declare-fun b!484033 () Bool)

(declare-fun e!284923 () Bool)

(assert (=> b!484033 (= e!284922 e!284923)))

(declare-fun res!288420 () Bool)

(assert (=> b!484033 (=> (not res!288420) (not e!284923))))

(assert (=> b!484033 (= res!288420 (bvslt (_1!4656 (h!10173 l!956)) (_1!4656 (h!10173 (t!15534 l!956)))))))

(declare-fun b!484034 () Bool)

(assert (=> b!484034 (= e!284923 (isStrictlySorted!418 (t!15534 l!956)))))

(assert (= (and d!76875 (not res!288419)) b!484033))

(assert (= (and b!484033 res!288420) b!484034))

(assert (=> b!484034 m!464237))

(assert (=> start!43828 d!76875))

(declare-fun b!484121 () Bool)

(declare-fun e!284977 () List!9321)

(declare-fun call!31092 () List!9321)

(assert (=> b!484121 (= e!284977 call!31092)))

(declare-fun bm!31088 () Bool)

(declare-fun call!31091 () List!9321)

(declare-fun call!31093 () List!9321)

(assert (=> bm!31088 (= call!31091 call!31093)))

(declare-fun b!484122 () Bool)

(declare-fun e!284980 () List!9321)

(declare-fun e!284981 () List!9321)

(assert (=> b!484122 (= e!284980 e!284981)))

(declare-fun c!58167 () Bool)

(assert (=> b!484122 (= c!58167 (and (is-Cons!9317 l!956) (= (_1!4656 (h!10173 l!956)) key!251)))))

(declare-fun d!76877 () Bool)

(declare-fun e!284978 () Bool)

(assert (=> d!76877 e!284978))

(declare-fun res!288451 () Bool)

(assert (=> d!76877 (=> (not res!288451) (not e!284978))))

(declare-fun lt!219141 () List!9321)

(assert (=> d!76877 (= res!288451 (isStrictlySorted!418 lt!219141))))

(assert (=> d!76877 (= lt!219141 e!284980)))

(declare-fun c!58166 () Bool)

(assert (=> d!76877 (= c!58166 (and (is-Cons!9317 l!956) (bvslt (_1!4656 (h!10173 l!956)) key!251)))))

(assert (=> d!76877 (isStrictlySorted!418 l!956)))

(assert (=> d!76877 (= (insertStrictlySorted!238 l!956 key!251 value!166) lt!219141)))

(declare-fun b!484123 () Bool)

(declare-fun c!58168 () Bool)

(assert (=> b!484123 (= c!58168 (and (is-Cons!9317 l!956) (bvsgt (_1!4656 (h!10173 l!956)) key!251)))))

(assert (=> b!484123 (= e!284981 e!284977)))

(declare-fun bm!31089 () Bool)

(declare-fun e!284979 () List!9321)

(declare-fun $colon$colon!119 (List!9321 tuple2!9290) List!9321)

(assert (=> bm!31089 (= call!31093 ($colon$colon!119 e!284979 (ite c!58166 (h!10173 l!956) (tuple2!9291 key!251 value!166))))))

(declare-fun c!58169 () Bool)

(assert (=> bm!31089 (= c!58169 c!58166)))

(declare-fun bm!31090 () Bool)

(assert (=> bm!31090 (= call!31092 call!31091)))

(declare-fun b!484124 () Bool)

(assert (=> b!484124 (= e!284980 call!31093)))

(declare-fun b!484125 () Bool)

(declare-fun contains!2664 (List!9321 tuple2!9290) Bool)

(assert (=> b!484125 (= e!284978 (contains!2664 lt!219141 (tuple2!9291 key!251 value!166)))))

(declare-fun b!484126 () Bool)

(assert (=> b!484126 (= e!284977 call!31092)))

(declare-fun b!484127 () Bool)

(assert (=> b!484127 (= e!284979 (ite c!58167 (t!15534 l!956) (ite c!58168 (Cons!9317 (h!10173 l!956) (t!15534 l!956)) Nil!9318)))))

(declare-fun b!484128 () Bool)

(assert (=> b!484128 (= e!284981 call!31091)))

(declare-fun b!484129 () Bool)

(assert (=> b!484129 (= e!284979 (insertStrictlySorted!238 (t!15534 l!956) key!251 value!166))))

(declare-fun b!484130 () Bool)

(declare-fun res!288452 () Bool)

(assert (=> b!484130 (=> (not res!288452) (not e!284978))))

(assert (=> b!484130 (= res!288452 (containsKey!383 lt!219141 key!251))))

(assert (= (and d!76877 c!58166) b!484124))

(assert (= (and d!76877 (not c!58166)) b!484122))

(assert (= (and b!484122 c!58167) b!484128))

(assert (= (and b!484122 (not c!58167)) b!484123))

(assert (= (and b!484123 c!58168) b!484126))

(assert (= (and b!484123 (not c!58168)) b!484121))

(assert (= (or b!484126 b!484121) bm!31090))

(assert (= (or b!484128 bm!31090) bm!31088))

(assert (= (or b!484124 bm!31088) bm!31089))

(assert (= (and bm!31089 c!58169) b!484129))

(assert (= (and bm!31089 (not c!58169)) b!484127))

(assert (= (and d!76877 res!288451) b!484130))

(assert (= (and b!484130 res!288452) b!484125))

(declare-fun m!464257 () Bool)

(assert (=> b!484125 m!464257))

(declare-fun m!464259 () Bool)

(assert (=> b!484130 m!464259))

(declare-fun m!464261 () Bool)

(assert (=> d!76877 m!464261))

(assert (=> d!76877 m!464233))

(declare-fun m!464265 () Bool)

(assert (=> b!484129 m!464265))

(declare-fun m!464267 () Bool)

(assert (=> bm!31089 m!464267))

(assert (=> b!484016 d!76877))

(declare-fun d!76893 () Bool)

(declare-fun res!288463 () Bool)

(declare-fun e!284990 () Bool)

(assert (=> d!76893 (=> res!288463 e!284990)))

(assert (=> d!76893 (= res!288463 (or (is-Nil!9318 (t!15534 l!956)) (is-Nil!9318 (t!15534 (t!15534 l!956)))))))

(assert (=> d!76893 (= (isStrictlySorted!418 (t!15534 l!956)) e!284990)))

(declare-fun b!484141 () Bool)

(declare-fun e!284991 () Bool)

(assert (=> b!484141 (= e!284990 e!284991)))

(declare-fun res!288464 () Bool)

(assert (=> b!484141 (=> (not res!288464) (not e!284991))))

(assert (=> b!484141 (= res!288464 (bvslt (_1!4656 (h!10173 (t!15534 l!956))) (_1!4656 (h!10173 (t!15534 (t!15534 l!956))))))))

(declare-fun b!484142 () Bool)

(assert (=> b!484142 (= e!284991 (isStrictlySorted!418 (t!15534 (t!15534 l!956))))))

(assert (= (and d!76893 (not res!288463)) b!484141))

(assert (= (and b!484141 res!288464) b!484142))

(declare-fun m!464269 () Bool)

(assert (=> b!484142 m!464269))

(assert (=> b!484014 d!76893))

(declare-fun d!76895 () Bool)

(declare-fun res!288465 () Bool)

(declare-fun e!284992 () Bool)

(assert (=> d!76895 (=> res!288465 e!284992)))

(assert (=> d!76895 (= res!288465 (and (is-Cons!9317 (t!15534 l!956)) (= (_1!4656 (h!10173 (t!15534 l!956))) key!251)))))

(assert (=> d!76895 (= (containsKey!383 (t!15534 l!956) key!251) e!284992)))

(declare-fun b!484146 () Bool)

(declare-fun e!284995 () Bool)

(assert (=> b!484146 (= e!284992 e!284995)))

(declare-fun res!288466 () Bool)

(assert (=> b!484146 (=> (not res!288466) (not e!284995))))

(assert (=> b!484146 (= res!288466 (and (or (not (is-Cons!9317 (t!15534 l!956))) (bvsle (_1!4656 (h!10173 (t!15534 l!956))) key!251)) (is-Cons!9317 (t!15534 l!956)) (bvslt (_1!4656 (h!10173 (t!15534 l!956))) key!251)))))

(declare-fun b!484148 () Bool)

(assert (=> b!484148 (= e!284995 (containsKey!383 (t!15534 (t!15534 l!956)) key!251))))

(assert (= (and d!76895 (not res!288465)) b!484146))

(assert (= (and b!484146 res!288466) b!484148))

(declare-fun m!464271 () Bool)

(assert (=> b!484148 m!464271))

(assert (=> b!484015 d!76895))

(declare-fun b!484154 () Bool)

(declare-fun e!284999 () Bool)

(declare-fun tp!43528 () Bool)

(assert (=> b!484154 (= e!284999 (and tp_is_empty!13943 tp!43528))))

(assert (=> b!484018 (= tp!43522 e!284999)))

(assert (= (and b!484018 (is-Cons!9317 (t!15534 l!956))) b!484154))

(push 1)

(assert (not b!484129))

(assert (not b!484130))

(assert (not b!484024))

(assert (not bm!31089))

(assert (not b!484148))

(assert (not b!484034))

(assert (not d!76877))

(assert tp_is_empty!13943)

(assert (not b!484142))

(assert (not b!484154))

(assert (not b!484125))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

