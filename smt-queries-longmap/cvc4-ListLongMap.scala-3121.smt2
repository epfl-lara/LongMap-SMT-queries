; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43954 () Bool)

(assert start!43954)

(declare-fun res!288910 () Bool)

(declare-fun e!285582 () Bool)

(assert (=> start!43954 (=> (not res!288910) (not e!285582))))

(declare-datatypes ((B!1152 0))(
  ( (B!1153 (val!7028 Int)) )
))
(declare-datatypes ((tuple2!9258 0))(
  ( (tuple2!9259 (_1!4640 (_ BitVec 64)) (_2!4640 B!1152)) )
))
(declare-datatypes ((List!9292 0))(
  ( (Nil!9289) (Cons!9288 (h!10144 tuple2!9258) (t!15517 List!9292)) )
))
(declare-fun l!956 () List!9292)

(declare-fun isStrictlySorted!431 (List!9292) Bool)

(assert (=> start!43954 (= res!288910 (isStrictlySorted!431 l!956))))

(assert (=> start!43954 e!285582))

(declare-fun e!285581 () Bool)

(assert (=> start!43954 e!285581))

(assert (=> start!43954 true))

(declare-fun tp_is_empty!13961 () Bool)

(assert (=> start!43954 tp_is_empty!13961))

(declare-fun b!485064 () Bool)

(declare-fun res!288911 () Bool)

