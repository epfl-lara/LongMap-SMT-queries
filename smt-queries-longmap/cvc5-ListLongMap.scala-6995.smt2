; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88704 () Bool)

(assert start!88704)

(declare-fun b!1018818 () Bool)

(declare-fun e!573316 () Bool)

(declare-fun tp_is_empty!23747 () Bool)

(declare-fun tp!71119 () Bool)

(assert (=> b!1018818 (= e!573316 (and tp_is_empty!23747 tp!71119))))

(declare-fun b!1018819 () Bool)

(declare-fun e!573317 () Bool)

(declare-fun e!573315 () Bool)

(assert (=> b!1018819 (= e!573317 e!573315)))

(declare-fun res!683128 () Bool)

(assert (=> b!1018819 (=> (not res!683128) (not e!573315))))

(declare-datatypes ((B!1680 0))(
  ( (B!1681 (val!11924 Int)) )
))
(declare-datatypes ((tuple2!15474 0))(
  ( (tuple2!15475 (_1!7748 (_ BitVec 64)) (_2!7748 B!1680)) )
))
(declare-datatypes ((List!21647 0))(
  ( (Nil!21644) (Cons!21643 (h!22841 tuple2!15474) (t!30642 List!21647)) )
))
(declare-fun l!996 () List!21647)

(declare-fun key!261 () (_ BitVec 64))

(assert (=> b!1018819 (= res!683128 (and (is-Cons!21643 l!996) (bvslt (_1!7748 (h!22841 l!996)) key!261)))))

(declare-fun value!172 () B!1680)

(declare-fun lt!449416 () List!21647)

(declare-fun insertStrictlySorted!356 (List!21647 (_ BitVec 64) B!1680) List!21647)

(assert (=> b!1018819 (= lt!449416 (insertStrictlySorted!356 l!996 key!261 value!172))))

(declare-fun res!683125 () Bool)

(assert (=> start!88704 (=> (not res!683125) (not e!573317))))

(declare-fun isStrictlySorted!673 (List!21647) Bool)

(assert (=> start!88704 (= res!683125 (isStrictlySorted!673 l!996))))

(assert (=> start!88704 e!573317))

(assert (=> start!88704 e!573316))

(assert (=> start!88704 true))

(assert (=> start!88704 tp_is_empty!23747))

(declare-fun b!1018820 () Bool)

(declare-fun res!683126 () Bool)

(assert (=> b!1018820 (=> (not res!683126) (not e!573315))))

(assert (=> b!1018820 (= res!683126 (isStrictlySorted!673 (t!30642 l!996)))))

(declare-fun b!1018821 () Bool)

(declare-fun containsKey!537 (List!21647 (_ BitVec 64)) Bool)

(assert (=> b!1018821 (= e!573315 (not (containsKey!537 (t!30642 l!996) key!261)))))

(declare-fun b!1018822 () Bool)

(declare-fun res!683127 () Bool)

(assert (=> b!1018822 (=> (not res!683127) (not e!573317))))

(assert (=> b!1018822 (= res!683127 (containsKey!537 l!996 key!261))))

(assert (= (and start!88704 res!683125) b!1018822))

(assert (= (and b!1018822 res!683127) b!1018819))

(assert (= (and b!1018819 res!683128) b!1018820))

(assert (= (and b!1018820 res!683126) b!1018821))

(assert (= (and start!88704 (is-Cons!21643 l!996)) b!1018818))

(declare-fun m!938937 () Bool)

(assert (=> start!88704 m!938937))

(declare-fun m!938939 () Bool)

(assert (=> b!1018819 m!938939))

(declare-fun m!938941 () Bool)

(assert (=> b!1018821 m!938941))

(declare-fun m!938943 () Bool)

(assert (=> b!1018820 m!938943))

(declare-fun m!938945 () Bool)

(assert (=> b!1018822 m!938945))

(push 1)

(assert tp_is_empty!23747)

