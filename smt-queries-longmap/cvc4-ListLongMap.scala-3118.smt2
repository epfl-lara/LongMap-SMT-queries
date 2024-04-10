; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43840 () Bool)

(assert start!43840)

(declare-fun b!484285 () Bool)

(declare-fun res!288531 () Bool)

(declare-fun e!285081 () Bool)

(assert (=> b!484285 (=> (not res!288531) (not e!285081))))

(declare-datatypes ((B!1134 0))(
  ( (B!1135 (val!7019 Int)) )
))
(declare-datatypes ((tuple2!9240 0))(
  ( (tuple2!9241 (_1!4631 (_ BitVec 64)) (_2!4631 B!1134)) )
))
(declare-datatypes ((List!9283 0))(
  ( (Nil!9280) (Cons!9279 (h!10135 tuple2!9240) (t!15505 List!9283)) )
))
(declare-fun l!956 () List!9283)

(declare-fun isStrictlySorted!422 (List!9283) Bool)

(assert (=> b!484285 (= res!288531 (isStrictlySorted!422 (t!15505 l!956)))))

(declare-fun b!484286 () Bool)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!385 (List!9283 (_ BitVec 64)) Bool)

(assert (=> b!484286 (= e!285081 (containsKey!385 (t!15505 l!956) key!251))))

(declare-fun b!484288 () Bool)

(declare-fun e!285080 () Bool)

(assert (=> b!484288 (= e!285080 e!285081)))

(declare-fun res!288533 () Bool)

(assert (=> b!484288 (=> (not res!288533) (not e!285081))))

(assert (=> b!484288 (= res!288533 (and (is-Cons!9279 l!956) (bvslt (_1!4631 (h!10135 l!956)) key!251)))))

(declare-fun lt!219367 () List!9283)

(declare-fun value!166 () B!1134)

(declare-fun insertStrictlySorted!237 (List!9283 (_ BitVec 64) B!1134) List!9283)

(assert (=> b!484288 (= lt!219367 (insertStrictlySorted!237 l!956 key!251 value!166))))

(declare-fun b!484289 () Bool)

(declare-fun e!285079 () Bool)

(declare-fun tp_is_empty!13943 () Bool)

(declare-fun tp!43522 () Bool)

(assert (=> b!484289 (= e!285079 (and tp_is_empty!13943 tp!43522))))

(declare-fun b!484287 () Bool)

(declare-fun res!288530 () Bool)

(assert (=> b!484287 (=> (not res!288530) (not e!285080))))

(assert (=> b!484287 (= res!288530 (not (containsKey!385 l!956 key!251)))))

(declare-fun res!288532 () Bool)

(assert (=> start!43840 (=> (not res!288532) (not e!285080))))

(assert (=> start!43840 (= res!288532 (isStrictlySorted!422 l!956))))

(assert (=> start!43840 e!285080))

(assert (=> start!43840 e!285079))

(assert (=> start!43840 true))

(assert (=> start!43840 tp_is_empty!13943))

(assert (= (and start!43840 res!288532) b!484287))

(assert (= (and b!484287 res!288530) b!484288))

(assert (= (and b!484288 res!288533) b!484285))

(assert (= (and b!484285 res!288531) b!484286))

(assert (= (and start!43840 (is-Cons!9279 l!956)) b!484289))

(declare-fun m!464963 () Bool)

(assert (=> b!484288 m!464963))

(declare-fun m!464965 () Bool)

(assert (=> start!43840 m!464965))

(declare-fun m!464967 () Bool)

(assert (=> b!484287 m!464967))

(declare-fun m!464969 () Bool)

(assert (=> b!484286 m!464969))

(declare-fun m!464971 () Bool)

(assert (=> b!484285 m!464971))

(push 1)

(assert (not b!484287))

(assert (not b!484285))

(assert (not b!484288))

(assert tp_is_empty!13943)

(assert (not b!484289))

(assert (not b!484286))

