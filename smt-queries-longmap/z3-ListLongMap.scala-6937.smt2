; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87556 () Bool)

(assert start!87556)

(declare-fun b!1013434 () Bool)

(assert (=> b!1013434 true))

(assert (=> b!1013434 true))

(declare-fun res!680401 () Bool)

(declare-fun e!570200 () Bool)

(assert (=> start!87556 (=> (not res!680401) (not e!570200))))

(declare-datatypes ((B!1328 0))(
  ( (B!1329 (val!11748 Int)) )
))
(declare-datatypes ((tuple2!15046 0))(
  ( (tuple2!15047 (_1!7534 (_ BitVec 64)) (_2!7534 B!1328)) )
))
(declare-datatypes ((List!21335 0))(
  ( (Nil!21332) (Cons!21331 (h!22538 tuple2!15046) (t!30328 List!21335)) )
))
(declare-fun l!412 () List!21335)

(declare-fun isStrictlySorted!516 (List!21335) Bool)

(assert (=> start!87556 (= res!680401 (isStrictlySorted!516 l!412))))

(assert (=> start!87556 e!570200))

(declare-fun e!570201 () Bool)

(assert (=> start!87556 e!570201))

(declare-fun tp_is_empty!23395 () Bool)

(assert (=> start!87556 tp_is_empty!23395))

(declare-fun b!1013433 () Bool)

(declare-fun res!680402 () Bool)

(assert (=> b!1013433 (=> (not res!680402) (not e!570200))))

(declare-fun value!115 () B!1328)

(get-info :version)

(assert (=> b!1013433 (= res!680402 (and ((_ is Cons!21331) l!412) (= (_2!7534 (h!22538 l!412)) value!115)))))

(declare-datatypes ((Unit!33039 0))(
  ( (Unit!33040) )
))
(declare-fun e!570199 () Unit!33039)

(declare-fun lt!447821 () Unit!33039)

(assert (=> b!1013434 (= e!570199 lt!447821)))

(declare-datatypes ((List!21336 0))(
  ( (Nil!21333) (Cons!21332 (h!22539 (_ BitVec 64)) (t!30329 List!21336)) )
))
(declare-fun lt!447820 () List!21336)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!5 (List!21335 List!21336 B!1328 tuple2!15046) Unit!33039)

(assert (=> b!1013434 (= lt!447821 (lemmaForallGetValueByKeySameWithASmallerHead!5 (t!30328 l!412) lt!447820 value!115 (h!22538 l!412)))))

(declare-fun lambda!287 () Int)

(declare-fun forall!207 (List!21336 Int) Bool)

(assert (=> b!1013434 (forall!207 lt!447820 lambda!287)))

(declare-fun b!1013435 () Bool)

(declare-fun tp!70257 () Bool)

(assert (=> b!1013435 (= e!570201 (and tp_is_empty!23395 tp!70257))))

(declare-fun b!1013436 () Bool)

(declare-fun Unit!33041 () Unit!33039)

(assert (=> b!1013436 (= e!570199 Unit!33041)))

(declare-fun b!1013437 () Bool)

(assert (=> b!1013437 (= e!570200 (not (isStrictlySorted!516 (t!30328 l!412))))))

(declare-fun lt!447819 () Unit!33039)

(assert (=> b!1013437 (= lt!447819 e!570199)))

(declare-fun c!102640 () Bool)

(declare-fun isEmpty!789 (List!21336) Bool)

(assert (=> b!1013437 (= c!102640 (not (isEmpty!789 lt!447820)))))

(declare-fun getKeysOf!13 (List!21335 B!1328) List!21336)

(assert (=> b!1013437 (= lt!447820 (getKeysOf!13 (t!30328 l!412) value!115))))

(assert (= (and start!87556 res!680401) b!1013433))

(assert (= (and b!1013433 res!680402) b!1013437))

(assert (= (and b!1013437 c!102640) b!1013434))

(assert (= (and b!1013437 (not c!102640)) b!1013436))

(assert (= (and start!87556 ((_ is Cons!21331) l!412)) b!1013435))

