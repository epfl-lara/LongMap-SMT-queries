; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106554 () Bool)

(assert start!106554)

(declare-fun b!1266330 () Bool)

(declare-fun res!843096 () Bool)

(declare-fun e!721258 () Bool)

(assert (=> b!1266330 (=> (not res!843096) (not e!721258))))

(declare-datatypes ((B!2000 0))(
  ( (B!2001 (val!16335 Int)) )
))
(declare-datatypes ((tuple2!21270 0))(
  ( (tuple2!21271 (_1!10646 (_ BitVec 64)) (_2!10646 B!2000)) )
))
(declare-datatypes ((List!28411 0))(
  ( (Nil!28408) (Cons!28407 (h!29616 tuple2!21270) (t!41926 List!28411)) )
))
(declare-fun l!706 () List!28411)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!659 (List!28411 (_ BitVec 64)) Bool)

(assert (=> b!1266330 (= res!843096 (not (containsKey!659 l!706 key1!31)))))

(declare-fun b!1266333 () Bool)

(declare-fun e!721259 () Bool)

(declare-fun tp_is_empty!32533 () Bool)

(declare-fun tp!96431 () Bool)

(assert (=> b!1266333 (= e!721259 (and tp_is_empty!32533 tp!96431))))

(declare-fun v1!26 () B!2000)

(declare-fun b!1266332 () Bool)

(declare-fun removeStrictlySorted!158 (List!28411 (_ BitVec 64)) List!28411)

(declare-fun insertStrictlySorted!469 (List!28411 (_ BitVec 64) B!2000) List!28411)

(assert (=> b!1266332 (= e!721258 (not (= (removeStrictlySorted!158 (insertStrictlySorted!469 l!706 key1!31 v1!26) key1!31) l!706)))))

(declare-fun b!1266331 () Bool)

(declare-fun res!843094 () Bool)

(assert (=> b!1266331 (=> (not res!843094) (not e!721258))))

(get-info :version)

(assert (=> b!1266331 (= res!843094 (not ((_ is Cons!28407) l!706)))))

(declare-fun res!843095 () Bool)

(assert (=> start!106554 (=> (not res!843095) (not e!721258))))

(declare-fun isStrictlySorted!798 (List!28411) Bool)

(assert (=> start!106554 (= res!843095 (isStrictlySorted!798 l!706))))

(assert (=> start!106554 e!721258))

(assert (=> start!106554 e!721259))

(assert (=> start!106554 true))

(assert (=> start!106554 tp_is_empty!32533))

(assert (= (and start!106554 res!843095) b!1266330))

(assert (= (and b!1266330 res!843096) b!1266331))

(assert (= (and b!1266331 res!843094) b!1266332))

(assert (= (and start!106554 ((_ is Cons!28407) l!706)) b!1266333))

(declare-fun m!1165655 () Bool)

(assert (=> b!1266330 m!1165655))

(declare-fun m!1165657 () Bool)

(assert (=> b!1266332 m!1165657))

(assert (=> b!1266332 m!1165657))

(declare-fun m!1165659 () Bool)

(assert (=> b!1266332 m!1165659))

(declare-fun m!1165661 () Bool)

(assert (=> start!106554 m!1165661))

(check-sat (not start!106554) tp_is_empty!32533 (not b!1266333) (not b!1266332) (not b!1266330))
(check-sat)
(get-model)

(declare-fun b!1266384 () Bool)

(declare-fun e!721290 () List!28411)

(assert (=> b!1266384 (= e!721290 Nil!28408)))

(declare-fun b!1266385 () Bool)

(declare-fun e!721291 () List!28411)

(assert (=> b!1266385 (= e!721291 e!721290)))

(declare-fun c!123428 () Bool)

(assert (=> b!1266385 (= c!123428 (and ((_ is Cons!28407) (insertStrictlySorted!469 l!706 key1!31 v1!26)) (not (= (_1!10646 (h!29616 (insertStrictlySorted!469 l!706 key1!31 v1!26))) key1!31))))))

(declare-fun b!1266386 () Bool)

(declare-fun e!721292 () Bool)

(declare-fun lt!573960 () List!28411)

(assert (=> b!1266386 (= e!721292 (not (containsKey!659 lt!573960 key1!31)))))

(declare-fun d!139087 () Bool)

(assert (=> d!139087 e!721292))

(declare-fun res!843125 () Bool)

(assert (=> d!139087 (=> (not res!843125) (not e!721292))))

(assert (=> d!139087 (= res!843125 (isStrictlySorted!798 lt!573960))))

(assert (=> d!139087 (= lt!573960 e!721291)))