(assert (=> b!485064 (=> (not res!288911) (not e!285582))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!394 (List!9292 (_ BitVec 64)) Bool)

(assert (=> b!485064 (= res!288911 (not (containsKey!394 l!956 key!251)))))

(declare-fun b!485065 () Bool)

(assert (=> b!485065 (= e!285582 (and (is-Cons!9288 l!956) (= (_1!4640 (h!10144 l!956)) key!251)))))

(declare-fun value!166 () B!1152)

(declare-fun lt!219487 () List!9292)

(declare-fun insertStrictlySorted!246 (List!9292 (_ BitVec 64) B!1152) List!9292)

(assert (=> b!485065 (= lt!219487 (insertStrictlySorted!246 l!956 key!251 value!166))))

(declare-fun b!485066 () Bool)

(declare-fun tp!43579 () Bool)

(assert (=> b!485066 (= e!285581 (and tp_is_empty!13961 tp!43579))))

(assert (= (and start!43954 res!288910) b!485064))

(assert (= (and b!485064 res!288911) b!485065))

(assert (= (and start!43954 (is-Cons!9288 l!956)) b!485066))

(declare-fun m!465399 () Bool)

(assert (=> start!43954 m!465399))

(declare-fun m!465401 () Bool)

(assert (=> b!485064 m!465401))

(declare-fun m!465403 () Bool)

(assert (=> b!485065 m!465403))

(push 1)

(assert tp_is_empty!13961)

(assert (not b!485066))

(assert (not start!43954))

(assert (not b!485065))

(assert (not b!485064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!485135 () Bool)

(declare-fun c!58394 () Bool)

(assert (=> b!485135 (= c!58394 (and (is-Cons!9288 l!956) (bvsgt (_1!4640 (h!10144 l!956)) key!251)))))

(declare-fun e!285633 () List!9292)

(declare-fun e!285632 () List!9292)

(assert (=> b!485135 (= e!285633 e!285632)))

(declare-fun bm!31199 () Bool)

(declare-fun call!31203 () List!9292)

(declare-fun call!31206 () List!9292)

(assert (=> bm!31199 (= call!31203 call!31206)))

(declare-fun b!485137 () Bool)

(declare-fun call!31205 () List!9292)

(assert (=> b!485137 (= e!285632 call!31205)))

(declare-fun b!485138 () Bool)

(declare-fun res!288941 () Bool)

(declare-fun e!285629 () Bool)

(assert (=> b!485138 (=> (not res!288941) (not e!285629))))

(declare-fun lt!219494 () List!9292)

(assert (=> b!485138 (= res!288941 (containsKey!394 lt!219494 key!251))))

(declare-fun bm!31200 () Bool)

(assert (=> bm!31200 (= call!31205 call!31203)))

(declare-fun b!485139 () Bool)

(assert (=> b!485139 (= e!285633 call!31203)))

(declare-fun c!58392 () Bool)

(declare-fun b!485140 () Bool)

(declare-fun e!285631 () List!9292)

(assert (=> b!485140 (= e!285631 (ite c!58392 (t!15517 l!956) (ite c!58394 (Cons!9288 (h!10144 l!956) (t!15517 l!956)) Nil!9289)))))

(declare-fun bm!31201 () Bool)

(declare-fun c!58393 () Bool)

(declare-fun $colon$colon!128 (List!9292 tuple2!9258) List!9292)

(assert (=> bm!31201 (= call!31206 ($colon$colon!128 e!285631 (ite c!58393 (h!10144 l!956) (tuple2!9259 key!251 value!166))))))

(declare-fun c!58391 () Bool)

(assert (=> bm!31201 (= c!58391 c!58393)))

(declare-fun b!485141 () Bool)

(declare-fun contains!2687 (List!9292 tuple2!9258) Bool)

(assert (=> b!485141 (= e!285629 (contains!2687 lt!219494 (tuple2!9259 key!251 value!166)))))

(declare-fun b!485142 () Bool)

(declare-fun e!285630 () List!9292)

(assert (=> b!485142 (= e!285630 e!285633)))

(assert (=> b!485142 (= c!58392 (and (is-Cons!9288 l!956) (= (_1!4640 (h!10144 l!956)) key!251)))))

(declare-fun b!485143 () Bool)

(assert (=> b!485143 (= e!285632 call!31205)))

(declare-fun b!485144 () Bool)

(assert (=> b!485144 (= e!285630 call!31206)))

(declare-fun b!485136 () Bool)

(assert (=> b!485136 (= e!285631 (insertStrictlySorted!246 (t!15517 l!956) key!251 value!166))))

(declare-fun d!77315 () Bool)

(assert (=> d!77315 e!285629))

(declare-fun res!288940 () Bool)

(assert (=> d!77315 (=> (not res!288940) (not e!285629))))

(assert (=> d!77315 (= res!288940 (isStrictlySorted!431 lt!219494))))

(assert (=> d!77315 (= lt!219494 e!285630)))

(assert (=> d!77315 (= c!58393 (and (is-Cons!9288 l!956) (bvslt (_1!4640 (h!10144 l!956)) key!251)))))

(assert (=> d!77315 (isStrictlySorted!431 l!956)))

(assert (=> d!77315 (= (insertStrictlySorted!246 l!956 key!251 value!166) lt!219494)))

(assert (= (and d!77315 c!58393) b!485144))

(assert (= (and d!77315 (not c!58393)) b!485142))

(assert (= (and b!485142 c!58392) b!485139))

(assert (= (and b!485142 (not c!58392)) b!485135))

(assert (= (and b!485135 c!58394) b!485137))

(assert (= (and b!485135 (not c!58394)) b!485143))

(assert (= (or b!485137 b!485143) bm!31200))

(assert (= (or b!485139 bm!31200) bm!31199))

(assert (= (or b!485144 bm!31199) bm!31201))

(assert (= (and bm!31201 c!58391) b!485136))

(assert (= (and bm!31201 (not c!58391)) b!485140))

(assert (= (and d!77315 res!288940) b!485138))

(assert (= (and b!485138 res!288941) b!485141))

(declare-fun m!465413 () Bool)

(assert (=> b!485136 m!465413))

(declare-fun m!465415 () Bool)

(assert (=> bm!31201 m!465415))

(declare-fun m!465417 () Bool)

(assert (=> d!77315 m!465417))

(assert (=> d!77315 m!465399))

(declare-fun m!465419 () Bool)

(assert (=> b!485141 m!465419))

(declare-fun m!465421 () Bool)

(assert (=> b!485138 m!465421))

(assert (=> b!485065 d!77315))

(declare-fun d!77325 () Bool)

(declare-fun res!288954 () Bool)

(declare-fun e!285646 () Bool)

(assert (=> d!77325 (=> res!288954 e!285646)))

(assert (=> d!77325 (= res!288954 (or (is-Nil!9289 l!956) (is-Nil!9289 (t!15517 l!956))))))

(assert (=> d!77325 (= (isStrictlySorted!431 l!956) e!285646)))

(declare-fun b!485165 () Bool)

(declare-fun e!285647 () Bool)

(assert (=> b!485165 (= e!285646 e!285647)))

(declare-fun res!288955 () Bool)

(assert (=> b!485165 (=> (not res!288955) (not e!285647))))

(assert (=> b!485165 (= res!288955 (bvslt (_1!4640 (h!10144 l!956)) (_1!4640 (h!10144 (t!15517 l!956)))))))

(declare-fun b!485166 () Bool)

(assert (=> b!485166 (= e!285647 (isStrictlySorted!431 (t!15517 l!956)))))

(assert (= (and d!77325 (not res!288954)) b!485165))

(assert (= (and b!485165 res!288955) b!485166))

(declare-fun m!465423 () Bool)

(assert (=> b!485166 m!465423))

(assert (=> start!43954 d!77325))

(declare-fun d!77327 () Bool)

(declare-fun res!288964 () Bool)

(declare-fun e!285666 () Bool)

(assert (=> d!77327 (=> res!288964 e!285666)))

(assert (=> d!77327 (= res!288964 (and (is-Cons!9288 l!956) (= (_1!4640 (h!10144 l!956)) key!251)))))

(assert (=> d!77327 (= (containsKey!394 l!956 key!251) e!285666)))