(declare-fun m!937505 () Bool)

(assert (=> start!87556 m!937505))

(declare-fun m!937507 () Bool)

(assert (=> b!1013434 m!937507))

(declare-fun m!937509 () Bool)

(assert (=> b!1013434 m!937509))

(declare-fun m!937511 () Bool)

(assert (=> b!1013437 m!937511))

(declare-fun m!937513 () Bool)

(assert (=> b!1013437 m!937513))

(declare-fun m!937515 () Bool)

(assert (=> b!1013437 m!937515))

(check-sat (not start!87556) (not b!1013434) tp_is_empty!23395 (not b!1013435) (not b!1013437))
(check-sat)
(get-model)

(declare-fun d!120711 () Bool)

(declare-fun res!680419 () Bool)

(declare-fun e!570224 () Bool)

(assert (=> d!120711 (=> res!680419 e!570224)))

(assert (=> d!120711 (= res!680419 (or ((_ is Nil!21332) (t!30328 l!412)) ((_ is Nil!21332) (t!30328 (t!30328 l!412)))))))

(assert (=> d!120711 (= (isStrictlySorted!516 (t!30328 l!412)) e!570224)))

(declare-fun b!1013484 () Bool)

(declare-fun e!570225 () Bool)

(assert (=> b!1013484 (= e!570224 e!570225)))

(declare-fun res!680420 () Bool)

(assert (=> b!1013484 (=> (not res!680420) (not e!570225))))

(assert (=> b!1013484 (= res!680420 (bvslt (_1!7534 (h!22538 (t!30328 l!412))) (_1!7534 (h!22538 (t!30328 (t!30328 l!412))))))))

(declare-fun b!1013485 () Bool)

(assert (=> b!1013485 (= e!570225 (isStrictlySorted!516 (t!30328 (t!30328 l!412))))))

(assert (= (and d!120711 (not res!680419)) b!1013484))

(assert (= (and b!1013484 res!680420) b!1013485))

(declare-fun m!937541 () Bool)

(assert (=> b!1013485 m!937541))

(assert (=> b!1013437 d!120711))

(declare-fun d!120717 () Bool)

(assert (=> d!120717 (= (isEmpty!789 lt!447820) ((_ is Nil!21333) lt!447820))))

(assert (=> b!1013437 d!120717))

(declare-fun bs!28802 () Bool)

(declare-fun b!1013582 () Bool)

(assert (= bs!28802 (and b!1013582 b!1013434)))

(declare-fun lambda!321 () Int)

(declare-fun lt!447906 () tuple2!15046)

(declare-fun lt!447913 () List!21335)

(assert (=> bs!28802 (= (= (Cons!21331 lt!447906 lt!447913) l!412) (= lambda!321 lambda!287))))

(assert (=> b!1013582 true))

(assert (=> b!1013582 true))

(assert (=> b!1013582 true))

(declare-fun bs!28803 () Bool)

(declare-fun b!1013578 () Bool)

(assert (= bs!28803 (and b!1013578 b!1013434)))

(declare-fun lambda!322 () Int)

(declare-fun lt!447912 () tuple2!15046)

(declare-fun lt!447915 () List!21335)

(assert (=> bs!28803 (= (= (Cons!21331 lt!447912 lt!447915) l!412) (= lambda!322 lambda!287))))

(declare-fun bs!28804 () Bool)

(assert (= bs!28804 (and b!1013578 b!1013582)))

(assert (=> bs!28804 (= (= (Cons!21331 lt!447912 lt!447915) (Cons!21331 lt!447906 lt!447913)) (= lambda!322 lambda!321))))

(assert (=> b!1013578 true))

(assert (=> b!1013578 true))

(assert (=> b!1013578 true))

(declare-fun bs!28806 () Bool)

(declare-fun d!120719 () Bool)

(assert (= bs!28806 (and d!120719 b!1013434)))

(declare-fun lambda!323 () Int)

(assert (=> bs!28806 (= (= (t!30328 l!412) l!412) (= lambda!323 lambda!287))))

