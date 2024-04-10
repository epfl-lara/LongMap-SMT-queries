; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87376 () Bool)

(assert start!87376)

(declare-fun res!680042 () Bool)

(declare-fun e!569554 () Bool)

(assert (=> start!87376 (=> (not res!680042) (not e!569554))))

(declare-datatypes ((B!1350 0))(
  ( (B!1351 (val!11759 Int)) )
))
(declare-datatypes ((tuple2!15064 0))(
  ( (tuple2!15065 (_1!7543 (_ BitVec 64)) (_2!7543 B!1350)) )
))
(declare-datatypes ((List!21365 0))(
  ( (Nil!21362) (Cons!21361 (h!22559 tuple2!15064) (t!30366 List!21365)) )
))
(declare-fun l!412 () List!21365)

(declare-fun isStrictlySorted!539 (List!21365) Bool)

(assert (=> start!87376 (= res!680042 (isStrictlySorted!539 l!412))))

(assert (=> start!87376 e!569554))

(declare-fun e!569553 () Bool)

(assert (=> start!87376 e!569553))

(declare-fun tp_is_empty!23417 () Bool)

(assert (=> start!87376 tp_is_empty!23417))

(declare-fun b!1012455 () Bool)

(declare-fun res!680043 () Bool)

(assert (=> b!1012455 (=> (not res!680043) (not e!569554))))

(declare-fun value!115 () B!1350)

(assert (=> b!1012455 (= res!680043 (and (not (= (_2!7543 (h!22559 l!412)) value!115)) (is-Cons!21361 l!412)))))

(declare-fun b!1012456 () Bool)

(assert (=> b!1012456 (= e!569554 (not (isStrictlySorted!539 (t!30366 l!412))))))

(declare-datatypes ((List!21366 0))(
  ( (Nil!21363) (Cons!21362 (h!22560 (_ BitVec 64)) (t!30367 List!21366)) )
))
(declare-fun lt!447477 () List!21366)

(declare-fun getKeysOf!21 (List!21365 B!1350) List!21366)

(assert (=> b!1012456 (= lt!447477 (getKeysOf!21 (t!30366 l!412) value!115))))

(declare-fun b!1012457 () Bool)

(declare-fun tp!70307 () Bool)

(assert (=> b!1012457 (= e!569553 (and tp_is_empty!23417 tp!70307))))

(assert (= (and start!87376 res!680042) b!1012455))

(assert (= (and b!1012455 res!680043) b!1012456))

(assert (= (and start!87376 (is-Cons!21361 l!412)) b!1012457))

(declare-fun m!936019 () Bool)

(assert (=> start!87376 m!936019))

(declare-fun m!936021 () Bool)

(assert (=> b!1012456 m!936021))

(declare-fun m!936023 () Bool)

(assert (=> b!1012456 m!936023))

(push 1)

(assert (not b!1012456))

(assert (not start!87376))

(assert (not b!1012457))

(assert tp_is_empty!23417)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120301 () Bool)

(declare-fun res!680062 () Bool)

(declare-fun e!569573 () Bool)

(assert (=> d!120301 (=> res!680062 e!569573)))

(assert (=> d!120301 (= res!680062 (or (is-Nil!21362 (t!30366 l!412)) (is-Nil!21362 (t!30366 (t!30366 l!412)))))))

(assert (=> d!120301 (= (isStrictlySorted!539 (t!30366 l!412)) e!569573)))

(declare-fun b!1012476 () Bool)

(declare-fun e!569574 () Bool)

(assert (=> b!1012476 (= e!569573 e!569574)))

(declare-fun res!680063 () Bool)

(assert (=> b!1012476 (=> (not res!680063) (not e!569574))))

(assert (=> b!1012476 (= res!680063 (bvslt (_1!7543 (h!22559 (t!30366 l!412))) (_1!7543 (h!22559 (t!30366 (t!30366 l!412))))))))

(declare-fun b!1012477 () Bool)

(assert (=> b!1012477 (= e!569574 (isStrictlySorted!539 (t!30366 (t!30366 l!412))))))

(assert (= (and d!120301 (not res!680062)) b!1012476))

(assert (= (and b!1012476 res!680063) b!1012477))