(assert (not b!1018819))

(assert (not b!1018820))

(assert (not b!1018818))

(assert (not b!1018822))

(assert (not start!88704))

(assert (not b!1018821))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121817 () Bool)

(declare-fun res!683133 () Bool)

(declare-fun e!573322 () Bool)

(assert (=> d!121817 (=> res!683133 e!573322)))

(assert (=> d!121817 (= res!683133 (and (is-Cons!21643 l!996) (= (_1!7748 (h!22841 l!996)) key!261)))))

(assert (=> d!121817 (= (containsKey!537 l!996 key!261) e!573322)))

(declare-fun b!1018827 () Bool)

(declare-fun e!573323 () Bool)

(assert (=> b!1018827 (= e!573322 e!573323)))

(declare-fun res!683134 () Bool)

(assert (=> b!1018827 (=> (not res!683134) (not e!573323))))

(assert (=> b!1018827 (= res!683134 (and (or (not (is-Cons!21643 l!996)) (bvsle (_1!7748 (h!22841 l!996)) key!261)) (is-Cons!21643 l!996) (bvslt (_1!7748 (h!22841 l!996)) key!261)))))

(declare-fun b!1018828 () Bool)

(assert (=> b!1018828 (= e!573323 (containsKey!537 (t!30642 l!996) key!261))))

(assert (= (and d!121817 (not res!683133)) b!1018827))

(assert (= (and b!1018827 res!683134) b!1018828))

(assert (=> b!1018828 m!938941))

(assert (=> b!1018822 d!121817))

(declare-fun d!121821 () Bool)

(declare-fun res!683143 () Bool)

(declare-fun e!573338 () Bool)

(assert (=> d!121821 (=> res!683143 e!573338)))

(assert (=> d!121821 (= res!683143 (or (is-Nil!21644 (t!30642 l!996)) (is-Nil!21644 (t!30642 (t!30642 l!996)))))))

(assert (=> d!121821 (= (isStrictlySorted!673 (t!30642 l!996)) e!573338)))

(declare-fun b!1018849 () Bool)

(declare-fun e!573339 () Bool)

(assert (=> b!1018849 (= e!573338 e!573339)))

(declare-fun res!683144 () Bool)

(assert (=> b!1018849 (=> (not res!683144) (not e!573339))))

(assert (=> b!1018849 (= res!683144 (bvslt (_1!7748 (h!22841 (t!30642 l!996))) (_1!7748 (h!22841 (t!30642 (t!30642 l!996))))))))

(declare-fun b!1018850 () Bool)

(assert (=> b!1018850 (= e!573339 (isStrictlySorted!673 (t!30642 (t!30642 l!996))))))

(assert (= (and d!121821 (not res!683143)) b!1018849))

(assert (= (and b!1018849 res!683144) b!1018850))

(declare-fun m!938947 () Bool)

(assert (=> b!1018850 m!938947))

(assert (=> b!1018820 d!121821))

(declare-fun d!121823 () Bool)

(declare-fun res!683145 () Bool)

(declare-fun e!573340 () Bool)

(assert (=> d!121823 (=> res!683145 e!573340)))

(assert (=> d!121823 (= res!683145 (or (is-Nil!21644 l!996) (is-Nil!21644 (t!30642 l!996))))))

(assert (=> d!121823 (= (isStrictlySorted!673 l!996) e!573340)))

(declare-fun b!1018851 () Bool)

(declare-fun e!573341 () Bool)

(assert (=> b!1018851 (= e!573340 e!573341)))

(declare-fun res!683146 () Bool)

(assert (=> b!1018851 (=> (not res!683146) (not e!573341))))

(assert (=> b!1018851 (= res!683146 (bvslt (_1!7748 (h!22841 l!996)) (_1!7748 (h!22841 (t!30642 l!996)))))))

(declare-fun b!1018852 () Bool)

