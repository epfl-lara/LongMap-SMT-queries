; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88960 () Bool)

(assert start!88960)

(declare-fun b!1020454 () Bool)

(declare-fun res!683785 () Bool)

(declare-fun e!574361 () Bool)

(assert (=> b!1020454 (=> (not res!683785) (not e!574361))))

(declare-datatypes ((B!1682 0))(
  ( (B!1683 (val!11925 Int)) )
))
(declare-datatypes ((tuple2!15400 0))(
  ( (tuple2!15401 (_1!7711 (_ BitVec 64)) (_2!7711 B!1682)) )
))
(declare-datatypes ((List!21602 0))(
  ( (Nil!21599) (Cons!21598 (h!22805 tuple2!15400) (t!30598 List!21602)) )
))
(declare-fun l!996 () List!21602)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!540 (List!21602 (_ BitVec 64)) Bool)

(assert (=> b!1020454 (= res!683785 (containsKey!540 l!996 key!261))))

(declare-fun b!1020456 () Bool)

(declare-fun e!574360 () Bool)

(assert (=> b!1020456 (= e!574361 e!574360)))

(declare-fun res!683782 () Bool)

(assert (=> b!1020456 (=> (not res!683782) (not e!574360))))

(get-info :version)

(assert (=> b!1020456 (= res!683782 (and ((_ is Cons!21598) l!996) (bvslt (_1!7711 (h!22805 l!996)) key!261)))))

(declare-fun value!172 () B!1682)

(declare-fun lt!450143 () List!21602)

(declare-fun insertStrictlySorted!357 (List!21602 (_ BitVec 64) B!1682) List!21602)

(assert (=> b!1020456 (= lt!450143 (insertStrictlySorted!357 l!996 key!261 value!172))))

(declare-fun b!1020457 () Bool)

(declare-fun e!574362 () Bool)

(declare-fun tp_is_empty!23749 () Bool)

(declare-fun tp!71131 () Bool)

(assert (=> b!1020457 (= e!574362 (and tp_is_empty!23749 tp!71131))))

(declare-fun b!1020458 () Bool)

(declare-fun ListPrimitiveSize!136 (List!21602) Int)

(assert (=> b!1020458 (= e!574360 (>= (ListPrimitiveSize!136 (t!30598 l!996)) (ListPrimitiveSize!136 l!996)))))

(declare-fun b!1020459 () Bool)

(declare-fun res!683784 () Bool)

(assert (=> b!1020459 (=> (not res!683784) (not e!574360))))

(declare-fun isStrictlySorted!666 (List!21602) Bool)

(assert (=> b!1020459 (= res!683784 (isStrictlySorted!666 (t!30598 l!996)))))

(declare-fun res!683786 () Bool)

(assert (=> start!88960 (=> (not res!683786) (not e!574361))))

(assert (=> start!88960 (= res!683786 (isStrictlySorted!666 l!996))))

(assert (=> start!88960 e!574361))

(assert (=> start!88960 e!574362))

(assert (=> start!88960 true))

(assert (=> start!88960 tp_is_empty!23749))

(declare-fun b!1020455 () Bool)

(declare-fun res!683783 () Bool)

(assert (=> b!1020455 (=> (not res!683783) (not e!574360))))

(assert (=> b!1020455 (= res!683783 (containsKey!540 (t!30598 l!996) key!261))))

(assert (= (and start!88960 res!683786) b!1020454))

(assert (= (and b!1020454 res!683785) b!1020456))

(assert (= (and b!1020456 res!683782) b!1020459))

(assert (= (and b!1020459 res!683784) b!1020455))

(assert (= (and b!1020455 res!683783) b!1020458))

(assert (= (and start!88960 ((_ is Cons!21598) l!996)) b!1020457))

(declare-fun m!941271 () Bool)

(assert (=> b!1020454 m!941271))

(declare-fun m!941273 () Bool)

(assert (=> b!1020458 m!941273))

(declare-fun m!941275 () Bool)

(assert (=> b!1020458 m!941275))

(declare-fun m!941277 () Bool)

(assert (=> b!1020459 m!941277))

(declare-fun m!941279 () Bool)

(assert (=> b!1020456 m!941279))

(declare-fun m!941281 () Bool)

(assert (=> b!1020455 m!941281))

(declare-fun m!941283 () Bool)

(assert (=> start!88960 m!941283))

(check-sat (not b!1020454) (not start!88960) (not b!1020457) (not b!1020455) (not b!1020456) (not b!1020458) (not b!1020459) tp_is_empty!23749)
(check-sat)
(get-model)

