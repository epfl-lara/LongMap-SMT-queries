; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138120 () Bool)

(assert start!138120)

(declare-fun b!1584824 () Bool)

(declare-fun e!884743 () Bool)

(declare-fun tp_is_empty!39463 () Bool)

(declare-fun tp!115141 () Bool)

(assert (=> b!1584824 (= e!884743 (and tp_is_empty!39463 tp!115141))))

(declare-fun b!1584823 () Bool)

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun e!884742 () Bool)

(declare-datatypes ((B!2930 0))(
  ( (B!2931 (val!19827 Int)) )
))
(declare-fun newValue!123 () B!2930)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-datatypes ((tuple2!25822 0))(
  ( (tuple2!25823 (_1!12922 (_ BitVec 64)) (_2!12922 B!2930)) )
))
(declare-datatypes ((List!36947 0))(
  ( (Nil!36944) (Cons!36943 (h!38486 tuple2!25822) (t!51863 List!36947)) )
))
(declare-fun l!1251 () List!36947)

(declare-fun containsKey!1006 (List!36947 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!629 (List!36947 (_ BitVec 64) B!2930) List!36947)

(assert (=> b!1584823 (= e!884742 (containsKey!1006 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123) otherKey!56))))

(declare-fun res!1082458 () Bool)

(assert (=> start!138120 (=> (not res!1082458) (not e!884742))))

(declare-fun isStrictlySorted!1172 (List!36947) Bool)

(assert (=> start!138120 (= res!1082458 (isStrictlySorted!1172 l!1251))))

(assert (=> start!138120 e!884742))

(assert (=> start!138120 e!884743))

(assert (=> start!138120 true))

(assert (=> start!138120 tp_is_empty!39463))

(declare-fun b!1584822 () Bool)

(declare-fun res!1082459 () Bool)

(assert (=> b!1584822 (=> (not res!1082459) (not e!884742))))

(assert (=> b!1584822 (= res!1082459 (and (not (= otherKey!56 newKey!123)) (not (is-Cons!36943 l!1251))))))

(declare-fun b!1584821 () Bool)

(declare-fun res!1082457 () Bool)

(assert (=> b!1584821 (=> (not res!1082457) (not e!884742))))

(assert (=> b!1584821 (= res!1082457 (not (containsKey!1006 l!1251 otherKey!56)))))

(assert (= (and start!138120 res!1082458) b!1584821))

(assert (= (and b!1584821 res!1082457) b!1584822))

(assert (= (and b!1584822 res!1082459) b!1584823))

(assert (= (and start!138120 (is-Cons!36943 l!1251)) b!1584824))

(declare-fun m!1453955 () Bool)

(assert (=> b!1584823 m!1453955))

(assert (=> b!1584823 m!1453955))

(declare-fun m!1453957 () Bool)

(assert (=> b!1584823 m!1453957))

(declare-fun m!1453959 () Bool)

(assert (=> start!138120 m!1453959))

(declare-fun m!1453961 () Bool)

(assert (=> b!1584821 m!1453961))

(push 1)

(assert (not b!1584823))

(assert tp_is_empty!39463)

(assert (not start!138120))

(assert (not b!1584824))