(declare-fun bs!28807 () Bool)

(assert (= bs!28807 (and d!120719 b!1013582)))

(assert (=> bs!28807 (= (= (t!30328 l!412) (Cons!21331 lt!447906 lt!447913)) (= lambda!323 lambda!321))))

(declare-fun bs!28808 () Bool)

(assert (= bs!28808 (and d!120719 b!1013578)))

(assert (=> bs!28808 (= (= (t!30328 l!412) (Cons!21331 lt!447912 lt!447915)) (= lambda!323 lambda!322))))

(assert (=> d!120719 true))

(assert (=> d!120719 true))

(declare-fun b!1013576 () Bool)

(declare-fun e!570280 () List!21336)

(declare-fun call!42565 () List!21336)

(assert (=> b!1013576 (= e!570280 (Cons!21332 (_1!7534 (h!22538 (t!30328 l!412))) call!42565))))

(declare-fun c!102670 () Bool)

(declare-fun call!42568 () Bool)

(assert (=> b!1013576 (= c!102670 (not call!42568))))

(declare-fun lt!447914 () Unit!33039)

(declare-fun e!570282 () Unit!33039)

(assert (=> b!1013576 (= lt!447914 e!570282)))

(declare-fun bm!42562 () Bool)

(declare-fun lt!447917 () List!21336)

(declare-fun call!42566 () Unit!33039)

(declare-fun c!102669 () Bool)

(declare-fun lt!447910 () List!21336)

(assert (=> bm!42562 (= call!42566 (lemmaForallGetValueByKeySameWithASmallerHead!5 (ite c!102669 lt!447913 lt!447915) (ite c!102669 lt!447917 lt!447910) value!115 (ite c!102669 lt!447906 lt!447912)))))

(declare-fun b!1013577 () Bool)

(declare-fun e!570281 () List!21336)

(assert (=> b!1013577 (= e!570280 e!570281)))

(declare-fun c!102668 () Bool)

(assert (=> b!1013577 (= c!102668 (and ((_ is Cons!21331) (t!30328 l!412)) (not (= (_2!7534 (h!22538 (t!30328 l!412))) value!115))))))

(declare-fun e!570283 () Unit!33039)

(declare-fun lt!447911 () Unit!33039)

(assert (=> b!1013578 (= e!570283 lt!447911)))

(assert (=> b!1013578 (= lt!447915 (t!30328 (t!30328 l!412)))))

(assert (=> b!1013578 (= lt!447910 call!42565)))

(assert (=> b!1013578 (= lt!447912 (h!22538 (t!30328 l!412)))))

(assert (=> b!1013578 (= lt!447911 call!42566)))

(declare-fun call!42567 () Bool)

(assert (=> b!1013578 call!42567))

(declare-fun lt!447907 () List!21336)

(assert (=> d!120719 (forall!207 lt!447907 lambda!323)))

(assert (=> d!120719 (= lt!447907 e!570280)))

(assert (=> d!120719 (= c!102669 (and ((_ is Cons!21331) (t!30328 l!412)) (= (_2!7534 (h!22538 (t!30328 l!412))) value!115)))))

(assert (=> d!120719 (isStrictlySorted!516 (t!30328 l!412))))

(assert (=> d!120719 (= (getKeysOf!13 (t!30328 l!412) value!115) lt!447907)))

(declare-fun b!1013579 () Bool)

(assert (=> b!1013579 (= e!570281 Nil!21333)))

(declare-fun bm!42563 () Bool)

(assert (=> bm!42563 (= call!42565 (getKeysOf!13 (t!30328 (t!30328 l!412)) value!115))))

(declare-fun b!1013580 () Bool)

(declare-fun Unit!33050 () Unit!33039)

(assert (=> b!1013580 (= e!570283 Unit!33050)))

(declare-fun b!1013581 () Bool)

(declare-fun Unit!33051 () Unit!33039)

(assert (=> b!1013581 (= e!570282 Unit!33051)))

(declare-fun bm!42564 () Bool)