(declare-fun d!122459 () Bool)

(declare-fun res!683825 () Bool)

(declare-fun e!574389 () Bool)

(assert (=> d!122459 (=> res!683825 e!574389)))

(assert (=> d!122459 (= res!683825 (and ((_ is Cons!21598) l!996) (= (_1!7711 (h!22805 l!996)) key!261)))))

(assert (=> d!122459 (= (containsKey!540 l!996 key!261) e!574389)))

(declare-fun b!1020504 () Bool)

(declare-fun e!574390 () Bool)

(assert (=> b!1020504 (= e!574389 e!574390)))

(declare-fun res!683826 () Bool)

(assert (=> b!1020504 (=> (not res!683826) (not e!574390))))

(assert (=> b!1020504 (= res!683826 (and (or (not ((_ is Cons!21598) l!996)) (bvsle (_1!7711 (h!22805 l!996)) key!261)) ((_ is Cons!21598) l!996) (bvslt (_1!7711 (h!22805 l!996)) key!261)))))

(declare-fun b!1020505 () Bool)

(assert (=> b!1020505 (= e!574390 (containsKey!540 (t!30598 l!996) key!261))))

(assert (= (and d!122459 (not res!683825)) b!1020504))

(assert (= (and b!1020504 res!683826) b!1020505))

(assert (=> b!1020505 m!941281))

(assert (=> b!1020454 d!122459))

(declare-fun d!122463 () Bool)

(declare-fun res!683827 () Bool)

(declare-fun e!574391 () Bool)

(assert (=> d!122463 (=> res!683827 e!574391)))

(assert (=> d!122463 (= res!683827 (and ((_ is Cons!21598) (t!30598 l!996)) (= (_1!7711 (h!22805 (t!30598 l!996))) key!261)))))

(assert (=> d!122463 (= (containsKey!540 (t!30598 l!996) key!261) e!574391)))

(declare-fun b!1020506 () Bool)

(declare-fun e!574392 () Bool)

(assert (=> b!1020506 (= e!574391 e!574392)))

(declare-fun res!683828 () Bool)

(assert (=> b!1020506 (=> (not res!683828) (not e!574392))))

(assert (=> b!1020506 (= res!683828 (and (or (not ((_ is Cons!21598) (t!30598 l!996))) (bvsle (_1!7711 (h!22805 (t!30598 l!996))) key!261)) ((_ is Cons!21598) (t!30598 l!996)) (bvslt (_1!7711 (h!22805 (t!30598 l!996))) key!261)))))

(declare-fun b!1020507 () Bool)

(assert (=> b!1020507 (= e!574392 (containsKey!540 (t!30598 (t!30598 l!996)) key!261))))

(assert (= (and d!122463 (not res!683827)) b!1020506))

(assert (= (and b!1020506 res!683828) b!1020507))

(declare-fun m!941313 () Bool)

(assert (=> b!1020507 m!941313))

(assert (=> b!1020455 d!122463))

(declare-fun d!122465 () Bool)

(declare-fun lt!450152 () Int)

(assert (=> d!122465 (>= lt!450152 0)))

(declare-fun e!574401 () Int)

(assert (=> d!122465 (= lt!450152 e!574401)))

(declare-fun c!103686 () Bool)

(assert (=> d!122465 (= c!103686 ((_ is Nil!21599) (t!30598 l!996)))))

(assert (=> d!122465 (= (ListPrimitiveSize!136 (t!30598 l!996)) lt!450152)))

(declare-fun b!1020518 () Bool)

(assert (=> b!1020518 (= e!574401 0)))

(declare-fun b!1020519 () Bool)

(assert (=> b!1020519 (= e!574401 (+ 1 (ListPrimitiveSize!136 (t!30598 (t!30598 l!996)))))))

(assert (= (and d!122465 c!103686) b!1020518))

(assert (= (and d!122465 (not c!103686)) b!1020519))

(declare-fun m!941317 () Bool)

(assert (=> b!1020519 m!941317))

(assert (=> b!1020458 d!122465))

(declare-fun d!122469 () Bool)

(declare-fun lt!450153 () Int)

(assert (=> d!122469 (>= lt!450153 0)))

(declare-fun e!574402 () Int)

(assert (=> d!122469 (= lt!450153 e!574402)))

(declare-fun c!103687 () Bool)

(assert (=> d!122469 (= c!103687 ((_ is Nil!21599) l!996))))

(assert (=> d!122469 (= (ListPrimitiveSize!136 l!996) lt!450153)))