(assert (not start!43840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77077 () Bool)

(declare-fun res!288564 () Bool)

(declare-fun e!285112 () Bool)

(assert (=> d!77077 (=> res!288564 e!285112)))

(assert (=> d!77077 (= res!288564 (and (is-Cons!9279 (t!15505 l!956)) (= (_1!4631 (h!10135 (t!15505 l!956))) key!251)))))

(assert (=> d!77077 (= (containsKey!385 (t!15505 l!956) key!251) e!285112)))

(declare-fun b!484320 () Bool)

(declare-fun e!285113 () Bool)

(assert (=> b!484320 (= e!285112 e!285113)))

(declare-fun res!288565 () Bool)

(assert (=> b!484320 (=> (not res!288565) (not e!285113))))

(assert (=> b!484320 (= res!288565 (and (or (not (is-Cons!9279 (t!15505 l!956))) (bvsle (_1!4631 (h!10135 (t!15505 l!956))) key!251)) (is-Cons!9279 (t!15505 l!956)) (bvslt (_1!4631 (h!10135 (t!15505 l!956))) key!251)))))

(declare-fun b!484321 () Bool)

(assert (=> b!484321 (= e!285113 (containsKey!385 (t!15505 (t!15505 l!956)) key!251))))

(assert (= (and d!77077 (not res!288564)) b!484320))

(assert (= (and b!484320 res!288565) b!484321))

(declare-fun m!464975 () Bool)

(assert (=> b!484321 m!464975))

(assert (=> b!484286 d!77077))

(declare-fun d!77087 () Bool)

(declare-fun res!288572 () Bool)

(declare-fun e!285120 () Bool)

(assert (=> d!77087 (=> res!288572 e!285120)))

(assert (=> d!77087 (= res!288572 (or (is-Nil!9280 (t!15505 l!956)) (is-Nil!9280 (t!15505 (t!15505 l!956)))))))

(assert (=> d!77087 (= (isStrictlySorted!422 (t!15505 l!956)) e!285120)))

(declare-fun b!484328 () Bool)

(declare-fun e!285121 () Bool)

(assert (=> b!484328 (= e!285120 e!285121)))

(declare-fun res!288573 () Bool)

(assert (=> b!484328 (=> (not res!288573) (not e!285121))))

(assert (=> b!484328 (= res!288573 (bvslt (_1!4631 (h!10135 (t!15505 l!956))) (_1!4631 (h!10135 (t!15505 (t!15505 l!956))))))))

(declare-fun b!484329 () Bool)

(assert (=> b!484329 (= e!285121 (isStrictlySorted!422 (t!15505 (t!15505 l!956))))))

(assert (= (and d!77087 (not res!288572)) b!484328))

(assert (= (and b!484328 res!288573) b!484329))

(declare-fun m!464979 () Bool)

(assert (=> b!484329 m!464979))

(assert (=> b!484285 d!77087))

(declare-fun b!484424 () Bool)

(declare-fun e!285175 () List!9283)

(assert (=> b!484424 (= e!285175 (insertStrictlySorted!237 (t!15505 l!956) key!251 value!166))))

(declare-fun b!484425 () Bool)

(declare-fun e!285176 () List!9283)

(declare-fun call!31120 () List!9283)

(assert (=> b!484425 (= e!285176 call!31120)))

(declare-fun b!484426 () Bool)

(declare-fun c!58242 () Bool)

(assert (=> b!484426 (= c!58242 (and (is-Cons!9279 l!956) (bvsgt (_1!4631 (h!10135 l!956)) key!251)))))

(declare-fun e!285173 () List!9283)

(assert (=> b!484426 (= e!285173 e!285176)))

(declare-fun c!58244 () Bool)

(declare-fun b!484427 () Bool)

(assert (=> b!484427 (= e!285175 (ite c!58244 (t!15505 l!956) (ite c!58242 (Cons!9279 (h!10135 l!956) (t!15505 l!956)) Nil!9280)))))

(declare-fun d!77091 () Bool)

(declare-fun e!285172 () Bool)

(assert (=> d!77091 e!285172))

(declare-fun res!288594 () Bool)

(assert (=> d!77091 (=> (not res!288594) (not e!285172))))

(declare-fun lt!219376 () List!9283)

(assert (=> d!77091 (= res!288594 (isStrictlySorted!422 lt!219376))))

(declare-fun e!285174 () List!9283)

(assert (=> d!77091 (= lt!219376 e!285174)))

(declare-fun c!58241 () Bool)

(assert (=> d!77091 (= c!58241 (and (is-Cons!9279 l!956) (bvslt (_1!4631 (h!10135 l!956)) key!251)))))

(assert (=> d!77091 (isStrictlySorted!422 l!956)))

(assert (=> d!77091 (= (insertStrictlySorted!237 l!956 key!251 value!166) lt!219376)))

(declare-fun bm!31116 () Bool)

(declare-fun call!31119 () List!9283)

(declare-fun call!31121 () List!9283)

(assert (=> bm!31116 (= call!31119 call!31121)))

(declare-fun b!484428 () Bool)

(declare-fun contains!2680 (List!9283 tuple2!9240) Bool)

(assert (=> b!484428 (= e!285172 (contains!2680 lt!219376 (tuple2!9241 key!251 value!166)))))

(declare-fun b!484429 () Bool)

(assert (=> b!484429 (= e!285174 call!31121)))

(declare-fun b!484430 () Bool)

(assert (=> b!484430 (= e!285176 call!31120)))

(declare-fun bm!31117 () Bool)

(declare-fun $colon$colon!121 (List!9283 tuple2!9240) List!9283)

(assert (=> bm!31117 (= call!31121 ($colon$colon!121 e!285175 (ite c!58241 (h!10135 l!956) (tuple2!9241 key!251 value!166))))))

(declare-fun c!58243 () Bool)

(assert (=> bm!31117 (= c!58243 c!58241)))

(declare-fun b!484431 () Bool)

(assert (=> b!484431 (= e!285173 call!31119)))

(declare-fun b!484432 () Bool)

(assert (=> b!484432 (= e!285174 e!285173)))

(assert (=> b!484432 (= c!58244 (and (is-Cons!9279 l!956) (= (_1!4631 (h!10135 l!956)) key!251)))))

(declare-fun bm!31118 () Bool)

(assert (=> bm!31118 (= call!31120 call!31119)))

(declare-fun b!484433 () Bool)

(declare-fun res!288595 () Bool)

(assert (=> b!484433 (=> (not res!288595) (not e!285172))))

(assert (=> b!484433 (= res!288595 (containsKey!385 lt!219376 key!251))))

(assert (= (and d!77091 c!58241) b!484429))

(assert (= (and d!77091 (not c!58241)) b!484432))

(assert (= (and b!484432 c!58244) b!484431))

(assert (= (and b!484432 (not c!58244)) b!484426))

(assert (= (and b!484426 c!58242) b!484425))

(assert (= (and b!484426 (not c!58242)) b!484430))

(assert (= (or b!484425 b!484430) bm!31118))

(assert (= (or b!484431 bm!31118) bm!31116))

(assert (= (or b!484429 bm!31116) bm!31117))

(assert (= (and bm!31117 c!58243) b!484424))

(assert (= (and bm!31117 (not c!58243)) b!484427))

(assert (= (and d!77091 res!288594) b!484433))

(assert (= (and b!484433 res!288595) b!484428))

(declare-fun m!465005 () Bool)

(assert (=> bm!31117 m!465005))

(declare-fun m!465007 () Bool)

(assert (=> b!484433 m!465007))

(declare-fun m!465009 () Bool)

(assert (=> b!484424 m!465009))

(declare-fun m!465011 () Bool)

(assert (=> d!77091 m!465011))

(assert (=> d!77091 m!464965))

(declare-fun m!465013 () Bool)

(assert (=> b!484428 m!465013))

(assert (=> b!484288 d!77091))

(declare-fun d!77097 () Bool)

(declare-fun res!288596 () Bool)

(declare-fun e!285177 () Bool)

(assert (=> d!77097 (=> res!288596 e!285177)))

(assert (=> d!77097 (= res!288596 (and (is-Cons!9279 l!956) (= (_1!4631 (h!10135 l!956)) key!251)))))

(assert (=> d!77097 (= (containsKey!385 l!956 key!251) e!285177)))

(declare-fun b!484434 () Bool)

(declare-fun e!285178 () Bool)

(assert (=> b!484434 (= e!285177 e!285178)))

(declare-fun res!288597 () Bool)

(assert (=> b!484434 (=> (not res!288597) (not e!285178))))

(assert (=> b!484434 (= res!288597 (and (or (not (is-Cons!9279 l!956)) (bvsle (_1!4631 (h!10135 l!956)) key!251)) (is-Cons!9279 l!956) (bvslt (_1!4631 (h!10135 l!956)) key!251)))))

(declare-fun b!484435 () Bool)

(assert (=> b!484435 (= e!285178 (containsKey!385 (t!15505 l!956) key!251))))

(assert (= (and d!77097 (not res!288596)) b!484434))

(assert (= (and b!484434 res!288597) b!484435))

(assert (=> b!484435 m!464969))

(assert (=> b!484287 d!77097))

(declare-fun d!77099 () Bool)

(declare-fun res!288598 () Bool)

(declare-fun e!285179 () Bool)

(assert (=> d!77099 (=> res!288598 e!285179)))

(assert (=> d!77099 (= res!288598 (or (is-Nil!9280 l!956) (is-Nil!9280 (t!15505 l!956))))))

(assert (=> d!77099 (= (isStrictlySorted!422 l!956) e!285179)))

(declare-fun b!484436 () Bool)

(declare-fun e!285180 () Bool)

(assert (=> b!484436 (= e!285179 e!285180)))

(declare-fun res!288599 () Bool)

(assert (=> b!484436 (=> (not res!288599) (not e!285180))))

(assert (=> b!484436 (= res!288599 (bvslt (_1!4631 (h!10135 l!956)) (_1!4631 (h!10135 (t!15505 l!956)))))))

(declare-fun b!484437 () Bool)

(assert (=> b!484437 (= e!285180 (isStrictlySorted!422 (t!15505 l!956)))))

(assert (= (and d!77099 (not res!288598)) b!484436))

(assert (= (and b!484436 res!288599) b!484437))

(assert (=> b!484437 m!464971))

(assert (=> start!43840 d!77099))

(declare-fun b!484442 () Bool)

(declare-fun e!285183 () Bool)

(declare-fun tp!43531 () Bool)

(assert (=> b!484442 (= e!285183 (and tp_is_empty!13943 tp!43531))))

(assert (=> b!484289 (= tp!43522 e!285183)))

(assert (= (and b!484289 (is-Cons!9279 (t!15505 l!956))) b!484442))

(push 1)

(assert (not d!77091))

(assert (not b!484428))

(assert tp_is_empty!13943)

(assert (not b!484433))

(assert (not b!484442))

(assert (not b!484329))

(assert (not b!484321))

(assert (not b!484437))

(assert (not bm!31117))

(assert (not b!484424))

(assert (not b!484435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