(assert (=> b!1018852 (= e!573341 (isStrictlySorted!673 (t!30642 l!996)))))

(assert (= (and d!121823 (not res!683145)) b!1018851))

(assert (= (and b!1018851 res!683146) b!1018852))

(assert (=> b!1018852 m!938943))

(assert (=> start!88704 d!121823))

(declare-fun d!121825 () Bool)

(declare-fun res!683149 () Bool)

(declare-fun e!573344 () Bool)

(assert (=> d!121825 (=> res!683149 e!573344)))

(assert (=> d!121825 (= res!683149 (and (is-Cons!21643 (t!30642 l!996)) (= (_1!7748 (h!22841 (t!30642 l!996))) key!261)))))

(assert (=> d!121825 (= (containsKey!537 (t!30642 l!996) key!261) e!573344)))

(declare-fun b!1018855 () Bool)

(declare-fun e!573345 () Bool)

(assert (=> b!1018855 (= e!573344 e!573345)))

(declare-fun res!683150 () Bool)

(assert (=> b!1018855 (=> (not res!683150) (not e!573345))))

(assert (=> b!1018855 (= res!683150 (and (or (not (is-Cons!21643 (t!30642 l!996))) (bvsle (_1!7748 (h!22841 (t!30642 l!996))) key!261)) (is-Cons!21643 (t!30642 l!996)) (bvslt (_1!7748 (h!22841 (t!30642 l!996))) key!261)))))

(declare-fun b!1018856 () Bool)

(assert (=> b!1018856 (= e!573345 (containsKey!537 (t!30642 (t!30642 l!996)) key!261))))

(assert (= (and d!121825 (not res!683149)) b!1018855))

(assert (= (and b!1018855 res!683150) b!1018856))

(declare-fun m!938951 () Bool)

(assert (=> b!1018856 m!938951))

(assert (=> b!1018821 d!121825))

(declare-fun b!1018942 () Bool)

(declare-fun e!573403 () List!21647)

(assert (=> b!1018942 (= e!573403 (insertStrictlySorted!356 (t!30642 l!996) key!261 value!172))))

(declare-fun bm!43016 () Bool)

(declare-fun call!43020 () List!21647)

(declare-fun call!43019 () List!21647)

(assert (=> bm!43016 (= call!43020 call!43019)))

(declare-fun c!103230 () Bool)

(declare-fun b!1018943 () Bool)

(declare-fun c!103228 () Bool)

(assert (=> b!1018943 (= e!573403 (ite c!103228 (t!30642 l!996) (ite c!103230 (Cons!21643 (h!22841 l!996) (t!30642 l!996)) Nil!21644)))))

(declare-fun b!1018944 () Bool)

(declare-fun e!573401 () List!21647)

(declare-fun call!43021 () List!21647)

(assert (=> b!1018944 (= e!573401 call!43021)))

(declare-fun b!1018945 () Bool)

(declare-fun e!573404 () List!21647)

(assert (=> b!1018945 (= e!573404 call!43019)))

(declare-fun b!1018946 () Bool)

(declare-fun e!573402 () List!21647)

(assert (=> b!1018946 (= e!573402 call!43020)))

(declare-fun b!1018947 () Bool)

(assert (=> b!1018947 (= c!103230 (and (is-Cons!21643 l!996) (bvsgt (_1!7748 (h!22841 l!996)) key!261)))))

(assert (=> b!1018947 (= e!573402 e!573401)))

(declare-fun bm!43018 () Bool)

(assert (=> bm!43018 (= call!43021 call!43020)))

(declare-fun b!1018948 () Bool)

(declare-fun res!683188 () Bool)

(declare-fun e!573400 () Bool)

(assert (=> b!1018948 (=> (not res!683188) (not e!573400))))

(declare-fun lt!449424 () List!21647)

(assert (=> b!1018948 (= res!683188 (containsKey!537 lt!449424 key!261))))

(declare-fun b!1018949 () Bool)

