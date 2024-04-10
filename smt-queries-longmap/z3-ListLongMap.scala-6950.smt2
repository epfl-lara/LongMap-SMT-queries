; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87542 () Bool)

(assert start!87542)

(declare-fun b!1013505 () Bool)

(assert (=> b!1013505 true))

(assert (=> b!1013505 true))

(declare-fun res!680425 () Bool)

(declare-fun e!570130 () Bool)

(assert (=> b!1013505 (=> res!680425 e!570130)))

(declare-datatypes ((List!21411 0))(
  ( (Nil!21408) (Cons!21407 (h!22605 (_ BitVec 64)) (t!30412 List!21411)) )
))
(declare-fun lt!448020 () List!21411)

(declare-fun lambda!512 () Int)

(declare-fun forall!231 (List!21411 Int) Bool)

(assert (=> b!1013505 (= res!680425 (not (forall!231 lt!448020 lambda!512)))))

(declare-fun b!1013506 () Bool)

(declare-fun e!570133 () Bool)

(declare-fun tp_is_empty!23475 () Bool)

(declare-fun tp!70448 () Bool)

(assert (=> b!1013506 (= e!570133 (and tp_is_empty!23475 tp!70448))))

(declare-fun b!1013507 () Bool)

(declare-fun res!680429 () Bool)

(assert (=> b!1013507 (=> res!680429 e!570130)))

(declare-datatypes ((B!1408 0))(
  ( (B!1409 (val!11788 Int)) )
))
(declare-datatypes ((tuple2!15122 0))(
  ( (tuple2!15123 (_1!7572 (_ BitVec 64)) (_2!7572 B!1408)) )
))
(declare-datatypes ((List!21412 0))(
  ( (Nil!21409) (Cons!21408 (h!22606 tuple2!15122) (t!30413 List!21412)) )
))
(declare-fun l!412 () List!21412)

(declare-fun isEmpty!818 (List!21412) Bool)

(assert (=> b!1013507 (= res!680429 (isEmpty!818 (t!30413 l!412)))))

(declare-fun res!680426 () Bool)

(declare-fun e!570131 () Bool)

(assert (=> start!87542 (=> (not res!680426) (not e!570131))))

(declare-fun isStrictlySorted!562 (List!21412) Bool)

(assert (=> start!87542 (= res!680426 (isStrictlySorted!562 l!412))))

(assert (=> start!87542 e!570131))

(assert (=> start!87542 e!570133))

(assert (=> start!87542 tp_is_empty!23475))

(declare-fun b!1013508 () Bool)

(declare-fun e!570132 () Bool)

(assert (=> b!1013508 (= e!570132 e!570130)))

(declare-fun res!680428 () Bool)

(assert (=> b!1013508 (=> res!680428 e!570130)))

(assert (=> b!1013508 (= res!680428 (not (isStrictlySorted!562 (t!30413 l!412))))))

(declare-fun b!1013509 () Bool)

(assert (=> b!1013509 (= e!570131 e!570132)))

(declare-fun res!680430 () Bool)

(assert (=> b!1013509 (=> (not res!680430) (not e!570132))))

(declare-fun isEmpty!819 (List!21411) Bool)

(assert (=> b!1013509 (= res!680430 (not (isEmpty!819 lt!448020)))))

(declare-fun value!115 () B!1408)

(declare-fun getKeysOf!38 (List!21412 B!1408) List!21411)

(assert (=> b!1013509 (= lt!448020 (getKeysOf!38 (t!30413 l!412) value!115))))

(declare-fun b!1013510 () Bool)

(declare-fun head!933 (List!21412) tuple2!15122)

(assert (=> b!1013510 (= e!570130 (bvsge (_1!7572 (h!22606 l!412)) (_1!7572 (head!933 (t!30413 l!412)))))))

(declare-fun b!1013511 () Bool)

(declare-fun res!680427 () Bool)

(assert (=> b!1013511 (=> (not res!680427) (not e!570131))))

(get-info :version)

