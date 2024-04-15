; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88620 () Bool)

(assert start!88620)

(declare-fun res!682848 () Bool)

(declare-fun e!572945 () Bool)

(assert (=> start!88620 (=> (not res!682848) (not e!572945))))

(declare-datatypes ((B!1662 0))(
  ( (B!1663 (val!11915 Int)) )
))
(declare-datatypes ((tuple2!15456 0))(
  ( (tuple2!15457 (_1!7739 (_ BitVec 64)) (_2!7739 B!1662)) )
))
(declare-datatypes ((List!21638 0))(
  ( (Nil!21635) (Cons!21634 (h!22832 tuple2!15456) (t!30630 List!21638)) )
))
(declare-fun l!996 () List!21638)

(declare-fun isStrictlySorted!664 (List!21638) Bool)

(assert (=> start!88620 (= res!682848 (isStrictlySorted!664 l!996))))

(assert (=> start!88620 e!572945))

(declare-fun e!572944 () Bool)

(assert (=> start!88620 e!572944))

(assert (=> start!88620 true))

(declare-fun tp_is_empty!23729 () Bool)

(assert (=> start!88620 tp_is_empty!23729))

(declare-fun b!1018280 () Bool)

(declare-fun res!682849 () Bool)

(assert (=> b!1018280 (=> (not res!682849) (not e!572945))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!528 (List!21638 (_ BitVec 64)) Bool)

(assert (=> b!1018280 (= res!682849 (containsKey!528 l!996 key!261))))

(declare-fun value!172 () B!1662)

(declare-fun b!1018281 () Bool)

(declare-fun lt!449359 () List!21638)

(assert (=> b!1018281 (= e!572945 (and (is-Cons!21634 l!996) (= (_1!7739 (h!22832 l!996)) key!261) (not (= lt!449359 (Cons!21634 (tuple2!15457 key!261 value!172) (t!30630 l!996))))))))

(declare-fun insertStrictlySorted!350 (List!21638 (_ BitVec 64) B!1662) List!21638)

(assert (=> b!1018281 (= lt!449359 (insertStrictlySorted!350 l!996 key!261 value!172))))

(declare-fun b!1018282 () Bool)

(declare-fun tp!71062 () Bool)

(assert (=> b!1018282 (= e!572944 (and tp_is_empty!23729 tp!71062))))

(assert (= (and start!88620 res!682848) b!1018280))

(assert (= (and b!1018280 res!682849) b!1018281))

(assert (= (and start!88620 (is-Cons!21634 l!996)) b!1018282))

(declare-fun m!938695 () Bool)

(assert (=> start!88620 m!938695))

(declare-fun m!938697 () Bool)

(assert (=> b!1018280 m!938697))

(declare-fun m!938699 () Bool)

(assert (=> b!1018281 m!938699))

(push 1)

(assert (not b!1018282))

(assert (not b!1018280))

(assert (not b!1018281))

(assert tp_is_empty!23729)

(assert (not start!88620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121707 () Bool)

(declare-fun res!682854 () Bool)

(declare-fun e!572950 () Bool)

(assert (=> d!121707 (=> res!682854 e!572950)))

(assert (=> d!121707 (= res!682854 (and (is-Cons!21634 l!996) (= (_1!7739 (h!22832 l!996)) key!261)))))

(assert (=> d!121707 (= (containsKey!528 l!996 key!261) e!572950)))

(declare-fun b!1018287 () Bool)

(declare-fun e!572951 () Bool)

(assert (=> b!1018287 (= e!572950 e!572951)))

(declare-fun res!682855 () Bool)

(assert (=> b!1018287 (=> (not res!682855) (not e!572951))))

(assert (=> b!1018287 (= res!682855 (and (or (not (is-Cons!21634 l!996)) (bvsle (_1!7739 (h!22832 l!996)) key!261)) (is-Cons!21634 l!996) (bvslt (_1!7739 (h!22832 l!996)) key!261)))))

(declare-fun b!1018288 () Bool)

(assert (=> b!1018288 (= e!572951 (containsKey!528 (t!30630 l!996) key!261))))

(assert (= (and d!121707 (not res!682854)) b!1018287))

(assert (= (and b!1018287 res!682855) b!1018288))

(declare-fun m!938701 () Bool)

(assert (=> b!1018288 m!938701))

(assert (=> b!1018280 d!121707))

(declare-fun d!121713 () Bool)

(declare-fun res!682860 () Bool)

(declare-fun e!572962 () Bool)

(assert (=> d!121713 (=> res!682860 e!572962)))

(assert (=> d!121713 (= res!682860 (or (is-Nil!21635 l!996) (is-Nil!21635 (t!30630 l!996))))))

(assert (=> d!121713 (= (isStrictlySorted!664 l!996) e!572962)))

(declare-fun b!1018307 () Bool)

(declare-fun e!572963 () Bool)

(assert (=> b!1018307 (= e!572962 e!572963)))

(declare-fun res!682861 () Bool)

(assert (=> b!1018307 (=> (not res!682861) (not e!572963))))

(assert (=> b!1018307 (= res!682861 (bvslt (_1!7739 (h!22832 l!996)) (_1!7739 (h!22832 (t!30630 l!996)))))))

(declare-fun b!1018308 () Bool)

(assert (=> b!1018308 (= e!572963 (isStrictlySorted!664 (t!30630 l!996)))))

(assert (= (and d!121713 (not res!682860)) b!1018307))

(assert (= (and b!1018307 res!682861) b!1018308))

(declare-fun m!938703 () Bool)

(assert (=> b!1018308 m!938703))

(assert (=> start!88620 d!121713))

(declare-fun b!1018410 () Bool)

(declare-fun res!682902 () Bool)

(declare-fun e!573032 () Bool)

(assert (=> b!1018410 (=> (not res!682902) (not e!573032))))

(declare-fun lt!449368 () List!21638)

(assert (=> b!1018410 (= res!682902 (containsKey!528 lt!449368 key!261))))

(declare-fun bm!42956 () Bool)

(declare-fun call!42959 () List!21638)

(declare-fun call!42960 () List!21638)

(assert (=> bm!42956 (= call!42959 call!42960)))

(declare-fun b!1018411 () Bool)

(declare-fun e!573030 () List!21638)

(assert (=> b!1018411 (= e!573030 call!42960)))

(declare-fun b!1018412 () Bool)

(declare-fun contains!5873 (List!21638 tuple2!15456) Bool)

(assert (=> b!1018412 (= e!573032 (contains!5873 lt!449368 (tuple2!15457 key!261 value!172)))))

(declare-fun bm!42957 () Bool)

(declare-fun e!573028 () List!21638)

(declare-fun c!103141 () Bool)

(declare-fun $colon$colon!582 (List!21638 tuple2!15456) List!21638)

(assert (=> bm!42957 (= call!42960 ($colon$colon!582 e!573028 (ite c!103141 (h!22832 l!996) (tuple2!15457 key!261 value!172))))))

(declare-fun c!103139 () Bool)

(assert (=> bm!42957 (= c!103139 c!103141)))

(declare-fun b!1018413 () Bool)

(declare-fun e!573031 () List!21638)

(assert (=> b!1018413 (= e!573030 e!573031)))

(declare-fun c!103140 () Bool)

(assert (=> b!1018413 (= c!103140 (and (is-Cons!21634 l!996) (= (_1!7739 (h!22832 l!996)) key!261)))))

(declare-fun b!1018414 () Bool)

(assert (=> b!1018414 (= e!573031 call!42959)))

(declare-fun c!103138 () Bool)

(declare-fun b!1018415 () Bool)

(assert (=> b!1018415 (= e!573028 (ite c!103140 (t!30630 l!996) (ite c!103138 (Cons!21634 (h!22832 l!996) (t!30630 l!996)) Nil!21635)))))

(declare-fun b!1018416 () Bool)

(assert (=> b!1018416 (= e!573028 (insertStrictlySorted!350 (t!30630 l!996) key!261 value!172))))

(declare-fun b!1018417 () Bool)

(assert (=> b!1018417 (= c!103138 (and (is-Cons!21634 l!996) (bvsgt (_1!7739 (h!22832 l!996)) key!261)))))

(declare-fun e!573029 () List!21638)

(assert (=> b!1018417 (= e!573031 e!573029)))

(declare-fun b!1018409 () Bool)

(declare-fun call!42961 () List!21638)

(assert (=> b!1018409 (= e!573029 call!42961)))

(declare-fun d!121715 () Bool)

(assert (=> d!121715 e!573032))

(declare-fun res!682903 () Bool)

(assert (=> d!121715 (=> (not res!682903) (not e!573032))))

(assert (=> d!121715 (= res!682903 (isStrictlySorted!664 lt!449368))))

(assert (=> d!121715 (= lt!449368 e!573030)))

(assert (=> d!121715 (= c!103141 (and (is-Cons!21634 l!996) (bvslt (_1!7739 (h!22832 l!996)) key!261)))))

(assert (=> d!121715 (isStrictlySorted!664 l!996)))

(assert (=> d!121715 (= (insertStrictlySorted!350 l!996 key!261 value!172) lt!449368)))

(declare-fun bm!42958 () Bool)

(assert (=> bm!42958 (= call!42961 call!42959)))

(declare-fun b!1018418 () Bool)

(assert (=> b!1018418 (= e!573029 call!42961)))

(assert (= (and d!121715 c!103141) b!1018411))

(assert (= (and d!121715 (not c!103141)) b!1018413))

(assert (= (and b!1018413 c!103140) b!1018414))

(assert (= (and b!1018413 (not c!103140)) b!1018417))

(assert (= (and b!1018417 c!103138) b!1018409))

(assert (= (and b!1018417 (not c!103138)) b!1018418))

(assert (= (or b!1018409 b!1018418) bm!42958))

(assert (= (or b!1018414 bm!42958) bm!42956))

(assert (= (or b!1018411 bm!42956) bm!42957))

(assert (= (and bm!42957 c!103139) b!1018416))

(assert (= (and bm!42957 (not c!103139)) b!1018415))

(assert (= (and d!121715 res!682903) b!1018410))

(assert (= (and b!1018410 res!682902) b!1018412))

(declare-fun m!938733 () Bool)

(assert (=> b!1018416 m!938733))

(declare-fun m!938735 () Bool)

(assert (=> d!121715 m!938735))

(assert (=> d!121715 m!938695))

(declare-fun m!938737 () Bool)

(assert (=> b!1018412 m!938737))

(declare-fun m!938739 () Bool)

(assert (=> b!1018410 m!938739))

(declare-fun m!938741 () Bool)

(assert (=> bm!42957 m!938741))

(assert (=> b!1018281 d!121715))

(declare-fun b!1018423 () Bool)

(declare-fun e!573035 () Bool)

(declare-fun tp!71071 () Bool)

(assert (=> b!1018423 (= e!573035 (and tp_is_empty!23729 tp!71071))))

(assert (=> b!1018282 (= tp!71062 e!573035)))

(assert (= (and b!1018282 (is-Cons!21634 (t!30630 l!996))) b!1018423))

(push 1)

(assert (not b!1018423))

(assert (not d!121715))

(assert (not b!1018412))

(assert (not b!1018416))

(assert tp_is_empty!23729)

(assert (not b!1018410))

(assert (not bm!42957))

(assert (not b!1018308))

(assert (not b!1018288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121725 () Bool)

(declare-fun res!682904 () Bool)

(declare-fun e!573036 () Bool)

(assert (=> d!121725 (=> res!682904 e!573036)))

(assert (=> d!121725 (= res!682904 (and (is-Cons!21634 lt!449368) (= (_1!7739 (h!22832 lt!449368)) key!261)))))

(assert (=> d!121725 (= (containsKey!528 lt!449368 key!261) e!573036)))

(declare-fun b!1018424 () Bool)

(declare-fun e!573037 () Bool)

(assert (=> b!1018424 (= e!573036 e!573037)))

(declare-fun res!682905 () Bool)

(assert (=> b!1018424 (=> (not res!682905) (not e!573037))))

(assert (=> b!1018424 (= res!682905 (and (or (not (is-Cons!21634 lt!449368)) (bvsle (_1!7739 (h!22832 lt!449368)) key!261)) (is-Cons!21634 lt!449368) (bvslt (_1!7739 (h!22832 lt!449368)) key!261)))))

(declare-fun b!1018425 () Bool)

(assert (=> b!1018425 (= e!573037 (containsKey!528 (t!30630 lt!449368) key!261))))

(assert (= (and d!121725 (not res!682904)) b!1018424))

(assert (= (and b!1018424 res!682905) b!1018425))

(declare-fun m!938743 () Bool)

(assert (=> b!1018425 m!938743))

(assert (=> b!1018410 d!121725))

(declare-fun d!121727 () Bool)

(declare-fun res!682906 () Bool)

(declare-fun e!573038 () Bool)

(assert (=> d!121727 (=> res!682906 e!573038)))

(assert (=> d!121727 (= res!682906 (or (is-Nil!21635 lt!449368) (is-Nil!21635 (t!30630 lt!449368))))))

(assert (=> d!121727 (= (isStrictlySorted!664 lt!449368) e!573038)))

(declare-fun b!1018426 () Bool)

(declare-fun e!573039 () Bool)

(assert (=> b!1018426 (= e!573038 e!573039)))

(declare-fun res!682907 () Bool)

(assert (=> b!1018426 (=> (not res!682907) (not e!573039))))

(assert (=> b!1018426 (= res!682907 (bvslt (_1!7739 (h!22832 lt!449368)) (_1!7739 (h!22832 (t!30630 lt!449368)))))))

(declare-fun b!1018427 () Bool)

(assert (=> b!1018427 (= e!573039 (isStrictlySorted!664 (t!30630 lt!449368)))))

(assert (= (and d!121727 (not res!682906)) b!1018426))

(assert (= (and b!1018426 res!682907) b!1018427))

(declare-fun m!938745 () Bool)

(assert (=> b!1018427 m!938745))

(assert (=> d!121715 d!121727))

(assert (=> d!121715 d!121713))

(declare-fun d!121729 () Bool)

(declare-fun res!682908 () Bool)

(declare-fun e!573040 () Bool)

(assert (=> d!121729 (=> res!682908 e!573040)))

(assert (=> d!121729 (= res!682908 (and (is-Cons!21634 (t!30630 l!996)) (= (_1!7739 (h!22832 (t!30630 l!996))) key!261)))))

(assert (=> d!121729 (= (containsKey!528 (t!30630 l!996) key!261) e!573040)))

(declare-fun b!1018428 () Bool)

(declare-fun e!573041 () Bool)

(assert (=> b!1018428 (= e!573040 e!573041)))

(declare-fun res!682909 () Bool)

(assert (=> b!1018428 (=> (not res!682909) (not e!573041))))

(assert (=> b!1018428 (= res!682909 (and (or (not (is-Cons!21634 (t!30630 l!996))) (bvsle (_1!7739 (h!22832 (t!30630 l!996))) key!261)) (is-Cons!21634 (t!30630 l!996)) (bvslt (_1!7739 (h!22832 (t!30630 l!996))) key!261)))))

(declare-fun b!1018429 () Bool)

(assert (=> b!1018429 (= e!573041 (containsKey!528 (t!30630 (t!30630 l!996)) key!261))))

(assert (= (and d!121729 (not res!682908)) b!1018428))

(assert (= (and b!1018428 res!682909) b!1018429))

(declare-fun m!938747 () Bool)

(assert (=> b!1018429 m!938747))

(assert (=> b!1018288 d!121729))

(declare-fun d!121731 () Bool)

(assert (=> d!121731 (= ($colon$colon!582 e!573028 (ite c!103141 (h!22832 l!996) (tuple2!15457 key!261 value!172))) (Cons!21634 (ite c!103141 (h!22832 l!996) (tuple2!15457 key!261 value!172)) e!573028))))

(assert (=> bm!42957 d!121731))

(declare-fun d!121733 () Bool)

(declare-fun res!682910 () Bool)

(declare-fun e!573042 () Bool)

(assert (=> d!121733 (=> res!682910 e!573042)))

(assert (=> d!121733 (= res!682910 (or (is-Nil!21635 (t!30630 l!996)) (is-Nil!21635 (t!30630 (t!30630 l!996)))))))

(assert (=> d!121733 (= (isStrictlySorted!664 (t!30630 l!996)) e!573042)))

(declare-fun b!1018430 () Bool)

(declare-fun e!573043 () Bool)

(assert (=> b!1018430 (= e!573042 e!573043)))

(declare-fun res!682911 () Bool)

(assert (=> b!1018430 (=> (not res!682911) (not e!573043))))

(assert (=> b!1018430 (= res!682911 (bvslt (_1!7739 (h!22832 (t!30630 l!996))) (_1!7739 (h!22832 (t!30630 (t!30630 l!996))))))))

(declare-fun b!1018431 () Bool)

(assert (=> b!1018431 (= e!573043 (isStrictlySorted!664 (t!30630 (t!30630 l!996))))))

(assert (= (and d!121733 (not res!682910)) b!1018430))

(assert (= (and b!1018430 res!682911) b!1018431))

(declare-fun m!938749 () Bool)

(assert (=> b!1018431 m!938749))

(assert (=> b!1018308 d!121733))

(declare-fun lt!449371 () Bool)

(declare-fun d!121735 () Bool)

(declare-fun content!485 (List!21638) (Set tuple2!15456))

(assert (=> d!121735 (= lt!449371 (set.member (tuple2!15457 key!261 value!172) (content!485 lt!449368)))))

(declare-fun e!573050 () Bool)

(assert (=> d!121735 (= lt!449371 e!573050)))

(declare-fun res!682918 () Bool)

(assert (=> d!121735 (=> (not res!682918) (not e!573050))))

(assert (=> d!121735 (= res!682918 (is-Cons!21634 lt!449368))))

(assert (=> d!121735 (= (contains!5873 lt!449368 (tuple2!15457 key!261 value!172)) lt!449371)))

(declare-fun b!1018438 () Bool)

(declare-fun e!573052 () Bool)

(assert (=> b!1018438 (= e!573050 e!573052)))

(declare-fun res!682919 () Bool)

(assert (=> b!1018438 (=> res!682919 e!573052)))

(assert (=> b!1018438 (= res!682919 (= (h!22832 lt!449368) (tuple2!15457 key!261 value!172)))))

(declare-fun b!1018439 () Bool)

(assert (=> b!1018439 (= e!573052 (contains!5873 (t!30630 lt!449368) (tuple2!15457 key!261 value!172)))))

(assert (= (and d!121735 res!682918) b!1018438))

(assert (= (and b!1018438 (not res!682919)) b!1018439))

(declare-fun m!938755 () Bool)

(assert (=> d!121735 m!938755))

(declare-fun m!938757 () Bool)

(assert (=> d!121735 m!938757))

(declare-fun m!938759 () Bool)

(assert (=> b!1018439 m!938759))

(assert (=> b!1018412 d!121735))

(declare-fun b!1018443 () Bool)

(declare-fun res!682922 () Bool)

(declare-fun e!573058 () Bool)

(assert (=> b!1018443 (=> (not res!682922) (not e!573058))))

(declare-fun lt!449372 () List!21638)

(assert (=> b!1018443 (= res!682922 (containsKey!528 lt!449372 key!261))))

(declare-fun bm!42959 () Bool)

(declare-fun call!42962 () List!21638)

(declare-fun call!42963 () List!21638)

(assert (=> bm!42959 (= call!42962 call!42963)))

(declare-fun b!1018444 () Bool)

(declare-fun e!573056 () List!21638)

(assert (=> b!1018444 (= e!573056 call!42963)))

(declare-fun b!1018445 () Bool)

(assert (=> b!1018445 (= e!573058 (contains!5873 lt!449372 (tuple2!15457 key!261 value!172)))))

(declare-fun c!103145 () Bool)

(declare-fun e!573054 () List!21638)

(declare-fun bm!42960 () Bool)

(assert (=> bm!42960 (= call!42963 ($colon$colon!582 e!573054 (ite c!103145 (h!22832 (t!30630 l!996)) (tuple2!15457 key!261 value!172))))))

(declare-fun c!103143 () Bool)

(assert (=> bm!42960 (= c!103143 c!103145)))

(declare-fun b!1018446 () Bool)

(declare-fun e!573057 () List!21638)

(assert (=> b!1018446 (= e!573056 e!573057)))

(declare-fun c!103144 () Bool)

(assert (=> b!1018446 (= c!103144 (and (is-Cons!21634 (t!30630 l!996)) (= (_1!7739 (h!22832 (t!30630 l!996))) key!261)))))

(declare-fun b!1018447 () Bool)

(assert (=> b!1018447 (= e!573057 call!42962)))

(declare-fun b!1018448 () Bool)

(declare-fun c!103142 () Bool)

(assert (=> b!1018448 (= e!573054 (ite c!103144 (t!30630 (t!30630 l!996)) (ite c!103142 (Cons!21634 (h!22832 (t!30630 l!996)) (t!30630 (t!30630 l!996))) Nil!21635)))))

(declare-fun b!1018449 () Bool)

(assert (=> b!1018449 (= e!573054 (insertStrictlySorted!350 (t!30630 (t!30630 l!996)) key!261 value!172))))

(declare-fun b!1018450 () Bool)

(assert (=> b!1018450 (= c!103142 (and (is-Cons!21634 (t!30630 l!996)) (bvsgt (_1!7739 (h!22832 (t!30630 l!996))) key!261)))))

(declare-fun e!573055 () List!21638)

(assert (=> b!1018450 (= e!573057 e!573055)))

(declare-fun b!1018442 () Bool)

(declare-fun call!42964 () List!21638)

(assert (=> b!1018442 (= e!573055 call!42964)))

(declare-fun d!121743 () Bool)

(assert (=> d!121743 e!573058))

(declare-fun res!682923 () Bool)

(assert (=> d!121743 (=> (not res!682923) (not e!573058))))

(assert (=> d!121743 (= res!682923 (isStrictlySorted!664 lt!449372))))

(assert (=> d!121743 (= lt!449372 e!573056)))

(assert (=> d!121743 (= c!103145 (and (is-Cons!21634 (t!30630 l!996)) (bvslt (_1!7739 (h!22832 (t!30630 l!996))) key!261)))))

(assert (=> d!121743 (isStrictlySorted!664 (t!30630 l!996))))

(assert (=> d!121743 (= (insertStrictlySorted!350 (t!30630 l!996) key!261 value!172) lt!449372)))

(declare-fun bm!42961 () Bool)

(assert (=> bm!42961 (= call!42964 call!42962)))

(declare-fun b!1018451 () Bool)

(assert (=> b!1018451 (= e!573055 call!42964)))

(assert (= (and d!121743 c!103145) b!1018444))

(assert (= (and d!121743 (not c!103145)) b!1018446))

(assert (= (and b!1018446 c!103144) b!1018447))

(assert (= (and b!1018446 (not c!103144)) b!1018450))

(assert (= (and b!1018450 c!103142) b!1018442))

(assert (= (and b!1018450 (not c!103142)) b!1018451))

(assert (= (or b!1018442 b!1018451) bm!42961))

(assert (= (or b!1018447 bm!42961) bm!42959))

(assert (= (or b!1018444 bm!42959) bm!42960))

(assert (= (and bm!42960 c!103143) b!1018449))

(assert (= (and bm!42960 (not c!103143)) b!1018448))

(assert (= (and d!121743 res!682923) b!1018443))

(assert (= (and b!1018443 res!682922) b!1018445))

(declare-fun m!938763 () Bool)

(assert (=> b!1018449 m!938763))

(declare-fun m!938765 () Bool)

(assert (=> d!121743 m!938765))

(assert (=> d!121743 m!938703))

(declare-fun m!938767 () Bool)

(assert (=> b!1018445 m!938767))

(declare-fun m!938769 () Bool)

(assert (=> b!1018443 m!938769))

(declare-fun m!938771 () Bool)

(assert (=> bm!42960 m!938771))

(assert (=> b!1018416 d!121743))

(declare-fun b!1018464 () Bool)

(declare-fun e!573066 () Bool)

(declare-fun tp!71072 () Bool)

(assert (=> b!1018464 (= e!573066 (and tp_is_empty!23729 tp!71072))))

(assert (=> b!1018423 (= tp!71071 e!573066)))

(assert (= (and b!1018423 (is-Cons!21634 (t!30630 (t!30630 l!996)))) b!1018464))

(push 1)

(assert (not d!121735))

(assert (not b!1018449))

(assert (not b!1018425))

(assert (not d!121743))

(assert (not b!1018464))

(assert tp_is_empty!23729)

(assert (not b!1018427))

(assert (not b!1018439))

(assert (not bm!42960))

(assert (not b!1018431))

(assert (not b!1018445))

(assert (not b!1018443))

(assert (not b!1018429))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