(declare-fun b!1020520 () Bool)

(assert (=> b!1020520 (= e!574402 0)))

(declare-fun b!1020521 () Bool)

(assert (=> b!1020521 (= e!574402 (+ 1 (ListPrimitiveSize!136 (t!30598 l!996))))))

(assert (= (and d!122469 c!103687) b!1020520))

(assert (= (and d!122469 (not c!103687)) b!1020521))

(assert (=> b!1020521 m!941273))

(assert (=> b!1020458 d!122469))

(declare-fun d!122473 () Bool)

(declare-fun res!683847 () Bool)

(declare-fun e!574415 () Bool)

(assert (=> d!122473 (=> res!683847 e!574415)))

(assert (=> d!122473 (= res!683847 (or ((_ is Nil!21599) (t!30598 l!996)) ((_ is Nil!21599) (t!30598 (t!30598 l!996)))))))

(assert (=> d!122473 (= (isStrictlySorted!666 (t!30598 l!996)) e!574415)))

(declare-fun b!1020534 () Bool)

(declare-fun e!574416 () Bool)

(assert (=> b!1020534 (= e!574415 e!574416)))

(declare-fun res!683848 () Bool)

(assert (=> b!1020534 (=> (not res!683848) (not e!574416))))

(assert (=> b!1020534 (= res!683848 (bvslt (_1!7711 (h!22805 (t!30598 l!996))) (_1!7711 (h!22805 (t!30598 (t!30598 l!996))))))))

(declare-fun b!1020535 () Bool)

(assert (=> b!1020535 (= e!574416 (isStrictlySorted!666 (t!30598 (t!30598 l!996))))))

(assert (= (and d!122473 (not res!683847)) b!1020534))

(assert (= (and b!1020534 res!683848) b!1020535))

(declare-fun m!941323 () Bool)

(assert (=> b!1020535 m!941323))

(assert (=> b!1020459 d!122473))

(declare-fun d!122479 () Bool)

(declare-fun res!683849 () Bool)

(declare-fun e!574417 () Bool)

(assert (=> d!122479 (=> res!683849 e!574417)))

(assert (=> d!122479 (= res!683849 (or ((_ is Nil!21599) l!996) ((_ is Nil!21599) (t!30598 l!996))))))

(assert (=> d!122479 (= (isStrictlySorted!666 l!996) e!574417)))

(declare-fun b!1020536 () Bool)

(declare-fun e!574418 () Bool)

(assert (=> b!1020536 (= e!574417 e!574418)))

(declare-fun res!683850 () Bool)

(assert (=> b!1020536 (=> (not res!683850) (not e!574418))))

(assert (=> b!1020536 (= res!683850 (bvslt (_1!7711 (h!22805 l!996)) (_1!7711 (h!22805 (t!30598 l!996)))))))

(declare-fun b!1020537 () Bool)

(assert (=> b!1020537 (= e!574418 (isStrictlySorted!666 (t!30598 l!996)))))

(assert (= (and d!122479 (not res!683849)) b!1020536))

(assert (= (and b!1020536 res!683850) b!1020537))

(assert (=> b!1020537 m!941277))

(assert (=> start!88960 d!122479))

(declare-fun bm!43133 () Bool)

(declare-fun call!43138 () List!21602)

(declare-fun call!43136 () List!21602)

(assert (=> bm!43133 (= call!43138 call!43136)))

(declare-fun b!1020620 () Bool)

(declare-fun e!574466 () List!21602)

(declare-fun call!43137 () List!21602)

(assert (=> b!1020620 (= e!574466 call!43137)))

(declare-fun b!1020622 () Bool)

(assert (=> b!1020622 (= e!574466 call!43137)))

(declare-fun b!1020623 () Bool)

(declare-fun c!103718 () Bool)

(assert (=> b!1020623 (= c!103718 (and ((_ is Cons!21598) l!996) (bvsgt (_1!7711 (h!22805 l!996)) key!261)))))

(declare-fun e!574464 () List!21602)

(assert (=> b!1020623 (= e!574464 e!574466)))

(declare-fun c!103716 () Bool)

(declare-fun bm!43134 () Bool)

(declare-fun e!574467 () List!21602)

(declare-fun $colon$colon!588 (List!21602 tuple2!15400) List!21602)

(assert (=> bm!43134 (= call!43136 ($colon$colon!588 e!574467 (ite c!103716 (h!22805 l!996) (tuple2!15401 key!261 value!172))))))

(declare-fun c!103717 () Bool)

(assert (=> bm!43134 (= c!103717 c!103716)))