(assert (=> b!1013511 (= res!680427 (and ((_ is Cons!21408) l!412) (= (_2!7572 (h!22606 l!412)) value!115)))))

(assert (= (and start!87542 res!680426) b!1013511))

(assert (= (and b!1013511 res!680427) b!1013509))

(assert (= (and b!1013509 res!680430) b!1013508))

(assert (= (and b!1013508 (not res!680428)) b!1013507))

(assert (= (and b!1013507 (not res!680429)) b!1013505))

(assert (= (and b!1013505 (not res!680425)) b!1013510))

(assert (= (and start!87542 ((_ is Cons!21408) l!412)) b!1013506))

(declare-fun m!936443 () Bool)

(assert (=> start!87542 m!936443))

(declare-fun m!936445 () Bool)

(assert (=> b!1013509 m!936445))

(declare-fun m!936447 () Bool)

(assert (=> b!1013509 m!936447))

(declare-fun m!936449 () Bool)

(assert (=> b!1013510 m!936449))

(declare-fun m!936451 () Bool)

(assert (=> b!1013505 m!936451))

(declare-fun m!936453 () Bool)

(assert (=> b!1013508 m!936453))

(declare-fun m!936455 () Bool)

(assert (=> b!1013507 m!936455))

(check-sat (not b!1013506) (not b!1013505) (not b!1013510) (not b!1013507) (not b!1013508) tp_is_empty!23475 (not b!1013509) (not start!87542))
(check-sat)
(get-model)

(declare-fun d!120459 () Bool)

(assert (=> d!120459 (= (isEmpty!818 (t!30413 l!412)) ((_ is Nil!21409) (t!30413 l!412)))))

(assert (=> b!1013507 d!120459))

(declare-fun d!120461 () Bool)

(declare-fun res!680453 () Bool)

(declare-fun e!570150 () Bool)

(assert (=> d!120461 (=> res!680453 e!570150)))

(assert (=> d!120461 (= res!680453 ((_ is Nil!21408) lt!448020))))

(assert (=> d!120461 (= (forall!231 lt!448020 lambda!512) e!570150)))

(declare-fun b!1013545 () Bool)

(declare-fun e!570151 () Bool)

(assert (=> b!1013545 (= e!570150 e!570151)))

(declare-fun res!680454 () Bool)

(assert (=> b!1013545 (=> (not res!680454) (not e!570151))))

(declare-fun dynLambda!1883 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013545 (= res!680454 (dynLambda!1883 lambda!512 (h!22605 lt!448020)))))

(declare-fun b!1013546 () Bool)

(assert (=> b!1013546 (= e!570151 (forall!231 (t!30412 lt!448020) lambda!512))))

(assert (= (and d!120461 (not res!680453)) b!1013545))

(assert (= (and b!1013545 res!680454) b!1013546))

(declare-fun b_lambda!15253 () Bool)

(assert (=> (not b_lambda!15253) (not b!1013545)))

(declare-fun m!936471 () Bool)

(assert (=> b!1013545 m!936471))

(declare-fun m!936473 () Bool)

(assert (=> b!1013546 m!936473))

(assert (=> b!1013505 d!120461))

(declare-fun d!120463 () Bool)

(declare-fun res!680459 () Bool)

(declare-fun e!570156 () Bool)

(assert (=> d!120463 (=> res!680459 e!570156)))

(assert (=> d!120463 (= res!680459 (or ((_ is Nil!21409) l!412) ((_ is Nil!21409) (t!30413 l!412))))))

(assert (=> d!120463 (= (isStrictlySorted!562 l!412) e!570156)))

(declare-fun b!1013551 () Bool)

(declare-fun e!570157 () Bool)

(assert (=> b!1013551 (= e!570156 e!570157)))

(declare-fun res!680460 () Bool)

(assert (=> b!1013551 (=> (not res!680460) (not e!570157))))

(assert (=> b!1013551 (= res!680460 (bvslt (_1!7572 (h!22606 l!412)) (_1!7572 (h!22606 (t!30413 l!412)))))))

(declare-fun b!1013552 () Bool)

