; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87372 () Bool)

(assert start!87372)

(declare-fun res!680031 () Bool)

(declare-fun e!569541 () Bool)

(assert (=> start!87372 (=> (not res!680031) (not e!569541))))

(declare-datatypes ((B!1346 0))(
  ( (B!1347 (val!11757 Int)) )
))
(declare-datatypes ((tuple2!15060 0))(
  ( (tuple2!15061 (_1!7541 (_ BitVec 64)) (_2!7541 B!1346)) )
))
(declare-datatypes ((List!21361 0))(
  ( (Nil!21358) (Cons!21357 (h!22555 tuple2!15060) (t!30362 List!21361)) )
))
(declare-fun l!412 () List!21361)

(declare-fun isStrictlySorted!537 (List!21361) Bool)

(assert (=> start!87372 (= res!680031 (isStrictlySorted!537 l!412))))

(assert (=> start!87372 e!569541))

(declare-fun e!569542 () Bool)

(assert (=> start!87372 e!569542))

(declare-fun tp_is_empty!23413 () Bool)

(assert (=> start!87372 tp_is_empty!23413))

(declare-fun b!1012437 () Bool)

(declare-fun res!680030 () Bool)

(assert (=> b!1012437 (=> (not res!680030) (not e!569541))))

(declare-fun value!115 () B!1346)

(assert (=> b!1012437 (= res!680030 (and (not (= (_2!7541 (h!22555 l!412)) value!115)) (is-Cons!21357 l!412)))))

(declare-fun b!1012438 () Bool)

(assert (=> b!1012438 (= e!569541 (not (isStrictlySorted!537 (t!30362 l!412))))))

(declare-datatypes ((List!21362 0))(
  ( (Nil!21359) (Cons!21358 (h!22556 (_ BitVec 64)) (t!30363 List!21362)) )
))
(declare-fun lt!447471 () List!21362)

(declare-fun getKeysOf!19 (List!21361 B!1346) List!21362)

(assert (=> b!1012438 (= lt!447471 (getKeysOf!19 (t!30362 l!412) value!115))))

(declare-fun b!1012439 () Bool)

(declare-fun tp!70301 () Bool)

(assert (=> b!1012439 (= e!569542 (and tp_is_empty!23413 tp!70301))))

(assert (= (and start!87372 res!680031) b!1012437))

(assert (= (and b!1012437 res!680030) b!1012438))

(assert (= (and start!87372 (is-Cons!21357 l!412)) b!1012439))

(declare-fun m!936007 () Bool)

(assert (=> start!87372 m!936007))

(declare-fun m!936009 () Bool)

(assert (=> b!1012438 m!936009))

(declare-fun m!936011 () Bool)

(assert (=> b!1012438 m!936011))

(push 1)

(assert (not b!1012438))

(assert (not start!87372))

(assert (not b!1012439))

(assert tp_is_empty!23413)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120295 () Bool)

(declare-fun res!680048 () Bool)

(declare-fun e!569559 () Bool)

(assert (=> d!120295 (=> res!680048 e!569559)))

(assert (=> d!120295 (= res!680048 (or (is-Nil!21358 (t!30362 l!412)) (is-Nil!21358 (t!30362 (t!30362 l!412)))))))

(assert (=> d!120295 (= (isStrictlySorted!537 (t!30362 l!412)) e!569559)))

(declare-fun b!1012462 () Bool)

(declare-fun e!569560 () Bool)

(assert (=> b!1012462 (= e!569559 e!569560)))

(declare-fun res!680049 () Bool)

(assert (=> b!1012462 (=> (not res!680049) (not e!569560))))

(assert (=> b!1012462 (= res!680049 (bvslt (_1!7541 (h!22555 (t!30362 l!412))) (_1!7541 (h!22555 (t!30362 (t!30362 l!412))))))))

(declare-fun b!1012463 () Bool)

(assert (=> b!1012463 (= e!569560 (isStrictlySorted!537 (t!30362 (t!30362 l!412))))))

(assert (= (and d!120295 (not res!680048)) b!1012462))

(assert (= (and b!1012462 res!680049) b!1012463))

(declare-fun m!936025 () Bool)

(assert (=> b!1012463 m!936025))

(assert (=> b!1012438 d!120295))

(declare-fun b!1012566 () Bool)

(assert (=> b!1012566 true))

(assert (=> b!1012566 true))

(assert (=> b!1012566 true))

(declare-fun bs!28827 () Bool)

(declare-fun b!1012573 () Bool)

(assert (= bs!28827 (and b!1012573 b!1012566)))

