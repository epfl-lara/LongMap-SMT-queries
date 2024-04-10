; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43952 () Bool)

(assert start!43952)

(declare-fun res!288904 () Bool)

(declare-fun e!285576 () Bool)

(assert (=> start!43952 (=> (not res!288904) (not e!285576))))

(declare-datatypes ((B!1150 0))(
  ( (B!1151 (val!7027 Int)) )
))
(declare-datatypes ((tuple2!9256 0))(
  ( (tuple2!9257 (_1!4639 (_ BitVec 64)) (_2!4639 B!1150)) )
))
(declare-datatypes ((List!9291 0))(
  ( (Nil!9288) (Cons!9287 (h!10143 tuple2!9256) (t!15516 List!9291)) )
))
(declare-fun l!956 () List!9291)

(declare-fun isStrictlySorted!430 (List!9291) Bool)

(assert (=> start!43952 (= res!288904 (isStrictlySorted!430 l!956))))

(assert (=> start!43952 e!285576))

(declare-fun e!285575 () Bool)

(assert (=> start!43952 e!285575))

(assert (=> start!43952 true))

(declare-fun tp_is_empty!13959 () Bool)

(assert (=> start!43952 tp_is_empty!13959))

(declare-fun b!485055 () Bool)

(declare-fun res!288905 () Bool)

