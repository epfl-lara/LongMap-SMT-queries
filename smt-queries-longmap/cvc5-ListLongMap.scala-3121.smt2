; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43950 () Bool)

(assert start!43950)

(declare-fun res!288898 () Bool)

(declare-fun e!285570 () Bool)

(assert (=> start!43950 (=> (not res!288898) (not e!285570))))

(declare-datatypes ((B!1148 0))(
  ( (B!1149 (val!7026 Int)) )
))
(declare-datatypes ((tuple2!9254 0))(
  ( (tuple2!9255 (_1!4638 (_ BitVec 64)) (_2!4638 B!1148)) )
))
(declare-datatypes ((List!9290 0))(
  ( (Nil!9287) (Cons!9286 (h!10142 tuple2!9254) (t!15515 List!9290)) )
))
(declare-fun l!956 () List!9290)

(declare-fun isStrictlySorted!429 (List!9290) Bool)

(assert (=> start!43950 (= res!288898 (isStrictlySorted!429 l!956))))

(assert (=> start!43950 e!285570))

(declare-fun e!285569 () Bool)

(assert (=> start!43950 e!285569))

(assert (=> start!43950 true))

(declare-fun tp_is_empty!13957 () Bool)

(assert (=> start!43950 tp_is_empty!13957))

(declare-fun b!485046 () Bool)

(declare-fun res!288899 () Bool)