(declare-fun c!123427 () Bool)

(assert (=> d!139087 (= c!123427 (and ((_ is Cons!28407) (insertStrictlySorted!469 l!706 key1!31 v1!26)) (= (_1!10646 (h!29616 (insertStrictlySorted!469 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!139087 (isStrictlySorted!798 (insertStrictlySorted!469 l!706 key1!31 v1!26))))

(assert (=> d!139087 (= (removeStrictlySorted!158 (insertStrictlySorted!469 l!706 key1!31 v1!26) key1!31) lt!573960)))

(declare-fun b!1266387 () Bool)

(assert (=> b!1266387 (= e!721291 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))

(declare-fun b!1266388 () Bool)

(declare-fun $colon$colon!646 (List!28411 tuple2!21270) List!28411)

(assert (=> b!1266388 (= e!721290 ($colon$colon!646 (removeStrictlySorted!158 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31) (h!29616 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))

(assert (= (and d!139087 c!123427) b!1266387))

(assert (= (and d!139087 (not c!123427)) b!1266385))

(assert (= (and b!1266385 c!123428) b!1266388))

(assert (= (and b!1266385 (not c!123428)) b!1266384))

(assert (= (and d!139087 res!843125) b!1266386))

(declare-fun m!1165681 () Bool)

(assert (=> b!1266386 m!1165681))

(declare-fun m!1165683 () Bool)

(assert (=> d!139087 m!1165683))

(assert (=> d!139087 m!1165657))

(declare-fun m!1165685 () Bool)

(assert (=> d!139087 m!1165685))

(declare-fun m!1165687 () Bool)

(assert (=> b!1266388 m!1165687))

(assert (=> b!1266388 m!1165687))

(declare-fun m!1165689 () Bool)

(assert (=> b!1266388 m!1165689))

(assert (=> b!1266332 d!139087))

(declare-fun b!1266469 () Bool)

(declare-fun e!721337 () List!28411)

(declare-fun call!62469 () List!28411)

(assert (=> b!1266469 (= e!721337 call!62469)))

(declare-fun c!123462 () Bool)

(declare-fun c!123464 () Bool)

(declare-fun b!1266470 () Bool)

(declare-fun e!721339 () List!28411)

(assert (=> b!1266470 (= e!721339 (ite c!123464 (t!41926 l!706) (ite c!123462 (Cons!28407 (h!29616 l!706) (t!41926 l!706)) Nil!28408)))))

(declare-fun b!1266471 () Bool)

(assert (=> b!1266471 (= e!721339 (insertStrictlySorted!469 (t!41926 l!706) key1!31 v1!26))))

(declare-fun b!1266472 () Bool)

(declare-fun res!843142 () Bool)

(declare-fun e!721336 () Bool)

(assert (=> b!1266472 (=> (not res!843142) (not e!721336))))

(declare-fun lt!573971 () List!28411)

(assert (=> b!1266472 (= res!843142 (containsKey!659 lt!573971 key1!31))))

(declare-fun bm!62465 () Bool)

(declare-fun call!62467 () List!28411)

(assert (=> bm!62465 (= call!62467 call!62469)))

(declare-fun b!1266473 () Bool)

(declare-fun contains!7612 (List!28411 tuple2!21270) Bool)

(assert (=> b!1266473 (= e!721336 (contains!7612 lt!573971 (tuple2!21271 key1!31 v1!26)))))

(declare-fun b!1266474 () Bool)

(declare-fun e!721338 () List!28411)

(assert (=> b!1266474 (= e!721338 e!721337)))

(assert (=> b!1266474 (= c!123464 (and ((_ is Cons!28407) l!706) (= (_1!10646 (h!29616 l!706)) key1!31)))))

(declare-fun d!139095 () Bool)

(assert (=> d!139095 e!721336))

(declare-fun res!843143 () Bool)

(assert (=> d!139095 (=> (not res!843143) (not e!721336))))

(assert (=> d!139095 (= res!843143 (isStrictlySorted!798 lt!573971))))

(assert (=> d!139095 (= lt!573971 e!721338)))

(declare-fun c!123463 () Bool)

(assert (=> d!139095 (= c!123463 (and ((_ is Cons!28407) l!706) (bvslt (_1!10646 (h!29616 l!706)) key1!31)))))

(assert (=> d!139095 (isStrictlySorted!798 l!706)))

(assert (=> d!139095 (= (insertStrictlySorted!469 l!706 key1!31 v1!26) lt!573971)))

(declare-fun call!62468 () List!28411)

(declare-fun bm!62464 () Bool)

(assert (=> bm!62464 (= call!62468 ($colon$colon!646 e!721339 (ite c!123463 (h!29616 l!706) (tuple2!21271 key1!31 v1!26))))))

(declare-fun c!123461 () Bool)

(assert (=> bm!62464 (= c!123461 c!123463)))

(declare-fun b!1266475 () Bool)

(declare-fun e!721335 () List!28411)

(assert (=> b!1266475 (= e!721335 call!62467)))

(declare-fun b!1266476 () Bool)

(assert (=> b!1266476 (= e!721335 call!62467)))

(declare-fun b!1266477 () Bool)

(assert (=> b!1266477 (= e!721338 call!62468)))

(declare-fun b!1266478 () Bool)

(assert (=> b!1266478 (= c!123462 (and ((_ is Cons!28407) l!706) (bvsgt (_1!10646 (h!29616 l!706)) key1!31)))))

(assert (=> b!1266478 (= e!721337 e!721335)))

(declare-fun bm!62466 () Bool)

(assert (=> bm!62466 (= call!62469 call!62468)))

(assert (= (and d!139095 c!123463) b!1266477))

(assert (= (and d!139095 (not c!123463)) b!1266474))

(assert (= (and b!1266474 c!123464) b!1266469))

(assert (= (and b!1266474 (not c!123464)) b!1266478))

(assert (= (and b!1266478 c!123462) b!1266475))

(assert (= (and b!1266478 (not c!123462)) b!1266476))

(assert (= (or b!1266475 b!1266476) bm!62465))

(assert (= (or b!1266469 bm!62465) bm!62466))

(assert (= (or b!1266477 bm!62466) bm!62464))

(assert (= (and bm!62464 c!123461) b!1266471))

(assert (= (and bm!62464 (not c!123461)) b!1266470))

(assert (= (and d!139095 res!843143) b!1266472))

(assert (= (and b!1266472 res!843142) b!1266473))

(declare-fun m!1165711 () Bool)

(assert (=> b!1266473 m!1165711))

(declare-fun m!1165713 () Bool)

(assert (=> d!139095 m!1165713))

(assert (=> d!139095 m!1165661))

(declare-fun m!1165715 () Bool)

(assert (=> b!1266471 m!1165715))

(declare-fun m!1165717 () Bool)

(assert (=> b!1266472 m!1165717))

(declare-fun m!1165719 () Bool)

(assert (=> bm!62464 m!1165719))

(assert (=> b!1266332 d!139095))

(declare-fun d!139101 () Bool)

(declare-fun res!843156 () Bool)

(declare-fun e!721358 () Bool)

(assert (=> d!139101 (=> res!843156 e!721358)))

(assert (=> d!139101 (= res!843156 (and ((_ is Cons!28407) l!706) (= (_1!10646 (h!29616 l!706)) key1!31)))))

(assert (=> d!139101 (= (containsKey!659 l!706 key1!31) e!721358)))

(declare-fun b!1266507 () Bool)

(declare-fun e!721359 () Bool)

(assert (=> b!1266507 (= e!721358 e!721359)))

(declare-fun res!843157 () Bool)

(assert (=> b!1266507 (=> (not res!843157) (not e!721359))))

(assert (=> b!1266507 (= res!843157 (and (or (not ((_ is Cons!28407) l!706)) (bvsle (_1!10646 (h!29616 l!706)) key1!31)) ((_ is Cons!28407) l!706) (bvslt (_1!10646 (h!29616 l!706)) key1!31)))))

(declare-fun b!1266508 () Bool)

(assert (=> b!1266508 (= e!721359 (containsKey!659 (t!41926 l!706) key1!31))))

(assert (= (and d!139101 (not res!843156)) b!1266507))

(assert (= (and b!1266507 res!843157) b!1266508))

(declare-fun m!1165741 () Bool)

(assert (=> b!1266508 m!1165741))

(assert (=> b!1266330 d!139101))

(declare-fun d!139107 () Bool)

(declare-fun res!843172 () Bool)

(declare-fun e!721374 () Bool)

(assert (=> d!139107 (=> res!843172 e!721374)))

(assert (=> d!139107 (= res!843172 (or ((_ is Nil!28408) l!706) ((_ is Nil!28408) (t!41926 l!706))))))

(assert (=> d!139107 (= (isStrictlySorted!798 l!706) e!721374)))

(declare-fun b!1266523 () Bool)

(declare-fun e!721375 () Bool)

(assert (=> b!1266523 (= e!721374 e!721375)))

(declare-fun res!843173 () Bool)

(assert (=> b!1266523 (=> (not res!843173) (not e!721375))))

(assert (=> b!1266523 (= res!843173 (bvslt (_1!10646 (h!29616 l!706)) (_1!10646 (h!29616 (t!41926 l!706)))))))

(declare-fun b!1266524 () Bool)

(assert (=> b!1266524 (= e!721375 (isStrictlySorted!798 (t!41926 l!706)))))

(assert (= (and d!139107 (not res!843172)) b!1266523))

(assert (= (and b!1266523 res!843173) b!1266524))

(declare-fun m!1165745 () Bool)

(assert (=> b!1266524 m!1165745))

(assert (=> start!106554 d!139107))

(declare-fun b!1266537 () Bool)

(declare-fun e!721384 () Bool)

(declare-fun tp!96442 () Bool)

(assert (=> b!1266537 (= e!721384 (and tp_is_empty!32533 tp!96442))))

(assert (=> b!1266333 (= tp!96431 e!721384)))

(assert (= (and b!1266333 ((_ is Cons!28407) (t!41926 l!706))) b!1266537))

(check-sat (not b!1266386) (not b!1266471) (not b!1266508) (not d!139095) (not b!1266388) (not bm!62464) (not b!1266537) (not d!139087) (not b!1266524) (not b!1266473) (not b!1266472) tp_is_empty!32533)
(check-sat)
(get-model)

(declare-fun d!139111 () Bool)

(assert (=> d!139111 (= ($colon$colon!646 (removeStrictlySorted!158 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31) (h!29616 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (Cons!28407 (h!29616 (insertStrictlySorted!469 l!706 key1!31 v1!26)) (removeStrictlySorted!158 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31)))))

(assert (=> b!1266388 d!139111))

(declare-fun b!1266544 () Bool)

(declare-fun e!721389 () List!28411)

(assert (=> b!1266544 (= e!721389 Nil!28408)))

(declare-fun b!1266545 () Bool)

(declare-fun e!721390 () List!28411)

(assert (=> b!1266545 (= e!721390 e!721389)))

(declare-fun c!123474 () Bool)

(assert (=> b!1266545 (= c!123474 (and ((_ is Cons!28407) (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (not (= (_1!10646 (h!29616 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)))) key1!31))))))

(declare-fun b!1266546 () Bool)

(declare-fun e!721391 () Bool)

(declare-fun lt!573974 () List!28411)

(assert (=> b!1266546 (= e!721391 (not (containsKey!659 lt!573974 key1!31)))))

(declare-fun d!139113 () Bool)

(assert (=> d!139113 e!721391))

(declare-fun res!843178 () Bool)

(assert (=> d!139113 (=> (not res!843178) (not e!721391))))

(assert (=> d!139113 (= res!843178 (isStrictlySorted!798 lt!573974))))

(assert (=> d!139113 (= lt!573974 e!721390)))

(declare-fun c!123473 () Bool)

(assert (=> d!139113 (= c!123473 (and ((_ is Cons!28407) (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (= (_1!10646 (h!29616 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)))) key1!31)))))

(assert (=> d!139113 (isStrictlySorted!798 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))

(assert (=> d!139113 (= (removeStrictlySorted!158 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)) key1!31) lt!573974)))

(declare-fun b!1266547 () Bool)

(assert (=> b!1266547 (= e!721390 (t!41926 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))

(declare-fun b!1266548 () Bool)

(assert (=> b!1266548 (= e!721389 ($colon$colon!646 (removeStrictlySorted!158 (t!41926 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26))) key1!31) (h!29616 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))))

(assert (= (and d!139113 c!123473) b!1266547))

(assert (= (and d!139113 (not c!123473)) b!1266545))

(assert (= (and b!1266545 c!123474) b!1266548))

(assert (= (and b!1266545 (not c!123474)) b!1266544))

(assert (= (and d!139113 res!843178) b!1266546))

(declare-fun m!1165751 () Bool)

(assert (=> b!1266546 m!1165751))

(declare-fun m!1165753 () Bool)

(assert (=> d!139113 m!1165753))

(declare-fun m!1165755 () Bool)

(assert (=> d!139113 m!1165755))

(declare-fun m!1165757 () Bool)

(assert (=> b!1266548 m!1165757))

(assert (=> b!1266548 m!1165757))

(declare-fun m!1165759 () Bool)

(assert (=> b!1266548 m!1165759))

(assert (=> b!1266388 d!139113))

(declare-fun lt!573977 () Bool)

(declare-fun d!139115 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!635 (List!28411) (InoxSet tuple2!21270))

(assert (=> d!139115 (= lt!573977 (select (content!635 lt!573971) (tuple2!21271 key1!31 v1!26)))))

(declare-fun e!721396 () Bool)

(assert (=> d!139115 (= lt!573977 e!721396)))

(declare-fun res!843184 () Bool)

(assert (=> d!139115 (=> (not res!843184) (not e!721396))))

(assert (=> d!139115 (= res!843184 ((_ is Cons!28407) lt!573971))))

(assert (=> d!139115 (= (contains!7612 lt!573971 (tuple2!21271 key1!31 v1!26)) lt!573977)))

(declare-fun b!1266553 () Bool)

(declare-fun e!721397 () Bool)

(assert (=> b!1266553 (= e!721396 e!721397)))

(declare-fun res!843183 () Bool)

(assert (=> b!1266553 (=> res!843183 e!721397)))

(assert (=> b!1266553 (= res!843183 (= (h!29616 lt!573971) (tuple2!21271 key1!31 v1!26)))))

(declare-fun b!1266554 () Bool)

(assert (=> b!1266554 (= e!721397 (contains!7612 (t!41926 lt!573971) (tuple2!21271 key1!31 v1!26)))))

(assert (= (and d!139115 res!843184) b!1266553))

(assert (= (and b!1266553 (not res!843183)) b!1266554))

(declare-fun m!1165761 () Bool)

(assert (=> d!139115 m!1165761))

(declare-fun m!1165763 () Bool)

(assert (=> d!139115 m!1165763))

(declare-fun m!1165765 () Bool)

(assert (=> b!1266554 m!1165765))

(assert (=> b!1266473 d!139115))

(declare-fun d!139117 () Bool)

(assert (=> d!139117 (= ($colon$colon!646 e!721339 (ite c!123463 (h!29616 l!706) (tuple2!21271 key1!31 v1!26))) (Cons!28407 (ite c!123463 (h!29616 l!706) (tuple2!21271 key1!31 v1!26)) e!721339))))

(assert (=> bm!62464 d!139117))

(declare-fun d!139119 () Bool)

(declare-fun res!843185 () Bool)

(declare-fun e!721398 () Bool)

(assert (=> d!139119 (=> res!843185 e!721398)))

(assert (=> d!139119 (= res!843185 (or ((_ is Nil!28408) (t!41926 l!706)) ((_ is Nil!28408) (t!41926 (t!41926 l!706)))))))

(assert (=> d!139119 (= (isStrictlySorted!798 (t!41926 l!706)) e!721398)))

(declare-fun b!1266555 () Bool)

(declare-fun e!721399 () Bool)

(assert (=> b!1266555 (= e!721398 e!721399)))

(declare-fun res!843186 () Bool)

(assert (=> b!1266555 (=> (not res!843186) (not e!721399))))

(assert (=> b!1266555 (= res!843186 (bvslt (_1!10646 (h!29616 (t!41926 l!706))) (_1!10646 (h!29616 (t!41926 (t!41926 l!706))))))))

(declare-fun b!1266556 () Bool)

(assert (=> b!1266556 (= e!721399 (isStrictlySorted!798 (t!41926 (t!41926 l!706))))))

(assert (= (and d!139119 (not res!843185)) b!1266555))

(assert (= (and b!1266555 res!843186) b!1266556))

(declare-fun m!1165767 () Bool)

(assert (=> b!1266556 m!1165767))

(assert (=> b!1266524 d!139119))

(declare-fun d!139121 () Bool)

(declare-fun res!843187 () Bool)

(declare-fun e!721400 () Bool)

(assert (=> d!139121 (=> res!843187 e!721400)))

(assert (=> d!139121 (= res!843187 (or ((_ is Nil!28408) lt!573960) ((_ is Nil!28408) (t!41926 lt!573960))))))

(assert (=> d!139121 (= (isStrictlySorted!798 lt!573960) e!721400)))

(declare-fun b!1266557 () Bool)

(declare-fun e!721401 () Bool)

(assert (=> b!1266557 (= e!721400 e!721401)))

(declare-fun res!843188 () Bool)

(assert (=> b!1266557 (=> (not res!843188) (not e!721401))))

(assert (=> b!1266557 (= res!843188 (bvslt (_1!10646 (h!29616 lt!573960)) (_1!10646 (h!29616 (t!41926 lt!573960)))))))

(declare-fun b!1266558 () Bool)

(assert (=> b!1266558 (= e!721401 (isStrictlySorted!798 (t!41926 lt!573960)))))

(assert (= (and d!139121 (not res!843187)) b!1266557))

(assert (= (and b!1266557 res!843188) b!1266558))

(declare-fun m!1165769 () Bool)

(assert (=> b!1266558 m!1165769))

(assert (=> d!139087 d!139121))

(declare-fun d!139123 () Bool)

(declare-fun res!843189 () Bool)

(declare-fun e!721402 () Bool)

(assert (=> d!139123 (=> res!843189 e!721402)))

(assert (=> d!139123 (= res!843189 (or ((_ is Nil!28408) (insertStrictlySorted!469 l!706 key1!31 v1!26)) ((_ is Nil!28408) (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26)))))))

(assert (=> d!139123 (= (isStrictlySorted!798 (insertStrictlySorted!469 l!706 key1!31 v1!26)) e!721402)))

(declare-fun b!1266559 () Bool)

(declare-fun e!721403 () Bool)

(assert (=> b!1266559 (= e!721402 e!721403)))

(declare-fun res!843190 () Bool)

(assert (=> b!1266559 (=> (not res!843190) (not e!721403))))

(assert (=> b!1266559 (= res!843190 (bvslt (_1!10646 (h!29616 (insertStrictlySorted!469 l!706 key1!31 v1!26))) (_1!10646 (h!29616 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))))

(declare-fun b!1266560 () Bool)

(assert (=> b!1266560 (= e!721403 (isStrictlySorted!798 (t!41926 (insertStrictlySorted!469 l!706 key1!31 v1!26))))))

(assert (= (and d!139123 (not res!843189)) b!1266559))

(assert (= (and b!1266559 res!843190) b!1266560))

(assert (=> b!1266560 m!1165755))

(assert (=> d!139087 d!139123))

(declare-fun d!139125 () Bool)

(declare-fun res!843191 () Bool)

(declare-fun e!721404 () Bool)

(assert (=> d!139125 (=> res!843191 e!721404)))

(assert (=> d!139125 (= res!843191 (and ((_ is Cons!28407) lt!573960) (= (_1!10646 (h!29616 lt!573960)) key1!31)))))

(assert (=> d!139125 (= (containsKey!659 lt!573960 key1!31) e!721404)))

(declare-fun b!1266561 () Bool)

(declare-fun e!721405 () Bool)

(assert (=> b!1266561 (= e!721404 e!721405)))

(declare-fun res!843192 () Bool)

(assert (=> b!1266561 (=> (not res!843192) (not e!721405))))

(assert (=> b!1266561 (= res!843192 (and (or (not ((_ is Cons!28407) lt!573960)) (bvsle (_1!10646 (h!29616 lt!573960)) key1!31)) ((_ is Cons!28407) lt!573960) (bvslt (_1!10646 (h!29616 lt!573960)) key1!31)))))

(declare-fun b!1266562 () Bool)

(assert (=> b!1266562 (= e!721405 (containsKey!659 (t!41926 lt!573960) key1!31))))

(assert (= (and d!139125 (not res!843191)) b!1266561))

(assert (= (and b!1266561 res!843192) b!1266562))

(declare-fun m!1165771 () Bool)

(assert (=> b!1266562 m!1165771))

(assert (=> b!1266386 d!139125))

(declare-fun d!139127 () Bool)

(declare-fun res!843193 () Bool)

(declare-fun e!721406 () Bool)

(assert (=> d!139127 (=> res!843193 e!721406)))

(assert (=> d!139127 (= res!843193 (or ((_ is Nil!28408) lt!573971) ((_ is Nil!28408) (t!41926 lt!573971))))))

(assert (=> d!139127 (= (isStrictlySorted!798 lt!573971) e!721406)))

(declare-fun b!1266563 () Bool)

(declare-fun e!721407 () Bool)

(assert (=> b!1266563 (= e!721406 e!721407)))

(declare-fun res!843194 () Bool)

(assert (=> b!1266563 (=> (not res!843194) (not e!721407))))

(assert (=> b!1266563 (= res!843194 (bvslt (_1!10646 (h!29616 lt!573971)) (_1!10646 (h!29616 (t!41926 lt!573971)))))))

(declare-fun b!1266564 () Bool)

(assert (=> b!1266564 (= e!721407 (isStrictlySorted!798 (t!41926 lt!573971)))))

(assert (= (and d!139127 (not res!843193)) b!1266563))

(assert (= (and b!1266563 res!843194) b!1266564))

(declare-fun m!1165773 () Bool)

(assert (=> b!1266564 m!1165773))

(assert (=> d!139095 d!139127))

(assert (=> d!139095 d!139107))

(declare-fun d!139129 () Bool)

(declare-fun res!843195 () Bool)

(declare-fun e!721408 () Bool)

(assert (=> d!139129 (=> res!843195 e!721408)))

(assert (=> d!139129 (= res!843195 (and ((_ is Cons!28407) lt!573971) (= (_1!10646 (h!29616 lt!573971)) key1!31)))))

(assert (=> d!139129 (= (containsKey!659 lt!573971 key1!31) e!721408)))

(declare-fun b!1266565 () Bool)

(declare-fun e!721409 () Bool)

(assert (=> b!1266565 (= e!721408 e!721409)))

(declare-fun res!843196 () Bool)

(assert (=> b!1266565 (=> (not res!843196) (not e!721409))))

(assert (=> b!1266565 (= res!843196 (and (or (not ((_ is Cons!28407) lt!573971)) (bvsle (_1!10646 (h!29616 lt!573971)) key1!31)) ((_ is Cons!28407) lt!573971) (bvslt (_1!10646 (h!29616 lt!573971)) key1!31)))))

(declare-fun b!1266566 () Bool)

(assert (=> b!1266566 (= e!721409 (containsKey!659 (t!41926 lt!573971) key1!31))))

(assert (= (and d!139129 (not res!843195)) b!1266565))

(assert (= (and b!1266565 res!843196) b!1266566))

(declare-fun m!1165775 () Bool)

(assert (=> b!1266566 m!1165775))

(assert (=> b!1266472 d!139129))

(declare-fun d!139131 () Bool)

(declare-fun res!843197 () Bool)

(declare-fun e!721410 () Bool)

(assert (=> d!139131 (=> res!843197 e!721410)))

(assert (=> d!139131 (= res!843197 (and ((_ is Cons!28407) (t!41926 l!706)) (= (_1!10646 (h!29616 (t!41926 l!706))) key1!31)))))

(assert (=> d!139131 (= (containsKey!659 (t!41926 l!706) key1!31) e!721410)))

(declare-fun b!1266567 () Bool)

(declare-fun e!721411 () Bool)

(assert (=> b!1266567 (= e!721410 e!721411)))

(declare-fun res!843198 () Bool)

(assert (=> b!1266567 (=> (not res!843198) (not e!721411))))

(assert (=> b!1266567 (= res!843198 (and (or (not ((_ is Cons!28407) (t!41926 l!706))) (bvsle (_1!10646 (h!29616 (t!41926 l!706))) key1!31)) ((_ is Cons!28407) (t!41926 l!706)) (bvslt (_1!10646 (h!29616 (t!41926 l!706))) key1!31)))))

(declare-fun b!1266568 () Bool)

(assert (=> b!1266568 (= e!721411 (containsKey!659 (t!41926 (t!41926 l!706)) key1!31))))

(assert (= (and d!139131 (not res!843197)) b!1266567))

(assert (= (and b!1266567 res!843198) b!1266568))

(declare-fun m!1165777 () Bool)

(assert (=> b!1266568 m!1165777))

(assert (=> b!1266508 d!139131))

(declare-fun b!1266569 () Bool)

(declare-fun e!721414 () List!28411)

(declare-fun call!62478 () List!28411)

(assert (=> b!1266569 (= e!721414 call!62478)))

(declare-fun c!123476 () Bool)

(declare-fun b!1266570 () Bool)

(declare-fun c!123478 () Bool)

(declare-fun e!721416 () List!28411)

(assert (=> b!1266570 (= e!721416 (ite c!123478 (t!41926 (t!41926 l!706)) (ite c!123476 (Cons!28407 (h!29616 (t!41926 l!706)) (t!41926 (t!41926 l!706))) Nil!28408)))))

(declare-fun b!1266571 () Bool)

(assert (=> b!1266571 (= e!721416 (insertStrictlySorted!469 (t!41926 (t!41926 l!706)) key1!31 v1!26))))

(declare-fun b!1266572 () Bool)

(declare-fun res!843199 () Bool)

(declare-fun e!721413 () Bool)

(assert (=> b!1266572 (=> (not res!843199) (not e!721413))))

(declare-fun lt!573978 () List!28411)

(assert (=> b!1266572 (= res!843199 (containsKey!659 lt!573978 key1!31))))

(declare-fun bm!62474 () Bool)

(declare-fun call!62476 () List!28411)

(assert (=> bm!62474 (= call!62476 call!62478)))

(declare-fun b!1266573 () Bool)

(assert (=> b!1266573 (= e!721413 (contains!7612 lt!573978 (tuple2!21271 key1!31 v1!26)))))

(declare-fun b!1266574 () Bool)

(declare-fun e!721415 () List!28411)

(assert (=> b!1266574 (= e!721415 e!721414)))

(assert (=> b!1266574 (= c!123478 (and ((_ is Cons!28407) (t!41926 l!706)) (= (_1!10646 (h!29616 (t!41926 l!706))) key1!31)))))

(declare-fun d!139133 () Bool)

(assert (=> d!139133 e!721413))

(declare-fun res!843200 () Bool)

(assert (=> d!139133 (=> (not res!843200) (not e!721413))))

(assert (=> d!139133 (= res!843200 (isStrictlySorted!798 lt!573978))))

(assert (=> d!139133 (= lt!573978 e!721415)))

(declare-fun c!123477 () Bool)

(assert (=> d!139133 (= c!123477 (and ((_ is Cons!28407) (t!41926 l!706)) (bvslt (_1!10646 (h!29616 (t!41926 l!706))) key1!31)))))

(assert (=> d!139133 (isStrictlySorted!798 (t!41926 l!706))))

(assert (=> d!139133 (= (insertStrictlySorted!469 (t!41926 l!706) key1!31 v1!26) lt!573978)))

(declare-fun bm!62473 () Bool)

(declare-fun call!62477 () List!28411)

(assert (=> bm!62473 (= call!62477 ($colon$colon!646 e!721416 (ite c!123477 (h!29616 (t!41926 l!706)) (tuple2!21271 key1!31 v1!26))))))

(declare-fun c!123475 () Bool)

(assert (=> bm!62473 (= c!123475 c!123477)))

(declare-fun b!1266575 () Bool)

(declare-fun e!721412 () List!28411)

(assert (=> b!1266575 (= e!721412 call!62476)))

(declare-fun b!1266576 () Bool)

(assert (=> b!1266576 (= e!721412 call!62476)))

(declare-fun b!1266577 () Bool)

(assert (=> b!1266577 (= e!721415 call!62477)))

(declare-fun b!1266578 () Bool)

(assert (=> b!1266578 (= c!123476 (and ((_ is Cons!28407) (t!41926 l!706)) (bvsgt (_1!10646 (h!29616 (t!41926 l!706))) key1!31)))))

(assert (=> b!1266578 (= e!721414 e!721412)))

(declare-fun bm!62475 () Bool)

(assert (=> bm!62475 (= call!62478 call!62477)))

(assert (= (and d!139133 c!123477) b!1266577))

(assert (= (and d!139133 (not c!123477)) b!1266574))

(assert (= (and b!1266574 c!123478) b!1266569))

(assert (= (and b!1266574 (not c!123478)) b!1266578))

(assert (= (and b!1266578 c!123476) b!1266575))

(assert (= (and b!1266578 (not c!123476)) b!1266576))

(assert (= (or b!1266575 b!1266576) bm!62474))

(assert (= (or b!1266569 bm!62474) bm!62475))

(assert (= (or b!1266577 bm!62475) bm!62473))

(assert (= (and bm!62473 c!123475) b!1266571))

(assert (= (and bm!62473 (not c!123475)) b!1266570))

(assert (= (and d!139133 res!843200) b!1266572))

(assert (= (and b!1266572 res!843199) b!1266573))

(declare-fun m!1165779 () Bool)

(assert (=> b!1266573 m!1165779))

(declare-fun m!1165781 () Bool)

(assert (=> d!139133 m!1165781))

(assert (=> d!139133 m!1165745))

(declare-fun m!1165783 () Bool)

(assert (=> b!1266571 m!1165783))

(declare-fun m!1165785 () Bool)

(assert (=> b!1266572 m!1165785))

(declare-fun m!1165787 () Bool)

(assert (=> bm!62473 m!1165787))

(assert (=> b!1266471 d!139133))

(declare-fun b!1266579 () Bool)

(declare-fun e!721417 () Bool)

(declare-fun tp!96447 () Bool)

(assert (=> b!1266579 (= e!721417 (and tp_is_empty!32533 tp!96447))))

(assert (=> b!1266537 (= tp!96442 e!721417)))

(assert (= (and b!1266537 ((_ is Cons!28407) (t!41926 (t!41926 l!706)))) b!1266579))

(check-sat (not b!1266572) (not b!1266556) (not b!1266554) (not b!1266548) (not b!1266558) (not b!1266546) (not b!1266571) (not d!139115) tp_is_empty!32533 (not b!1266566) (not d!139133) (not b!1266564) (not bm!62473) (not b!1266562) (not b!1266568) (not d!139113) (not b!1266579) (not b!1266560) (not b!1266573))
(check-sat)
