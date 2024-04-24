; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43848 () Bool)

(assert start!43848)

(declare-fun b!484394 () Bool)

(declare-fun res!288606 () Bool)

(declare-fun e!285152 () Bool)

(assert (=> b!484394 (=> (not res!288606) (not e!285152))))

(declare-datatypes ((B!1136 0))(
  ( (B!1137 (val!7020 Int)) )
))
(declare-datatypes ((tuple2!9156 0))(
  ( (tuple2!9157 (_1!4589 (_ BitVec 64)) (_2!4589 B!1136)) )
))
(declare-datatypes ((List!9186 0))(
  ( (Nil!9183) (Cons!9182 (h!10038 tuple2!9156) (t!15400 List!9186)) )
))
(declare-fun l!956 () List!9186)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!386 (List!9186 (_ BitVec 64)) Bool)

(assert (=> b!484394 (= res!288606 (not (containsKey!386 l!956 key!251)))))

(declare-fun b!484395 () Bool)

(declare-fun e!285153 () Bool)

(declare-fun tp_is_empty!13945 () Bool)

(declare-fun tp!43534 () Bool)

(assert (=> b!484395 (= e!285153 (and tp_is_empty!13945 tp!43534))))

(declare-fun b!484396 () Bool)

(declare-fun e!285151 () Bool)

(assert (=> b!484396 (= e!285152 e!285151)))

(declare-fun res!288605 () Bool)

(assert (=> b!484396 (=> (not res!288605) (not e!285151))))

(get-info :version)

(assert (=> b!484396 (= res!288605 (and ((_ is Cons!9182) l!956) (bvslt (_1!4589 (h!10038 l!956)) key!251)))))

(declare-fun lt!219391 () List!9186)

(declare-fun value!166 () B!1136)

(declare-fun insertStrictlySorted!239 (List!9186 (_ BitVec 64) B!1136) List!9186)

(assert (=> b!484396 (= lt!219391 (insertStrictlySorted!239 l!956 key!251 value!166))))

(declare-fun b!484397 () Bool)

(declare-fun res!288607 () Bool)

(assert (=> b!484397 (=> (not res!288607) (not e!285151))))

(declare-fun isStrictlySorted!411 (List!9186) Bool)

(assert (=> b!484397 (= res!288607 (isStrictlySorted!411 (t!15400 l!956)))))

(declare-fun b!484398 () Bool)

(declare-fun ListPrimitiveSize!64 (List!9186) Int)

(assert (=> b!484398 (= e!285151 (>= (ListPrimitiveSize!64 (t!15400 l!956)) (ListPrimitiveSize!64 l!956)))))

(declare-fun res!288603 () Bool)

(assert (=> start!43848 (=> (not res!288603) (not e!285152))))

(assert (=> start!43848 (= res!288603 (isStrictlySorted!411 l!956))))

(assert (=> start!43848 e!285152))

(assert (=> start!43848 e!285153))

(assert (=> start!43848 true))

(assert (=> start!43848 tp_is_empty!13945))

(declare-fun b!484399 () Bool)

(declare-fun res!288604 () Bool)

(assert (=> b!484399 (=> (not res!288604) (not e!285151))))

(assert (=> b!484399 (= res!288604 (not (containsKey!386 (t!15400 l!956) key!251)))))

(assert (= (and start!43848 res!288603) b!484394))

(assert (= (and b!484394 res!288606) b!484396))

(assert (= (and b!484396 res!288605) b!484397))

(assert (= (and b!484397 res!288607) b!484399))

(assert (= (and b!484399 res!288604) b!484398))

(assert (= (and start!43848 ((_ is Cons!9182) l!956)) b!484395))

(declare-fun m!465199 () Bool)

(assert (=> b!484396 m!465199))

(declare-fun m!465201 () Bool)

(assert (=> start!43848 m!465201))

(declare-fun m!465203 () Bool)

(assert (=> b!484399 m!465203))

(declare-fun m!465205 () Bool)

(assert (=> b!484394 m!465205))

(declare-fun m!465207 () Bool)

(assert (=> b!484398 m!465207))

(declare-fun m!465209 () Bool)

(assert (=> b!484398 m!465209))

(declare-fun m!465211 () Bool)

(assert (=> b!484397 m!465211))

(check-sat (not b!484396) (not b!484395) (not b!484394) (not b!484399) (not start!43848) (not b!484397) tp_is_empty!13945 (not b!484398))
(check-sat)
(get-model)

