; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7648 () Bool)

(assert start!7648)

(declare-fun b!48712 () Bool)

(declare-fun e!31282 () Bool)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-datatypes ((B!974 0))(
  ( (B!975 (val!1107 Int)) )
))
(declare-fun newValue!147 () B!974)

(declare-datatypes ((tuple2!1796 0))(
  ( (tuple2!1797 (_1!909 (_ BitVec 64)) (_2!909 B!974)) )
))
(declare-datatypes ((List!1304 0))(
  ( (Nil!1301) (Cons!1300 (h!1880 tuple2!1796) (t!4332 List!1304)) )
))
(declare-fun l!1333 () List!1304)

(declare-fun content!49 (List!1304) (Set tuple2!1796))

(declare-fun insertStrictlySorted!34 (List!1304 (_ BitVec 64) B!974) List!1304)

(assert (=> b!48712 (= e!31282 (not (= (set.union (content!49 l!1333) (set.insert (tuple2!1797 newKey!147 newValue!147) (as set.empty (Set tuple2!1796)))) (content!49 (insertStrictlySorted!34 l!1333 newKey!147 newValue!147)))))))

(declare-fun res!28283 () Bool)

(assert (=> start!7648 (=> (not res!28283) (not e!31282))))

(declare-fun isStrictlySorted!268 (List!1304) Bool)

(assert (=> start!7648 (= res!28283 (isStrictlySorted!268 l!1333))))

(assert (=> start!7648 e!31282))

(declare-fun e!31281 () Bool)

(assert (=> start!7648 e!31281))

(assert (=> start!7648 true))

(declare-fun tp_is_empty!2125 () Bool)

(assert (=> start!7648 tp_is_empty!2125))

(declare-fun b!48710 () Bool)

(declare-fun res!28282 () Bool)

(assert (=> b!48710 (=> (not res!28282) (not e!31282))))

(declare-fun containsKey!117 (List!1304 (_ BitVec 64)) Bool)

(assert (=> b!48710 (= res!28282 (not (containsKey!117 l!1333 newKey!147)))))

(declare-fun b!48713 () Bool)

(declare-fun tp!6455 () Bool)

(assert (=> b!48713 (= e!31281 (and tp_is_empty!2125 tp!6455))))

(declare-fun b!48711 () Bool)

(declare-fun res!28281 () Bool)

(assert (=> b!48711 (=> (not res!28281) (not e!31282))))

(assert (=> b!48711 (= res!28281 (is-Nil!1301 l!1333))))

(assert (= (and start!7648 res!28283) b!48710))

(assert (= (and b!48710 res!28282) b!48711))

(assert (= (and b!48711 res!28281) b!48712))

(assert (= (and start!7648 (is-Cons!1300 l!1333)) b!48713))

(declare-fun m!42369 () Bool)

(assert (=> b!48712 m!42369))

(declare-fun m!42371 () Bool)

(assert (=> b!48712 m!42371))

(declare-fun m!42373 () Bool)

(assert (=> b!48712 m!42373))

(assert (=> b!48712 m!42373))

(declare-fun m!42375 () Bool)

(assert (=> b!48712 m!42375))

(declare-fun m!42377 () Bool)

(assert (=> start!7648 m!42377))

(declare-fun m!42379 () Bool)

(assert (=> b!48710 m!42379))

(push 1)

(assert tp_is_empty!2125)

(assert (not b!48712))

(assert (not b!48710))

(assert (not start!7648))