(declare-fun m!936029 () Bool)

(assert (=> b!1012477 m!936029))

(assert (=> b!1012456 d!120301))

(declare-fun b!1012542 () Bool)

(assert (=> b!1012542 true))

(assert (=> b!1012542 true))

(assert (=> b!1012542 true))

(declare-fun bs!28822 () Bool)

(declare-fun b!1012541 () Bool)

(assert (= bs!28822 (and b!1012541 b!1012542)))

(declare-fun lambda!365 () Int)

(declare-fun lt!447573 () tuple2!15064)

(declare-fun lt!447568 () List!21365)

(declare-fun lt!447567 () List!21365)

(declare-fun lambda!367 () Int)

(declare-fun lt!447564 () tuple2!15064)

(assert (=> bs!28822 (= (= (Cons!21361 lt!447564 lt!447568) (Cons!21361 lt!447573 lt!447567)) (= lambda!367 lambda!365))))

(assert (=> b!1012541 true))

(assert (=> b!1012541 true))

(assert (=> b!1012541 true))

(declare-fun bs!28825 () Bool)

(declare-fun d!120307 () Bool)

(assert (= bs!28825 (and d!120307 b!1012542)))

(declare-fun lambda!369 () Int)

(assert (=> bs!28825 (= (= (t!30366 l!412) (Cons!21361 lt!447573 lt!447567)) (= lambda!369 lambda!365))))

(declare-fun bs!28826 () Bool)

(assert (= bs!28826 (and d!120307 b!1012541)))

(assert (=> bs!28826 (= (= (t!30366 l!412) (Cons!21361 lt!447564 lt!447568)) (= lambda!369 lambda!367))))

(assert (=> d!120307 true))

(assert (=> d!120307 true))

(declare-fun b!1012536 () Bool)

(declare-fun e!569604 () List!21366)

(declare-fun e!569603 () List!21366)

(assert (=> b!1012536 (= e!569604 e!569603)))

(declare-fun c!102305 () Bool)

(assert (=> b!1012536 (= c!102305 (and (is-Cons!21361 (t!30366 l!412)) (not (= (_2!7543 (h!22559 (t!30366 l!412))) value!115))))))

(declare-fun b!1012537 () Bool)

(declare-datatypes ((Unit!33069 0))(
  ( (Unit!33070) )
))
(declare-fun lt!447566 () Unit!33069)

(declare-fun e!569605 () Unit!33069)

(assert (=> b!1012537 (= lt!447566 e!569605)))

(declare-fun c!102306 () Bool)

(declare-fun call!42537 () Bool)

(assert (=> b!1012537 (= c!102306 (not call!42537))))

(declare-fun lt!447571 () List!21366)

(declare-fun call!42536 () List!21366)

(assert (=> b!1012537 (= lt!447571 call!42536)))

(assert (=> b!1012537 (= e!569603 call!42536)))

(declare-fun c!102307 () Bool)

(declare-fun lt!447572 () List!21366)

(declare-fun bm!42531 () Bool)

(declare-fun call!42535 () Unit!33069)

(declare-fun lt!447569 () List!21366)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!12 (List!21365 List!21366 B!1350 tuple2!15064) Unit!33069)

(assert (=> bm!42531 (= call!42535 (lemmaForallGetValueByKeySameWithASmallerHead!12 (ite c!102307 lt!447567 lt!447568) (ite c!102307 lt!447569 lt!447572) value!115 (ite c!102307 lt!447573 lt!447564)))))

(declare-fun bm!42532 () Bool)

(assert (=> bm!42532 (= call!42536 (getKeysOf!21 (t!30366 (t!30366 l!412)) value!115))))

(declare-fun b!1012538 () Bool)

(assert (=> b!1012538 (= e!569604 (Cons!21362 (_1!7543 (h!22559 (t!30366 l!412))) call!42536))))

(declare-fun c!102308 () Bool)

(assert (=> b!1012538 (= c!102308 (not call!42537))))

(declare-fun lt!447570 () Unit!33069)

(declare-fun e!569606 () Unit!33069)

(assert (=> b!1012538 (= lt!447570 e!569606)))

(declare-fun lt!447563 () List!21366)