(assert (=> b!485055 (=> (not res!288905) (not e!285576))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!393 (List!9291 (_ BitVec 64)) Bool)

(assert (=> b!485055 (= res!288905 (not (containsKey!393 l!956 key!251)))))

(declare-fun b!485056 () Bool)

(get-info :version)

(assert (=> b!485056 (= e!285576 (and ((_ is Cons!9287) l!956) (= (_1!4639 (h!10143 l!956)) key!251)))))

(declare-fun value!166 () B!1150)

(declare-fun lt!219484 () List!9291)

(declare-fun insertStrictlySorted!245 (List!9291 (_ BitVec 64) B!1150) List!9291)

(assert (=> b!485056 (= lt!219484 (insertStrictlySorted!245 l!956 key!251 value!166))))

(declare-fun b!485057 () Bool)

(declare-fun tp!43576 () Bool)

(assert (=> b!485057 (= e!285575 (and tp_is_empty!13959 tp!43576))))

(assert (= (and start!43952 res!288904) b!485055))

(assert (= (and b!485055 res!288905) b!485056))

(assert (= (and start!43952 ((_ is Cons!9287) l!956)) b!485057))

(declare-fun m!465393 () Bool)

(assert (=> start!43952 m!465393))

(declare-fun m!465395 () Bool)

(assert (=> b!485055 m!465395))

(declare-fun m!465397 () Bool)

(assert (=> b!485056 m!465397))

(check-sat (not b!485055) (not start!43952) (not b!485057) (not b!485056) tp_is_empty!13959)
(check-sat)
(get-model)

(declare-fun d!77311 () Bool)

(declare-fun res!288920 () Bool)

(declare-fun e!285591 () Bool)

(assert (=> d!77311 (=> res!288920 e!285591)))

(assert (=> d!77311 (= res!288920 (or ((_ is Nil!9288) l!956) ((_ is Nil!9288) (t!15516 l!956))))))

(assert (=> d!77311 (= (isStrictlySorted!430 l!956) e!285591)))

(declare-fun b!485075 () Bool)

(declare-fun e!285592 () Bool)

(assert (=> b!485075 (= e!285591 e!285592)))

(declare-fun res!288921 () Bool)

(assert (=> b!485075 (=> (not res!288921) (not e!285592))))

(assert (=> b!485075 (= res!288921 (bvslt (_1!4639 (h!10143 l!956)) (_1!4639 (h!10143 (t!15516 l!956)))))))

(declare-fun b!485076 () Bool)

(assert (=> b!485076 (= e!285592 (isStrictlySorted!430 (t!15516 l!956)))))

(assert (= (and d!77311 (not res!288920)) b!485075))

(assert (= (and b!485075 res!288921) b!485076))

(declare-fun m!465405 () Bool)

(assert (=> b!485076 m!465405))

(assert (=> start!43952 d!77311))

(declare-fun d!77317 () Bool)

(declare-fun res!288932 () Bool)

(declare-fun e!285603 () Bool)

(assert (=> d!77317 (=> res!288932 e!285603)))

(assert (=> d!77317 (= res!288932 (and ((_ is Cons!9287) l!956) (= (_1!4639 (h!10143 l!956)) key!251)))))

(assert (=> d!77317 (= (containsKey!393 l!956 key!251) e!285603)))

(declare-fun b!485087 () Bool)

(declare-fun e!285604 () Bool)

(assert (=> b!485087 (= e!285603 e!285604)))

(declare-fun res!288933 () Bool)

(assert (=> b!485087 (=> (not res!288933) (not e!285604))))

(assert (=> b!485087 (= res!288933 (and (or (not ((_ is Cons!9287) l!956)) (bvsle (_1!4639 (h!10143 l!956)) key!251)) ((_ is Cons!9287) l!956) (bvslt (_1!4639 (h!10143 l!956)) key!251)))))

(declare-fun b!485088 () Bool)

(assert (=> b!485088 (= e!285604 (containsKey!393 (t!15516 l!956) key!251))))

(assert (= (and d!77317 (not res!288932)) b!485087))

(assert (= (and b!485087 res!288933) b!485088))

(declare-fun m!465409 () Bool)

(assert (=> b!485088 m!465409))

(assert (=> b!485055 d!77317))

(declare-fun b!485167 () Bool)

(declare-fun c!58399 () Bool)

(declare-fun e!285652 () List!9291)

(declare-fun c!58400 () Bool)

(assert (=> b!485167 (= e!285652 (ite c!58399 (t!15516 l!956) (ite c!58400 (Cons!9287 (h!10143 l!956) (t!15516 l!956)) Nil!9288)))))

(declare-fun d!77321 () Bool)

(declare-fun e!285650 () Bool)

(assert (=> d!77321 e!285650))

(declare-fun res!288957 () Bool)

(assert (=> d!77321 (=> (not res!288957) (not e!285650))))

(declare-fun lt!219495 () List!9291)

(assert (=> d!77321 (= res!288957 (isStrictlySorted!430 lt!219495))))

(declare-fun e!285648 () List!9291)

(assert (=> d!77321 (= lt!219495 e!285648)))

(declare-fun c!58401 () Bool)

(assert (=> d!77321 (= c!58401 (and ((_ is Cons!9287) l!956) (bvslt (_1!4639 (h!10143 l!956)) key!251)))))

(assert (=> d!77321 (isStrictlySorted!430 l!956)))

(assert (=> d!77321 (= (insertStrictlySorted!245 l!956 key!251 value!166) lt!219495)))

(declare-fun b!485168 () Bool)

(declare-fun e!285649 () List!9291)

(declare-fun call!31216 () List!9291)

(assert (=> b!485168 (= e!285649 call!31216)))

(declare-fun b!485169 () Bool)

(declare-fun contains!2688 (List!9291 tuple2!9256) Bool)

(assert (=> b!485169 (= e!285650 (contains!2688 lt!219495 (tuple2!9257 key!251 value!166)))))

(declare-fun bm!31212 () Bool)

(declare-fun call!31215 () List!9291)

(declare-fun call!31217 () List!9291)

(assert (=> bm!31212 (= call!31215 call!31217)))

(declare-fun b!485170 () Bool)

(declare-fun res!288956 () Bool)

(assert (=> b!485170 (=> (not res!288956) (not e!285650))))

(assert (=> b!485170 (= res!288956 (containsKey!393 lt!219495 key!251))))

(declare-fun bm!31213 () Bool)

(declare-fun $colon$colon!130 (List!9291 tuple2!9256) List!9291)

(assert (=> bm!31213 (= call!31217 ($colon$colon!130 e!285652 (ite c!58401 (h!10143 l!956) (tuple2!9257 key!251 value!166))))))

(declare-fun c!58402 () Bool)

(assert (=> bm!31213 (= c!58402 c!58401)))

(declare-fun b!485171 () Bool)

(declare-fun e!285651 () List!9291)

(assert (=> b!485171 (= e!285648 e!285651)))

(assert (=> b!485171 (= c!58399 (and ((_ is Cons!9287) l!956) (= (_1!4639 (h!10143 l!956)) key!251)))))

(declare-fun b!485172 () Bool)

(assert (=> b!485172 (= e!285649 call!31216)))

(declare-fun b!485173 () Bool)

(assert (=> b!485173 (= e!285652 (insertStrictlySorted!245 (t!15516 l!956) key!251 value!166))))

(declare-fun b!485174 () Bool)

(assert (=> b!485174 (= e!285651 call!31215)))

(declare-fun b!485175 () Bool)

(assert (=> b!485175 (= e!285648 call!31217)))

(declare-fun b!485176 () Bool)

(assert (=> b!485176 (= c!58400 (and ((_ is Cons!9287) l!956) (bvsgt (_1!4639 (h!10143 l!956)) key!251)))))

(assert (=> b!485176 (= e!285651 e!285649)))

(declare-fun bm!31214 () Bool)

(assert (=> bm!31214 (= call!31216 call!31215)))

(assert (= (and d!77321 c!58401) b!485175))

(assert (= (and d!77321 (not c!58401)) b!485171))

(assert (= (and b!485171 c!58399) b!485174))

(assert (= (and b!485171 (not c!58399)) b!485176))

(assert (= (and b!485176 c!58400) b!485172))

(assert (= (and b!485176 (not c!58400)) b!485168))

(assert (= (or b!485172 b!485168) bm!31214))

(assert (= (or b!485174 bm!31214) bm!31212))

(assert (= (or b!485175 bm!31212) bm!31213))

(assert (= (and bm!31213 c!58402) b!485173))

(assert (= (and bm!31213 (not c!58402)) b!485167))

(assert (= (and d!77321 res!288957) b!485170))

(assert (= (and b!485170 res!288956) b!485169))

(declare-fun m!465425 () Bool)

(assert (=> b!485173 m!465425))

(declare-fun m!465427 () Bool)

(assert (=> b!485170 m!465427))

(declare-fun m!465429 () Bool)

(assert (=> d!77321 m!465429))

(assert (=> d!77321 m!465393))

(declare-fun m!465431 () Bool)

(assert (=> b!485169 m!465431))

(declare-fun m!465435 () Bool)

(assert (=> bm!31213 m!465435))

(assert (=> b!485056 d!77321))

(declare-fun b!485201 () Bool)

(declare-fun e!285668 () Bool)

(declare-fun tp!43584 () Bool)

(assert (=> b!485201 (= e!285668 (and tp_is_empty!13959 tp!43584))))

(assert (=> b!485057 (= tp!43576 e!285668)))

(assert (= (and b!485057 ((_ is Cons!9287) (t!15516 l!956))) b!485201))

(check-sat (not d!77321) (not b!485076) (not bm!31213) (not b!485088) (not b!485173) (not b!485169) (not b!485201) tp_is_empty!13959 (not b!485170))
(check-sat)