(assert (=> b!1018949 (= e!573401 call!43021)))

(declare-fun b!1018950 () Bool)

(assert (=> b!1018950 (= e!573404 e!573402)))

(assert (=> b!1018950 (= c!103228 (and (is-Cons!21643 l!996) (= (_1!7748 (h!22841 l!996)) key!261)))))

(declare-fun b!1018951 () Bool)

(declare-fun contains!5878 (List!21647 tuple2!15474) Bool)

(assert (=> b!1018951 (= e!573400 (contains!5878 lt!449424 (tuple2!15475 key!261 value!172)))))

(declare-fun c!103229 () Bool)

(declare-fun bm!43017 () Bool)

(declare-fun $colon$colon!587 (List!21647 tuple2!15474) List!21647)

(assert (=> bm!43017 (= call!43019 ($colon$colon!587 e!573403 (ite c!103229 (h!22841 l!996) (tuple2!15475 key!261 value!172))))))

(declare-fun c!103227 () Bool)

(assert (=> bm!43017 (= c!103227 c!103229)))

(declare-fun d!121829 () Bool)

(assert (=> d!121829 e!573400))

(declare-fun res!683187 () Bool)

(assert (=> d!121829 (=> (not res!683187) (not e!573400))))

(assert (=> d!121829 (= res!683187 (isStrictlySorted!673 lt!449424))))

(assert (=> d!121829 (= lt!449424 e!573404)))

(assert (=> d!121829 (= c!103229 (and (is-Cons!21643 l!996) (bvslt (_1!7748 (h!22841 l!996)) key!261)))))

(assert (=> d!121829 (isStrictlySorted!673 l!996)))

(assert (=> d!121829 (= (insertStrictlySorted!356 l!996 key!261 value!172) lt!449424)))

(assert (= (and d!121829 c!103229) b!1018945))

(assert (= (and d!121829 (not c!103229)) b!1018950))

(assert (= (and b!1018950 c!103228) b!1018946))

(assert (= (and b!1018950 (not c!103228)) b!1018947))

(assert (= (and b!1018947 c!103230) b!1018944))

(assert (= (and b!1018947 (not c!103230)) b!1018949))

(assert (= (or b!1018944 b!1018949) bm!43018))

(assert (= (or b!1018946 bm!43018) bm!43016))

(assert (= (or b!1018945 bm!43016) bm!43017))

(assert (= (and bm!43017 c!103227) b!1018942))

(assert (= (and bm!43017 (not c!103227)) b!1018943))

(assert (= (and d!121829 res!683187) b!1018948))

(assert (= (and b!1018948 res!683188) b!1018951))

(declare-fun m!938969 () Bool)

(assert (=> b!1018948 m!938969))

(declare-fun m!938971 () Bool)

(assert (=> bm!43017 m!938971))

(declare-fun m!938973 () Bool)

(assert (=> b!1018942 m!938973))

(declare-fun m!938975 () Bool)

(assert (=> d!121829 m!938975))

(assert (=> d!121829 m!938937))

(declare-fun m!938977 () Bool)

(assert (=> b!1018951 m!938977))

(assert (=> b!1018819 d!121829))

(declare-fun b!1018956 () Bool)

(declare-fun e!573407 () Bool)

(declare-fun tp!71125 () Bool)

(assert (=> b!1018956 (= e!573407 (and tp_is_empty!23747 tp!71125))))

(assert (=> b!1018818 (= tp!71119 e!573407)))

(assert (= (and b!1018818 (is-Cons!21643 (t!30642 l!996))) b!1018956))

(push 1)

(assert (not b!1018942))

(assert (not b!1018951))

(assert (not b!1018828))

(assert (not b!1018856))

(assert (not d!121829))

(assert (not b!1018948))

(assert (not b!1018850))

(assert (not b!1018852))

(assert tp_is_empty!23747)

(assert (not b!1018956))

(assert (not bm!43017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