(declare-fun lt!447580 () tuple2!15060)

(declare-fun lt!447576 () tuple2!15060)

(declare-fun lambda!373 () Int)

(declare-fun lambda!372 () Int)

(declare-fun lt!447581 () List!21361)

(declare-fun lt!447577 () List!21361)

(assert (=> bs!28827 (= (= (Cons!21357 lt!447580 lt!447577) (Cons!21357 lt!447576 lt!447581)) (= lambda!373 lambda!372))))

(assert (=> b!1012573 true))

(assert (=> b!1012573 true))

(assert (=> b!1012573 true))

(declare-fun bs!28828 () Bool)

(declare-fun d!120299 () Bool)

(assert (= bs!28828 (and d!120299 b!1012566)))

(declare-fun lambda!374 () Int)

(assert (=> bs!28828 (= (= (t!30362 l!412) (Cons!21357 lt!447576 lt!447581)) (= lambda!374 lambda!372))))

(declare-fun bs!28829 () Bool)

(assert (= bs!28829 (and d!120299 b!1012573)))

(assert (=> bs!28829 (= (= (t!30362 l!412) (Cons!21357 lt!447580 lt!447577)) (= lambda!374 lambda!373))))

(assert (=> d!120299 true))

(assert (=> d!120299 true))

(declare-fun b!1012567 () Bool)

(declare-fun e!569617 () List!21362)

(assert (=> b!1012567 (= e!569617 Nil!21359)))

(declare-datatypes ((Unit!33074 0))(
  ( (Unit!33075) )
))
(declare-fun call!42546 () Unit!33074)

(declare-fun bm!42543 () Bool)

(declare-fun c!102310 () Bool)

(declare-fun lt!447583 () List!21362)

(declare-fun lt!447579 () List!21362)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!13 (List!21361 List!21362 B!1346 tuple2!15060) Unit!33074)

(assert (=> bm!42543 (= call!42546 (lemmaForallGetValueByKeySameWithASmallerHead!13 (ite c!102310 lt!447581 lt!447577) (ite c!102310 lt!447583 lt!447579) value!115 (ite c!102310 lt!447576 lt!447580)))))

(declare-fun b!1012568 () Bool)

(declare-fun e!569616 () Unit!33074)

(declare-fun Unit!33077 () Unit!33074)

(assert (=> b!1012568 (= e!569616 Unit!33077)))

(declare-fun call!42549 () Bool)

(declare-fun bm!42544 () Bool)

(declare-fun forall!215 (List!21362 Int) Bool)

(assert (=> bm!42544 (= call!42549 (forall!215 (ite c!102310 lt!447583 lt!447579) (ite c!102310 lambda!372 lambda!373)))))

(declare-fun bm!42545 () Bool)

(declare-fun call!42548 () Bool)

(declare-fun call!42547 () List!21362)

(declare-fun isEmpty!794 (List!21362) Bool)

(assert (=> bm!42545 (= call!42548 (isEmpty!794 call!42547))))

(declare-fun b!1012569 () Bool)

(declare-fun e!569615 () List!21362)

(assert (=> b!1012569 (= e!569615 e!569617)))

(declare-fun c!102309 () Bool)

(assert (=> b!1012569 (= c!102309 (and (is-Cons!21357 (t!30362 l!412)) (not (= (_2!7541 (h!22555 (t!30362 l!412))) value!115))))))

(declare-fun b!1012570 () Bool)

(assert (=> b!1012570 (= e!569615 (Cons!21358 (_1!7541 (h!22555 (t!30362 l!412))) call!42547))))

(declare-fun c!102312 () Bool)

(assert (=> b!1012570 (= c!102312 (not call!42548))))

(declare-fun lt!447582 () Unit!33074)

(assert (=> b!1012570 (= lt!447582 e!569616)))

(declare-fun b!1012571 () Bool)

(declare-fun e!569618 () Unit!33074)

(declare-fun Unit!33078 () Unit!33074)

(assert (=> b!1012571 (= e!569618 Unit!33078)))

(declare-fun b!1012572 () Bool)

(declare-fun lt!447584 () Unit!33074)

(assert (=> b!1012572 (= lt!447584 e!569618)))

(declare-fun c!102311 () Bool)

(assert (=> b!1012572 (= c!102311 (not call!42548))))

(declare-fun lt!447574 () List!21362)

(assert (=> b!1012572 (= lt!447574 call!42547)))

(assert (=> b!1012572 (= e!569617 call!42547)))

(declare-fun lt!447575 () List!21362)