(declare-fun forall!214 (List!21366 Int) Bool)

(assert (=> d!120307 (forall!214 lt!447563 lambda!369)))

(assert (=> d!120307 (= lt!447563 e!569604)))

(assert (=> d!120307 (= c!102307 (and (is-Cons!21361 (t!30366 l!412)) (= (_2!7543 (h!22559 (t!30366 l!412))) value!115)))))

(assert (=> d!120307 (isStrictlySorted!539 (t!30366 l!412))))

(assert (=> d!120307 (= (getKeysOf!21 (t!30366 l!412) value!115) lt!447563)))

(declare-fun bm!42533 () Bool)

(declare-fun call!42534 () Bool)

(assert (=> bm!42533 (= call!42534 (forall!214 (ite c!102307 lt!447569 lt!447572) (ite c!102307 lambda!365 lambda!367)))))

(declare-fun b!1012539 () Bool)

(assert (=> b!1012539 (= e!569603 Nil!21363)))

(declare-fun b!1012540 () Bool)

(declare-fun Unit!33073 () Unit!33069)

(assert (=> b!1012540 (= e!569606 Unit!33073)))

(declare-fun bm!42534 () Bool)

(declare-fun isEmpty!793 (List!21366) Bool)

(assert (=> bm!42534 (= call!42537 (isEmpty!793 call!42536))))

(declare-fun lt!447562 () Unit!33069)

(assert (=> b!1012541 (= e!569605 lt!447562)))

(assert (=> b!1012541 (= lt!447568 (t!30366 (t!30366 l!412)))))

(assert (=> b!1012541 (= lt!447572 call!42536)))

(assert (=> b!1012541 (= lt!447564 (h!22559 (t!30366 l!412)))))

(assert (=> b!1012541 (= lt!447562 call!42535)))

(assert (=> b!1012541 call!42534))

(assert (=> b!1012542 call!42534))

(declare-fun lt!447565 () Unit!33069)

(assert (=> b!1012542 (= lt!447565 call!42535)))

(assert (=> b!1012542 (= lt!447573 (h!22559 (t!30366 l!412)))))

(assert (=> b!1012542 (= lt!447569 call!42536)))

(assert (=> b!1012542 (= lt!447567 (t!30366 (t!30366 l!412)))))

(assert (=> b!1012542 (= e!569606 lt!447565)))

(declare-fun b!1012543 () Bool)

(declare-fun Unit!33076 () Unit!33069)

(assert (=> b!1012543 (= e!569605 Unit!33076)))

(assert (= (and d!120307 c!102307) b!1012538))

(assert (= (and d!120307 (not c!102307)) b!1012536))

(assert (= (and b!1012538 c!102308) b!1012542))

(assert (= (and b!1012538 (not c!102308)) b!1012540))

(assert (= (and b!1012536 c!102305) b!1012537))

(assert (= (and b!1012536 (not c!102305)) b!1012539))

(assert (= (and b!1012537 c!102306) b!1012541))

(assert (= (and b!1012537 (not c!102306)) b!1012543))

(assert (= (or b!1012542 b!1012541) bm!42531))

(assert (= (or b!1012542 b!1012541) bm!42533))

(assert (= (or b!1012538 b!1012542 b!1012537 b!1012541) bm!42532))

(assert (= (or b!1012538 b!1012537) bm!42534))

(declare-fun m!936041 () Bool)

(assert (=> bm!42532 m!936041))

(declare-fun m!936043 () Bool)

(assert (=> bm!42534 m!936043))

(declare-fun m!936045 () Bool)

(assert (=> bm!42531 m!936045))

(declare-fun m!936047 () Bool)

(assert (=> bm!42533 m!936047))

(declare-fun m!936049 () Bool)

(assert (=> d!120307 m!936049))

(assert (=> d!120307 m!936021))

(assert (=> b!1012456 d!120307))

(declare-fun d!120309 () Bool)

(declare-fun res!680064 () Bool)

(declare-fun e!569610 () Bool)

(assert (=> d!120309 (=> res!680064 e!569610)))

(assert (=> d!120309 (= res!680064 (or (is-Nil!21362 l!412) (is-Nil!21362 (t!30366 l!412))))))