(assert (=> bm!42564 (= call!42567 (forall!207 (ite c!102669 lt!447917 lt!447910) (ite c!102669 lambda!321 lambda!322)))))

(assert (=> b!1013582 call!42567))

(declare-fun lt!447908 () Unit!33039)

(assert (=> b!1013582 (= lt!447908 call!42566)))

(assert (=> b!1013582 (= lt!447906 (h!22538 (t!30328 l!412)))))

(assert (=> b!1013582 (= lt!447917 call!42565)))

(assert (=> b!1013582 (= lt!447913 (t!30328 (t!30328 l!412)))))

(assert (=> b!1013582 (= e!570282 lt!447908)))

(declare-fun bm!42565 () Bool)

(assert (=> bm!42565 (= call!42568 (isEmpty!789 call!42565))))

(declare-fun b!1013583 () Bool)

(declare-fun lt!447909 () Unit!33039)

(assert (=> b!1013583 (= lt!447909 e!570283)))

(declare-fun c!102667 () Bool)

(assert (=> b!1013583 (= c!102667 (not call!42568))))

(declare-fun lt!447916 () List!21336)

(assert (=> b!1013583 (= lt!447916 call!42565)))

(assert (=> b!1013583 (= e!570281 call!42565)))

(assert (= (and d!120719 c!102669) b!1013576))

(assert (= (and d!120719 (not c!102669)) b!1013577))

(assert (= (and b!1013576 c!102670) b!1013582))

(assert (= (and b!1013576 (not c!102670)) b!1013581))

(assert (= (and b!1013577 c!102668) b!1013583))

(assert (= (and b!1013577 (not c!102668)) b!1013579))

(assert (= (and b!1013583 c!102667) b!1013578))

(assert (= (and b!1013583 (not c!102667)) b!1013580))

(assert (= (or b!1013582 b!1013578) bm!42562))

(assert (= (or b!1013582 b!1013578) bm!42564))

(assert (= (or b!1013576 b!1013582 b!1013578 b!1013583) bm!42563))

(assert (= (or b!1013576 b!1013583) bm!42565))

(declare-fun m!937587 () Bool)

(assert (=> bm!42565 m!937587))

(declare-fun m!937589 () Bool)

(assert (=> bm!42564 m!937589))

(declare-fun m!937591 () Bool)

(assert (=> bm!42563 m!937591))

(declare-fun m!937593 () Bool)

(assert (=> bm!42562 m!937593))

(declare-fun m!937595 () Bool)

(assert (=> d!120719 m!937595))

(assert (=> d!120719 m!937511))

(assert (=> b!1013437 d!120719))

(declare-fun bs!28809 () Bool)

(declare-fun b!1013614 () Bool)

(assert (= bs!28809 (and b!1013614 b!1013434)))

(declare-fun lambda!334 () Int)

(assert (=> bs!28809 (= (= (t!30328 l!412) l!412) (= lambda!334 lambda!287))))

(declare-fun bs!28810 () Bool)

(assert (= bs!28810 (and b!1013614 b!1013582)))

(assert (=> bs!28810 (= (= (t!30328 l!412) (Cons!21331 lt!447906 lt!447913)) (= lambda!334 lambda!321))))

(declare-fun bs!28811 () Bool)

(assert (= bs!28811 (and b!1013614 b!1013578)))

(assert (=> bs!28811 (= (= (t!30328 l!412) (Cons!21331 lt!447912 lt!447915)) (= lambda!334 lambda!322))))

(declare-fun bs!28812 () Bool)

(assert (= bs!28812 (and b!1013614 d!120719)))

(assert (=> bs!28812 (= lambda!334 lambda!323)))

(assert (=> b!1013614 true))

(assert (=> b!1013614 true))

(declare-fun bs!28813 () Bool)

(declare-fun d!120743 () Bool)

(assert (= bs!28813 (and d!120743 b!1013614)))

(declare-fun lambda!335 () Int)

(assert (=> bs!28813 (= (= (Cons!21331 (h!22538 l!412) (t!30328 l!412)) (t!30328 l!412)) (= lambda!335 lambda!334))))