(declare-fun b!1020624 () Bool)

(assert (=> b!1020624 (= e!574464 call!43138)))

(declare-fun c!103719 () Bool)

(declare-fun b!1020625 () Bool)

(assert (=> b!1020625 (= e!574467 (ite c!103719 (t!30598 l!996) (ite c!103718 (Cons!21598 (h!22805 l!996) (t!30598 l!996)) Nil!21599)))))

(declare-fun b!1020626 () Bool)

(assert (=> b!1020626 (= e!574467 (insertStrictlySorted!357 (t!30598 l!996) key!261 value!172))))

(declare-fun d!122481 () Bool)

(declare-fun e!574465 () Bool)

(assert (=> d!122481 e!574465))

(declare-fun res!683874 () Bool)

(assert (=> d!122481 (=> (not res!683874) (not e!574465))))

(declare-fun lt!450163 () List!21602)

(assert (=> d!122481 (= res!683874 (isStrictlySorted!666 lt!450163))))

(declare-fun e!574468 () List!21602)

(assert (=> d!122481 (= lt!450163 e!574468)))

(assert (=> d!122481 (= c!103716 (and ((_ is Cons!21598) l!996) (bvslt (_1!7711 (h!22805 l!996)) key!261)))))

(assert (=> d!122481 (isStrictlySorted!666 l!996)))

(assert (=> d!122481 (= (insertStrictlySorted!357 l!996 key!261 value!172) lt!450163)))

(declare-fun b!1020618 () Bool)

(declare-fun contains!5929 (List!21602 tuple2!15400) Bool)

(assert (=> b!1020618 (= e!574465 (contains!5929 lt!450163 (tuple2!15401 key!261 value!172)))))

(declare-fun b!1020627 () Bool)

(assert (=> b!1020627 (= e!574468 e!574464)))

(assert (=> b!1020627 (= c!103719 (and ((_ is Cons!21598) l!996) (= (_1!7711 (h!22805 l!996)) key!261)))))

(declare-fun b!1020628 () Bool)

(declare-fun res!683873 () Bool)

(assert (=> b!1020628 (=> (not res!683873) (not e!574465))))

(assert (=> b!1020628 (= res!683873 (containsKey!540 lt!450163 key!261))))

(declare-fun b!1020629 () Bool)

(assert (=> b!1020629 (= e!574468 call!43136)))

(declare-fun bm!43135 () Bool)

(assert (=> bm!43135 (= call!43137 call!43138)))

(assert (= (and d!122481 c!103716) b!1020629))

(assert (= (and d!122481 (not c!103716)) b!1020627))

(assert (= (and b!1020627 c!103719) b!1020624))

(assert (= (and b!1020627 (not c!103719)) b!1020623))

(assert (= (and b!1020623 c!103718) b!1020622))

(assert (= (and b!1020623 (not c!103718)) b!1020620))

(assert (= (or b!1020622 b!1020620) bm!43135))

(assert (= (or b!1020624 bm!43135) bm!43133))

(assert (= (or b!1020629 bm!43133) bm!43134))

(assert (= (and bm!43134 c!103717) b!1020626))

(assert (= (and bm!43134 (not c!103717)) b!1020625))

(assert (= (and d!122481 res!683874) b!1020628))

(assert (= (and b!1020628 res!683873) b!1020618))

(declare-fun m!941337 () Bool)

(assert (=> d!122481 m!941337))

(assert (=> d!122481 m!941283))

(declare-fun m!941339 () Bool)

(assert (=> b!1020626 m!941339))

(declare-fun m!941341 () Bool)

(assert (=> bm!43134 m!941341))

(declare-fun m!941343 () Bool)

(assert (=> b!1020618 m!941343))

(declare-fun m!941345 () Bool)

(assert (=> b!1020628 m!941345))

(assert (=> b!1020456 d!122481))

(declare-fun b!1020644 () Bool)

(declare-fun e!574479 () Bool)

(declare-fun tp!71140 () Bool)

(assert (=> b!1020644 (= e!574479 (and tp_is_empty!23749 tp!71140))))

(assert (=> b!1020457 (= tp!71131 e!574479)))

(assert (= (and b!1020457 ((_ is Cons!21598) (t!30598 l!996))) b!1020644))

(check-sat (not b!1020505) (not b!1020618) (not b!1020507) (not bm!43134) (not b!1020521) (not b!1020628) (not b!1020537) (not d!122481) (not b!1020519) (not b!1020644) tp_is_empty!23749 (not b!1020535) (not b!1020626))
(check-sat)