(assert (=> b!1013552 (= e!570157 (isStrictlySorted!562 (t!30413 l!412)))))

(assert (= (and d!120463 (not res!680459)) b!1013551))

(assert (= (and b!1013551 res!680460) b!1013552))

(assert (=> b!1013552 m!936453))

(assert (=> start!87542 d!120463))

(declare-fun d!120467 () Bool)

(assert (=> d!120467 (= (isEmpty!819 lt!448020) ((_ is Nil!21408) lt!448020))))

(assert (=> b!1013509 d!120467))

(declare-fun bs!28926 () Bool)

(declare-fun b!1013602 () Bool)

(assert (= bs!28926 (and b!1013602 b!1013505)))

(declare-fun lt!448083 () tuple2!15122)

(declare-fun lambda!528 () Int)

(declare-fun lt!448072 () List!21412)

(assert (=> bs!28926 (= (= (Cons!21408 lt!448083 lt!448072) (t!30413 l!412)) (= lambda!528 lambda!512))))

(assert (=> b!1013602 true))

(assert (=> b!1013602 true))

(assert (=> b!1013602 true))

(declare-fun bs!28927 () Bool)

(declare-fun b!1013606 () Bool)

(assert (= bs!28927 (and b!1013606 b!1013505)))

(declare-fun lambda!529 () Int)

(declare-fun lt!448082 () tuple2!15122)

(declare-fun lt!448073 () List!21412)

(assert (=> bs!28927 (= (= (Cons!21408 lt!448082 lt!448073) (t!30413 l!412)) (= lambda!529 lambda!512))))

(declare-fun bs!28928 () Bool)

(assert (= bs!28928 (and b!1013606 b!1013602)))

(assert (=> bs!28928 (= (= (Cons!21408 lt!448082 lt!448073) (Cons!21408 lt!448083 lt!448072)) (= lambda!529 lambda!528))))

(assert (=> b!1013606 true))

(assert (=> b!1013606 true))

(assert (=> b!1013606 true))

(declare-fun bs!28929 () Bool)

(declare-fun d!120469 () Bool)

(assert (= bs!28929 (and d!120469 b!1013505)))

(declare-fun lambda!530 () Int)

(assert (=> bs!28929 (= lambda!530 lambda!512)))

(declare-fun bs!28930 () Bool)

(assert (= bs!28930 (and d!120469 b!1013602)))

(assert (=> bs!28930 (= (= (t!30413 l!412) (Cons!21408 lt!448083 lt!448072)) (= lambda!530 lambda!528))))

(declare-fun bs!28931 () Bool)

(assert (= bs!28931 (and d!120469 b!1013606)))

(assert (=> bs!28931 (= (= (t!30413 l!412) (Cons!21408 lt!448082 lt!448073)) (= lambda!530 lambda!529))))

(assert (=> d!120469 true))

(assert (=> d!120469 true))

(declare-fun bm!42671 () Bool)

(declare-fun call!42676 () List!21411)

(assert (=> bm!42671 (= call!42676 (getKeysOf!38 (t!30413 (t!30413 l!412)) value!115))))

(declare-fun lt!448075 () List!21411)

(assert (=> d!120469 (forall!231 lt!448075 lambda!530)))

(declare-fun e!570191 () List!21411)

(assert (=> d!120469 (= lt!448075 e!570191)))

(declare-fun c!102490 () Bool)

(assert (=> d!120469 (= c!102490 (and ((_ is Cons!21408) (t!30413 l!412)) (= (_2!7572 (h!22606 (t!30413 l!412))) value!115)))))

(assert (=> d!120469 (isStrictlySorted!562 (t!30413 l!412))))

(assert (=> d!120469 (= (getKeysOf!38 (t!30413 l!412) value!115) lt!448075)))

(declare-fun b!1013599 () Bool)

(declare-datatypes ((Unit!33122 0))(
  ( (Unit!33123) )
))
(declare-fun e!570189 () Unit!33122)

(declare-fun Unit!33124 () Unit!33122)

(assert (=> b!1013599 (= e!570189 Unit!33124)))

(declare-fun b!1013600 () Bool)