(declare-fun bs!28814 () Bool)

(assert (= bs!28814 (and d!120743 b!1013434)))

(assert (=> bs!28814 (= (= (Cons!21331 (h!22538 l!412) (t!30328 l!412)) l!412) (= lambda!335 lambda!287))))

(declare-fun bs!28815 () Bool)

(assert (= bs!28815 (and d!120743 b!1013578)))

(assert (=> bs!28815 (= (= (Cons!21331 (h!22538 l!412) (t!30328 l!412)) (Cons!21331 lt!447912 lt!447915)) (= lambda!335 lambda!322))))

(declare-fun bs!28816 () Bool)

(assert (= bs!28816 (and d!120743 d!120719)))

(assert (=> bs!28816 (= (= (Cons!21331 (h!22538 l!412) (t!30328 l!412)) (t!30328 l!412)) (= lambda!335 lambda!323))))

(declare-fun bs!28817 () Bool)

(assert (= bs!28817 (and d!120743 b!1013582)))

(assert (=> bs!28817 (= (= (Cons!21331 (h!22538 l!412) (t!30328 l!412)) (Cons!21331 lt!447906 lt!447913)) (= lambda!335 lambda!321))))

(assert (=> d!120743 true))

(assert (=> d!120743 true))

(assert (=> d!120743 true))

(assert (=> d!120743 (forall!207 lt!447820 lambda!335)))

(declare-fun lt!447944 () Unit!33039)

(declare-fun choose!1631 (List!21335 List!21336 B!1328 tuple2!15046) Unit!33039)

(assert (=> d!120743 (= lt!447944 (choose!1631 (t!30328 l!412) lt!447820 value!115 (h!22538 l!412)))))

(declare-fun e!570297 () Bool)

(assert (=> d!120743 e!570297))

(declare-fun res!680474 () Bool)

(assert (=> d!120743 (=> (not res!680474) (not e!570297))))

(assert (=> d!120743 (= res!680474 (isStrictlySorted!516 (t!30328 l!412)))))

(assert (=> d!120743 (= (lemmaForallGetValueByKeySameWithASmallerHead!5 (t!30328 l!412) lt!447820 value!115 (h!22538 l!412)) lt!447944)))

(declare-fun b!1013613 () Bool)

(declare-fun res!680475 () Bool)

(assert (=> b!1013613 (=> (not res!680475) (not e!570297))))

(declare-fun isEmpty!794 (List!21335) Bool)

(assert (=> b!1013613 (= res!680475 (not (isEmpty!794 (t!30328 l!412))))))

(declare-fun res!680473 () Bool)

(assert (=> b!1013614 (=> (not res!680473) (not e!570297))))

(assert (=> b!1013614 (= res!680473 (forall!207 lt!447820 lambda!334))))

(declare-fun b!1013615 () Bool)

(declare-fun head!923 (List!21335) tuple2!15046)

(assert (=> b!1013615 (= e!570297 (bvslt (_1!7534 (h!22538 l!412)) (_1!7534 (head!923 (t!30328 l!412)))))))

(assert (= (and d!120743 res!680474) b!1013613))

(assert (= (and b!1013613 res!680475) b!1013614))

(assert (= (and b!1013614 res!680473) b!1013615))

(declare-fun m!937597 () Bool)

(assert (=> d!120743 m!937597))

(declare-fun m!937599 () Bool)

(assert (=> d!120743 m!937599))

(assert (=> d!120743 m!937511))

(declare-fun m!937601 () Bool)

(assert (=> b!1013613 m!937601))

(declare-fun m!937603 () Bool)

(assert (=> b!1013614 m!937603))

(declare-fun m!937605 () Bool)

(assert (=> b!1013615 m!937605))

(assert (=> b!1013434 d!120743))

(declare-fun d!120745 () Bool)

(declare-fun res!680480 () Bool)

(declare-fun e!570306 () Bool)

(assert (=> d!120745 (=> res!680480 e!570306)))

(assert (=> d!120745 (= res!680480 ((_ is Nil!21333) lt!447820))))