(declare-fun e!285206 () Bool)

(declare-fun lt!219402 () List!9186)

(declare-fun b!484478 () Bool)

(declare-fun contains!2657 (List!9186 tuple2!9156) Bool)

(assert (=> b!484478 (= e!285206 (contains!2657 lt!219402 (tuple2!9157 key!251 value!166)))))

(declare-fun c!58228 () Bool)

(declare-fun c!58230 () Bool)

(declare-fun e!285200 () List!9186)

(declare-fun b!484479 () Bool)

(assert (=> b!484479 (= e!285200 (ite c!58228 (t!15400 l!956) (ite c!58230 (Cons!9182 (h!10038 l!956) (t!15400 l!956)) Nil!9183)))))

(declare-fun bm!31111 () Bool)

(declare-fun call!31116 () List!9186)

(declare-fun call!31115 () List!9186)

(assert (=> bm!31111 (= call!31116 call!31115)))

(declare-fun b!484480 () Bool)

(declare-fun e!285203 () List!9186)

(assert (=> b!484480 (= e!285203 call!31115)))

(declare-fun bm!31112 () Bool)

(declare-fun call!31114 () List!9186)

(assert (=> bm!31112 (= call!31114 call!31116)))

(declare-fun b!484481 () Bool)

(assert (=> b!484481 (= c!58230 (and ((_ is Cons!9182) l!956) (bvsgt (_1!4589 (h!10038 l!956)) key!251)))))

(declare-fun e!285205 () List!9186)

(declare-fun e!285204 () List!9186)

(assert (=> b!484481 (= e!285205 e!285204)))

(declare-fun b!484482 () Bool)

(declare-fun res!288661 () Bool)

(assert (=> b!484482 (=> (not res!288661) (not e!285206))))

(assert (=> b!484482 (= res!288661 (containsKey!386 lt!219402 key!251))))

(declare-fun b!484483 () Bool)

(assert (=> b!484483 (= e!285200 (insertStrictlySorted!239 (t!15400 l!956) key!251 value!166))))

(declare-fun bm!31113 () Bool)

(declare-fun c!58231 () Bool)

(declare-fun $colon$colon!120 (List!9186 tuple2!9156) List!9186)

(assert (=> bm!31113 (= call!31115 ($colon$colon!120 e!285200 (ite c!58231 (h!10038 l!956) (tuple2!9157 key!251 value!166))))))

(declare-fun c!58229 () Bool)

(assert (=> bm!31113 (= c!58229 c!58231)))

(declare-fun b!484484 () Bool)

(assert (=> b!484484 (= e!285205 call!31116)))

(declare-fun d!77133 () Bool)

(assert (=> d!77133 e!285206))

(declare-fun res!288660 () Bool)

(assert (=> d!77133 (=> (not res!288660) (not e!285206))))

(assert (=> d!77133 (= res!288660 (isStrictlySorted!411 lt!219402))))

(assert (=> d!77133 (= lt!219402 e!285203)))

(assert (=> d!77133 (= c!58231 (and ((_ is Cons!9182) l!956) (bvslt (_1!4589 (h!10038 l!956)) key!251)))))

(assert (=> d!77133 (isStrictlySorted!411 l!956)))

(assert (=> d!77133 (= (insertStrictlySorted!239 l!956 key!251 value!166) lt!219402)))

(declare-fun b!484485 () Bool)

(assert (=> b!484485 (= e!285204 call!31114)))

(declare-fun b!484486 () Bool)

(assert (=> b!484486 (= e!285203 e!285205)))

(assert (=> b!484486 (= c!58228 (and ((_ is Cons!9182) l!956) (= (_1!4589 (h!10038 l!956)) key!251)))))

(declare-fun b!484487 () Bool)

(assert (=> b!484487 (= e!285204 call!31114)))

(assert (= (and d!77133 c!58231) b!484480))

(assert (= (and d!77133 (not c!58231)) b!484486))

(assert (= (and b!484486 c!58228) b!484484))

(assert (= (and b!484486 (not c!58228)) b!484481))

(assert (= (and b!484481 c!58230) b!484487))

(assert (= (and b!484481 (not c!58230)) b!484485))

(assert (= (or b!484487 b!484485) bm!31112))

(assert (= (or b!484484 bm!31112) bm!31111))

(assert (= (or b!484480 bm!31111) bm!31113))

(assert (= (and bm!31113 c!58229) b!484483))