(declare-fun e!570188 () Unit!33122)

(declare-fun Unit!33125 () Unit!33122)

(assert (=> b!1013600 (= e!570188 Unit!33125)))

(declare-fun b!1013601 () Bool)

(declare-fun e!570190 () List!21411)

(assert (=> b!1013601 (= e!570190 Nil!21408)))

(declare-fun lt!448080 () List!21411)

(declare-fun call!42675 () Unit!33122)

(declare-fun lt!448077 () List!21411)

(declare-fun bm!42672 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!25 (List!21412 List!21411 B!1408 tuple2!15122) Unit!33122)

(assert (=> bm!42672 (= call!42675 (lemmaForallGetValueByKeySameWithASmallerHead!25 (ite c!102490 lt!448072 lt!448073) (ite c!102490 lt!448077 lt!448080) value!115 (ite c!102490 lt!448083 lt!448082)))))

(declare-fun call!42674 () Bool)

(assert (=> b!1013602 call!42674))

(declare-fun lt!448079 () Unit!33122)

(assert (=> b!1013602 (= lt!448079 call!42675)))

(assert (=> b!1013602 (= lt!448083 (h!22606 (t!30413 l!412)))))

(assert (=> b!1013602 (= lt!448077 call!42676)))

(assert (=> b!1013602 (= lt!448072 (t!30413 (t!30413 l!412)))))

(assert (=> b!1013602 (= e!570189 lt!448079)))

(declare-fun b!1013603 () Bool)

(assert (=> b!1013603 (= e!570191 e!570190)))

(declare-fun c!102489 () Bool)

(assert (=> b!1013603 (= c!102489 (and ((_ is Cons!21408) (t!30413 l!412)) (not (= (_2!7572 (h!22606 (t!30413 l!412))) value!115))))))

(declare-fun bm!42673 () Bool)

(assert (=> bm!42673 (= call!42674 (forall!231 (ite c!102490 lt!448077 lt!448080) (ite c!102490 lambda!528 lambda!529)))))

(declare-fun b!1013604 () Bool)

(assert (=> b!1013604 (= e!570191 (Cons!21407 (_1!7572 (h!22606 (t!30413 l!412))) call!42676))))

(declare-fun c!102491 () Bool)

(declare-fun call!42677 () Bool)

(assert (=> b!1013604 (= c!102491 (not call!42677))))

(declare-fun lt!448074 () Unit!33122)

(assert (=> b!1013604 (= lt!448074 e!570189)))

(declare-fun bm!42674 () Bool)

(assert (=> bm!42674 (= call!42677 (isEmpty!819 call!42676))))

(declare-fun b!1013605 () Bool)

(declare-fun lt!448076 () Unit!33122)

(assert (=> b!1013605 (= lt!448076 e!570188)))

(declare-fun c!102488 () Bool)

(assert (=> b!1013605 (= c!102488 (not call!42677))))

(declare-fun lt!448081 () List!21411)

(assert (=> b!1013605 (= lt!448081 call!42676)))

(assert (=> b!1013605 (= e!570190 call!42676)))

(declare-fun lt!448078 () Unit!33122)

(assert (=> b!1013606 (= e!570188 lt!448078)))

(assert (=> b!1013606 (= lt!448073 (t!30413 (t!30413 l!412)))))

(assert (=> b!1013606 (= lt!448080 call!42676)))

(assert (=> b!1013606 (= lt!448082 (h!22606 (t!30413 l!412)))))

(assert (=> b!1013606 (= lt!448078 call!42675)))

(assert (=> b!1013606 call!42674))

(assert (= (and d!120469 c!102490) b!1013604))

(assert (= (and d!120469 (not c!102490)) b!1013603))

(assert (= (and b!1013604 c!102491) b!1013602))

(assert (= (and b!1013604 (not c!102491)) b!1013599))

(assert (= (and b!1013603 c!102489) b!1013605))

(assert (= (and b!1013603 (not c!102489)) b!1013601))

(assert (= (and b!1013605 c!102488) b!1013606))

