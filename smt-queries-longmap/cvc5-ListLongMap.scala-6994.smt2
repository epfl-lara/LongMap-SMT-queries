; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88680 () Bool)

(assert start!88680)

(declare-fun b!1018627 () Bool)

(declare-fun res!683031 () Bool)

(declare-fun e!573192 () Bool)

(assert (=> b!1018627 (=> (not res!683031) (not e!573192))))

(declare-datatypes ((B!1674 0))(
  ( (B!1675 (val!11921 Int)) )
))
(declare-datatypes ((tuple2!15468 0))(
  ( (tuple2!15469 (_1!7745 (_ BitVec 64)) (_2!7745 B!1674)) )
))
(declare-datatypes ((List!21644 0))(
  ( (Nil!21641) (Cons!21640 (h!22838 tuple2!15468) (t!30639 List!21644)) )
))
(declare-fun l!996 () List!21644)

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!534 (List!21644 (_ BitVec 64)) Bool)

(assert (=> b!1018627 (= res!683031 (containsKey!534 l!996 key!261))))

(declare-fun res!683032 () Bool)

(assert (=> start!88680 (=> (not res!683032) (not e!573192))))

(declare-fun isStrictlySorted!670 (List!21644) Bool)

(assert (=> start!88680 (= res!683032 (isStrictlySorted!670 l!996))))

(assert (=> start!88680 e!573192))

(declare-fun e!573194 () Bool)

(assert (=> start!88680 e!573194))

(assert (=> start!88680 true))

(declare-fun tp_is_empty!23741 () Bool)

(assert (=> start!88680 tp_is_empty!23741))

(declare-fun b!1018630 () Bool)

(declare-fun tp!71101 () Bool)

(assert (=> b!1018630 (= e!573194 (and tp_is_empty!23741 tp!71101))))

(declare-fun b!1018629 () Bool)

(declare-fun e!573193 () Bool)

(assert (=> b!1018629 (= e!573193 (not (isStrictlySorted!670 (t!30639 l!996))))))

(declare-fun b!1018628 () Bool)

(assert (=> b!1018628 (= e!573192 e!573193)))

(declare-fun res!683030 () Bool)

(assert (=> b!1018628 (=> (not res!683030) (not e!573193))))

(assert (=> b!1018628 (= res!683030 (and (is-Cons!21640 l!996) (bvslt (_1!7745 (h!22838 l!996)) key!261)))))

(declare-fun value!172 () B!1674)

(declare-fun lt!449398 () List!21644)

(declare-fun insertStrictlySorted!353 (List!21644 (_ BitVec 64) B!1674) List!21644)

(assert (=> b!1018628 (= lt!449398 (insertStrictlySorted!353 l!996 key!261 value!172))))

(assert (= (and start!88680 res!683032) b!1018627))

(assert (= (and b!1018627 res!683031) b!1018628))

(assert (= (and b!1018628 res!683030) b!1018629))

(assert (= (and start!88680 (is-Cons!21640 l!996)) b!1018630))

(declare-fun m!938867 () Bool)

(assert (=> b!1018627 m!938867))

(declare-fun m!938869 () Bool)

(assert (=> start!88680 m!938869))

(declare-fun m!938871 () Bool)

(assert (=> b!1018629 m!938871))

(declare-fun m!938873 () Bool)

(assert (=> b!1018628 m!938873))

(push 1)

(assert (not b!1018629))

(assert (not b!1018630))

(assert (not start!88680))

(assert (not b!1018627))

(assert tp_is_empty!23741)