(assert (= (and bm!31113 (not c!58229)) b!484479))

(assert (= (and d!77133 res!288660) b!484482))

(assert (= (and b!484482 res!288661) b!484478))

(declare-fun m!465241 () Bool)

(assert (=> b!484478 m!465241))

(declare-fun m!465243 () Bool)

(assert (=> d!77133 m!465243))

(assert (=> d!77133 m!465201))

(declare-fun m!465245 () Bool)

(assert (=> bm!31113 m!465245))

(declare-fun m!465247 () Bool)

(assert (=> b!484483 m!465247))

(declare-fun m!465249 () Bool)

(assert (=> b!484482 m!465249))

(assert (=> b!484396 d!77133))

(declare-fun d!77145 () Bool)

(declare-fun res!288670 () Bool)

(declare-fun e!285217 () Bool)

(assert (=> d!77145 (=> res!288670 e!285217)))

(assert (=> d!77145 (= res!288670 (and ((_ is Cons!9182) (t!15400 l!956)) (= (_1!4589 (h!10038 (t!15400 l!956))) key!251)))))

(assert (=> d!77145 (= (containsKey!386 (t!15400 l!956) key!251) e!285217)))

(declare-fun b!484500 () Bool)

(declare-fun e!285218 () Bool)

(assert (=> b!484500 (= e!285217 e!285218)))

(declare-fun res!288671 () Bool)

(assert (=> b!484500 (=> (not res!288671) (not e!285218))))

(assert (=> b!484500 (= res!288671 (and (or (not ((_ is Cons!9182) (t!15400 l!956))) (bvsle (_1!4589 (h!10038 (t!15400 l!956))) key!251)) ((_ is Cons!9182) (t!15400 l!956)) (bvslt (_1!4589 (h!10038 (t!15400 l!956))) key!251)))))

(declare-fun b!484501 () Bool)

(assert (=> b!484501 (= e!285218 (containsKey!386 (t!15400 (t!15400 l!956)) key!251))))

(assert (= (and d!77145 (not res!288670)) b!484500))

(assert (= (and b!484500 res!288671) b!484501))

(declare-fun m!465253 () Bool)

(assert (=> b!484501 m!465253))

(assert (=> b!484399 d!77145))

(declare-fun d!77151 () Bool)

(declare-fun res!288674 () Bool)

(declare-fun e!285221 () Bool)

(assert (=> d!77151 (=> res!288674 e!285221)))

(assert (=> d!77151 (= res!288674 (and ((_ is Cons!9182) l!956) (= (_1!4589 (h!10038 l!956)) key!251)))))

(assert (=> d!77151 (= (containsKey!386 l!956 key!251) e!285221)))

(declare-fun b!484504 () Bool)

(declare-fun e!285222 () Bool)

(assert (=> b!484504 (= e!285221 e!285222)))

(declare-fun res!288675 () Bool)

(assert (=> b!484504 (=> (not res!288675) (not e!285222))))

(assert (=> b!484504 (= res!288675 (and (or (not ((_ is Cons!9182) l!956)) (bvsle (_1!4589 (h!10038 l!956)) key!251)) ((_ is Cons!9182) l!956) (bvslt (_1!4589 (h!10038 l!956)) key!251)))))

(declare-fun b!484505 () Bool)

(assert (=> b!484505 (= e!285222 (containsKey!386 (t!15400 l!956) key!251))))

(assert (= (and d!77151 (not res!288674)) b!484504))

(assert (= (and b!484504 res!288675) b!484505))

(assert (=> b!484505 m!465203))

(assert (=> b!484394 d!77151))

(declare-fun d!77155 () Bool)

(declare-fun res!288684 () Bool)

(declare-fun e!285231 () Bool)

(assert (=> d!77155 (=> res!288684 e!285231)))

(assert (=> d!77155 (= res!288684 (or ((_ is Nil!9183) (t!15400 l!956)) ((_ is Nil!9183) (t!15400 (t!15400 l!956)))))))

(assert (=> d!77155 (= (isStrictlySorted!411 (t!15400 l!956)) e!285231)))

(declare-fun b!484514 () Bool)

(declare-fun e!285232 () Bool)

(assert (=> b!484514 (= e!285231 e!285232)))

(declare-fun res!288685 () Bool)

(assert (=> b!484514 (=> (not res!288685) (not e!285232))))

(assert (=> b!484514 (= res!288685 (bvslt (_1!4589 (h!10038 (t!15400 l!956))) (_1!4589 (h!10038 (t!15400 (t!15400 l!956))))))))