(assert (=> d!120745 (= (forall!207 lt!447820 lambda!287) e!570306)))

(declare-fun b!1013628 () Bool)

(declare-fun e!570307 () Bool)

(assert (=> b!1013628 (= e!570306 e!570307)))

(declare-fun res!680481 () Bool)

(assert (=> b!1013628 (=> (not res!680481) (not e!570307))))

(declare-fun dynLambda!1905 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013628 (= res!680481 (dynLambda!1905 lambda!287 (h!22539 lt!447820)))))

(declare-fun b!1013629 () Bool)

(assert (=> b!1013629 (= e!570307 (forall!207 (t!30329 lt!447820) lambda!287))))

(assert (= (and d!120745 (not res!680480)) b!1013628))

(assert (= (and b!1013628 res!680481) b!1013629))

(declare-fun b_lambda!15249 () Bool)

(assert (=> (not b_lambda!15249) (not b!1013628)))

(declare-fun m!937607 () Bool)

(assert (=> b!1013628 m!937607))

(declare-fun m!937609 () Bool)

(assert (=> b!1013629 m!937609))

(assert (=> b!1013434 d!120745))

(declare-fun d!120747 () Bool)

(declare-fun res!680482 () Bool)

(declare-fun e!570308 () Bool)

(assert (=> d!120747 (=> res!680482 e!570308)))

(assert (=> d!120747 (= res!680482 (or ((_ is Nil!21332) l!412) ((_ is Nil!21332) (t!30328 l!412))))))

(assert (=> d!120747 (= (isStrictlySorted!516 l!412) e!570308)))

(declare-fun b!1013630 () Bool)

(declare-fun e!570309 () Bool)

(assert (=> b!1013630 (= e!570308 e!570309)))

(declare-fun res!680483 () Bool)

(assert (=> b!1013630 (=> (not res!680483) (not e!570309))))

(assert (=> b!1013630 (= res!680483 (bvslt (_1!7534 (h!22538 l!412)) (_1!7534 (h!22538 (t!30328 l!412)))))))

(declare-fun b!1013631 () Bool)

(assert (=> b!1013631 (= e!570309 (isStrictlySorted!516 (t!30328 l!412)))))

(assert (= (and d!120747 (not res!680482)) b!1013630))

(assert (= (and b!1013630 res!680483) b!1013631))

(assert (=> b!1013631 m!937511))

(assert (=> start!87556 d!120747))

(declare-fun b!1013636 () Bool)

(declare-fun e!570312 () Bool)

(declare-fun tp!70269 () Bool)

(assert (=> b!1013636 (= e!570312 (and tp_is_empty!23395 tp!70269))))

(assert (=> b!1013435 (= tp!70257 e!570312)))

(assert (= (and b!1013435 ((_ is Cons!21331) (t!30328 l!412))) b!1013636))

(declare-fun b_lambda!15251 () Bool)

(assert (= b_lambda!15249 (or b!1013434 b_lambda!15251)))

(declare-fun bs!28830 () Bool)

(declare-fun d!120749 () Bool)

(assert (= bs!28830 (and d!120749 b!1013434)))

(declare-datatypes ((Option!566 0))(
  ( (Some!565 (v!14416 B!1328)) (None!564) )
))
(declare-fun getValueByKey!515 (List!21335 (_ BitVec 64)) Option!566)

(assert (=> bs!28830 (= (dynLambda!1905 lambda!287 (h!22539 lt!447820)) (= (getValueByKey!515 l!412 (h!22539 lt!447820)) (Some!565 value!115)))))

(declare-fun m!937611 () Bool)

(assert (=> bs!28830 m!937611))

(assert (=> b!1013628 d!120749))

(check-sat (not b!1013636) tp_is_empty!23395 (not bm!42565) (not b!1013629) (not b!1013613) (not bm!42564) (not b!1013615) (not bm!42562) (not bm!42563) (not d!120743) (not b!1013614) (not b!1013631) (not d!120719) (not b!1013485) (not bs!28830) (not b_lambda!15251))
(check-sat)
