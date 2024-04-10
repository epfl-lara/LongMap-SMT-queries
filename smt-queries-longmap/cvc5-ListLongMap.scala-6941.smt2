; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87390 () Bool)

(assert start!87390)

(declare-fun b!1012597 () Bool)

(declare-fun e!569628 () Bool)

(declare-datatypes ((B!1352 0))(
  ( (B!1353 (val!11760 Int)) )
))
(declare-datatypes ((tuple2!15066 0))(
  ( (tuple2!15067 (_1!7544 (_ BitVec 64)) (_2!7544 B!1352)) )
))
(declare-datatypes ((List!21367 0))(
  ( (Nil!21364) (Cons!21363 (h!22561 tuple2!15066) (t!30368 List!21367)) )
))
(declare-fun l!412 () List!21367)

(declare-fun isStrictlySorted!540 (List!21367) Bool)

(assert (=> b!1012597 (= e!569628 (not (isStrictlySorted!540 (t!30368 l!412))))))

(declare-fun b!1012596 () Bool)

(declare-fun res!680075 () Bool)

(assert (=> b!1012596 (=> (not res!680075) (not e!569628))))

(declare-fun value!115 () B!1352)

(declare-datatypes ((List!21368 0))(
  ( (Nil!21365) (Cons!21364 (h!22562 (_ BitVec 64)) (t!30369 List!21368)) )
))
(declare-fun isEmpty!795 (List!21368) Bool)

(declare-fun getKeysOf!22 (List!21367 B!1352) List!21368)

(assert (=> b!1012596 (= res!680075 (not (isEmpty!795 (getKeysOf!22 (t!30368 l!412) value!115))))))

(declare-fun b!1012595 () Bool)

(declare-fun res!680074 () Bool)

(assert (=> b!1012595 (=> (not res!680074) (not e!569628))))

(assert (=> b!1012595 (= res!680074 (and (not (= (_2!7544 (h!22561 l!412)) value!115)) (is-Cons!21363 l!412)))))

(declare-fun res!680076 () Bool)

(assert (=> start!87390 (=> (not res!680076) (not e!569628))))

(assert (=> start!87390 (= res!680076 (isStrictlySorted!540 l!412))))

(assert (=> start!87390 e!569628))

(declare-fun e!569629 () Bool)

(assert (=> start!87390 e!569629))

(declare-fun tp_is_empty!23419 () Bool)

(assert (=> start!87390 tp_is_empty!23419))

(declare-fun b!1012598 () Bool)

(declare-fun tp!70319 () Bool)

(assert (=> b!1012598 (= e!569629 (and tp_is_empty!23419 tp!70319))))

(assert (= (and start!87390 res!680076) b!1012595))

(assert (= (and b!1012595 res!680074) b!1012596))

(assert (= (and b!1012596 res!680075) b!1012597))

(assert (= (and start!87390 (is-Cons!21363 l!412)) b!1012598))

(declare-fun m!936061 () Bool)

(assert (=> b!1012597 m!936061))

(declare-fun m!936063 () Bool)

(assert (=> b!1012596 m!936063))

(assert (=> b!1012596 m!936063))

(declare-fun m!936065 () Bool)

(assert (=> b!1012596 m!936065))

(declare-fun m!936067 () Bool)

(assert (=> start!87390 m!936067))

(push 1)

(assert tp_is_empty!23419)

(assert (not b!1012597))

(assert (not b!1012596))

(assert (not b!1012598))