(assert (not b!1584821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167557 () Bool)

(declare-fun res!1082492 () Bool)

(declare-fun e!884770 () Bool)

(assert (=> d!167557 (=> res!1082492 e!884770)))

(assert (=> d!167557 (= res!1082492 (and (is-Cons!36943 l!1251) (= (_1!12922 (h!38486 l!1251)) otherKey!56)))))

(assert (=> d!167557 (= (containsKey!1006 l!1251 otherKey!56) e!884770)))

(declare-fun b!1584863 () Bool)

(declare-fun e!884771 () Bool)

(assert (=> b!1584863 (= e!884770 e!884771)))

(declare-fun res!1082493 () Bool)

(assert (=> b!1584863 (=> (not res!1082493) (not e!884771))))

(assert (=> b!1584863 (= res!1082493 (and (or (not (is-Cons!36943 l!1251)) (bvsle (_1!12922 (h!38486 l!1251)) otherKey!56)) (is-Cons!36943 l!1251) (bvslt (_1!12922 (h!38486 l!1251)) otherKey!56)))))

(declare-fun b!1584864 () Bool)

(assert (=> b!1584864 (= e!884771 (containsKey!1006 (t!51863 l!1251) otherKey!56))))

(assert (= (and d!167557 (not res!1082492)) b!1584863))

(assert (= (and b!1584863 res!1082493) b!1584864))

(declare-fun m!1453981 () Bool)

(assert (=> b!1584864 m!1453981))

(assert (=> b!1584821 d!167557))

(declare-fun d!167563 () Bool)

(declare-fun res!1082504 () Bool)

(declare-fun e!884782 () Bool)

(assert (=> d!167563 (=> res!1082504 e!884782)))

(assert (=> d!167563 (= res!1082504 (or (is-Nil!36944 l!1251) (is-Nil!36944 (t!51863 l!1251))))))

(assert (=> d!167563 (= (isStrictlySorted!1172 l!1251) e!884782)))

(declare-fun b!1584875 () Bool)

(declare-fun e!884783 () Bool)

(assert (=> b!1584875 (= e!884782 e!884783)))

(declare-fun res!1082505 () Bool)

(assert (=> b!1584875 (=> (not res!1082505) (not e!884783))))

(assert (=> b!1584875 (= res!1082505 (bvslt (_1!12922 (h!38486 l!1251)) (_1!12922 (h!38486 (t!51863 l!1251)))))))

(declare-fun b!1584876 () Bool)

(assert (=> b!1584876 (= e!884783 (isStrictlySorted!1172 (t!51863 l!1251)))))

(assert (= (and d!167563 (not res!1082504)) b!1584875))

(assert (= (and b!1584875 res!1082505) b!1584876))

(declare-fun m!1453985 () Bool)

(assert (=> b!1584876 m!1453985))

(assert (=> start!138120 d!167563))

(declare-fun d!167567 () Bool)

(declare-fun res!1082508 () Bool)

(declare-fun e!884786 () Bool)

(assert (=> d!167567 (=> res!1082508 e!884786)))

(assert (=> d!167567 (= res!1082508 (and (is-Cons!36943 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123)) (= (_1!12922 (h!38486 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167567 (= (containsKey!1006 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123) otherKey!56) e!884786)))

(declare-fun b!1584879 () Bool)

(declare-fun e!884787 () Bool)

(assert (=> b!1584879 (= e!884786 e!884787)))

(declare-fun res!1082509 () Bool)

(assert (=> b!1584879 (=> (not res!1082509) (not e!884787))))

(assert (=> b!1584879 (= res!1082509 (and (or (not (is-Cons!36943 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123))) (bvsle (_1!12922 (h!38486 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123))) otherKey!56)) (is-Cons!36943 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123)) (bvslt (_1!12922 (h!38486 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1584880 () Bool)

(assert (=> b!1584880 (= e!884787 (containsKey!1006 (t!51863 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167567 (not res!1082508)) b!1584879))

(assert (= (and b!1584879 res!1082509) b!1584880))

(declare-fun m!1453989 () Bool)

(assert (=> b!1584880 m!1453989))

(assert (=> b!1584823 d!167567))

(declare-fun b!1584963 () Bool)

(declare-fun e!884831 () List!36947)

(declare-fun call!72609 () List!36947)

(assert (=> b!1584963 (= e!884831 call!72609)))

(declare-fun c!146947 () Bool)

(declare-fun e!884833 () List!36947)

(declare-fun c!146946 () Bool)

(declare-fun b!1584964 () Bool)

(assert (=> b!1584964 (= e!884833 (ite c!146946 (t!51863 l!1251) (ite c!146947 (Cons!36943 (h!38486 l!1251) (t!51863 l!1251)) Nil!36944)))))

(declare-fun call!72610 () List!36947)

(declare-fun bm!72606 () Bool)

(declare-fun c!146945 () Bool)

(declare-fun $colon$colon!1026 (List!36947 tuple2!25822) List!36947)

(assert (=> bm!72606 (= call!72610 ($colon$colon!1026 e!884833 (ite c!146945 (h!38486 l!1251) (tuple2!25823 newKey!123 newValue!123))))))

(declare-fun c!146944 () Bool)

(assert (=> bm!72606 (= c!146944 c!146945)))

(declare-fun b!1584965 () Bool)

(declare-fun e!884834 () List!36947)

(assert (=> b!1584965 (= e!884834 call!72610)))

(declare-fun b!1584966 () Bool)

(assert (=> b!1584966 (= c!146947 (and (is-Cons!36943 l!1251) (bvsgt (_1!12922 (h!38486 l!1251)) newKey!123)))))

(declare-fun e!884830 () List!36947)

(assert (=> b!1584966 (= e!884830 e!884831)))

(declare-fun bm!72607 () Bool)

(declare-fun call!72611 () List!36947)

(assert (=> bm!72607 (= call!72609 call!72611)))

(declare-fun b!1584967 () Bool)

(assert (=> b!1584967 (= e!884831 call!72609)))

(declare-fun e!884832 () Bool)

(declare-fun lt!677305 () List!36947)

(declare-fun b!1584968 () Bool)

(declare-fun contains!10530 (List!36947 tuple2!25822) Bool)

(assert (=> b!1584968 (= e!884832 (contains!10530 lt!677305 (tuple2!25823 newKey!123 newValue!123)))))

(declare-fun b!1584969 () Bool)

(assert (=> b!1584969 (= e!884833 (insertStrictlySorted!629 (t!51863 l!1251) newKey!123 newValue!123))))

(declare-fun b!1584970 () Bool)

(assert (=> b!1584970 (= e!884834 e!884830)))

(assert (=> b!1584970 (= c!146946 (and (is-Cons!36943 l!1251) (= (_1!12922 (h!38486 l!1251)) newKey!123)))))

(declare-fun b!1584971 () Bool)

(assert (=> b!1584971 (= e!884830 call!72611)))

(declare-fun b!1584972 () Bool)

(declare-fun res!1082529 () Bool)

(assert (=> b!1584972 (=> (not res!1082529) (not e!884832))))

(assert (=> b!1584972 (= res!1082529 (containsKey!1006 lt!677305 newKey!123))))

(declare-fun d!167571 () Bool)

(assert (=> d!167571 e!884832))

(declare-fun res!1082528 () Bool)

(assert (=> d!167571 (=> (not res!1082528) (not e!884832))))

(assert (=> d!167571 (= res!1082528 (isStrictlySorted!1172 lt!677305))))

(assert (=> d!167571 (= lt!677305 e!884834)))

(assert (=> d!167571 (= c!146945 (and (is-Cons!36943 l!1251) (bvslt (_1!12922 (h!38486 l!1251)) newKey!123)))))

(assert (=> d!167571 (isStrictlySorted!1172 l!1251)))

(assert (=> d!167571 (= (insertStrictlySorted!629 l!1251 newKey!123 newValue!123) lt!677305)))

(declare-fun bm!72608 () Bool)

(assert (=> bm!72608 (= call!72611 call!72610)))

(assert (= (and d!167571 c!146945) b!1584965))

(assert (= (and d!167571 (not c!146945)) b!1584970))

(assert (= (and b!1584970 c!146946) b!1584971))

(assert (= (and b!1584970 (not c!146946)) b!1584966))

(assert (= (and b!1584966 c!146947) b!1584967))

(assert (= (and b!1584966 (not c!146947)) b!1584963))

(assert (= (or b!1584967 b!1584963) bm!72607))

(assert (= (or b!1584971 bm!72607) bm!72608))

(assert (= (or b!1584965 bm!72608) bm!72606))

(assert (= (and bm!72606 c!146944) b!1584969))

(assert (= (and bm!72606 (not c!146944)) b!1584964))

(assert (= (and d!167571 res!1082528) b!1584972))

(assert (= (and b!1584972 res!1082529) b!1584968))

(declare-fun m!1454013 () Bool)

(assert (=> d!167571 m!1454013))

(assert (=> d!167571 m!1453959))

(declare-fun m!1454015 () Bool)

(assert (=> b!1584969 m!1454015))

(declare-fun m!1454017 () Bool)

(assert (=> bm!72606 m!1454017))

(declare-fun m!1454019 () Bool)

(assert (=> b!1584968 m!1454019))

(declare-fun m!1454021 () Bool)

(assert (=> b!1584972 m!1454021))

(assert (=> b!1584823 d!167571))

(declare-fun b!1584990 () Bool)

(declare-fun e!884847 () Bool)

(declare-fun tp!115152 () Bool)

(assert (=> b!1584990 (= e!884847 (and tp_is_empty!39463 tp!115152))))

(assert (=> b!1584824 (= tp!115141 e!884847)))

(assert (= (and b!1584824 (is-Cons!36943 (t!51863 l!1251))) b!1584990))

(push 1)

(assert (not bm!72606))

(assert (not b!1584968))

(assert (not d!167571))

(assert tp_is_empty!39463)

(assert (not b!1584969))

(assert (not b!1584876))

(assert (not b!1584880))

(assert (not b!1584864))

(assert (not b!1584972))

(assert (not b!1584990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1584996 () Bool)

(declare-fun e!884853 () List!36947)

(declare-fun call!72612 () List!36947)

(assert (=> b!1584996 (= e!884853 call!72612)))

(declare-fun c!146951 () Bool)

(declare-fun b!1584997 () Bool)

(declare-fun e!884855 () List!36947)

(declare-fun c!146950 () Bool)

(assert (=> b!1584997 (= e!884855 (ite c!146950 (t!51863 (t!51863 l!1251)) (ite c!146951 (Cons!36943 (h!38486 (t!51863 l!1251)) (t!51863 (t!51863 l!1251))) Nil!36944)))))

(declare-fun c!146949 () Bool)

(declare-fun bm!72609 () Bool)

(declare-fun call!72613 () List!36947)

(assert (=> bm!72609 (= call!72613 ($colon$colon!1026 e!884855 (ite c!146949 (h!38486 (t!51863 l!1251)) (tuple2!25823 newKey!123 newValue!123))))))

(declare-fun c!146948 () Bool)

(assert (=> bm!72609 (= c!146948 c!146949)))

(declare-fun b!1584998 () Bool)

(declare-fun e!884856 () List!36947)

(assert (=> b!1584998 (= e!884856 call!72613)))

(declare-fun b!1584999 () Bool)

(assert (=> b!1584999 (= c!146951 (and (is-Cons!36943 (t!51863 l!1251)) (bvsgt (_1!12922 (h!38486 (t!51863 l!1251))) newKey!123)))))

(declare-fun e!884852 () List!36947)

(assert (=> b!1584999 (= e!884852 e!884853)))

(declare-fun bm!72610 () Bool)

(declare-fun call!72614 () List!36947)

(assert (=> bm!72610 (= call!72612 call!72614)))

(declare-fun b!1585000 () Bool)

(assert (=> b!1585000 (= e!884853 call!72612)))

(declare-fun lt!677306 () List!36947)

(declare-fun b!1585001 () Bool)

(declare-fun e!884854 () Bool)

(assert (=> b!1585001 (= e!884854 (contains!10530 lt!677306 (tuple2!25823 newKey!123 newValue!123)))))

(declare-fun b!1585002 () Bool)

(assert (=> b!1585002 (= e!884855 (insertStrictlySorted!629 (t!51863 (t!51863 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1585003 () Bool)

(assert (=> b!1585003 (= e!884856 e!884852)))

(assert (=> b!1585003 (= c!146950 (and (is-Cons!36943 (t!51863 l!1251)) (= (_1!12922 (h!38486 (t!51863 l!1251))) newKey!123)))))

(declare-fun b!1585004 () Bool)

(assert (=> b!1585004 (= e!884852 call!72614)))

(declare-fun b!1585005 () Bool)

(declare-fun res!1082539 () Bool)

(assert (=> b!1585005 (=> (not res!1082539) (not e!884854))))

(assert (=> b!1585005 (= res!1082539 (containsKey!1006 lt!677306 newKey!123))))

(declare-fun d!167579 () Bool)

(assert (=> d!167579 e!884854))

(declare-fun res!1082538 () Bool)

(assert (=> d!167579 (=> (not res!1082538) (not e!884854))))

(assert (=> d!167579 (= res!1082538 (isStrictlySorted!1172 lt!677306))))

(assert (=> d!167579 (= lt!677306 e!884856)))

(assert (=> d!167579 (= c!146949 (and (is-Cons!36943 (t!51863 l!1251)) (bvslt (_1!12922 (h!38486 (t!51863 l!1251))) newKey!123)))))

(assert (=> d!167579 (isStrictlySorted!1172 (t!51863 l!1251))))

(assert (=> d!167579 (= (insertStrictlySorted!629 (t!51863 l!1251) newKey!123 newValue!123) lt!677306)))

(declare-fun bm!72611 () Bool)

(assert (=> bm!72611 (= call!72614 call!72613)))

(assert (= (and d!167579 c!146949) b!1584998))

(assert (= (and d!167579 (not c!146949)) b!1585003))

(assert (= (and b!1585003 c!146950) b!1585004))

(assert (= (and b!1585003 (not c!146950)) b!1584999))

(assert (= (and b!1584999 c!146951) b!1585000))

(assert (= (and b!1584999 (not c!146951)) b!1584996))

(assert (= (or b!1585000 b!1584996) bm!72610))

(assert (= (or b!1585004 bm!72610) bm!72611))

(assert (= (or b!1584998 bm!72611) bm!72609))

(assert (= (and bm!72609 c!146948) b!1585002))

(assert (= (and bm!72609 (not c!146948)) b!1584997))

(assert (= (and d!167579 res!1082538) b!1585005))

(assert (= (and b!1585005 res!1082539) b!1585001))

(declare-fun m!1454027 () Bool)

(assert (=> d!167579 m!1454027))

(assert (=> d!167579 m!1453985))

(declare-fun m!1454029 () Bool)

(assert (=> b!1585002 m!1454029))

(declare-fun m!1454031 () Bool)

(assert (=> bm!72609 m!1454031))

(declare-fun m!1454033 () Bool)

(assert (=> b!1585001 m!1454033))

(declare-fun m!1454035 () Bool)

(assert (=> b!1585005 m!1454035))

(assert (=> b!1584969 d!167579))

(declare-fun d!167581 () Bool)

(declare-fun res!1082540 () Bool)

(declare-fun e!884857 () Bool)

(assert (=> d!167581 (=> res!1082540 e!884857)))

(assert (=> d!167581 (= res!1082540 (and (is-Cons!36943 (t!51863 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123))) (= (_1!12922 (h!38486 (t!51863 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(assert (=> d!167581 (= (containsKey!1006 (t!51863 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123)) otherKey!56) e!884857)))

(declare-fun b!1585006 () Bool)

(declare-fun e!884858 () Bool)

(assert (=> b!1585006 (= e!884857 e!884858)))

(declare-fun res!1082541 () Bool)

(assert (=> b!1585006 (=> (not res!1082541) (not e!884858))))

(assert (=> b!1585006 (= res!1082541 (and (or (not (is-Cons!36943 (t!51863 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123)))) (bvsle (_1!12922 (h!38486 (t!51863 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123)))) otherKey!56)) (is-Cons!36943 (t!51863 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123))) (bvslt (_1!12922 (h!38486 (t!51863 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123)))) otherKey!56)))))

(declare-fun b!1585007 () Bool)

(assert (=> b!1585007 (= e!884858 (containsKey!1006 (t!51863 (t!51863 (insertStrictlySorted!629 l!1251 newKey!123 newValue!123))) otherKey!56))))

(assert (= (and d!167581 (not res!1082540)) b!1585006))

(assert (= (and b!1585006 res!1082541) b!1585007))

(declare-fun m!1454037 () Bool)

(assert (=> b!1585007 m!1454037))

(assert (=> b!1584880 d!167581))

(declare-fun d!167583 () Bool)

(declare-fun res!1082542 () Bool)

(declare-fun e!884859 () Bool)

(assert (=> d!167583 (=> res!1082542 e!884859)))

(assert (=> d!167583 (= res!1082542 (or (is-Nil!36944 (t!51863 l!1251)) (is-Nil!36944 (t!51863 (t!51863 l!1251)))))))

(assert (=> d!167583 (= (isStrictlySorted!1172 (t!51863 l!1251)) e!884859)))

(declare-fun b!1585008 () Bool)

(declare-fun e!884860 () Bool)

(assert (=> b!1585008 (= e!884859 e!884860)))

(declare-fun res!1082543 () Bool)

(assert (=> b!1585008 (=> (not res!1082543) (not e!884860))))

(assert (=> b!1585008 (= res!1082543 (bvslt (_1!12922 (h!38486 (t!51863 l!1251))) (_1!12922 (h!38486 (t!51863 (t!51863 l!1251))))))))

(declare-fun b!1585009 () Bool)

(assert (=> b!1585009 (= e!884860 (isStrictlySorted!1172 (t!51863 (t!51863 l!1251))))))

(assert (= (and d!167583 (not res!1082542)) b!1585008))

(assert (= (and b!1585008 res!1082543) b!1585009))

(declare-fun m!1454039 () Bool)

(assert (=> b!1585009 m!1454039))

(assert (=> b!1584876 d!167583))

(declare-fun lt!677309 () Bool)

(declare-fun d!167585 () Bool)

(declare-fun content!863 (List!36947) (Set tuple2!25822))

(assert (=> d!167585 (= lt!677309 (set.member (tuple2!25823 newKey!123 newValue!123) (content!863 lt!677305)))))

(declare-fun e!884865 () Bool)

(assert (=> d!167585 (= lt!677309 e!884865)))

(declare-fun res!1082548 () Bool)

(assert (=> d!167585 (=> (not res!1082548) (not e!884865))))

(assert (=> d!167585 (= res!1082548 (is-Cons!36943 lt!677305))))

(assert (=> d!167585 (= (contains!10530 lt!677305 (tuple2!25823 newKey!123 newValue!123)) lt!677309)))

(declare-fun b!1585014 () Bool)

(declare-fun e!884866 () Bool)

(assert (=> b!1585014 (= e!884865 e!884866)))

(declare-fun res!1082549 () Bool)

(assert (=> b!1585014 (=> res!1082549 e!884866)))

(assert (=> b!1585014 (= res!1082549 (= (h!38486 lt!677305) (tuple2!25823 newKey!123 newValue!123)))))

(declare-fun b!1585015 () Bool)

(assert (=> b!1585015 (= e!884866 (contains!10530 (t!51863 lt!677305) (tuple2!25823 newKey!123 newValue!123)))))

(assert (= (and d!167585 res!1082548) b!1585014))

(assert (= (and b!1585014 (not res!1082549)) b!1585015))

(declare-fun m!1454041 () Bool)

(assert (=> d!167585 m!1454041))

(declare-fun m!1454043 () Bool)

(assert (=> d!167585 m!1454043))

(declare-fun m!1454045 () Bool)

(assert (=> b!1585015 m!1454045))

(assert (=> b!1584968 d!167585))

(declare-fun d!167587 () Bool)

(assert (=> d!167587 (= ($colon$colon!1026 e!884833 (ite c!146945 (h!38486 l!1251) (tuple2!25823 newKey!123 newValue!123))) (Cons!36943 (ite c!146945 (h!38486 l!1251) (tuple2!25823 newKey!123 newValue!123)) e!884833))))

(assert (=> bm!72606 d!167587))

(declare-fun d!167589 () Bool)

(declare-fun res!1082550 () Bool)

(declare-fun e!884867 () Bool)

(assert (=> d!167589 (=> res!1082550 e!884867)))

(assert (=> d!167589 (= res!1082550 (and (is-Cons!36943 lt!677305) (= (_1!12922 (h!38486 lt!677305)) newKey!123)))))

(assert (=> d!167589 (= (containsKey!1006 lt!677305 newKey!123) e!884867)))

(declare-fun b!1585016 () Bool)

(declare-fun e!884868 () Bool)

(assert (=> b!1585016 (= e!884867 e!884868)))

(declare-fun res!1082551 () Bool)

(assert (=> b!1585016 (=> (not res!1082551) (not e!884868))))

(assert (=> b!1585016 (= res!1082551 (and (or (not (is-Cons!36943 lt!677305)) (bvsle (_1!12922 (h!38486 lt!677305)) newKey!123)) (is-Cons!36943 lt!677305) (bvslt (_1!12922 (h!38486 lt!677305)) newKey!123)))))

(declare-fun b!1585017 () Bool)

(assert (=> b!1585017 (= e!884868 (containsKey!1006 (t!51863 lt!677305) newKey!123))))

(assert (= (and d!167589 (not res!1082550)) b!1585016))

(assert (= (and b!1585016 res!1082551) b!1585017))

(declare-fun m!1454047 () Bool)

(assert (=> b!1585017 m!1454047))

(assert (=> b!1584972 d!167589))

(declare-fun d!167591 () Bool)

(declare-fun res!1082552 () Bool)

(declare-fun e!884869 () Bool)

(assert (=> d!167591 (=> res!1082552 e!884869)))

(assert (=> d!167591 (= res!1082552 (or (is-Nil!36944 lt!677305) (is-Nil!36944 (t!51863 lt!677305))))))

(assert (=> d!167591 (= (isStrictlySorted!1172 lt!677305) e!884869)))

(declare-fun b!1585018 () Bool)

(declare-fun e!884870 () Bool)

(assert (=> b!1585018 (= e!884869 e!884870)))

(declare-fun res!1082553 () Bool)

(assert (=> b!1585018 (=> (not res!1082553) (not e!884870))))

(assert (=> b!1585018 (= res!1082553 (bvslt (_1!12922 (h!38486 lt!677305)) (_1!12922 (h!38486 (t!51863 lt!677305)))))))

(declare-fun b!1585019 () Bool)

(assert (=> b!1585019 (= e!884870 (isStrictlySorted!1172 (t!51863 lt!677305)))))

(assert (= (and d!167591 (not res!1082552)) b!1585018))

(assert (= (and b!1585018 res!1082553) b!1585019))

(declare-fun m!1454049 () Bool)

(assert (=> b!1585019 m!1454049))

(assert (=> d!167571 d!167591))

(assert (=> d!167571 d!167563))

(declare-fun d!167593 () Bool)

(declare-fun res!1082554 () Bool)

(declare-fun e!884871 () Bool)

(assert (=> d!167593 (=> res!1082554 e!884871)))

(assert (=> d!167593 (= res!1082554 (and (is-Cons!36943 (t!51863 l!1251)) (= (_1!12922 (h!38486 (t!51863 l!1251))) otherKey!56)))))

(assert (=> d!167593 (= (containsKey!1006 (t!51863 l!1251) otherKey!56) e!884871)))

(declare-fun b!1585020 () Bool)

(declare-fun e!884872 () Bool)

(assert (=> b!1585020 (= e!884871 e!884872)))

(declare-fun res!1082555 () Bool)

(assert (=> b!1585020 (=> (not res!1082555) (not e!884872))))

(assert (=> b!1585020 (= res!1082555 (and (or (not (is-Cons!36943 (t!51863 l!1251))) (bvsle (_1!12922 (h!38486 (t!51863 l!1251))) otherKey!56)) (is-Cons!36943 (t!51863 l!1251)) (bvslt (_1!12922 (h!38486 (t!51863 l!1251))) otherKey!56)))))

(declare-fun b!1585021 () Bool)

(assert (=> b!1585021 (= e!884872 (containsKey!1006 (t!51863 (t!51863 l!1251)) otherKey!56))))

(assert (= (and d!167593 (not res!1082554)) b!1585020))

(assert (= (and b!1585020 res!1082555) b!1585021))

(declare-fun m!1454051 () Bool)

(assert (=> b!1585021 m!1454051))

(assert (=> b!1584864 d!167593))

(declare-fun b!1585022 () Bool)

(declare-fun e!884873 () Bool)

(declare-fun tp!115157 () Bool)

(assert (=> b!1585022 (= e!884873 (and tp_is_empty!39463 tp!115157))))

(assert (=> b!1584990 (= tp!115152 e!884873)))

(assert (= (and b!1584990 (is-Cons!36943 (t!51863 (t!51863 l!1251)))) b!1585022))

(push 1)

(assert (not d!167579))

(assert (not d!167585))

(assert (not b!1585019))

(assert (not b!1585005))

(assert (not b!1585017))

(assert (not b!1585001))

(assert (not b!1585009))

(assert (not b!1585015))

(assert tp_is_empty!39463)

(assert (not b!1585007))

(assert (not b!1585002))

(assert (not b!1585022))

(assert (not bm!72609))

(assert (not b!1585021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