(assert (=> b!485046 (=> (not res!288899) (not e!285570))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!392 (List!9290 (_ BitVec 64)) Bool)

(assert (=> b!485046 (= res!288899 (not (containsKey!392 l!956 key!251)))))

(declare-fun b!485047 () Bool)

(assert (=> b!485047 (= e!285570 (and (is-Cons!9286 l!956) (= (_1!4638 (h!10142 l!956)) key!251)))))

(declare-fun lt!219481 () List!9290)

(declare-fun value!166 () B!1148)

(declare-fun insertStrictlySorted!244 (List!9290 (_ BitVec 64) B!1148) List!9290)

(assert (=> b!485047 (= lt!219481 (insertStrictlySorted!244 l!956 key!251 value!166))))

(declare-fun b!485048 () Bool)

(declare-fun tp!43573 () Bool)

(assert (=> b!485048 (= e!285569 (and tp_is_empty!13957 tp!43573))))

(assert (= (and start!43950 res!288898) b!485046))

(assert (= (and b!485046 res!288899) b!485047))

(assert (= (and start!43950 (is-Cons!9286 l!956)) b!485048))

(declare-fun m!465387 () Bool)

(assert (=> start!43950 m!465387))

(declare-fun m!465389 () Bool)

(assert (=> b!485046 m!465389))

(declare-fun m!465391 () Bool)

(assert (=> b!485047 m!465391))

(push 1)

(assert (not b!485046))

(assert tp_is_empty!13957)

(assert (not b!485048))

(assert (not start!43950))

(assert (not b!485047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77313 () Bool)

(declare-fun res!288922 () Bool)

(declare-fun e!285593 () Bool)

(assert (=> d!77313 (=> res!288922 e!285593)))

(assert (=> d!77313 (= res!288922 (or (is-Nil!9287 l!956) (is-Nil!9287 (t!15515 l!956))))))

(assert (=> d!77313 (= (isStrictlySorted!429 l!956) e!285593)))

(declare-fun b!485077 () Bool)

(declare-fun e!285594 () Bool)

(assert (=> b!485077 (= e!285593 e!285594)))

(declare-fun res!288923 () Bool)

(assert (=> b!485077 (=> (not res!288923) (not e!285594))))

(assert (=> b!485077 (= res!288923 (bvslt (_1!4638 (h!10142 l!956)) (_1!4638 (h!10142 (t!15515 l!956)))))))

(declare-fun b!485078 () Bool)

(assert (=> b!485078 (= e!285594 (isStrictlySorted!429 (t!15515 l!956)))))

(assert (= (and d!77313 (not res!288922)) b!485077))

(assert (= (and b!485077 res!288923) b!485078))

(declare-fun m!465407 () Bool)

(assert (=> b!485078 m!465407))

(assert (=> start!43950 d!77313))

(declare-fun d!77319 () Bool)

(declare-fun res!288934 () Bool)

(declare-fun e!285605 () Bool)

(assert (=> d!77319 (=> res!288934 e!285605)))

(assert (=> d!77319 (= res!288934 (and (is-Cons!9286 l!956) (= (_1!4638 (h!10142 l!956)) key!251)))))

(assert (=> d!77319 (= (containsKey!392 l!956 key!251) e!285605)))

(declare-fun b!485089 () Bool)

(declare-fun e!285606 () Bool)

(assert (=> b!485089 (= e!285605 e!285606)))

(declare-fun res!288935 () Bool)

(assert (=> b!485089 (=> (not res!288935) (not e!285606))))

(assert (=> b!485089 (= res!288935 (and (or (not (is-Cons!9286 l!956)) (bvsle (_1!4638 (h!10142 l!956)) key!251)) (is-Cons!9286 l!956) (bvslt (_1!4638 (h!10142 l!956)) key!251)))))

(declare-fun b!485090 () Bool)

(assert (=> b!485090 (= e!285606 (containsKey!392 (t!15515 l!956) key!251))))

(assert (= (and d!77319 (not res!288934)) b!485089))

(assert (= (and b!485089 res!288935) b!485090))

(declare-fun m!465411 () Bool)

(assert (=> b!485090 m!465411))

(assert (=> b!485046 d!77319))

(declare-fun b!485177 () Bool)

(declare-fun res!288961 () Bool)

(declare-fun e!285656 () Bool)

(assert (=> b!485177 (=> (not res!288961) (not e!285656))))

(declare-fun lt!219496 () List!9290)

(assert (=> b!485177 (= res!288961 (containsKey!392 lt!219496 key!251))))

(declare-fun b!485178 () Bool)

(declare-fun e!285655 () List!9290)

(declare-fun call!31219 () List!9290)

(assert (=> b!485178 (= e!285655 call!31219)))

(declare-fun b!485179 () Bool)

(declare-fun c!58404 () Bool)

(assert (=> b!485179 (= c!58404 (and (is-Cons!9286 l!956) (bvsgt (_1!4638 (h!10142 l!956)) key!251)))))

(declare-fun e!285658 () List!9290)

(assert (=> b!485179 (= e!285658 e!285655)))

(declare-fun c!58403 () Bool)

(declare-fun bm!31215 () Bool)

(declare-fun call!31218 () List!9290)

(declare-fun e!285659 () List!9290)

(declare-fun $colon$colon!129 (List!9290 tuple2!9254) List!9290)

(assert (=> bm!31215 (= call!31218 ($colon$colon!129 e!285659 (ite c!58403 (h!10142 l!956) (tuple2!9255 key!251 value!166))))))

(declare-fun c!58405 () Bool)

(assert (=> bm!31215 (= c!58405 c!58403)))

(declare-fun b!485180 () Bool)

(declare-fun e!285657 () List!9290)

(assert (=> b!485180 (= e!285657 e!285658)))

(declare-fun c!58406 () Bool)

(assert (=> b!485180 (= c!58406 (and (is-Cons!9286 l!956) (= (_1!4638 (h!10142 l!956)) key!251)))))

(declare-fun d!77323 () Bool)

(assert (=> d!77323 e!285656))

(declare-fun res!288960 () Bool)

(assert (=> d!77323 (=> (not res!288960) (not e!285656))))

(assert (=> d!77323 (= res!288960 (isStrictlySorted!429 lt!219496))))

(assert (=> d!77323 (= lt!219496 e!285657)))

(assert (=> d!77323 (= c!58403 (and (is-Cons!9286 l!956) (bvslt (_1!4638 (h!10142 l!956)) key!251)))))

(assert (=> d!77323 (isStrictlySorted!429 l!956)))

(assert (=> d!77323 (= (insertStrictlySorted!244 l!956 key!251 value!166) lt!219496)))

(declare-fun b!485181 () Bool)

(assert (=> b!485181 (= e!285659 (insertStrictlySorted!244 (t!15515 l!956) key!251 value!166))))

(declare-fun b!485182 () Bool)

(declare-fun call!31220 () List!9290)

(assert (=> b!485182 (= e!285658 call!31220)))

(declare-fun b!485183 () Bool)

(assert (=> b!485183 (= e!285657 call!31218)))

(declare-fun bm!31216 () Bool)

(assert (=> bm!31216 (= call!31220 call!31218)))

(declare-fun b!485184 () Bool)

(assert (=> b!485184 (= e!285659 (ite c!58406 (t!15515 l!956) (ite c!58404 (Cons!9286 (h!10142 l!956) (t!15515 l!956)) Nil!9287)))))

(declare-fun b!485186 () Bool)

(declare-fun contains!2689 (List!9290 tuple2!9254) Bool)

(assert (=> b!485186 (= e!285656 (contains!2689 lt!219496 (tuple2!9255 key!251 value!166)))))

(declare-fun b!485188 () Bool)

(assert (=> b!485188 (= e!285655 call!31219)))

(declare-fun bm!31217 () Bool)

(assert (=> bm!31217 (= call!31219 call!31220)))

(assert (= (and d!77323 c!58403) b!485183))

(assert (= (and d!77323 (not c!58403)) b!485180))

(assert (= (and b!485180 c!58406) b!485182))

(assert (= (and b!485180 (not c!58406)) b!485179))

(assert (= (and b!485179 c!58404) b!485188))

(assert (= (and b!485179 (not c!58404)) b!485178))

(assert (= (or b!485188 b!485178) bm!31217))

(assert (= (or b!485182 bm!31217) bm!31216))

(assert (= (or b!485183 bm!31216) bm!31215))

(assert (= (and bm!31215 c!58405) b!485181))

(assert (= (and bm!31215 (not c!58405)) b!485184))

(assert (= (and d!77323 res!288960) b!485177))

(assert (= (and b!485177 res!288961) b!485186))

(declare-fun m!465433 () Bool)

(assert (=> d!77323 m!465433))

(assert (=> d!77323 m!465387))

(declare-fun m!465437 () Bool)

(assert (=> b!485186 m!465437))

(declare-fun m!465439 () Bool)

(assert (=> b!485177 m!465439))

(declare-fun m!465441 () Bool)

(assert (=> b!485181 m!465441))

(declare-fun m!465443 () Bool)

(assert (=> bm!31215 m!465443))

(assert (=> b!485047 d!77323))

(declare-fun b!485202 () Bool)

(declare-fun e!285669 () Bool)

(declare-fun tp!43585 () Bool)

(assert (=> b!485202 (= e!285669 (and tp_is_empty!13957 tp!43585))))

(assert (=> b!485048 (= tp!43573 e!285669)))

(assert (= (and b!485048 (is-Cons!9286 (t!15515 l!956))) b!485202))

(push 1)

