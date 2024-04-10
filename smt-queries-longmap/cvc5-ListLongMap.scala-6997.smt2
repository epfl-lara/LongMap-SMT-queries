; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88756 () Bool)

(assert start!88756)

(declare-fun b!1019364 () Bool)

(declare-fun e!573656 () Bool)

(declare-fun e!573657 () Bool)

(assert (=> b!1019364 (= e!573656 e!573657)))

(declare-fun res!683384 () Bool)

(assert (=> b!1019364 (=> (not res!683384) (not e!573657))))

(declare-datatypes ((B!1688 0))(
  ( (B!1689 (val!11928 Int)) )
))
(declare-datatypes ((tuple2!15402 0))(
  ( (tuple2!15403 (_1!7712 (_ BitVec 64)) (_2!7712 B!1688)) )
))
(declare-datatypes ((List!21616 0))(
  ( (Nil!21613) (Cons!21612 (h!22810 tuple2!15402) (t!30620 List!21616)) )
))
(declare-fun l!996 () List!21616)

(declare-fun key!261 () (_ BitVec 64))

(assert (=> b!1019364 (= res!683384 (and (is-Cons!21612 l!996) (bvslt (_1!7712 (h!22810 l!996)) key!261)))))

(declare-fun value!172 () B!1688)

(declare-fun lt!449661 () List!21616)

(declare-fun insertStrictlySorted!359 (List!21616 (_ BitVec 64) B!1688) List!21616)

(assert (=> b!1019364 (= lt!449661 (insertStrictlySorted!359 l!996 key!261 value!172))))

(declare-fun res!683385 () Bool)

(assert (=> start!88756 (=> (not res!683385) (not e!573656))))

(declare-fun isStrictlySorted!681 (List!21616) Bool)

(assert (=> start!88756 (= res!683385 (isStrictlySorted!681 l!996))))

(assert (=> start!88756 e!573656))

(declare-fun e!573655 () Bool)

(assert (=> start!88756 e!573655))

(assert (=> start!88756 true))

(declare-fun tp_is_empty!23755 () Bool)

(assert (=> start!88756 tp_is_empty!23755))

(declare-fun b!1019365 () Bool)

(declare-fun tp!71149 () Bool)

(assert (=> b!1019365 (= e!573655 (and tp_is_empty!23755 tp!71149))))

(declare-fun b!1019366 () Bool)

(declare-fun res!683383 () Bool)

(assert (=> b!1019366 (=> (not res!683383) (not e!573656))))

(declare-fun containsKey!541 (List!21616 (_ BitVec 64)) Bool)

(assert (=> b!1019366 (= res!683383 (containsKey!541 l!996 key!261))))

(declare-fun b!1019367 () Bool)

(declare-fun res!683387 () Bool)

(assert (=> b!1019367 (=> (not res!683387) (not e!573657))))

(assert (=> b!1019367 (= res!683387 (containsKey!541 (t!30620 l!996) key!261))))

(declare-fun b!1019368 () Bool)

(declare-fun length!44 (List!21616) Int)

(assert (=> b!1019368 (= e!573657 (not (= (length!44 lt!449661) (length!44 l!996))))))

(assert (=> b!1019368 (= (length!44 (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172)) (length!44 (t!30620 l!996)))))

(declare-datatypes ((Unit!33287 0))(
  ( (Unit!33288) )
))
(declare-fun lt!449660 () Unit!33287)

(declare-fun lemmaAddExistingKeyPreservesSize!4 (List!21616 (_ BitVec 64) B!1688) Unit!33287)

(assert (=> b!1019368 (= lt!449660 (lemmaAddExistingKeyPreservesSize!4 (t!30620 l!996) key!261 value!172))))

(declare-fun b!1019369 () Bool)

(declare-fun res!683386 () Bool)

(assert (=> b!1019369 (=> (not res!683386) (not e!573657))))

(assert (=> b!1019369 (= res!683386 (isStrictlySorted!681 (t!30620 l!996)))))

(assert (= (and start!88756 res!683385) b!1019366))

(assert (= (and b!1019366 res!683383) b!1019364))

(assert (= (and b!1019364 res!683384) b!1019369))

(assert (= (and b!1019369 res!683386) b!1019367))

(assert (= (and b!1019367 res!683387) b!1019368))

(assert (= (and start!88756 (is-Cons!21612 l!996)) b!1019365))

(declare-fun m!939697 () Bool)

(assert (=> start!88756 m!939697))

(declare-fun m!939699 () Bool)

(assert (=> b!1019368 m!939699))

(declare-fun m!939701 () Bool)

(assert (=> b!1019368 m!939701))

(declare-fun m!939703 () Bool)

(assert (=> b!1019368 m!939703))

(declare-fun m!939705 () Bool)

(assert (=> b!1019368 m!939705))

(assert (=> b!1019368 m!939703))

(declare-fun m!939707 () Bool)

(assert (=> b!1019368 m!939707))

(declare-fun m!939709 () Bool)

(assert (=> b!1019368 m!939709))

(declare-fun m!939711 () Bool)

(assert (=> b!1019366 m!939711))

(declare-fun m!939713 () Bool)

(assert (=> b!1019367 m!939713))

(declare-fun m!939715 () Bool)

(assert (=> b!1019364 m!939715))

(declare-fun m!939717 () Bool)

(assert (=> b!1019369 m!939717))

(push 1)

(assert (not b!1019367))

(assert (not b!1019368))

(assert (not b!1019366))

(assert (not b!1019369))

(assert (not start!88756))

(assert (not b!1019365))

(assert tp_is_empty!23755)

