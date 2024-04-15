; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137918 () Bool)

(assert start!137918)

(declare-fun b!1583377 () Bool)

(declare-fun e!883809 () Bool)

(declare-fun tp_is_empty!39423 () Bool)

(declare-fun tp!115025 () Bool)

(assert (=> b!1583377 (= e!883809 (and tp_is_empty!39423 tp!115025))))

(declare-fun e!883810 () Bool)

(declare-fun newKey!123 () (_ BitVec 64))

(declare-datatypes ((B!2890 0))(
  ( (B!2891 (val!19807 Int)) )
))
(declare-datatypes ((tuple2!25850 0))(
  ( (tuple2!25851 (_1!12936 (_ BitVec 64)) (_2!12936 B!2890)) )
))
(declare-datatypes ((List!36968 0))(
  ( (Nil!36965) (Cons!36964 (h!38508 tuple2!25850) (t!51874 List!36968)) )
))
(declare-fun l!1251 () List!36968)

(declare-fun newValue!123 () B!2890)

(declare-fun b!1583378 () Bool)

(declare-fun isStrictlySorted!1153 (List!36968) Bool)

(declare-fun insertStrictlySorted!622 (List!36968 (_ BitVec 64) B!2890) List!36968)

(assert (=> b!1583378 (= e!883810 (not (isStrictlySorted!1153 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123))))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!987 (List!36968 (_ BitVec 64)) Bool)

(assert (=> b!1583378 (not (containsKey!987 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52101 0))(
  ( (Unit!52102) )
))
(declare-fun lt!676919 () Unit!52101)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!8 (List!36968 (_ BitVec 64) B!2890 (_ BitVec 64)) Unit!52101)