(assert (not b!48713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9679 () Bool)

(declare-fun res!28312 () Bool)

(declare-fun e!31311 () Bool)

(assert (=> d!9679 (=> res!28312 e!31311)))

(assert (=> d!9679 (= res!28312 (and (is-Cons!1300 l!1333) (= (_1!909 (h!1880 l!1333)) newKey!147)))))

(assert (=> d!9679 (= (containsKey!117 l!1333 newKey!147) e!31311)))

(declare-fun b!48760 () Bool)

(declare-fun e!31312 () Bool)

(assert (=> b!48760 (= e!31311 e!31312)))

(declare-fun res!28313 () Bool)

(assert (=> b!48760 (=> (not res!28313) (not e!31312))))

(assert (=> b!48760 (= res!28313 (and (or (not (is-Cons!1300 l!1333)) (bvsle (_1!909 (h!1880 l!1333)) newKey!147)) (is-Cons!1300 l!1333) (bvslt (_1!909 (h!1880 l!1333)) newKey!147)))))

(declare-fun b!48761 () Bool)

(assert (=> b!48761 (= e!31312 (containsKey!117 (t!4332 l!1333) newKey!147))))

(assert (= (and d!9679 (not res!28312)) b!48760))

(assert (= (and b!48760 res!28313) b!48761))

(declare-fun m!42415 () Bool)

(assert (=> b!48761 m!42415))

(assert (=> b!48710 d!9679))

(declare-fun d!9687 () Bool)

(declare-fun res!28318 () Bool)

(declare-fun e!31319 () Bool)

(assert (=> d!9687 (=> res!28318 e!31319)))

(assert (=> d!9687 (= res!28318 (or (is-Nil!1301 l!1333) (is-Nil!1301 (t!4332 l!1333))))))

(assert (=> d!9687 (= (isStrictlySorted!268 l!1333) e!31319)))

(declare-fun b!48770 () Bool)

(declare-fun e!31320 () Bool)

(assert (=> b!48770 (= e!31319 e!31320)))

(declare-fun res!28319 () Bool)

(assert (=> b!48770 (=> (not res!28319) (not e!31320))))

(assert (=> b!48770 (= res!28319 (bvslt (_1!909 (h!1880 l!1333)) (_1!909 (h!1880 (t!4332 l!1333)))))))

(declare-fun b!48771 () Bool)

(assert (=> b!48771 (= e!31320 (isStrictlySorted!268 (t!4332 l!1333)))))

(assert (= (and d!9687 (not res!28318)) b!48770))

(assert (= (and b!48770 res!28319) b!48771))

(declare-fun m!42425 () Bool)

(assert (=> b!48771 m!42425))

(assert (=> start!7648 d!9687))

(declare-fun d!9693 () Bool)

(declare-fun c!6539 () Bool)

(assert (=> d!9693 (= c!6539 (is-Nil!1301 l!1333))))

(declare-fun e!31323 () (Set tuple2!1796))

(assert (=> d!9693 (= (content!49 l!1333) e!31323)))

(declare-fun b!48776 () Bool)

(assert (=> b!48776 (= e!31323 (as set.empty (Set tuple2!1796)))))

(declare-fun b!48777 () Bool)

(assert (=> b!48777 (= e!31323 (set.union (set.insert (h!1880 l!1333) (as set.empty (Set tuple2!1796))) (content!49 (t!4332 l!1333))))))

(assert (= (and d!9693 c!6539) b!48776))

(assert (= (and d!9693 (not c!6539)) b!48777))

(declare-fun m!42427 () Bool)

(assert (=> b!48777 m!42427))

(declare-fun m!42429 () Bool)

(assert (=> b!48777 m!42429))

(assert (=> b!48712 d!9693))

(declare-fun c!6540 () Bool)

(declare-fun d!9695 () Bool)

(assert (=> d!9695 (= c!6540 (is-Nil!1301 (insertStrictlySorted!34 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31324 () (Set tuple2!1796))

(assert (=> d!9695 (= (content!49 (insertStrictlySorted!34 l!1333 newKey!147 newValue!147)) e!31324)))

(declare-fun b!48778 () Bool)

(assert (=> b!48778 (= e!31324 (as set.empty (Set tuple2!1796)))))

(declare-fun b!48779 () Bool)

(assert (=> b!48779 (= e!31324 (set.union (set.insert (h!1880 (insertStrictlySorted!34 l!1333 newKey!147 newValue!147)) (as set.empty (Set tuple2!1796))) (content!49 (t!4332 (insertStrictlySorted!34 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9695 c!6540) b!48778))

(assert (= (and d!9695 (not c!6540)) b!48779))

(declare-fun m!42431 () Bool)

(assert (=> b!48779 m!42431))

(declare-fun m!42433 () Bool)

(assert (=> b!48779 m!42433))

(assert (=> b!48712 d!9695))

(declare-fun lt!20690 () List!1304)

(declare-fun b!48878 () Bool)

(declare-fun e!31385 () Bool)

(declare-fun contains!607 (List!1304 tuple2!1796) Bool)

(assert (=> b!48878 (= e!31385 (contains!607 lt!20690 (tuple2!1797 newKey!147 newValue!147)))))

(declare-fun b!48879 () Bool)

(declare-fun res!28353 () Bool)

(assert (=> b!48879 (=> (not res!28353) (not e!31385))))

(assert (=> b!48879 (= res!28353 (containsKey!117 lt!20690 newKey!147))))

(declare-fun c!6573 () Bool)

(declare-fun b!48880 () Bool)

(declare-fun c!6576 () Bool)

(declare-fun e!31383 () List!1304)

(assert (=> b!48880 (= e!31383 (ite c!6576 (t!4332 l!1333) (ite c!6573 (Cons!1300 (h!1880 l!1333) (t!4332 l!1333)) Nil!1301)))))

(declare-fun b!48881 () Bool)

(declare-fun e!31381 () List!1304)

(declare-fun e!31382 () List!1304)

(assert (=> b!48881 (= e!31381 e!31382)))

(assert (=> b!48881 (= c!6576 (and (is-Cons!1300 l!1333) (= (_1!909 (h!1880 l!1333)) newKey!147)))))

(declare-fun b!48882 () Bool)

(declare-fun call!3799 () List!1304)

(assert (=> b!48882 (= e!31382 call!3799)))

(declare-fun bm!3795 () Bool)

(declare-fun call!3798 () List!1304)

(assert (=> bm!3795 (= call!3799 call!3798)))

(declare-fun b!48883 () Bool)

(declare-fun e!31384 () List!1304)

(declare-fun call!3797 () List!1304)

(assert (=> b!48883 (= e!31384 call!3797)))

(declare-fun b!48884 () Bool)

(assert (=> b!48884 (= e!31384 call!3797)))

(declare-fun d!9697 () Bool)

(assert (=> d!9697 e!31385))

(declare-fun res!28352 () Bool)

(assert (=> d!9697 (=> (not res!28352) (not e!31385))))

(assert (=> d!9697 (= res!28352 (isStrictlySorted!268 lt!20690))))

(assert (=> d!9697 (= lt!20690 e!31381)))

(declare-fun c!6575 () Bool)

(assert (=> d!9697 (= c!6575 (and (is-Cons!1300 l!1333) (bvslt (_1!909 (h!1880 l!1333)) newKey!147)))))

(assert (=> d!9697 (isStrictlySorted!268 l!1333)))

(assert (=> d!9697 (= (insertStrictlySorted!34 l!1333 newKey!147 newValue!147) lt!20690)))

(declare-fun bm!3794 () Bool)

(declare-fun $colon$colon!54 (List!1304 tuple2!1796) List!1304)

(assert (=> bm!3794 (= call!3798 ($colon$colon!54 e!31383 (ite c!6575 (h!1880 l!1333) (tuple2!1797 newKey!147 newValue!147))))))

(declare-fun c!6574 () Bool)

(assert (=> bm!3794 (= c!6574 c!6575)))

(declare-fun bm!3796 () Bool)

(assert (=> bm!3796 (= call!3797 call!3799)))

(declare-fun b!48885 () Bool)

(assert (=> b!48885 (= c!6573 (and (is-Cons!1300 l!1333) (bvsgt (_1!909 (h!1880 l!1333)) newKey!147)))))

(assert (=> b!48885 (= e!31382 e!31384)))

(declare-fun b!48886 () Bool)

(assert (=> b!48886 (= e!31383 (insertStrictlySorted!34 (t!4332 l!1333) newKey!147 newValue!147))))

(declare-fun b!48887 () Bool)

(assert (=> b!48887 (= e!31381 call!3798)))

(assert (= (and d!9697 c!6575) b!48887))

(assert (= (and d!9697 (not c!6575)) b!48881))

(assert (= (and b!48881 c!6576) b!48882))

(assert (= (and b!48881 (not c!6576)) b!48885))

(assert (= (and b!48885 c!6573) b!48883))

(assert (= (and b!48885 (not c!6573)) b!48884))

(assert (= (or b!48883 b!48884) bm!3796))

(assert (= (or b!48882 bm!3796) bm!3795))

(assert (= (or b!48887 bm!3795) bm!3794))

(assert (= (and bm!3794 c!6574) b!48886))

(assert (= (and bm!3794 (not c!6574)) b!48880))

(assert (= (and d!9697 res!28352) b!48879))

(assert (= (and b!48879 res!28353) b!48878))

(declare-fun m!42461 () Bool)

(assert (=> b!48886 m!42461))

(declare-fun m!42463 () Bool)

(assert (=> b!48878 m!42463))

(declare-fun m!42465 () Bool)

(assert (=> b!48879 m!42465))

(declare-fun m!42467 () Bool)

(assert (=> d!9697 m!42467))

(assert (=> d!9697 m!42377))

(declare-fun m!42469 () Bool)

(assert (=> bm!3794 m!42469))

(assert (=> b!48712 d!9697))

(declare-fun b!48902 () Bool)

(declare-fun e!31396 () Bool)

(declare-fun tp!6470 () Bool)

(assert (=> b!48902 (= e!31396 (and tp_is_empty!2125 tp!6470))))

(assert (=> b!48713 (= tp!6455 e!31396)))

(assert (= (and b!48713 (is-Cons!1300 (t!4332 l!1333))) b!48902))

(push 1)

(assert tp_is_empty!2125)

(assert (not b!48777))

(assert (not b!48779))

(assert (not b!48771))

(assert (not bm!3794))

(assert (not b!48879))

(assert (not b!48878))

(assert (not d!9697))

(assert (not b!48902))

(assert (not b!48761))

(assert (not b!48886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9723 () Bool)

(declare-fun c!6583 () Bool)

(assert (=> d!9723 (= c!6583 (is-Nil!1301 (t!4332 (insertStrictlySorted!34 l!1333 newKey!147 newValue!147))))))

(declare-fun e!31418 () (Set tuple2!1796))

(assert (=> d!9723 (= (content!49 (t!4332 (insertStrictlySorted!34 l!1333 newKey!147 newValue!147))) e!31418)))

(declare-fun b!48931 () Bool)

(assert (=> b!48931 (= e!31418 (as set.empty (Set tuple2!1796)))))

(declare-fun b!48932 () Bool)

(assert (=> b!48932 (= e!31418 (set.union (set.insert (h!1880 (t!4332 (insertStrictlySorted!34 l!1333 newKey!147 newValue!147))) (as set.empty (Set tuple2!1796))) (content!49 (t!4332 (t!4332 (insertStrictlySorted!34 l!1333 newKey!147 newValue!147))))))))

(assert (= (and d!9723 c!6583) b!48931))

(assert (= (and d!9723 (not c!6583)) b!48932))

(declare-fun m!42493 () Bool)

(assert (=> b!48932 m!42493))

(declare-fun m!42495 () Bool)

(assert (=> b!48932 m!42495))

(assert (=> b!48779 d!9723))

(declare-fun lt!20697 () Bool)

(declare-fun d!9725 () Bool)

(assert (=> d!9725 (= lt!20697 (set.member (tuple2!1797 newKey!147 newValue!147) (content!49 lt!20690)))))

(declare-fun e!31425 () Bool)

(assert (=> d!9725 (= lt!20697 e!31425)))

(declare-fun res!28376 () Bool)

(assert (=> d!9725 (=> (not res!28376) (not e!31425))))

(assert (=> d!9725 (= res!28376 (is-Cons!1300 lt!20690))))

(assert (=> d!9725 (= (contains!607 lt!20690 (tuple2!1797 newKey!147 newValue!147)) lt!20697)))

(declare-fun b!48938 () Bool)

(declare-fun e!31424 () Bool)

(assert (=> b!48938 (= e!31425 e!31424)))

(declare-fun res!28377 () Bool)

(assert (=> b!48938 (=> res!28377 e!31424)))

(assert (=> b!48938 (= res!28377 (= (h!1880 lt!20690) (tuple2!1797 newKey!147 newValue!147)))))

(declare-fun b!48939 () Bool)

(assert (=> b!48939 (= e!31424 (contains!607 (t!4332 lt!20690) (tuple2!1797 newKey!147 newValue!147)))))

(assert (= (and d!9725 res!28376) b!48938))

(assert (= (and b!48938 (not res!28377)) b!48939))

(declare-fun m!42507 () Bool)

(assert (=> d!9725 m!42507))

(declare-fun m!42509 () Bool)

(assert (=> d!9725 m!42509))

(declare-fun m!42511 () Bool)

(assert (=> b!48939 m!42511))

(assert (=> b!48878 d!9725))

(declare-fun e!31430 () Bool)

(declare-fun b!48940 () Bool)

(declare-fun lt!20698 () List!1304)

(assert (=> b!48940 (= e!31430 (contains!607 lt!20698 (tuple2!1797 newKey!147 newValue!147)))))

(declare-fun b!48941 () Bool)

(declare-fun res!28379 () Bool)

(assert (=> b!48941 (=> (not res!28379) (not e!31430))))

(assert (=> b!48941 (= res!28379 (containsKey!117 lt!20698 newKey!147))))

(declare-fun c!6584 () Bool)

(declare-fun b!48942 () Bool)

(declare-fun e!31428 () List!1304)

(declare-fun c!6587 () Bool)

(assert (=> b!48942 (= e!31428 (ite c!6587 (t!4332 (t!4332 l!1333)) (ite c!6584 (Cons!1300 (h!1880 (t!4332 l!1333)) (t!4332 (t!4332 l!1333))) Nil!1301)))))

(declare-fun b!48943 () Bool)

(declare-fun e!31426 () List!1304)

(declare-fun e!31427 () List!1304)

(assert (=> b!48943 (= e!31426 e!31427)))

(assert (=> b!48943 (= c!6587 (and (is-Cons!1300 (t!4332 l!1333)) (= (_1!909 (h!1880 (t!4332 l!1333))) newKey!147)))))

(declare-fun b!48944 () Bool)

(declare-fun call!3805 () List!1304)

(assert (=> b!48944 (= e!31427 call!3805)))

(declare-fun bm!3801 () Bool)

(declare-fun call!3804 () List!1304)

(assert (=> bm!3801 (= call!3805 call!3804)))

(declare-fun b!48945 () Bool)

(declare-fun e!31429 () List!1304)

(declare-fun call!3803 () List!1304)

(assert (=> b!48945 (= e!31429 call!3803)))

(declare-fun b!48946 () Bool)

(assert (=> b!48946 (= e!31429 call!3803)))

(declare-fun d!9727 () Bool)

(assert (=> d!9727 e!31430))

(declare-fun res!28378 () Bool)

(assert (=> d!9727 (=> (not res!28378) (not e!31430))))

(assert (=> d!9727 (= res!28378 (isStrictlySorted!268 lt!20698))))

(assert (=> d!9727 (= lt!20698 e!31426)))

(declare-fun c!6586 () Bool)

(assert (=> d!9727 (= c!6586 (and (is-Cons!1300 (t!4332 l!1333)) (bvslt (_1!909 (h!1880 (t!4332 l!1333))) newKey!147)))))

(assert (=> d!9727 (isStrictlySorted!268 (t!4332 l!1333))))

(assert (=> d!9727 (= (insertStrictlySorted!34 (t!4332 l!1333) newKey!147 newValue!147) lt!20698)))

(declare-fun bm!3800 () Bool)

(assert (=> bm!3800 (= call!3804 ($colon$colon!54 e!31428 (ite c!6586 (h!1880 (t!4332 l!1333)) (tuple2!1797 newKey!147 newValue!147))))))

(declare-fun c!6585 () Bool)

(assert (=> bm!3800 (= c!6585 c!6586)))

(declare-fun bm!3802 () Bool)

(assert (=> bm!3802 (= call!3803 call!3805)))

(declare-fun b!48947 () Bool)

(assert (=> b!48947 (= c!6584 (and (is-Cons!1300 (t!4332 l!1333)) (bvsgt (_1!909 (h!1880 (t!4332 l!1333))) newKey!147)))))

(assert (=> b!48947 (= e!31427 e!31429)))

(declare-fun b!48948 () Bool)

(assert (=> b!48948 (= e!31428 (insertStrictlySorted!34 (t!4332 (t!4332 l!1333)) newKey!147 newValue!147))))

(declare-fun b!48949 () Bool)

(assert (=> b!48949 (= e!31426 call!3804)))

(assert (= (and d!9727 c!6586) b!48949))

(assert (= (and d!9727 (not c!6586)) b!48943))

(assert (= (and b!48943 c!6587) b!48944))

(assert (= (and b!48943 (not c!6587)) b!48947))

(assert (= (and b!48947 c!6584) b!48945))

(assert (= (and b!48947 (not c!6584)) b!48946))

(assert (= (or b!48945 b!48946) bm!3802))

(assert (= (or b!48944 bm!3802) bm!3801))

(assert (= (or b!48949 bm!3801) bm!3800))

(assert (= (and bm!3800 c!6585) b!48948))

(assert (= (and bm!3800 (not c!6585)) b!48942))

(assert (= (and d!9727 res!28378) b!48941))

(assert (= (and b!48941 res!28379) b!48940))

(declare-fun m!42513 () Bool)

(assert (=> b!48948 m!42513))

(declare-fun m!42515 () Bool)

(assert (=> b!48940 m!42515))

(declare-fun m!42517 () Bool)

(assert (=> b!48941 m!42517))

(declare-fun m!42519 () Bool)

(assert (=> d!9727 m!42519))

(assert (=> d!9727 m!42425))

(declare-fun m!42521 () Bool)

(assert (=> bm!3800 m!42521))

(assert (=> b!48886 d!9727))

(declare-fun d!9729 () Bool)

(declare-fun res!28380 () Bool)

(declare-fun e!31431 () Bool)

(assert (=> d!9729 (=> res!28380 e!31431)))

(assert (=> d!9729 (= res!28380 (and (is-Cons!1300 lt!20690) (= (_1!909 (h!1880 lt!20690)) newKey!147)))))

(assert (=> d!9729 (= (containsKey!117 lt!20690 newKey!147) e!31431)))

(declare-fun b!48950 () Bool)

(declare-fun e!31432 () Bool)

(assert (=> b!48950 (= e!31431 e!31432)))

(declare-fun res!28381 () Bool)

(assert (=> b!48950 (=> (not res!28381) (not e!31432))))

(assert (=> b!48950 (= res!28381 (and (or (not (is-Cons!1300 lt!20690)) (bvsle (_1!909 (h!1880 lt!20690)) newKey!147)) (is-Cons!1300 lt!20690) (bvslt (_1!909 (h!1880 lt!20690)) newKey!147)))))

(declare-fun b!48951 () Bool)

(assert (=> b!48951 (= e!31432 (containsKey!117 (t!4332 lt!20690) newKey!147))))

(assert (= (and d!9729 (not res!28380)) b!48950))

(assert (= (and b!48950 res!28381) b!48951))

(declare-fun m!42523 () Bool)

(assert (=> b!48951 m!42523))

(assert (=> b!48879 d!9729))

(declare-fun d!9731 () Bool)

(declare-fun res!28382 () Bool)

(declare-fun e!31433 () Bool)

(assert (=> d!9731 (=> res!28382 e!31433)))

(assert (=> d!9731 (= res!28382 (or (is-Nil!1301 lt!20690) (is-Nil!1301 (t!4332 lt!20690))))))

(assert (=> d!9731 (= (isStrictlySorted!268 lt!20690) e!31433)))

(declare-fun b!48952 () Bool)

(declare-fun e!31434 () Bool)

(assert (=> b!48952 (= e!31433 e!31434)))

(declare-fun res!28383 () Bool)

(assert (=> b!48952 (=> (not res!28383) (not e!31434))))

(assert (=> b!48952 (= res!28383 (bvslt (_1!909 (h!1880 lt!20690)) (_1!909 (h!1880 (t!4332 lt!20690)))))))

(declare-fun b!48953 () Bool)

(assert (=> b!48953 (= e!31434 (isStrictlySorted!268 (t!4332 lt!20690)))))

(assert (= (and d!9731 (not res!28382)) b!48952))

(assert (= (and b!48952 res!28383) b!48953))

(declare-fun m!42525 () Bool)

(assert (=> b!48953 m!42525))

(assert (=> d!9697 d!9731))

(assert (=> d!9697 d!9687))

(declare-fun d!9733 () Bool)

(declare-fun res!28384 () Bool)

(declare-fun e!31435 () Bool)

(assert (=> d!9733 (=> res!28384 e!31435)))

(assert (=> d!9733 (= res!28384 (and (is-Cons!1300 (t!4332 l!1333)) (= (_1!909 (h!1880 (t!4332 l!1333))) newKey!147)))))

(assert (=> d!9733 (= (containsKey!117 (t!4332 l!1333) newKey!147) e!31435)))

(declare-fun b!48954 () Bool)

(declare-fun e!31436 () Bool)

(assert (=> b!48954 (= e!31435 e!31436)))

(declare-fun res!28385 () Bool)

(assert (=> b!48954 (=> (not res!28385) (not e!31436))))

(assert (=> b!48954 (= res!28385 (and (or (not (is-Cons!1300 (t!4332 l!1333))) (bvsle (_1!909 (h!1880 (t!4332 l!1333))) newKey!147)) (is-Cons!1300 (t!4332 l!1333)) (bvslt (_1!909 (h!1880 (t!4332 l!1333))) newKey!147)))))

(declare-fun b!48955 () Bool)

(assert (=> b!48955 (= e!31436 (containsKey!117 (t!4332 (t!4332 l!1333)) newKey!147))))

(assert (= (and d!9733 (not res!28384)) b!48954))

(assert (= (and b!48954 res!28385) b!48955))

(declare-fun m!42527 () Bool)

(assert (=> b!48955 m!42527))

(assert (=> b!48761 d!9733))

(declare-fun d!9735 () Bool)

(declare-fun c!6588 () Bool)

(assert (=> d!9735 (= c!6588 (is-Nil!1301 (t!4332 l!1333)))))

(declare-fun e!31437 () (Set tuple2!1796))

(assert (=> d!9735 (= (content!49 (t!4332 l!1333)) e!31437)))

(declare-fun b!48956 () Bool)

(assert (=> b!48956 (= e!31437 (as set.empty (Set tuple2!1796)))))

(declare-fun b!48957 () Bool)

(assert (=> b!48957 (= e!31437 (set.union (set.insert (h!1880 (t!4332 l!1333)) (as set.empty (Set tuple2!1796))) (content!49 (t!4332 (t!4332 l!1333)))))))

(assert (= (and d!9735 c!6588) b!48956))

(assert (= (and d!9735 (not c!6588)) b!48957))

(declare-fun m!42529 () Bool)

(assert (=> b!48957 m!42529))

(declare-fun m!42531 () Bool)

(assert (=> b!48957 m!42531))

(assert (=> b!48777 d!9735))

(declare-fun d!9737 () Bool)

(assert (=> d!9737 (= ($colon$colon!54 e!31383 (ite c!6575 (h!1880 l!1333) (tuple2!1797 newKey!147 newValue!147))) (Cons!1300 (ite c!6575 (h!1880 l!1333) (tuple2!1797 newKey!147 newValue!147)) e!31383))))

(assert (=> bm!3794 d!9737))

(declare-fun d!9739 () Bool)

(declare-fun res!28386 () Bool)

(declare-fun e!31438 () Bool)

(assert (=> d!9739 (=> res!28386 e!31438)))

(assert (=> d!9739 (= res!28386 (or (is-Nil!1301 (t!4332 l!1333)) (is-Nil!1301 (t!4332 (t!4332 l!1333)))))))

(assert (=> d!9739 (= (isStrictlySorted!268 (t!4332 l!1333)) e!31438)))

(declare-fun b!48958 () Bool)

(declare-fun e!31439 () Bool)

(assert (=> b!48958 (= e!31438 e!31439)))

(declare-fun res!28387 () Bool)

(assert (=> b!48958 (=> (not res!28387) (not e!31439))))

(assert (=> b!48958 (= res!28387 (bvslt (_1!909 (h!1880 (t!4332 l!1333))) (_1!909 (h!1880 (t!4332 (t!4332 l!1333))))))))

(declare-fun b!48959 () Bool)

(assert (=> b!48959 (= e!31439 (isStrictlySorted!268 (t!4332 (t!4332 l!1333))))))

(assert (= (and d!9739 (not res!28386)) b!48958))