(assert (not b!1019364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122047 () Bool)

(declare-fun res!683434 () Bool)

(declare-fun e!573692 () Bool)

(assert (=> d!122047 (=> res!683434 e!573692)))

(assert (=> d!122047 (= res!683434 (and (is-Cons!21612 l!996) (= (_1!7712 (h!22810 l!996)) key!261)))))

(assert (=> d!122047 (= (containsKey!541 l!996 key!261) e!573692)))

(declare-fun b!1019422 () Bool)

(declare-fun e!573693 () Bool)

(assert (=> b!1019422 (= e!573692 e!573693)))

(declare-fun res!683435 () Bool)

(assert (=> b!1019422 (=> (not res!683435) (not e!573693))))

(assert (=> b!1019422 (= res!683435 (and (or (not (is-Cons!21612 l!996)) (bvsle (_1!7712 (h!22810 l!996)) key!261)) (is-Cons!21612 l!996) (bvslt (_1!7712 (h!22810 l!996)) key!261)))))

(declare-fun b!1019423 () Bool)

(assert (=> b!1019423 (= e!573693 (containsKey!541 (t!30620 l!996) key!261))))

(assert (= (and d!122047 (not res!683434)) b!1019422))

(assert (= (and b!1019422 res!683435) b!1019423))

(assert (=> b!1019423 m!939713))

(assert (=> b!1019366 d!122047))

(declare-fun d!122049 () Bool)

(declare-fun res!683436 () Bool)

(declare-fun e!573694 () Bool)

(assert (=> d!122049 (=> res!683436 e!573694)))

(assert (=> d!122049 (= res!683436 (and (is-Cons!21612 (t!30620 l!996)) (= (_1!7712 (h!22810 (t!30620 l!996))) key!261)))))

(assert (=> d!122049 (= (containsKey!541 (t!30620 l!996) key!261) e!573694)))

(declare-fun b!1019424 () Bool)

(declare-fun e!573695 () Bool)

(assert (=> b!1019424 (= e!573694 e!573695)))

(declare-fun res!683437 () Bool)

(assert (=> b!1019424 (=> (not res!683437) (not e!573695))))

(assert (=> b!1019424 (= res!683437 (and (or (not (is-Cons!21612 (t!30620 l!996))) (bvsle (_1!7712 (h!22810 (t!30620 l!996))) key!261)) (is-Cons!21612 (t!30620 l!996)) (bvslt (_1!7712 (h!22810 (t!30620 l!996))) key!261)))))

(declare-fun b!1019425 () Bool)

(assert (=> b!1019425 (= e!573695 (containsKey!541 (t!30620 (t!30620 l!996)) key!261))))

(assert (= (and d!122049 (not res!683436)) b!1019424))

(assert (= (and b!1019424 res!683437) b!1019425))

(declare-fun m!939767 () Bool)

(assert (=> b!1019425 m!939767))

(assert (=> b!1019367 d!122049))

(declare-fun d!122051 () Bool)

(declare-fun size!31157 (List!21616) Int)

(assert (=> d!122051 (= (length!44 lt!449661) (size!31157 lt!449661))))

(declare-fun bs!29686 () Bool)

(assert (= bs!29686 d!122051))

(declare-fun m!939769 () Bool)

(assert (=> bs!29686 m!939769))

(assert (=> b!1019368 d!122051))

(declare-fun b!1019512 () Bool)

(declare-fun c!103351 () Bool)

(assert (=> b!1019512 (= c!103351 (and (is-Cons!21612 (t!30620 l!996)) (bvsgt (_1!7712 (h!22810 (t!30620 l!996))) key!261)))))

(declare-fun e!573746 () List!21616)

(declare-fun e!573745 () List!21616)

(assert (=> b!1019512 (= e!573746 e!573745)))

(declare-fun d!122055 () Bool)

(declare-fun e!573744 () Bool)

(assert (=> d!122055 e!573744))

(declare-fun res!683461 () Bool)

(assert (=> d!122055 (=> (not res!683461) (not e!573744))))

(declare-fun lt!449682 () List!21616)

(assert (=> d!122055 (= res!683461 (isStrictlySorted!681 lt!449682))))

(declare-fun e!573742 () List!21616)

(assert (=> d!122055 (= lt!449682 e!573742)))

(declare-fun c!103354 () Bool)

(assert (=> d!122055 (= c!103354 (and (is-Cons!21612 (t!30620 l!996)) (bvslt (_1!7712 (h!22810 (t!30620 l!996))) key!261)))))

(assert (=> d!122055 (isStrictlySorted!681 (t!30620 l!996))))

(assert (=> d!122055 (= (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172) lt!449682)))

(declare-fun b!1019513 () Bool)

(declare-fun call!43099 () List!21616)

(assert (=> b!1019513 (= e!573745 call!43099)))

(declare-fun b!1019514 () Bool)

(declare-fun res!683460 () Bool)

(assert (=> b!1019514 (=> (not res!683460) (not e!573744))))

(assert (=> b!1019514 (= res!683460 (containsKey!541 lt!449682 key!261))))

(declare-fun b!1019515 () Bool)

(declare-fun call!43101 () List!21616)

(assert (=> b!1019515 (= e!573742 call!43101)))

(declare-fun b!1019516 () Bool)

(declare-fun call!43100 () List!21616)

(assert (=> b!1019516 (= e!573746 call!43100)))

(declare-fun e!573743 () List!21616)

(declare-fun bm!43096 () Bool)

(declare-fun $colon$colon!591 (List!21616 tuple2!15402) List!21616)

(assert (=> bm!43096 (= call!43101 ($colon$colon!591 e!573743 (ite c!103354 (h!22810 (t!30620 l!996)) (tuple2!15403 key!261 value!172))))))

(declare-fun c!103353 () Bool)

(assert (=> bm!43096 (= c!103353 c!103354)))

(declare-fun c!103352 () Bool)

(declare-fun b!1019517 () Bool)

(assert (=> b!1019517 (= e!573743 (ite c!103352 (t!30620 (t!30620 l!996)) (ite c!103351 (Cons!21612 (h!22810 (t!30620 l!996)) (t!30620 (t!30620 l!996))) Nil!21613)))))

(declare-fun bm!43097 () Bool)

(assert (=> bm!43097 (= call!43100 call!43101)))

(declare-fun b!1019518 () Bool)

(assert (=> b!1019518 (= e!573745 call!43099)))

(declare-fun b!1019519 () Bool)

(assert (=> b!1019519 (= e!573743 (insertStrictlySorted!359 (t!30620 (t!30620 l!996)) key!261 value!172))))

(declare-fun b!1019520 () Bool)

(assert (=> b!1019520 (= e!573742 e!573746)))

(assert (=> b!1019520 (= c!103352 (and (is-Cons!21612 (t!30620 l!996)) (= (_1!7712 (h!22810 (t!30620 l!996))) key!261)))))

(declare-fun b!1019521 () Bool)

(declare-fun contains!5909 (List!21616 tuple2!15402) Bool)

(assert (=> b!1019521 (= e!573744 (contains!5909 lt!449682 (tuple2!15403 key!261 value!172)))))

(declare-fun bm!43098 () Bool)

(assert (=> bm!43098 (= call!43099 call!43100)))

(assert (= (and d!122055 c!103354) b!1019515))

(assert (= (and d!122055 (not c!103354)) b!1019520))

(assert (= (and b!1019520 c!103352) b!1019516))

(assert (= (and b!1019520 (not c!103352)) b!1019512))

(assert (= (and b!1019512 c!103351) b!1019518))

(assert (= (and b!1019512 (not c!103351)) b!1019513))

(assert (= (or b!1019518 b!1019513) bm!43098))

(assert (= (or b!1019516 bm!43098) bm!43097))

(assert (= (or b!1019515 bm!43097) bm!43096))

(assert (= (and bm!43096 c!103353) b!1019519))

(assert (= (and bm!43096 (not c!103353)) b!1019517))

(assert (= (and d!122055 res!683461) b!1019514))

(assert (= (and b!1019514 res!683460) b!1019521))

(declare-fun m!939795 () Bool)

(assert (=> b!1019521 m!939795))

(declare-fun m!939797 () Bool)

(assert (=> b!1019514 m!939797))

(declare-fun m!939799 () Bool)

(assert (=> d!122055 m!939799))

(assert (=> d!122055 m!939717))

(declare-fun m!939801 () Bool)

(assert (=> b!1019519 m!939801))

(declare-fun m!939803 () Bool)

(assert (=> bm!43096 m!939803))

(assert (=> b!1019368 d!122055))

(declare-fun d!122069 () Bool)

(assert (=> d!122069 (= (length!44 (t!30620 l!996)) (size!31157 (t!30620 l!996)))))

(declare-fun bs!29690 () Bool)

(assert (= bs!29690 d!122069))

(declare-fun m!939805 () Bool)

(assert (=> bs!29690 m!939805))

(assert (=> b!1019368 d!122069))

(declare-fun d!122071 () Bool)

(assert (=> d!122071 (= (length!44 l!996) (size!31157 l!996))))

(declare-fun bs!29691 () Bool)

(assert (= bs!29691 d!122071))

(declare-fun m!939807 () Bool)

(assert (=> bs!29691 m!939807))

(assert (=> b!1019368 d!122071))

(declare-fun d!122073 () Bool)

(assert (=> d!122073 (= (length!44 (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172)) (length!44 (t!30620 l!996)))))

(declare-fun lt!449689 () Unit!33287)

(declare-fun choose!1675 (List!21616 (_ BitVec 64) B!1688) Unit!33287)

(assert (=> d!122073 (= lt!449689 (choose!1675 (t!30620 l!996) key!261 value!172))))

(assert (=> d!122073 (= (lemmaAddExistingKeyPreservesSize!4 (t!30620 l!996) key!261 value!172) lt!449689)))

(declare-fun bs!29694 () Bool)

(assert (= bs!29694 d!122073))

(assert (=> bs!29694 m!939703))

(assert (=> bs!29694 m!939703))

(assert (=> bs!29694 m!939707))

(assert (=> bs!29694 m!939705))

(declare-fun m!939821 () Bool)

(assert (=> bs!29694 m!939821))

(assert (=> b!1019368 d!122073))

(declare-fun d!122083 () Bool)

(assert (=> d!122083 (= (length!44 (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172)) (size!31157 (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172)))))

(declare-fun bs!29695 () Bool)

(assert (= bs!29695 d!122083))

(assert (=> bs!29695 m!939703))

(declare-fun m!939823 () Bool)

(assert (=> bs!29695 m!939823))

(assert (=> b!1019368 d!122083))

(declare-fun d!122085 () Bool)

(declare-fun res!683478 () Bool)

(declare-fun e!573769 () Bool)

(assert (=> d!122085 (=> res!683478 e!573769)))

(assert (=> d!122085 (= res!683478 (or (is-Nil!21613 l!996) (is-Nil!21613 (t!30620 l!996))))))

(assert (=> d!122085 (= (isStrictlySorted!681 l!996) e!573769)))

(declare-fun b!1019551 () Bool)

(declare-fun e!573770 () Bool)

(assert (=> b!1019551 (= e!573769 e!573770)))

(declare-fun res!683479 () Bool)

(assert (=> b!1019551 (=> (not res!683479) (not e!573770))))

(assert (=> b!1019551 (= res!683479 (bvslt (_1!7712 (h!22810 l!996)) (_1!7712 (h!22810 (t!30620 l!996)))))))

(declare-fun b!1019552 () Bool)

(assert (=> b!1019552 (= e!573770 (isStrictlySorted!681 (t!30620 l!996)))))

(assert (= (and d!122085 (not res!683478)) b!1019551))

(assert (= (and b!1019551 res!683479) b!1019552))

(assert (=> b!1019552 m!939717))

(assert (=> start!88756 d!122085))

(declare-fun d!122089 () Bool)

(declare-fun res!683482 () Bool)

(declare-fun e!573776 () Bool)

(assert (=> d!122089 (=> res!683482 e!573776)))

(assert (=> d!122089 (= res!683482 (or (is-Nil!21613 (t!30620 l!996)) (is-Nil!21613 (t!30620 (t!30620 l!996)))))))

(assert (=> d!122089 (= (isStrictlySorted!681 (t!30620 l!996)) e!573776)))

(declare-fun b!1019563 () Bool)

(declare-fun e!573777 () Bool)

(assert (=> b!1019563 (= e!573776 e!573777)))

(declare-fun res!683483 () Bool)

(assert (=> b!1019563 (=> (not res!683483) (not e!573777))))

(assert (=> b!1019563 (= res!683483 (bvslt (_1!7712 (h!22810 (t!30620 l!996))) (_1!7712 (h!22810 (t!30620 (t!30620 l!996))))))))

(declare-fun b!1019564 () Bool)

(assert (=> b!1019564 (= e!573777 (isStrictlySorted!681 (t!30620 (t!30620 l!996))))))

(assert (= (and d!122089 (not res!683482)) b!1019563))

(assert (= (and b!1019563 res!683483) b!1019564))

(declare-fun m!939827 () Bool)

(assert (=> b!1019564 m!939827))

(assert (=> b!1019369 d!122089))

(declare-fun b!1019565 () Bool)

(declare-fun c!103363 () Bool)

(assert (=> b!1019565 (= c!103363 (and (is-Cons!21612 l!996) (bvsgt (_1!7712 (h!22810 l!996)) key!261)))))

(declare-fun e!573782 () List!21616)

(declare-fun e!573781 () List!21616)

(assert (=> b!1019565 (= e!573782 e!573781)))

(declare-fun d!122091 () Bool)

(declare-fun e!573780 () Bool)

(assert (=> d!122091 e!573780))

(declare-fun res!683485 () Bool)

(assert (=> d!122091 (=> (not res!683485) (not e!573780))))

(declare-fun lt!449691 () List!21616)

(assert (=> d!122091 (= res!683485 (isStrictlySorted!681 lt!449691))))

(declare-fun e!573778 () List!21616)

(assert (=> d!122091 (= lt!449691 e!573778)))

(declare-fun c!103366 () Bool)

(assert (=> d!122091 (= c!103366 (and (is-Cons!21612 l!996) (bvslt (_1!7712 (h!22810 l!996)) key!261)))))

(assert (=> d!122091 (isStrictlySorted!681 l!996)))

(assert (=> d!122091 (= (insertStrictlySorted!359 l!996 key!261 value!172) lt!449691)))

(declare-fun b!1019566 () Bool)

(declare-fun call!43108 () List!21616)

(assert (=> b!1019566 (= e!573781 call!43108)))

(declare-fun b!1019567 () Bool)

(declare-fun res!683484 () Bool)

(assert (=> b!1019567 (=> (not res!683484) (not e!573780))))

(assert (=> b!1019567 (= res!683484 (containsKey!541 lt!449691 key!261))))

(declare-fun b!1019568 () Bool)

(declare-fun call!43110 () List!21616)

(assert (=> b!1019568 (= e!573778 call!43110)))

(declare-fun b!1019569 () Bool)

(declare-fun call!43109 () List!21616)

(assert (=> b!1019569 (= e!573782 call!43109)))

(declare-fun e!573779 () List!21616)

(declare-fun bm!43105 () Bool)

(assert (=> bm!43105 (= call!43110 ($colon$colon!591 e!573779 (ite c!103366 (h!22810 l!996) (tuple2!15403 key!261 value!172))))))

(declare-fun c!103365 () Bool)

(assert (=> bm!43105 (= c!103365 c!103366)))

(declare-fun c!103364 () Bool)

(declare-fun b!1019570 () Bool)

(assert (=> b!1019570 (= e!573779 (ite c!103364 (t!30620 l!996) (ite c!103363 (Cons!21612 (h!22810 l!996) (t!30620 l!996)) Nil!21613)))))

(declare-fun bm!43106 () Bool)

(assert (=> bm!43106 (= call!43109 call!43110)))

(declare-fun b!1019571 () Bool)

(assert (=> b!1019571 (= e!573781 call!43108)))

(declare-fun b!1019572 () Bool)

(assert (=> b!1019572 (= e!573779 (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172))))

(declare-fun b!1019573 () Bool)

(assert (=> b!1019573 (= e!573778 e!573782)))

(assert (=> b!1019573 (= c!103364 (and (is-Cons!21612 l!996) (= (_1!7712 (h!22810 l!996)) key!261)))))

(declare-fun b!1019574 () Bool)

(assert (=> b!1019574 (= e!573780 (contains!5909 lt!449691 (tuple2!15403 key!261 value!172)))))

(declare-fun bm!43107 () Bool)

(assert (=> bm!43107 (= call!43108 call!43109)))

(assert (= (and d!122091 c!103366) b!1019568))

(assert (= (and d!122091 (not c!103366)) b!1019573))

(assert (= (and b!1019573 c!103364) b!1019569))

(assert (= (and b!1019573 (not c!103364)) b!1019565))

(assert (= (and b!1019565 c!103363) b!1019571))

(assert (= (and b!1019565 (not c!103363)) b!1019566))

(assert (= (or b!1019571 b!1019566) bm!43107))

(assert (= (or b!1019569 bm!43107) bm!43106))

(assert (= (or b!1019568 bm!43106) bm!43105))

(assert (= (and bm!43105 c!103365) b!1019572))

(assert (= (and bm!43105 (not c!103365)) b!1019570))

(assert (= (and d!122091 res!683485) b!1019567))

(assert (= (and b!1019567 res!683484) b!1019574))

(declare-fun m!939839 () Bool)

(assert (=> b!1019574 m!939839))

(declare-fun m!939841 () Bool)

(assert (=> b!1019567 m!939841))

(declare-fun m!939843 () Bool)

(assert (=> d!122091 m!939843))

(assert (=> d!122091 m!939697))

(assert (=> b!1019572 m!939703))

(declare-fun m!939845 () Bool)

(assert (=> bm!43105 m!939845))

(assert (=> b!1019364 d!122091))

(declare-fun b!1019579 () Bool)

(declare-fun e!573785 () Bool)

(declare-fun tp!71161 () Bool)

(assert (=> b!1019579 (= e!573785 (and tp_is_empty!23755 tp!71161))))

(assert (=> b!1019365 (= tp!71149 e!573785)))

(assert (= (and b!1019365 (is-Cons!21612 (t!30620 l!996))) b!1019579))

(push 1)

(assert (not b!1019564))

(assert (not b!1019423))

(assert (not d!122071))

(assert (not d!122073))

(assert (not b!1019579))

(assert (not b!1019425))

(assert (not b!1019552))

(assert (not d!122069))

(assert (not bm!43096))

(assert tp_is_empty!23755)

(assert (not bm!43105))

(assert (not b!1019567))

(assert (not d!122051))

(assert (not b!1019572))

(assert (not b!1019519))

(assert (not d!122055))

(assert (not d!122091))

(assert (not d!122083))

(assert (not b!1019514))

(assert (not b!1019521))

(assert (not b!1019574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!122139 () Bool)

(declare-fun res!683512 () Bool)

(declare-fun e!573825 () Bool)

(assert (=> d!122139 (=> res!683512 e!573825)))

(assert (=> d!122139 (= res!683512 (and (is-Cons!21612 (t!30620 (t!30620 l!996))) (= (_1!7712 (h!22810 (t!30620 (t!30620 l!996)))) key!261)))))

(assert (=> d!122139 (= (containsKey!541 (t!30620 (t!30620 l!996)) key!261) e!573825)))

(declare-fun b!1019632 () Bool)

(declare-fun e!573826 () Bool)

(assert (=> b!1019632 (= e!573825 e!573826)))

(declare-fun res!683513 () Bool)

(assert (=> b!1019632 (=> (not res!683513) (not e!573826))))

(assert (=> b!1019632 (= res!683513 (and (or (not (is-Cons!21612 (t!30620 (t!30620 l!996)))) (bvsle (_1!7712 (h!22810 (t!30620 (t!30620 l!996)))) key!261)) (is-Cons!21612 (t!30620 (t!30620 l!996))) (bvslt (_1!7712 (h!22810 (t!30620 (t!30620 l!996)))) key!261)))))

(declare-fun b!1019633 () Bool)

(assert (=> b!1019633 (= e!573826 (containsKey!541 (t!30620 (t!30620 (t!30620 l!996))) key!261))))

(assert (= (and d!122139 (not res!683512)) b!1019632))

(assert (= (and b!1019632 res!683513) b!1019633))

(declare-fun m!939899 () Bool)

(assert (=> b!1019633 m!939899))

(assert (=> b!1019425 d!122139))

(declare-fun b!1019634 () Bool)

(declare-fun c!103377 () Bool)

(assert (=> b!1019634 (= c!103377 (and (is-Cons!21612 (t!30620 (t!30620 l!996))) (bvsgt (_1!7712 (h!22810 (t!30620 (t!30620 l!996)))) key!261)))))

(declare-fun e!573831 () List!21616)

(declare-fun e!573830 () List!21616)

(assert (=> b!1019634 (= e!573831 e!573830)))

(declare-fun d!122141 () Bool)

(declare-fun e!573829 () Bool)

(assert (=> d!122141 e!573829))

(declare-fun res!683515 () Bool)

(assert (=> d!122141 (=> (not res!683515) (not e!573829))))

(declare-fun lt!449706 () List!21616)

(assert (=> d!122141 (= res!683515 (isStrictlySorted!681 lt!449706))))

(declare-fun e!573827 () List!21616)

(assert (=> d!122141 (= lt!449706 e!573827)))

(declare-fun c!103380 () Bool)

(assert (=> d!122141 (= c!103380 (and (is-Cons!21612 (t!30620 (t!30620 l!996))) (bvslt (_1!7712 (h!22810 (t!30620 (t!30620 l!996)))) key!261)))))

(assert (=> d!122141 (isStrictlySorted!681 (t!30620 (t!30620 l!996)))))

(assert (=> d!122141 (= (insertStrictlySorted!359 (t!30620 (t!30620 l!996)) key!261 value!172) lt!449706)))

(declare-fun b!1019635 () Bool)

(declare-fun call!43114 () List!21616)

(assert (=> b!1019635 (= e!573830 call!43114)))

(declare-fun b!1019636 () Bool)

(declare-fun res!683514 () Bool)

(assert (=> b!1019636 (=> (not res!683514) (not e!573829))))

(assert (=> b!1019636 (= res!683514 (containsKey!541 lt!449706 key!261))))

(declare-fun b!1019637 () Bool)

(declare-fun call!43116 () List!21616)

(assert (=> b!1019637 (= e!573827 call!43116)))

(declare-fun b!1019638 () Bool)

(declare-fun call!43115 () List!21616)

(assert (=> b!1019638 (= e!573831 call!43115)))

(declare-fun e!573828 () List!21616)

(declare-fun bm!43111 () Bool)

(assert (=> bm!43111 (= call!43116 ($colon$colon!591 e!573828 (ite c!103380 (h!22810 (t!30620 (t!30620 l!996))) (tuple2!15403 key!261 value!172))))))

(declare-fun c!103379 () Bool)

(assert (=> bm!43111 (= c!103379 c!103380)))

(declare-fun c!103378 () Bool)

(declare-fun b!1019639 () Bool)

(assert (=> b!1019639 (= e!573828 (ite c!103378 (t!30620 (t!30620 (t!30620 l!996))) (ite c!103377 (Cons!21612 (h!22810 (t!30620 (t!30620 l!996))) (t!30620 (t!30620 (t!30620 l!996)))) Nil!21613)))))

(declare-fun bm!43112 () Bool)

(assert (=> bm!43112 (= call!43115 call!43116)))

(declare-fun b!1019640 () Bool)

(assert (=> b!1019640 (= e!573830 call!43114)))

(declare-fun b!1019641 () Bool)

(assert (=> b!1019641 (= e!573828 (insertStrictlySorted!359 (t!30620 (t!30620 (t!30620 l!996))) key!261 value!172))))

(declare-fun b!1019642 () Bool)

(assert (=> b!1019642 (= e!573827 e!573831)))

(assert (=> b!1019642 (= c!103378 (and (is-Cons!21612 (t!30620 (t!30620 l!996))) (= (_1!7712 (h!22810 (t!30620 (t!30620 l!996)))) key!261)))))

(declare-fun b!1019643 () Bool)

(assert (=> b!1019643 (= e!573829 (contains!5909 lt!449706 (tuple2!15403 key!261 value!172)))))

(declare-fun bm!43113 () Bool)

(assert (=> bm!43113 (= call!43114 call!43115)))

(assert (= (and d!122141 c!103380) b!1019637))

(assert (= (and d!122141 (not c!103380)) b!1019642))

(assert (= (and b!1019642 c!103378) b!1019638))

(assert (= (and b!1019642 (not c!103378)) b!1019634))

(assert (= (and b!1019634 c!103377) b!1019640))

(assert (= (and b!1019634 (not c!103377)) b!1019635))

(assert (= (or b!1019640 b!1019635) bm!43113))

(assert (= (or b!1019638 bm!43113) bm!43112))

(assert (= (or b!1019637 bm!43112) bm!43111))

(assert (= (and bm!43111 c!103379) b!1019641))

(assert (= (and bm!43111 (not c!103379)) b!1019639))

(assert (= (and d!122141 res!683515) b!1019636))

(assert (= (and b!1019636 res!683514) b!1019643))

(declare-fun m!939901 () Bool)

(assert (=> b!1019643 m!939901))

(declare-fun m!939903 () Bool)

(assert (=> b!1019636 m!939903))

(declare-fun m!939905 () Bool)

(assert (=> d!122141 m!939905))

(assert (=> d!122141 m!939827))

(declare-fun m!939907 () Bool)

(assert (=> b!1019641 m!939907))

(declare-fun m!939909 () Bool)

(assert (=> bm!43111 m!939909))

(assert (=> b!1019519 d!122141))

(declare-fun d!122143 () Bool)

(declare-fun res!683516 () Bool)

(declare-fun e!573832 () Bool)

(assert (=> d!122143 (=> res!683516 e!573832)))

(assert (=> d!122143 (= res!683516 (or (is-Nil!21613 lt!449691) (is-Nil!21613 (t!30620 lt!449691))))))

(assert (=> d!122143 (= (isStrictlySorted!681 lt!449691) e!573832)))

(declare-fun b!1019644 () Bool)

(declare-fun e!573833 () Bool)

(assert (=> b!1019644 (= e!573832 e!573833)))

(declare-fun res!683517 () Bool)

(assert (=> b!1019644 (=> (not res!683517) (not e!573833))))

(assert (=> b!1019644 (= res!683517 (bvslt (_1!7712 (h!22810 lt!449691)) (_1!7712 (h!22810 (t!30620 lt!449691)))))))

(declare-fun b!1019645 () Bool)

(assert (=> b!1019645 (= e!573833 (isStrictlySorted!681 (t!30620 lt!449691)))))

(assert (= (and d!122143 (not res!683516)) b!1019644))

(assert (= (and b!1019644 res!683517) b!1019645))

(declare-fun m!939911 () Bool)

(assert (=> b!1019645 m!939911))

(assert (=> d!122091 d!122143))

(assert (=> d!122091 d!122085))

(declare-fun d!122145 () Bool)

(declare-fun lt!449709 () Int)

(assert (=> d!122145 (>= lt!449709 0)))

(declare-fun e!573836 () Int)

(assert (=> d!122145 (= lt!449709 e!573836)))

(declare-fun c!103383 () Bool)

(assert (=> d!122145 (= c!103383 (is-Nil!21613 (t!30620 l!996)))))

(assert (=> d!122145 (= (size!31157 (t!30620 l!996)) lt!449709)))

(declare-fun b!1019650 () Bool)

(assert (=> b!1019650 (= e!573836 0)))

(declare-fun b!1019651 () Bool)

(assert (=> b!1019651 (= e!573836 (+ 1 (size!31157 (t!30620 (t!30620 l!996)))))))

(assert (= (and d!122145 c!103383) b!1019650))

(assert (= (and d!122145 (not c!103383)) b!1019651))

(declare-fun m!939913 () Bool)

(assert (=> b!1019651 m!939913))

(assert (=> d!122069 d!122145))

(declare-fun d!122147 () Bool)

(assert (=> d!122147 (= ($colon$colon!591 e!573779 (ite c!103366 (h!22810 l!996) (tuple2!15403 key!261 value!172))) (Cons!21612 (ite c!103366 (h!22810 l!996) (tuple2!15403 key!261 value!172)) e!573779))))

(assert (=> bm!43105 d!122147))

(assert (=> d!122073 d!122083))

(assert (=> d!122073 d!122055))

(assert (=> d!122073 d!122069))

(declare-fun d!122149 () Bool)

(assert (=> d!122149 (= (length!44 (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172)) (length!44 (t!30620 l!996)))))

(assert (=> d!122149 true))

(declare-fun _$10!28 () Unit!33287)

(assert (=> d!122149 (= (choose!1675 (t!30620 l!996) key!261 value!172) _$10!28)))

(declare-fun bs!29702 () Bool)

(assert (= bs!29702 d!122149))

(assert (=> bs!29702 m!939703))

(assert (=> bs!29702 m!939703))

(assert (=> bs!29702 m!939707))

(assert (=> bs!29702 m!939705))

(assert (=> d!122073 d!122149))

(declare-fun lt!449712 () Bool)

(declare-fun d!122151 () Bool)

(declare-fun content!489 (List!21616) (Set tuple2!15402))

(assert (=> d!122151 (= lt!449712 (set.member (tuple2!15403 key!261 value!172) (content!489 lt!449682)))))

(declare-fun e!573841 () Bool)

(assert (=> d!122151 (= lt!449712 e!573841)))

(declare-fun res!683522 () Bool)

(assert (=> d!122151 (=> (not res!683522) (not e!573841))))

(assert (=> d!122151 (= res!683522 (is-Cons!21612 lt!449682))))

(assert (=> d!122151 (= (contains!5909 lt!449682 (tuple2!15403 key!261 value!172)) lt!449712)))

(declare-fun b!1019656 () Bool)

(declare-fun e!573842 () Bool)

(assert (=> b!1019656 (= e!573841 e!573842)))

(declare-fun res!683523 () Bool)

(assert (=> b!1019656 (=> res!683523 e!573842)))

(assert (=> b!1019656 (= res!683523 (= (h!22810 lt!449682) (tuple2!15403 key!261 value!172)))))

(declare-fun b!1019657 () Bool)

(assert (=> b!1019657 (= e!573842 (contains!5909 (t!30620 lt!449682) (tuple2!15403 key!261 value!172)))))

(assert (= (and d!122151 res!683522) b!1019656))

(assert (= (and b!1019656 (not res!683523)) b!1019657))

(declare-fun m!939915 () Bool)

(assert (=> d!122151 m!939915))

(declare-fun m!939917 () Bool)

(assert (=> d!122151 m!939917))

(declare-fun m!939919 () Bool)

(assert (=> b!1019657 m!939919))

(assert (=> b!1019521 d!122151))

(assert (=> b!1019423 d!122049))

(declare-fun d!122153 () Bool)

(declare-fun res!683524 () Bool)

(declare-fun e!573843 () Bool)

(assert (=> d!122153 (=> res!683524 e!573843)))

(assert (=> d!122153 (= res!683524 (or (is-Nil!21613 lt!449682) (is-Nil!21613 (t!30620 lt!449682))))))

(assert (=> d!122153 (= (isStrictlySorted!681 lt!449682) e!573843)))

(declare-fun b!1019658 () Bool)

(declare-fun e!573844 () Bool)

(assert (=> b!1019658 (= e!573843 e!573844)))

(declare-fun res!683525 () Bool)

(assert (=> b!1019658 (=> (not res!683525) (not e!573844))))

(assert (=> b!1019658 (= res!683525 (bvslt (_1!7712 (h!22810 lt!449682)) (_1!7712 (h!22810 (t!30620 lt!449682)))))))

(declare-fun b!1019659 () Bool)

(assert (=> b!1019659 (= e!573844 (isStrictlySorted!681 (t!30620 lt!449682)))))

(assert (= (and d!122153 (not res!683524)) b!1019658))

(assert (= (and b!1019658 res!683525) b!1019659))

(declare-fun m!939921 () Bool)

(assert (=> b!1019659 m!939921))

(assert (=> d!122055 d!122153))

(assert (=> d!122055 d!122089))

(assert (=> b!1019552 d!122089))

(declare-fun d!122155 () Bool)

(declare-fun lt!449713 () Int)

(assert (=> d!122155 (>= lt!449713 0)))

(declare-fun e!573845 () Int)

(assert (=> d!122155 (= lt!449713 e!573845)))

(declare-fun c!103384 () Bool)

(assert (=> d!122155 (= c!103384 (is-Nil!21613 lt!449661))))

(assert (=> d!122155 (= (size!31157 lt!449661) lt!449713)))

(declare-fun b!1019660 () Bool)

(assert (=> b!1019660 (= e!573845 0)))

(declare-fun b!1019661 () Bool)

(assert (=> b!1019661 (= e!573845 (+ 1 (size!31157 (t!30620 lt!449661))))))

(assert (= (and d!122155 c!103384) b!1019660))

(assert (= (and d!122155 (not c!103384)) b!1019661))

(declare-fun m!939923 () Bool)

(assert (=> b!1019661 m!939923))

(assert (=> d!122051 d!122155))

(declare-fun d!122157 () Bool)

(declare-fun res!683526 () Bool)

(declare-fun e!573846 () Bool)

(assert (=> d!122157 (=> res!683526 e!573846)))

(assert (=> d!122157 (= res!683526 (and (is-Cons!21612 lt!449682) (= (_1!7712 (h!22810 lt!449682)) key!261)))))

(assert (=> d!122157 (= (containsKey!541 lt!449682 key!261) e!573846)))

(declare-fun b!1019662 () Bool)

(declare-fun e!573847 () Bool)

(assert (=> b!1019662 (= e!573846 e!573847)))

(declare-fun res!683527 () Bool)

(assert (=> b!1019662 (=> (not res!683527) (not e!573847))))

(assert (=> b!1019662 (= res!683527 (and (or (not (is-Cons!21612 lt!449682)) (bvsle (_1!7712 (h!22810 lt!449682)) key!261)) (is-Cons!21612 lt!449682) (bvslt (_1!7712 (h!22810 lt!449682)) key!261)))))

(declare-fun b!1019663 () Bool)

(assert (=> b!1019663 (= e!573847 (containsKey!541 (t!30620 lt!449682) key!261))))

(assert (= (and d!122157 (not res!683526)) b!1019662))

(assert (= (and b!1019662 res!683527) b!1019663))

(declare-fun m!939925 () Bool)

(assert (=> b!1019663 m!939925))

(assert (=> b!1019514 d!122157))

(assert (=> b!1019572 d!122055))

(declare-fun d!122159 () Bool)

(declare-fun lt!449714 () Int)

(assert (=> d!122159 (>= lt!449714 0)))

(declare-fun e!573848 () Int)

(assert (=> d!122159 (= lt!449714 e!573848)))

(declare-fun c!103385 () Bool)

(assert (=> d!122159 (= c!103385 (is-Nil!21613 (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172)))))

(assert (=> d!122159 (= (size!31157 (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172)) lt!449714)))

(declare-fun b!1019664 () Bool)

(assert (=> b!1019664 (= e!573848 0)))

(declare-fun b!1019665 () Bool)

(assert (=> b!1019665 (= e!573848 (+ 1 (size!31157 (t!30620 (insertStrictlySorted!359 (t!30620 l!996) key!261 value!172)))))))

(assert (= (and d!122159 c!103385) b!1019664))

(assert (= (and d!122159 (not c!103385)) b!1019665))

(declare-fun m!939927 () Bool)

(assert (=> b!1019665 m!939927))

(assert (=> d!122083 d!122159))

(declare-fun d!122161 () Bool)

(declare-fun lt!449715 () Int)

(assert (=> d!122161 (>= lt!449715 0)))

(declare-fun e!573849 () Int)

(assert (=> d!122161 (= lt!449715 e!573849)))

(declare-fun c!103386 () Bool)

(assert (=> d!122161 (= c!103386 (is-Nil!21613 l!996))))

(assert (=> d!122161 (= (size!31157 l!996) lt!449715)))

(declare-fun b!1019666 () Bool)

(assert (=> b!1019666 (= e!573849 0)))

(declare-fun b!1019667 () Bool)

(assert (=> b!1019667 (= e!573849 (+ 1 (size!31157 (t!30620 l!996))))))

(assert (= (and d!122161 c!103386) b!1019666))

(assert (= (and d!122161 (not c!103386)) b!1019667))

(assert (=> b!1019667 m!939805))

(assert (=> d!122071 d!122161))

(declare-fun d!122163 () Bool)

(assert (=> d!122163 (= ($colon$colon!591 e!573743 (ite c!103354 (h!22810 (t!30620 l!996)) (tuple2!15403 key!261 value!172))) (Cons!21612 (ite c!103354 (h!22810 (t!30620 l!996)) (tuple2!15403 key!261 value!172)) e!573743))))

(assert (=> bm!43096 d!122163))

(declare-fun d!122165 () Bool)

(declare-fun lt!449716 () Bool)

(assert (=> d!122165 (= lt!449716 (set.member (tuple2!15403 key!261 value!172) (content!489 lt!449691)))))

(declare-fun e!573850 () Bool)

(assert (=> d!122165 (= lt!449716 e!573850)))

(declare-fun res!683528 () Bool)

(assert (=> d!122165 (=> (not res!683528) (not e!573850))))

(assert (=> d!122165 (= res!683528 (is-Cons!21612 lt!449691))))

(assert (=> d!122165 (= (contains!5909 lt!449691 (tuple2!15403 key!261 value!172)) lt!449716)))

(declare-fun b!1019668 () Bool)

(declare-fun e!573851 () Bool)

(assert (=> b!1019668 (= e!573850 e!573851)))

(declare-fun res!683529 () Bool)

(assert (=> b!1019668 (=> res!683529 e!573851)))

(assert (=> b!1019668 (= res!683529 (= (h!22810 lt!449691) (tuple2!15403 key!261 value!172)))))

(declare-fun b!1019669 () Bool)

(assert (=> b!1019669 (= e!573851 (contains!5909 (t!30620 lt!449691) (tuple2!15403 key!261 value!172)))))

(assert (= (and d!122165 res!683528) b!1019668))

(assert (= (and b!1019668 (not res!683529)) b!1019669))

(declare-fun m!939929 () Bool)

(assert (=> d!122165 m!939929))

(declare-fun m!939931 () Bool)

(assert (=> d!122165 m!939931))

(declare-fun m!939933 () Bool)

(assert (=> b!1019669 m!939933))

(assert (=> b!1019574 d!122165))

(declare-fun d!122167 () Bool)

(declare-fun res!683530 () Bool)

(declare-fun e!573852 () Bool)

(assert (=> d!122167 (=> res!683530 e!573852)))

(assert (=> d!122167 (= res!683530 (or (is-Nil!21613 (t!30620 (t!30620 l!996))) (is-Nil!21613 (t!30620 (t!30620 (t!30620 l!996))))))))

(assert (=> d!122167 (= (isStrictlySorted!681 (t!30620 (t!30620 l!996))) e!573852)))

(declare-fun b!1019670 () Bool)

(declare-fun e!573853 () Bool)

(assert (=> b!1019670 (= e!573852 e!573853)))

(declare-fun res!683531 () Bool)

(assert (=> b!1019670 (=> (not res!683531) (not e!573853))))

(assert (=> b!1019670 (= res!683531 (bvslt (_1!7712 (h!22810 (t!30620 (t!30620 l!996)))) (_1!7712 (h!22810 (t!30620 (t!30620 (t!30620 l!996)))))))))

(declare-fun b!1019671 () Bool)

(assert (=> b!1019671 (= e!573853 (isStrictlySorted!681 (t!30620 (t!30620 (t!30620 l!996)))))))

(assert (= (and d!122167 (not res!683530)) b!1019670))

(assert (= (and b!1019670 res!683531) b!1019671))

(declare-fun m!939935 () Bool)

(assert (=> b!1019671 m!939935))

(assert (=> b!1019564 d!122167))

(declare-fun d!122169 () Bool)

(declare-fun res!683532 () Bool)

(declare-fun e!573854 () Bool)

(assert (=> d!122169 (=> res!683532 e!573854)))

(assert (=> d!122169 (= res!683532 (and (is-Cons!21612 lt!449691) (= (_1!7712 (h!22810 lt!449691)) key!261)))))

(assert (=> d!122169 (= (containsKey!541 lt!449691 key!261) e!573854)))

(declare-fun b!1019672 () Bool)

(declare-fun e!573855 () Bool)

(assert (=> b!1019672 (= e!573854 e!573855)))

(declare-fun res!683533 () Bool)

(assert (=> b!1019672 (=> (not res!683533) (not e!573855))))

(assert (=> b!1019672 (= res!683533 (and (or (not (is-Cons!21612 lt!449691)) (bvsle (_1!7712 (h!22810 lt!449691)) key!261)) (is-Cons!21612 lt!449691) (bvslt (_1!7712 (h!22810 lt!449691)) key!261)))))

(declare-fun b!1019673 () Bool)

(assert (=> b!1019673 (= e!573855 (containsKey!541 (t!30620 lt!449691) key!261))))

(assert (= (and d!122169 (not res!683532)) b!1019672))

(assert (= (and b!1019672 res!683533) b!1019673))

(declare-fun m!939937 () Bool)

(assert (=> b!1019673 m!939937))

(assert (=> b!1019567 d!122169))

(declare-fun b!1019674 () Bool)

(declare-fun e!573856 () Bool)

(declare-fun tp!71166 () Bool)

(assert (=> b!1019674 (= e!573856 (and tp_is_empty!23755 tp!71166))))

(assert (=> b!1019579 (= tp!71161 e!573856)))

(assert (= (and b!1019579 (is-Cons!21612 (t!30620 (t!30620 l!996)))) b!1019674))

(push 1)