(assert (=> b!1583378 (= lt!676919 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!8 (t!51874 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1583379 () Bool)

(declare-fun res!1081674 () Bool)

(assert (=> b!1583379 (=> (not res!1081674) (not e!883810))))

(assert (=> b!1583379 (= res!1081674 (isStrictlySorted!1153 (t!51874 l!1251)))))

(declare-fun b!1583380 () Bool)

(declare-fun res!1081675 () Bool)

(assert (=> b!1583380 (=> (not res!1081675) (not e!883810))))

(assert (=> b!1583380 (= res!1081675 (not (containsKey!987 l!1251 otherKey!56)))))

(declare-fun res!1081672 () Bool)

(assert (=> start!137918 (=> (not res!1081672) (not e!883810))))

(assert (=> start!137918 (= res!1081672 (isStrictlySorted!1153 l!1251))))

(assert (=> start!137918 e!883810))

(assert (=> start!137918 e!883809))

(assert (=> start!137918 true))

(assert (=> start!137918 tp_is_empty!39423))

(declare-fun b!1583381 () Bool)

(declare-fun res!1081673 () Bool)

(assert (=> b!1583381 (=> (not res!1081673) (not e!883810))))

(assert (=> b!1583381 (= res!1081673 (not (containsKey!987 (t!51874 l!1251) otherKey!56)))))

(declare-fun b!1583382 () Bool)

(declare-fun res!1081676 () Bool)

(assert (=> b!1583382 (=> (not res!1081676) (not e!883810))))

(assert (=> b!1583382 (= res!1081676 (and (not (= otherKey!56 newKey!123)) (is-Cons!36964 l!1251)))))

(assert (= (and start!137918 res!1081672) b!1583380))

(assert (= (and b!1583380 res!1081675) b!1583382))

(assert (= (and b!1583382 res!1081676) b!1583379))

(assert (= (and b!1583379 res!1081674) b!1583381))

(assert (= (and b!1583381 res!1081673) b!1583378))

(assert (= (and start!137918 (is-Cons!36964 l!1251)) b!1583377))

(declare-fun m!1452541 () Bool)

(assert (=> b!1583378 m!1452541))

(declare-fun m!1452543 () Bool)

(assert (=> b!1583378 m!1452543))

(declare-fun m!1452545 () Bool)

(assert (=> b!1583378 m!1452545))

(declare-fun m!1452547 () Bool)

(assert (=> b!1583378 m!1452547))

(assert (=> b!1583378 m!1452547))

(declare-fun m!1452549 () Bool)

(assert (=> b!1583378 m!1452549))

(assert (=> b!1583378 m!1452543))

(declare-fun m!1452551 () Bool)

(assert (=> start!137918 m!1452551))

(declare-fun m!1452553 () Bool)

(assert (=> b!1583380 m!1452553))

(declare-fun m!1452555 () Bool)

(assert (=> b!1583379 m!1452555))

(declare-fun m!1452557 () Bool)

(assert (=> b!1583381 m!1452557))

(push 1)

(assert (not b!1583378))

(assert tp_is_empty!39423)

(assert (not b!1583377))

(assert (not b!1583380))

(assert (not b!1583379))

(assert (not start!137918))

(assert (not b!1583381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167035 () Bool)

(declare-fun res!1081696 () Bool)

(declare-fun e!883821 () Bool)

(assert (=> d!167035 (=> res!1081696 e!883821)))

(assert (=> d!167035 (= res!1081696 (or (is-Nil!36965 l!1251) (is-Nil!36965 (t!51874 l!1251))))))

(assert (=> d!167035 (= (isStrictlySorted!1153 l!1251) e!883821)))

(declare-fun b!1583405 () Bool)

(declare-fun e!883822 () Bool)

(assert (=> b!1583405 (= e!883821 e!883822)))

(declare-fun res!1081697 () Bool)

(assert (=> b!1583405 (=> (not res!1081697) (not e!883822))))

(assert (=> b!1583405 (= res!1081697 (bvslt (_1!12936 (h!38508 l!1251)) (_1!12936 (h!38508 (t!51874 l!1251)))))))

(declare-fun b!1583406 () Bool)

(assert (=> b!1583406 (= e!883822 (isStrictlySorted!1153 (t!51874 l!1251)))))

(assert (= (and d!167035 (not res!1081696)) b!1583405))

(assert (= (and b!1583405 res!1081697) b!1583406))

(assert (=> b!1583406 m!1452555))

(assert (=> start!137918 d!167035))

(declare-fun d!167039 () Bool)

(declare-fun res!1081708 () Bool)

(declare-fun e!883833 () Bool)

(assert (=> d!167039 (=> res!1081708 e!883833)))

(assert (=> d!167039 (= res!1081708 (and (is-Cons!36964 (t!51874 l!1251)) (= (_1!12936 (h!38508 (t!51874 l!1251))) otherKey!56)))))

(assert (=> d!167039 (= (containsKey!987 (t!51874 l!1251) otherKey!56) e!883833)))

(declare-fun b!1583417 () Bool)

(declare-fun e!883834 () Bool)

(assert (=> b!1583417 (= e!883833 e!883834)))

(declare-fun res!1081709 () Bool)

(assert (=> b!1583417 (=> (not res!1081709) (not e!883834))))

(assert (=> b!1583417 (= res!1081709 (and (or (not (is-Cons!36964 (t!51874 l!1251))) (bvsle (_1!12936 (h!38508 (t!51874 l!1251))) otherKey!56)) (is-Cons!36964 (t!51874 l!1251)) (bvslt (_1!12936 (h!38508 (t!51874 l!1251))) otherKey!56)))))

(declare-fun b!1583418 () Bool)

(assert (=> b!1583418 (= e!883834 (containsKey!987 (t!51874 (t!51874 l!1251)) otherKey!56))))

(assert (= (and d!167039 (not res!1081708)) b!1583417))

(assert (= (and b!1583417 res!1081709) b!1583418))

(declare-fun m!1452577 () Bool)

(assert (=> b!1583418 m!1452577))

(assert (=> b!1583381 d!167039))

(declare-fun d!167043 () Bool)

(declare-fun res!1081710 () Bool)

(declare-fun e!883835 () Bool)

(assert (=> d!167043 (=> res!1081710 e!883835)))

(assert (=> d!167043 (= res!1081710 (and (is-Cons!36964 l!1251) (= (_1!12936 (h!38508 l!1251)) otherKey!56)))))

(assert (=> d!167043 (= (containsKey!987 l!1251 otherKey!56) e!883835)))

(declare-fun b!1583419 () Bool)

(declare-fun e!883836 () Bool)

(assert (=> b!1583419 (= e!883835 e!883836)))

(declare-fun res!1081711 () Bool)

(assert (=> b!1583419 (=> (not res!1081711) (not e!883836))))

(assert (=> b!1583419 (= res!1081711 (and (or (not (is-Cons!36964 l!1251)) (bvsle (_1!12936 (h!38508 l!1251)) otherKey!56)) (is-Cons!36964 l!1251) (bvslt (_1!12936 (h!38508 l!1251)) otherKey!56)))))

(declare-fun b!1583420 () Bool)

(assert (=> b!1583420 (= e!883836 (containsKey!987 (t!51874 l!1251) otherKey!56))))

(assert (= (and d!167043 (not res!1081710)) b!1583419))

(assert (= (and b!1583419 res!1081711) b!1583420))

(assert (=> b!1583420 m!1452557))

(assert (=> b!1583380 d!167043))

(declare-fun d!167045 () Bool)

(declare-fun res!1081712 () Bool)

(declare-fun e!883837 () Bool)

(assert (=> d!167045 (=> res!1081712 e!883837)))

(assert (=> d!167045 (= res!1081712 (or (is-Nil!36965 (t!51874 l!1251)) (is-Nil!36965 (t!51874 (t!51874 l!1251)))))))

(assert (=> d!167045 (= (isStrictlySorted!1153 (t!51874 l!1251)) e!883837)))

(declare-fun b!1583421 () Bool)

(declare-fun e!883838 () Bool)

(assert (=> b!1583421 (= e!883837 e!883838)))

(declare-fun res!1081713 () Bool)

(assert (=> b!1583421 (=> (not res!1081713) (not e!883838))))

(assert (=> b!1583421 (= res!1081713 (bvslt (_1!12936 (h!38508 (t!51874 l!1251))) (_1!12936 (h!38508 (t!51874 (t!51874 l!1251))))))))

(declare-fun b!1583422 () Bool)

(assert (=> b!1583422 (= e!883838 (isStrictlySorted!1153 (t!51874 (t!51874 l!1251))))))

(assert (= (and d!167045 (not res!1081712)) b!1583421))

(assert (= (and b!1583421 res!1081713) b!1583422))

(declare-fun m!1452579 () Bool)

(assert (=> b!1583422 m!1452579))

(assert (=> b!1583379 d!167045))

(declare-fun e!883865 () List!36968)

(declare-fun b!1583469 () Bool)

(assert (=> b!1583469 (= e!883865 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123))))

(declare-fun b!1583470 () Bool)

(declare-fun e!883867 () List!36968)

(declare-fun e!883866 () List!36968)

(assert (=> b!1583470 (= e!883867 e!883866)))

(declare-fun c!146681 () Bool)

(assert (=> b!1583470 (= c!146681 (and (is-Cons!36964 l!1251) (= (_1!12936 (h!38508 l!1251)) newKey!123)))))

(declare-fun b!1583471 () Bool)

(declare-fun res!1081729 () Bool)

(declare-fun e!883868 () Bool)

(assert (=> b!1583471 (=> (not res!1081729) (not e!883868))))

(declare-fun lt!676927 () List!36968)

(assert (=> b!1583471 (= res!1081729 (containsKey!987 lt!676927 newKey!123))))

(declare-fun b!1583472 () Bool)

(declare-fun call!72457 () List!36968)

(assert (=> b!1583472 (= e!883867 call!72457)))

(declare-fun b!1583473 () Bool)

(declare-fun c!146679 () Bool)

(assert (=> b!1583473 (= c!146679 (and (is-Cons!36964 l!1251) (bvsgt (_1!12936 (h!38508 l!1251)) newKey!123)))))

(declare-fun e!883869 () List!36968)

(assert (=> b!1583473 (= e!883866 e!883869)))

(declare-fun bm!72455 () Bool)

(declare-fun c!146680 () Bool)

(declare-fun $colon$colon!1021 (List!36968 tuple2!25850) List!36968)

(assert (=> bm!72455 (= call!72457 ($colon$colon!1021 e!883865 (ite c!146680 (h!38508 l!1251) (tuple2!25851 newKey!123 newValue!123))))))

(declare-fun c!146678 () Bool)

(assert (=> bm!72455 (= c!146678 c!146680)))

(declare-fun b!1583474 () Bool)

(declare-fun contains!10475 (List!36968 tuple2!25850) Bool)

(assert (=> b!1583474 (= e!883868 (contains!10475 lt!676927 (tuple2!25851 newKey!123 newValue!123)))))

(declare-fun b!1583475 () Bool)

(declare-fun call!72459 () List!36968)

(assert (=> b!1583475 (= e!883866 call!72459)))

(declare-fun bm!72456 () Bool)

(assert (=> bm!72456 (= call!72459 call!72457)))

(declare-fun b!1583476 () Bool)

(declare-fun call!72458 () List!36968)

(assert (=> b!1583476 (= e!883869 call!72458)))

(declare-fun b!1583477 () Bool)

(assert (=> b!1583477 (= e!883865 (ite c!146681 (t!51874 l!1251) (ite c!146679 (Cons!36964 (h!38508 l!1251) (t!51874 l!1251)) Nil!36965)))))

(declare-fun b!1583478 () Bool)

(assert (=> b!1583478 (= e!883869 call!72458)))

(declare-fun bm!72454 () Bool)

(assert (=> bm!72454 (= call!72458 call!72459)))

(declare-fun d!167047 () Bool)

(assert (=> d!167047 e!883868))

(declare-fun res!1081728 () Bool)

(assert (=> d!167047 (=> (not res!1081728) (not e!883868))))

(assert (=> d!167047 (= res!1081728 (isStrictlySorted!1153 lt!676927))))

(assert (=> d!167047 (= lt!676927 e!883867)))

(assert (=> d!167047 (= c!146680 (and (is-Cons!36964 l!1251) (bvslt (_1!12936 (h!38508 l!1251)) newKey!123)))))

(assert (=> d!167047 (isStrictlySorted!1153 l!1251)))

(assert (=> d!167047 (= (insertStrictlySorted!622 l!1251 newKey!123 newValue!123) lt!676927)))

(assert (= (and d!167047 c!146680) b!1583472))

(assert (= (and d!167047 (not c!146680)) b!1583470))

(assert (= (and b!1583470 c!146681) b!1583475))

(assert (= (and b!1583470 (not c!146681)) b!1583473))

(assert (= (and b!1583473 c!146679) b!1583476))

(assert (= (and b!1583473 (not c!146679)) b!1583478))

(assert (= (or b!1583476 b!1583478) bm!72454))

(assert (= (or b!1583475 bm!72454) bm!72456))

(assert (= (or b!1583472 bm!72456) bm!72455))

(assert (= (and bm!72455 c!146678) b!1583469))

(assert (= (and bm!72455 (not c!146678)) b!1583477))

(assert (= (and d!167047 res!1081728) b!1583471))

(assert (= (and b!1583471 res!1081729) b!1583474))

(assert (=> b!1583469 m!1452547))

(declare-fun m!1452581 () Bool)

(assert (=> d!167047 m!1452581))

(assert (=> d!167047 m!1452551))

(declare-fun m!1452583 () Bool)

(assert (=> b!1583474 m!1452583))

(declare-fun m!1452585 () Bool)

(assert (=> b!1583471 m!1452585))

(declare-fun m!1452587 () Bool)

(assert (=> bm!72455 m!1452587))

(assert (=> b!1583378 d!167047))

(declare-fun d!167051 () Bool)

(declare-fun res!1081730 () Bool)

(declare-fun e!883870 () Bool)

(assert (=> d!167051 (=> res!1081730 e!883870)))

(assert (=> d!167051 (= res!1081730 (or (is-Nil!36965 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123)) (is-Nil!36965 (t!51874 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!167051 (= (isStrictlySorted!1153 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123)) e!883870)))

(declare-fun b!1583479 () Bool)

(declare-fun e!883871 () Bool)

(assert (=> b!1583479 (= e!883870 e!883871)))

(declare-fun res!1081731 () Bool)

(assert (=> b!1583479 (=> (not res!1081731) (not e!883871))))

(assert (=> b!1583479 (= res!1081731 (bvslt (_1!12936 (h!38508 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123))) (_1!12936 (h!38508 (t!51874 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1583480 () Bool)

(assert (=> b!1583480 (= e!883871 (isStrictlySorted!1153 (t!51874 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!167051 (not res!1081730)) b!1583479))

(assert (= (and b!1583479 res!1081731) b!1583480))

(declare-fun m!1452589 () Bool)

(assert (=> b!1583480 m!1452589))

(assert (=> b!1583378 d!167051))

(declare-fun b!1583491 () Bool)

(declare-fun e!883877 () List!36968)

(assert (=> b!1583491 (= e!883877 (insertStrictlySorted!622 (t!51874 (t!51874 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1583492 () Bool)

(declare-fun e!883879 () List!36968)

(declare-fun e!883878 () List!36968)

(assert (=> b!1583492 (= e!883879 e!883878)))

(declare-fun c!146689 () Bool)

(assert (=> b!1583492 (= c!146689 (and (is-Cons!36964 (t!51874 l!1251)) (= (_1!12936 (h!38508 (t!51874 l!1251))) newKey!123)))))

(declare-fun b!1583493 () Bool)

(declare-fun res!1081735 () Bool)

(declare-fun e!883880 () Bool)

(assert (=> b!1583493 (=> (not res!1081735) (not e!883880))))

(declare-fun lt!676929 () List!36968)

(assert (=> b!1583493 (= res!1081735 (containsKey!987 lt!676929 newKey!123))))

(declare-fun b!1583494 () Bool)

(declare-fun call!72463 () List!36968)

(assert (=> b!1583494 (= e!883879 call!72463)))

(declare-fun b!1583495 () Bool)

(declare-fun c!146687 () Bool)

(assert (=> b!1583495 (= c!146687 (and (is-Cons!36964 (t!51874 l!1251)) (bvsgt (_1!12936 (h!38508 (t!51874 l!1251))) newKey!123)))))

(declare-fun e!883881 () List!36968)

(assert (=> b!1583495 (= e!883878 e!883881)))

(declare-fun bm!72461 () Bool)

(declare-fun c!146688 () Bool)

(assert (=> bm!72461 (= call!72463 ($colon$colon!1021 e!883877 (ite c!146688 (h!38508 (t!51874 l!1251)) (tuple2!25851 newKey!123 newValue!123))))))

(declare-fun c!146686 () Bool)

(assert (=> bm!72461 (= c!146686 c!146688)))

(declare-fun b!1583496 () Bool)

(assert (=> b!1583496 (= e!883880 (contains!10475 lt!676929 (tuple2!25851 newKey!123 newValue!123)))))

(declare-fun b!1583497 () Bool)

(declare-fun call!72465 () List!36968)

(assert (=> b!1583497 (= e!883878 call!72465)))

(declare-fun bm!72462 () Bool)

(assert (=> bm!72462 (= call!72465 call!72463)))

(declare-fun b!1583498 () Bool)

(declare-fun call!72464 () List!36968)

(assert (=> b!1583498 (= e!883881 call!72464)))

(declare-fun b!1583499 () Bool)

(assert (=> b!1583499 (= e!883877 (ite c!146689 (t!51874 (t!51874 l!1251)) (ite c!146687 (Cons!36964 (h!38508 (t!51874 l!1251)) (t!51874 (t!51874 l!1251))) Nil!36965)))))

(declare-fun b!1583500 () Bool)

(assert (=> b!1583500 (= e!883881 call!72464)))

(declare-fun bm!72460 () Bool)

(assert (=> bm!72460 (= call!72464 call!72465)))

(declare-fun d!167053 () Bool)

(assert (=> d!167053 e!883880))

(declare-fun res!1081734 () Bool)

(assert (=> d!167053 (=> (not res!1081734) (not e!883880))))

(assert (=> d!167053 (= res!1081734 (isStrictlySorted!1153 lt!676929))))

(assert (=> d!167053 (= lt!676929 e!883879)))

(assert (=> d!167053 (= c!146688 (and (is-Cons!36964 (t!51874 l!1251)) (bvslt (_1!12936 (h!38508 (t!51874 l!1251))) newKey!123)))))

(assert (=> d!167053 (isStrictlySorted!1153 (t!51874 l!1251))))

(assert (=> d!167053 (= (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123) lt!676929)))

(assert (= (and d!167053 c!146688) b!1583494))

(assert (= (and d!167053 (not c!146688)) b!1583492))

(assert (= (and b!1583492 c!146689) b!1583497))

(assert (= (and b!1583492 (not c!146689)) b!1583495))

(assert (= (and b!1583495 c!146687) b!1583498))

(assert (= (and b!1583495 (not c!146687)) b!1583500))

(assert (= (or b!1583498 b!1583500) bm!72460))

(assert (= (or b!1583497 bm!72460) bm!72462))

(assert (= (or b!1583494 bm!72462) bm!72461))

(assert (= (and bm!72461 c!146686) b!1583491))

(assert (= (and bm!72461 (not c!146686)) b!1583499))

(assert (= (and d!167053 res!1081734) b!1583493))

(assert (= (and b!1583493 res!1081735) b!1583496))

(declare-fun m!1452591 () Bool)

(assert (=> b!1583491 m!1452591))

(declare-fun m!1452593 () Bool)

(assert (=> d!167053 m!1452593))

(assert (=> d!167053 m!1452555))

(declare-fun m!1452595 () Bool)

(assert (=> b!1583496 m!1452595))

(declare-fun m!1452597 () Bool)

(assert (=> b!1583493 m!1452597))

(declare-fun m!1452599 () Bool)

(assert (=> bm!72461 m!1452599))

(assert (=> b!1583378 d!167053))

(declare-fun d!167055 () Bool)

(assert (=> d!167055 (not (containsKey!987 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!676934 () Unit!52101)

(declare-fun choose!2115 (List!36968 (_ BitVec 64) B!2890 (_ BitVec 64)) Unit!52101)

(assert (=> d!167055 (= lt!676934 (choose!2115 (t!51874 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!883898 () Bool)

(assert (=> d!167055 e!883898))

(declare-fun res!1081748 () Bool)

(assert (=> d!167055 (=> (not res!1081748) (not e!883898))))

(assert (=> d!167055 (= res!1081748 (isStrictlySorted!1153 (t!51874 l!1251)))))

(assert (=> d!167055 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!8 (t!51874 l!1251) newKey!123 newValue!123 otherKey!56) lt!676934)))

(declare-fun b!1583529 () Bool)

(declare-fun res!1081749 () Bool)

(assert (=> b!1583529 (=> (not res!1081749) (not e!883898))))

(assert (=> b!1583529 (= res!1081749 (not (containsKey!987 (t!51874 l!1251) otherKey!56)))))

(declare-fun b!1583530 () Bool)

(assert (=> b!1583530 (= e!883898 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!167055 res!1081748) b!1583529))

(assert (= (and b!1583529 res!1081749) b!1583530))

(assert (=> d!167055 m!1452547))

(assert (=> d!167055 m!1452547))

(assert (=> d!167055 m!1452549))

(declare-fun m!1452609 () Bool)

(assert (=> d!167055 m!1452609))

(assert (=> d!167055 m!1452555))

(assert (=> b!1583529 m!1452557))

(assert (=> b!1583378 d!167055))

(declare-fun d!167059 () Bool)

(declare-fun res!1081752 () Bool)

(declare-fun e!883901 () Bool)

(assert (=> d!167059 (=> res!1081752 e!883901)))

(assert (=> d!167059 (= res!1081752 (and (is-Cons!36964 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123)) (= (_1!12936 (h!38508 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167059 (= (containsKey!987 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123) otherKey!56) e!883901)))

(declare-fun b!1583533 () Bool)

(declare-fun e!883902 () Bool)

(assert (=> b!1583533 (= e!883901 e!883902)))

(declare-fun res!1081753 () Bool)

(assert (=> b!1583533 (=> (not res!1081753) (not e!883902))))

(assert (=> b!1583533 (= res!1081753 (and (or (not (is-Cons!36964 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123))) (bvsle (_1!12936 (h!38508 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123))) otherKey!56)) (is-Cons!36964 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123)) (bvslt (_1!12936 (h!38508 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1583534 () Bool)

(assert (=> b!1583534 (= e!883902 (containsKey!987 (t!51874 (insertStrictlySorted!622 (t!51874 l!1251) newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167059 (not res!1081752)) b!1583533))

(assert (= (and b!1583533 res!1081753) b!1583534))

(declare-fun m!1452613 () Bool)

(assert (=> b!1583534 m!1452613))

(assert (=> b!1583378 d!167059))

(declare-fun b!1583549 () Bool)

(declare-fun e!883910 () Bool)

(declare-fun tp!115031 () Bool)

(assert (=> b!1583549 (= e!883910 (and tp_is_empty!39423 tp!115031))))

(assert (=> b!1583377 (= tp!115025 e!883910)))

(assert (= (and b!1583377 (is-Cons!36964 (t!51874 l!1251))) b!1583549))

(push 1)

(assert (not bm!72455))

(assert (not b!1583549))

(assert (not b!1583418))

(assert tp_is_empty!39423)

(assert (not d!167053))

(assert (not b!1583493))

(assert (not d!167055))

(assert (not b!1583480))

(assert (not bm!72461))

(assert (not b!1583406))

(assert (not b!1583534))

(assert (not b!1583496))

(assert (not b!1583491))

(assert (not b!1583529))

(assert (not b!1583422))

(assert (not b!1583474))

(assert (not d!167047))

(assert (not b!1583469))

(assert (not b!1583420))

(assert (not b!1583471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