(declare-fun b!484515 () Bool)

(assert (=> b!484515 (= e!285232 (isStrictlySorted!411 (t!15400 (t!15400 l!956))))))

(assert (= (and d!77155 (not res!288684)) b!484514))

(assert (= (and b!484514 res!288685) b!484515))

(declare-fun m!465259 () Bool)

(assert (=> b!484515 m!465259))

(assert (=> b!484397 d!77155))

(declare-fun d!77161 () Bool)

(declare-fun res!288686 () Bool)

(declare-fun e!285233 () Bool)

(assert (=> d!77161 (=> res!288686 e!285233)))

(assert (=> d!77161 (= res!288686 (or ((_ is Nil!9183) l!956) ((_ is Nil!9183) (t!15400 l!956))))))

(assert (=> d!77161 (= (isStrictlySorted!411 l!956) e!285233)))

(declare-fun b!484516 () Bool)

(declare-fun e!285234 () Bool)

(assert (=> b!484516 (= e!285233 e!285234)))

(declare-fun res!288687 () Bool)

(assert (=> b!484516 (=> (not res!288687) (not e!285234))))

(assert (=> b!484516 (= res!288687 (bvslt (_1!4589 (h!10038 l!956)) (_1!4589 (h!10038 (t!15400 l!956)))))))

(declare-fun b!484517 () Bool)

(assert (=> b!484517 (= e!285234 (isStrictlySorted!411 (t!15400 l!956)))))

(assert (= (and d!77161 (not res!288686)) b!484516))

(assert (= (and b!484516 res!288687) b!484517))

(assert (=> b!484517 m!465211))

(assert (=> start!43848 d!77161))

(declare-fun d!77163 () Bool)

(declare-fun lt!219409 () Int)

(assert (=> d!77163 (>= lt!219409 0)))

(declare-fun e!285243 () Int)

(assert (=> d!77163 (= lt!219409 e!285243)))

(declare-fun c!58242 () Bool)

(assert (=> d!77163 (= c!58242 ((_ is Nil!9183) (t!15400 l!956)))))

(assert (=> d!77163 (= (ListPrimitiveSize!64 (t!15400 l!956)) lt!219409)))

(declare-fun b!484534 () Bool)

(assert (=> b!484534 (= e!285243 0)))

(declare-fun b!484535 () Bool)

(assert (=> b!484535 (= e!285243 (+ 1 (ListPrimitiveSize!64 (t!15400 (t!15400 l!956)))))))

(assert (= (and d!77163 c!58242) b!484534))

(assert (= (and d!77163 (not c!58242)) b!484535))

(declare-fun m!465261 () Bool)

(assert (=> b!484535 m!465261))

(assert (=> b!484398 d!77163))

(declare-fun d!77165 () Bool)

(declare-fun lt!219410 () Int)

(assert (=> d!77165 (>= lt!219410 0)))

(declare-fun e!285244 () Int)

(assert (=> d!77165 (= lt!219410 e!285244)))

(declare-fun c!58243 () Bool)

(assert (=> d!77165 (= c!58243 ((_ is Nil!9183) l!956))))

(assert (=> d!77165 (= (ListPrimitiveSize!64 l!956) lt!219410)))

(declare-fun b!484536 () Bool)

(assert (=> b!484536 (= e!285244 0)))

(declare-fun b!484537 () Bool)

(assert (=> b!484537 (= e!285244 (+ 1 (ListPrimitiveSize!64 (t!15400 l!956))))))

(assert (= (and d!77165 c!58243) b!484536))

(assert (= (and d!77165 (not c!58243)) b!484537))

(assert (=> b!484537 m!465207))

(assert (=> b!484398 d!77165))

(declare-fun b!484542 () Bool)

(declare-fun e!285247 () Bool)

(declare-fun tp!43543 () Bool)

(assert (=> b!484542 (= e!285247 (and tp_is_empty!13945 tp!43543))))

(assert (=> b!484395 (= tp!43534 e!285247)))

(assert (= (and b!484395 ((_ is Cons!9182) (t!15400 l!956))) b!484542))

(check-sat (not b!484478) (not b!484483) (not b!484515) (not b!484501) (not bm!31113) (not b!484482) tp_is_empty!13945 (not b!484517) (not b!484537) (not b!484505) (not b!484542) (not d!77133) (not b!484535))
(check-sat)