(assert (not b!1018628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121791 () Bool)

(declare-fun res!683041 () Bool)

(declare-fun e!573203 () Bool)

(assert (=> d!121791 (=> res!683041 e!573203)))

(assert (=> d!121791 (= res!683041 (or (is-Nil!21641 l!996) (is-Nil!21641 (t!30639 l!996))))))

(assert (=> d!121791 (= (isStrictlySorted!670 l!996) e!573203)))

(declare-fun b!1018639 () Bool)

(declare-fun e!573204 () Bool)

(assert (=> b!1018639 (= e!573203 e!573204)))

(declare-fun res!683042 () Bool)

(assert (=> b!1018639 (=> (not res!683042) (not e!573204))))

(assert (=> b!1018639 (= res!683042 (bvslt (_1!7745 (h!22838 l!996)) (_1!7745 (h!22838 (t!30639 l!996)))))))

(declare-fun b!1018640 () Bool)

(assert (=> b!1018640 (= e!573204 (isStrictlySorted!670 (t!30639 l!996)))))

(assert (= (and d!121791 (not res!683041)) b!1018639))

(assert (= (and b!1018639 res!683042) b!1018640))

(assert (=> b!1018640 m!938871))

(assert (=> start!88680 d!121791))

(declare-fun e!573247 () List!21644)

(declare-fun bm!42980 () Bool)

(declare-fun call!42985 () List!21644)

(declare-fun c!103179 () Bool)

(declare-fun $colon$colon!583 (List!21644 tuple2!15468) List!21644)

(assert (=> bm!42980 (= call!42985 ($colon$colon!583 e!573247 (ite c!103179 (h!22838 l!996) (tuple2!15469 key!261 value!172))))))

(declare-fun c!103182 () Bool)

(assert (=> bm!42980 (= c!103182 c!103179)))

(declare-fun b!1018699 () Bool)

(declare-fun e!573244 () List!21644)

(declare-fun call!42983 () List!21644)

(assert (=> b!1018699 (= e!573244 call!42983)))

(declare-fun bm!42981 () Bool)

(declare-fun call!42984 () List!21644)

(assert (=> bm!42981 (= call!42983 call!42984)))

(declare-fun c!103180 () Bool)

(declare-fun c!103181 () Bool)

(declare-fun b!1018700 () Bool)

(assert (=> b!1018700 (= e!573247 (ite c!103180 (t!30639 l!996) (ite c!103181 (Cons!21640 (h!22838 l!996) (t!30639 l!996)) Nil!21641)))))

(declare-fun b!1018701 () Bool)

(declare-fun e!573246 () List!21644)

(assert (=> b!1018701 (= e!573246 call!42985)))

(declare-fun b!1018702 () Bool)

(declare-fun e!573243 () List!21644)

(assert (=> b!1018702 (= e!573246 e!573243)))

(assert (=> b!1018702 (= c!103180 (and (is-Cons!21640 l!996) (= (_1!7745 (h!22838 l!996)) key!261)))))

(declare-fun b!1018703 () Bool)

(declare-fun res!683070 () Bool)

(declare-fun e!573245 () Bool)

(assert (=> b!1018703 (=> (not res!683070) (not e!573245))))

(declare-fun lt!449403 () List!21644)

(assert (=> b!1018703 (= res!683070 (containsKey!534 lt!449403 key!261))))

(declare-fun bm!42982 () Bool)

(assert (=> bm!42982 (= call!42984 call!42985)))

(declare-fun d!121793 () Bool)

(assert (=> d!121793 e!573245))

(declare-fun res!683069 () Bool)

(assert (=> d!121793 (=> (not res!683069) (not e!573245))))

(assert (=> d!121793 (= res!683069 (isStrictlySorted!670 lt!449403))))

(assert (=> d!121793 (= lt!449403 e!573246)))

(assert (=> d!121793 (= c!103179 (and (is-Cons!21640 l!996) (bvslt (_1!7745 (h!22838 l!996)) key!261)))))

(assert (=> d!121793 (isStrictlySorted!670 l!996)))

(assert (=> d!121793 (= (insertStrictlySorted!353 l!996 key!261 value!172) lt!449403)))

(declare-fun b!1018704 () Bool)

(assert (=> b!1018704 (= c!103181 (and (is-Cons!21640 l!996) (bvsgt (_1!7745 (h!22838 l!996)) key!261)))))

(assert (=> b!1018704 (= e!573243 e!573244)))

(declare-fun b!1018705 () Bool)

(assert (=> b!1018705 (= e!573243 call!42984)))

(declare-fun b!1018706 () Bool)

(declare-fun contains!5874 (List!21644 tuple2!15468) Bool)

(assert (=> b!1018706 (= e!573245 (contains!5874 lt!449403 (tuple2!15469 key!261 value!172)))))

(declare-fun b!1018707 () Bool)

(assert (=> b!1018707 (= e!573247 (insertStrictlySorted!353 (t!30639 l!996) key!261 value!172))))

(declare-fun b!1018708 () Bool)

(assert (=> b!1018708 (= e!573244 call!42983)))

(assert (= (and d!121793 c!103179) b!1018701))

(assert (= (and d!121793 (not c!103179)) b!1018702))

(assert (= (and b!1018702 c!103180) b!1018705))

(assert (= (and b!1018702 (not c!103180)) b!1018704))

(assert (= (and b!1018704 c!103181) b!1018708))

(assert (= (and b!1018704 (not c!103181)) b!1018699))

(assert (= (or b!1018708 b!1018699) bm!42981))

(assert (= (or b!1018705 bm!42981) bm!42982))

(assert (= (or b!1018701 bm!42982) bm!42980))

(assert (= (and bm!42980 c!103182) b!1018707))

(assert (= (and bm!42980 (not c!103182)) b!1018700))

(assert (= (and d!121793 res!683069) b!1018703))

(assert (= (and b!1018703 res!683070) b!1018706))

(declare-fun m!938881 () Bool)

(assert (=> b!1018707 m!938881))

(declare-fun m!938883 () Bool)

(assert (=> b!1018703 m!938883))

(declare-fun m!938885 () Bool)

(assert (=> bm!42980 m!938885))

(declare-fun m!938887 () Bool)

(assert (=> d!121793 m!938887))

(assert (=> d!121793 m!938869))

(declare-fun m!938889 () Bool)

(assert (=> b!1018706 m!938889))

(assert (=> b!1018628 d!121793))

(declare-fun d!121807 () Bool)

(declare-fun res!683071 () Bool)

(declare-fun e!573248 () Bool)

(assert (=> d!121807 (=> res!683071 e!573248)))

(assert (=> d!121807 (= res!683071 (or (is-Nil!21641 (t!30639 l!996)) (is-Nil!21641 (t!30639 (t!30639 l!996)))))))

(assert (=> d!121807 (= (isStrictlySorted!670 (t!30639 l!996)) e!573248)))

(declare-fun b!1018709 () Bool)

(declare-fun e!573249 () Bool)

(assert (=> b!1018709 (= e!573248 e!573249)))

(declare-fun res!683072 () Bool)

(assert (=> b!1018709 (=> (not res!683072) (not e!573249))))

(assert (=> b!1018709 (= res!683072 (bvslt (_1!7745 (h!22838 (t!30639 l!996))) (_1!7745 (h!22838 (t!30639 (t!30639 l!996))))))))

(declare-fun b!1018710 () Bool)

(assert (=> b!1018710 (= e!573249 (isStrictlySorted!670 (t!30639 (t!30639 l!996))))))

(assert (= (and d!121807 (not res!683071)) b!1018709))

(assert (= (and b!1018709 res!683072) b!1018710))

(declare-fun m!938891 () Bool)

(assert (=> b!1018710 m!938891))

(assert (=> b!1018629 d!121807))

(declare-fun d!121809 () Bool)

(declare-fun res!683079 () Bool)

(declare-fun e!573259 () Bool)

(assert (=> d!121809 (=> res!683079 e!573259)))

(assert (=> d!121809 (= res!683079 (and (is-Cons!21640 l!996) (= (_1!7745 (h!22838 l!996)) key!261)))))

(assert (=> d!121809 (= (containsKey!534 l!996 key!261) e!573259)))

(declare-fun b!1018725 () Bool)

(declare-fun e!573260 () Bool)

(assert (=> b!1018725 (= e!573259 e!573260)))

(declare-fun res!683080 () Bool)

(assert (=> b!1018725 (=> (not res!683080) (not e!573260))))

(assert (=> b!1018725 (= res!683080 (and (or (not (is-Cons!21640 l!996)) (bvsle (_1!7745 (h!22838 l!996)) key!261)) (is-Cons!21640 l!996) (bvslt (_1!7745 (h!22838 l!996)) key!261)))))

(declare-fun b!1018726 () Bool)

(assert (=> b!1018726 (= e!573260 (containsKey!534 (t!30639 l!996) key!261))))

(assert (= (and d!121809 (not res!683079)) b!1018725))

(assert (= (and b!1018725 res!683080) b!1018726))

(declare-fun m!938903 () Bool)

(assert (=> b!1018726 m!938903))

(assert (=> b!1018627 d!121809))

(declare-fun b!1018731 () Bool)

(declare-fun e!573263 () Bool)

(declare-fun tp!71104 () Bool)

(assert (=> b!1018731 (= e!573263 (and tp_is_empty!23741 tp!71104))))

(assert (=> b!1018630 (= tp!71101 e!573263)))

(assert (= (and b!1018630 (is-Cons!21640 (t!30639 l!996))) b!1018731))

(push 1)

(assert (not bm!42980))

(assert (not d!121793))

(assert (not b!1018703))

(assert (not b!1018706))

(assert (not b!1018707))

(assert (not b!1018726))

(assert (not b!1018640))

(assert (not b!1018731))

(assert tp_is_empty!23741)

(assert (not b!1018710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