(assert (not start!87390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120319 () Bool)

(declare-fun res!680099 () Bool)

(declare-fun e!569646 () Bool)

(assert (=> d!120319 (=> res!680099 e!569646)))

(assert (=> d!120319 (= res!680099 (or (is-Nil!21364 l!412) (is-Nil!21364 (t!30368 l!412))))))

(assert (=> d!120319 (= (isStrictlySorted!540 l!412) e!569646)))

(declare-fun b!1012627 () Bool)

(declare-fun e!569647 () Bool)

(assert (=> b!1012627 (= e!569646 e!569647)))

(declare-fun res!680100 () Bool)

(assert (=> b!1012627 (=> (not res!680100) (not e!569647))))

(assert (=> b!1012627 (= res!680100 (bvslt (_1!7544 (h!22561 l!412)) (_1!7544 (h!22561 (t!30368 l!412)))))))

(declare-fun b!1012628 () Bool)

(assert (=> b!1012628 (= e!569647 (isStrictlySorted!540 (t!30368 l!412)))))

(assert (= (and d!120319 (not res!680099)) b!1012627))

(assert (= (and b!1012627 res!680100) b!1012628))

(assert (=> b!1012628 m!936061))

(assert (=> start!87390 d!120319))

(declare-fun d!120321 () Bool)

(assert (=> d!120321 (= (isEmpty!795 (getKeysOf!22 (t!30368 l!412) value!115)) (is-Nil!21365 (getKeysOf!22 (t!30368 l!412) value!115)))))

(assert (=> b!1012596 d!120321))

(declare-fun b!1012697 () Bool)

(assert (=> b!1012697 true))

(assert (=> b!1012697 true))

(assert (=> b!1012697 true))

(declare-fun bs!28836 () Bool)

(declare-fun b!1012691 () Bool)

(assert (= bs!28836 (and b!1012691 b!1012697)))

(declare-fun lambda!391 () Int)

(declare-fun lambda!390 () Int)

(declare-fun lt!447668 () tuple2!15066)

(declare-fun lt!447658 () List!21367)

(declare-fun lt!447663 () List!21367)

(declare-fun lt!447664 () tuple2!15066)

(assert (=> bs!28836 (= (= (Cons!21363 lt!447668 lt!447663) (Cons!21363 lt!447664 lt!447658)) (= lambda!391 lambda!390))))

(assert (=> b!1012691 true))

(assert (=> b!1012691 true))

(assert (=> b!1012691 true))

(declare-fun bs!28837 () Bool)

(declare-fun d!120323 () Bool)

(assert (= bs!28837 (and d!120323 b!1012697)))

(declare-fun lambda!392 () Int)

(assert (=> bs!28837 (= (= (t!30368 l!412) (Cons!21363 lt!447664 lt!447658)) (= lambda!392 lambda!390))))

(declare-fun bs!28838 () Bool)

(assert (= bs!28838 (and d!120323 b!1012691)))

(assert (=> bs!28838 (= (= (t!30368 l!412) (Cons!21363 lt!447668 lt!447663)) (= lambda!392 lambda!391))))

(assert (=> d!120323 true))

(assert (=> d!120323 true))

(declare-datatypes ((Unit!33082 0))(
  ( (Unit!33083) )
))
(declare-fun e!569682 () Unit!33082)

(declare-fun lt!447662 () Unit!33082)

(assert (=> b!1012691 (= e!569682 lt!447662)))

(assert (=> b!1012691 (= lt!447663 (t!30368 (t!30368 l!412)))))

(declare-fun lt!447665 () List!21368)

(declare-fun call!42570 () List!21368)

(assert (=> b!1012691 (= lt!447665 call!42570)))

(assert (=> b!1012691 (= lt!447668 (h!22561 (t!30368 l!412)))))

(declare-fun call!42571 () Unit!33082)

(assert (=> b!1012691 (= lt!447662 call!42571)))

(declare-fun call!42573 () Bool)

(assert (=> b!1012691 call!42573))

(declare-fun lt!447669 () List!21368)

(declare-fun c!102338 () Bool)

(declare-fun bm!42567 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!15 (List!21367 List!21368 B!1352 tuple2!15066) Unit!33082)

(assert (=> bm!42567 (= call!42571 (lemmaForallGetValueByKeySameWithASmallerHead!15 (ite c!102338 lt!447658 lt!447663) (ite c!102338 lt!447669 lt!447665) value!115 (ite c!102338 lt!447664 lt!447668)))))

(declare-fun bm!42568 () Bool)

(declare-fun call!42572 () Bool)

(assert (=> bm!42568 (= call!42572 (isEmpty!795 call!42570))))

(declare-fun b!1012692 () Bool)

(declare-fun lt!447666 () Unit!33082)

(assert (=> b!1012692 (= lt!447666 e!569682)))

(declare-fun c!102340 () Bool)

(assert (=> b!1012692 (= c!102340 (not call!42572))))

(declare-fun lt!447667 () List!21368)

(assert (=> b!1012692 (= lt!447667 call!42570)))

(declare-fun e!569683 () List!21368)

(assert (=> b!1012692 (= e!569683 call!42570)))

(declare-fun bm!42569 () Bool)

(declare-fun forall!217 (List!21368 Int) Bool)

(assert (=> bm!42569 (= call!42573 (forall!217 (ite c!102338 lt!447669 lt!447665) (ite c!102338 lambda!390 lambda!391)))))

(declare-fun b!1012694 () Bool)

(declare-fun e!569681 () List!21368)

(assert (=> b!1012694 (= e!569681 (Cons!21364 (_1!7544 (h!22561 (t!30368 l!412))) call!42570))))

(declare-fun c!102339 () Bool)

(assert (=> b!1012694 (= c!102339 (not call!42572))))

(declare-fun lt!447659 () Unit!33082)

(declare-fun e!569680 () Unit!33082)

(assert (=> b!1012694 (= lt!447659 e!569680)))

(declare-fun b!1012695 () Bool)

(assert (=> b!1012695 (= e!569683 Nil!21365)))

(declare-fun b!1012696 () Bool)

(assert (=> b!1012696 (= e!569681 e!569683)))

(declare-fun c!102337 () Bool)

(assert (=> b!1012696 (= c!102337 (and (is-Cons!21363 (t!30368 l!412)) (not (= (_2!7544 (h!22561 (t!30368 l!412))) value!115))))))

(assert (=> b!1012697 call!42573))

(declare-fun lt!447661 () Unit!33082)

(assert (=> b!1012697 (= lt!447661 call!42571)))

(assert (=> b!1012697 (= lt!447664 (h!22561 (t!30368 l!412)))))

(assert (=> b!1012697 (= lt!447669 call!42570)))

(assert (=> b!1012697 (= lt!447658 (t!30368 (t!30368 l!412)))))

(assert (=> b!1012697 (= e!569680 lt!447661)))

(declare-fun b!1012698 () Bool)

(declare-fun Unit!33085 () Unit!33082)

(assert (=> b!1012698 (= e!569680 Unit!33085)))

(declare-fun bm!42570 () Bool)

(assert (=> bm!42570 (= call!42570 (getKeysOf!22 (t!30368 (t!30368 l!412)) value!115))))

(declare-fun b!1012693 () Bool)

(declare-fun Unit!33086 () Unit!33082)

(assert (=> b!1012693 (= e!569682 Unit!33086)))

(declare-fun lt!447660 () List!21368)

(assert (=> d!120323 (forall!217 lt!447660 lambda!392)))

(assert (=> d!120323 (= lt!447660 e!569681)))

(assert (=> d!120323 (= c!102338 (and (is-Cons!21363 (t!30368 l!412)) (= (_2!7544 (h!22561 (t!30368 l!412))) value!115)))))

(assert (=> d!120323 (isStrictlySorted!540 (t!30368 l!412))))

(assert (=> d!120323 (= (getKeysOf!22 (t!30368 l!412) value!115) lt!447660)))

(assert (= (and d!120323 c!102338) b!1012694))

(assert (= (and d!120323 (not c!102338)) b!1012696))

(assert (= (and b!1012694 c!102339) b!1012697))

(assert (= (and b!1012694 (not c!102339)) b!1012698))

(assert (= (and b!1012696 c!102337) b!1012692))

(assert (= (and b!1012696 (not c!102337)) b!1012695))

(assert (= (and b!1012692 c!102340) b!1012691))

(assert (= (and b!1012692 (not c!102340)) b!1012693))

(assert (= (or b!1012697 b!1012691) bm!42567))

(assert (= (or b!1012697 b!1012691) bm!42569))

(assert (= (or b!1012694 b!1012697 b!1012691 b!1012692) bm!42570))

(assert (= (or b!1012694 b!1012692) bm!42568))

(declare-fun m!936097 () Bool)

(assert (=> bm!42569 m!936097))

(declare-fun m!936099 () Bool)

(assert (=> bm!42568 m!936099))

(declare-fun m!936101 () Bool)

(assert (=> d!120323 m!936101))

(assert (=> d!120323 m!936061))

(declare-fun m!936103 () Bool)

(assert (=> bm!42570 m!936103))

(declare-fun m!936105 () Bool)

(assert (=> bm!42567 m!936105))

(assert (=> b!1012596 d!120323))

(declare-fun d!120335 () Bool)

(declare-fun res!680115 () Bool)

(declare-fun e!569690 () Bool)

(assert (=> d!120335 (=> res!680115 e!569690)))

(assert (=> d!120335 (= res!680115 (or (is-Nil!21364 (t!30368 l!412)) (is-Nil!21364 (t!30368 (t!30368 l!412)))))))

(assert (=> d!120335 (= (isStrictlySorted!540 (t!30368 l!412)) e!569690)))

(declare-fun b!1012711 () Bool)

(declare-fun e!569691 () Bool)

(assert (=> b!1012711 (= e!569690 e!569691)))

(declare-fun res!680116 () Bool)

(assert (=> b!1012711 (=> (not res!680116) (not e!569691))))

(assert (=> b!1012711 (= res!680116 (bvslt (_1!7544 (h!22561 (t!30368 l!412))) (_1!7544 (h!22561 (t!30368 (t!30368 l!412))))))))

(declare-fun b!1012712 () Bool)

(assert (=> b!1012712 (= e!569691 (isStrictlySorted!540 (t!30368 (t!30368 l!412))))))

(assert (= (and d!120335 (not res!680115)) b!1012711))

(assert (= (and b!1012711 res!680116) b!1012712))

(declare-fun m!936107 () Bool)

(assert (=> b!1012712 m!936107))

(assert (=> b!1012597 d!120335))

(declare-fun b!1012723 () Bool)

(declare-fun e!569698 () Bool)

(declare-fun tp!70330 () Bool)

(assert (=> b!1012723 (= e!569698 (and tp_is_empty!23419 tp!70330))))

(assert (=> b!1012598 (= tp!70319 e!569698)))

(assert (= (and b!1012598 (is-Cons!21363 (t!30368 l!412))) b!1012723))

(push 1)