(assert (= (and b!1013605 (not c!102488)) b!1013600))

(assert (= (or b!1013602 b!1013606) bm!42672))

(assert (= (or b!1013602 b!1013606) bm!42673))

(assert (= (or b!1013604 b!1013602 b!1013605 b!1013606) bm!42671))

(assert (= (or b!1013604 b!1013605) bm!42674))

(declare-fun m!936481 () Bool)

(assert (=> bm!42673 m!936481))

(declare-fun m!936483 () Bool)

(assert (=> bm!42671 m!936483))

(declare-fun m!936485 () Bool)

(assert (=> bm!42674 m!936485))

(declare-fun m!936487 () Bool)

(assert (=> d!120469 m!936487))

(assert (=> d!120469 m!936453))

(declare-fun m!936489 () Bool)

(assert (=> bm!42672 m!936489))

(assert (=> b!1013509 d!120469))

(declare-fun d!120485 () Bool)

(assert (=> d!120485 (= (head!933 (t!30413 l!412)) (h!22606 (t!30413 l!412)))))

(assert (=> b!1013510 d!120485))

(declare-fun d!120487 () Bool)

(declare-fun res!680475 () Bool)

(declare-fun e!570196 () Bool)

(assert (=> d!120487 (=> res!680475 e!570196)))

(assert (=> d!120487 (= res!680475 (or ((_ is Nil!21409) (t!30413 l!412)) ((_ is Nil!21409) (t!30413 (t!30413 l!412)))))))

(assert (=> d!120487 (= (isStrictlySorted!562 (t!30413 l!412)) e!570196)))

(declare-fun b!1013617 () Bool)

(declare-fun e!570197 () Bool)

(assert (=> b!1013617 (= e!570196 e!570197)))

(declare-fun res!680476 () Bool)

(assert (=> b!1013617 (=> (not res!680476) (not e!570197))))

(assert (=> b!1013617 (= res!680476 (bvslt (_1!7572 (h!22606 (t!30413 l!412))) (_1!7572 (h!22606 (t!30413 (t!30413 l!412))))))))

(declare-fun b!1013618 () Bool)

(assert (=> b!1013618 (= e!570197 (isStrictlySorted!562 (t!30413 (t!30413 l!412))))))

(assert (= (and d!120487 (not res!680475)) b!1013617))

(assert (= (and b!1013617 res!680476) b!1013618))

(declare-fun m!936491 () Bool)

(assert (=> b!1013618 m!936491))

(assert (=> b!1013508 d!120487))

(declare-fun b!1013629 () Bool)

(declare-fun e!570202 () Bool)

(declare-fun tp!70454 () Bool)

(assert (=> b!1013629 (= e!570202 (and tp_is_empty!23475 tp!70454))))

(assert (=> b!1013506 (= tp!70448 e!570202)))

(assert (= (and b!1013506 ((_ is Cons!21408) (t!30413 l!412))) b!1013629))

(declare-fun b_lambda!15257 () Bool)

(assert (= b_lambda!15253 (or b!1013505 b_lambda!15257)))

(declare-fun bs!28933 () Bool)

(declare-fun d!120489 () Bool)

(assert (= bs!28933 (and d!120489 b!1013505)))

(declare-datatypes ((Option!571 0))(
  ( (Some!570 (v!14421 B!1408)) (None!569) )
))
(declare-fun getValueByKey!520 (List!21412 (_ BitVec 64)) Option!571)

(assert (=> bs!28933 (= (dynLambda!1883 lambda!512 (h!22605 lt!448020)) (= (getValueByKey!520 (t!30413 l!412) (h!22605 lt!448020)) (Some!570 value!115)))))

(declare-fun m!936493 () Bool)

(assert (=> bs!28933 m!936493))

(assert (=> b!1013545 d!120489))

(check-sat (not bm!42672) (not bm!42671) (not b!1013546) (not bs!28933) (not bm!42673) (not b!1013618) (not b_lambda!15257) tp_is_empty!23475 (not b!1013552) (not d!120469) (not b!1013629) (not bm!42674))
(check-sat)
