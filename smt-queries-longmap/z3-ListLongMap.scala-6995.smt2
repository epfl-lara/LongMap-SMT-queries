; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88704 () Bool)

(assert start!88704)

(declare-fun b!1018948 () Bool)

(declare-fun e!573394 () Bool)

(declare-fun tp_is_empty!23745 () Bool)

(declare-fun tp!71116 () Bool)

(assert (=> b!1018948 (= e!573394 (and tp_is_empty!23745 tp!71116))))

(declare-fun b!1018949 () Bool)

(declare-fun res!683182 () Bool)

(declare-fun e!573396 () Bool)

(assert (=> b!1018949 (=> (not res!683182) (not e!573396))))

(declare-datatypes ((B!1678 0))(
  ( (B!1679 (val!11923 Int)) )
))
(declare-datatypes ((tuple2!15392 0))(
  ( (tuple2!15393 (_1!7707 (_ BitVec 64)) (_2!7707 B!1678)) )
))
(declare-datatypes ((List!21611 0))(
  ( (Nil!21608) (Cons!21607 (h!22805 tuple2!15392) (t!30615 List!21611)) )
))
(declare-fun l!996 () List!21611)

(declare-fun isStrictlySorted!676 (List!21611) Bool)

(assert (=> b!1018949 (= res!683182 (isStrictlySorted!676 (t!30615 l!996)))))

(declare-fun res!683180 () Bool)

(declare-fun e!573395 () Bool)

(assert (=> start!88704 (=> (not res!683180) (not e!573395))))

(assert (=> start!88704 (= res!683180 (isStrictlySorted!676 l!996))))

(assert (=> start!88704 e!573395))

(assert (=> start!88704 e!573394))

(assert (=> start!88704 true))

(assert (=> start!88704 tp_is_empty!23745))

(declare-fun b!1018950 () Bool)

(assert (=> b!1018950 (= e!573395 e!573396)))

(declare-fun res!683183 () Bool)

(assert (=> b!1018950 (=> (not res!683183) (not e!573396))))

(declare-fun key!261 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1018950 (= res!683183 (and ((_ is Cons!21607) l!996) (bvslt (_1!7707 (h!22805 l!996)) key!261)))))

(declare-fun value!172 () B!1678)

(declare-fun lt!449613 () List!21611)

(declare-fun insertStrictlySorted!354 (List!21611 (_ BitVec 64) B!1678) List!21611)

(assert (=> b!1018950 (= lt!449613 (insertStrictlySorted!354 l!996 key!261 value!172))))

(declare-fun b!1018951 () Bool)

(declare-fun containsKey!536 (List!21611 (_ BitVec 64)) Bool)

(assert (=> b!1018951 (= e!573396 (not (containsKey!536 (t!30615 l!996) key!261)))))

(declare-fun b!1018952 () Bool)

(declare-fun res!683181 () Bool)

(assert (=> b!1018952 (=> (not res!683181) (not e!573395))))

(assert (=> b!1018952 (= res!683181 (containsKey!536 l!996 key!261))))

(assert (= (and start!88704 res!683180) b!1018952))

(assert (= (and b!1018952 res!683181) b!1018950))

(assert (= (and b!1018950 res!683183) b!1018949))

(assert (= (and b!1018949 res!683182) b!1018951))

(assert (= (and start!88704 ((_ is Cons!21607) l!996)) b!1018948))

(declare-fun m!939545 () Bool)

(assert (=> start!88704 m!939545))

(declare-fun m!939547 () Bool)

(assert (=> b!1018949 m!939547))

(declare-fun m!939549 () Bool)

(assert (=> b!1018952 m!939549))

(declare-fun m!939551 () Bool)

(assert (=> b!1018950 m!939551))

(declare-fun m!939553 () Bool)

(assert (=> b!1018951 m!939553))

(check-sat (not start!88704) (not b!1018950) (not b!1018951) (not b!1018952) (not b!1018948) tp_is_empty!23745 (not b!1018949))
(check-sat)
(get-model)

(declare-fun d!121965 () Bool)

(declare-fun res!683200 () Bool)

(declare-fun e!573410 () Bool)

(assert (=> d!121965 (=> res!683200 e!573410)))

(assert (=> d!121965 (= res!683200 (or ((_ is Nil!21608) (t!30615 l!996)) ((_ is Nil!21608) (t!30615 (t!30615 l!996)))))))

(assert (=> d!121965 (= (isStrictlySorted!676 (t!30615 l!996)) e!573410)))

(declare-fun b!1018972 () Bool)

(declare-fun e!573411 () Bool)

(assert (=> b!1018972 (= e!573410 e!573411)))

(declare-fun res!683201 () Bool)

(assert (=> b!1018972 (=> (not res!683201) (not e!573411))))

(assert (=> b!1018972 (= res!683201 (bvslt (_1!7707 (h!22805 (t!30615 l!996))) (_1!7707 (h!22805 (t!30615 (t!30615 l!996))))))))

(declare-fun b!1018973 () Bool)

(assert (=> b!1018973 (= e!573411 (isStrictlySorted!676 (t!30615 (t!30615 l!996))))))

(assert (= (and d!121965 (not res!683200)) b!1018972))

(assert (= (and b!1018972 res!683201) b!1018973))

(declare-fun m!939565 () Bool)

(assert (=> b!1018973 m!939565))

(assert (=> b!1018949 d!121965))

(declare-fun d!121969 () Bool)

(declare-fun res!683202 () Bool)

(declare-fun e!573412 () Bool)

(assert (=> d!121969 (=> res!683202 e!573412)))

(assert (=> d!121969 (= res!683202 (or ((_ is Nil!21608) l!996) ((_ is Nil!21608) (t!30615 l!996))))))

(assert (=> d!121969 (= (isStrictlySorted!676 l!996) e!573412)))

(declare-fun b!1018974 () Bool)

(declare-fun e!573413 () Bool)

(assert (=> b!1018974 (= e!573412 e!573413)))

(declare-fun res!683203 () Bool)

(assert (=> b!1018974 (=> (not res!683203) (not e!573413))))

(assert (=> b!1018974 (= res!683203 (bvslt (_1!7707 (h!22805 l!996)) (_1!7707 (h!22805 (t!30615 l!996)))))))

(declare-fun b!1018975 () Bool)

(assert (=> b!1018975 (= e!573413 (isStrictlySorted!676 (t!30615 l!996)))))

(assert (= (and d!121969 (not res!683202)) b!1018974))

(assert (= (and b!1018974 res!683203) b!1018975))

(assert (=> b!1018975 m!939547))

(assert (=> start!88704 d!121969))

(declare-fun b!1019062 () Bool)

(declare-fun e!573477 () List!21611)

(declare-fun call!43038 () List!21611)

(assert (=> b!1019062 (= e!573477 call!43038)))

(declare-fun b!1019063 () Bool)

(declare-fun e!573473 () List!21611)

(declare-fun call!43036 () List!21611)

(assert (=> b!1019063 (= e!573473 call!43036)))

(declare-fun e!573476 () List!21611)

(declare-fun b!1019064 () Bool)

(assert (=> b!1019064 (= e!573476 (insertStrictlySorted!354 (t!30615 l!996) key!261 value!172))))

(declare-fun b!1019065 () Bool)

(declare-fun c!103257 () Bool)

(assert (=> b!1019065 (= c!103257 (and ((_ is Cons!21607) l!996) (bvsgt (_1!7707 (h!22805 l!996)) key!261)))))

(declare-fun e!573475 () List!21611)

(assert (=> b!1019065 (= e!573475 e!573477)))

(declare-fun b!1019066 () Bool)

(assert (=> b!1019066 (= e!573477 call!43038)))

(declare-fun bm!43033 () Bool)

(declare-fun call!43037 () List!21611)

(assert (=> bm!43033 (= call!43037 call!43036)))

(declare-fun c!103258 () Bool)

(declare-fun b!1019067 () Bool)

(assert (=> b!1019067 (= e!573476 (ite c!103258 (t!30615 l!996) (ite c!103257 (Cons!21607 (h!22805 l!996) (t!30615 l!996)) Nil!21608)))))

(declare-fun d!121971 () Bool)

(declare-fun e!573474 () Bool)

(assert (=> d!121971 e!573474))

(declare-fun res!683247 () Bool)

(assert (=> d!121971 (=> (not res!683247) (not e!573474))))

(declare-fun lt!449622 () List!21611)

(assert (=> d!121971 (= res!683247 (isStrictlySorted!676 lt!449622))))

(assert (=> d!121971 (= lt!449622 e!573473)))

(declare-fun c!103255 () Bool)

(assert (=> d!121971 (= c!103255 (and ((_ is Cons!21607) l!996) (bvslt (_1!7707 (h!22805 l!996)) key!261)))))

(assert (=> d!121971 (isStrictlySorted!676 l!996)))

(assert (=> d!121971 (= (insertStrictlySorted!354 l!996 key!261 value!172) lt!449622)))

(declare-fun b!1019068 () Bool)

(assert (=> b!1019068 (= e!573475 call!43037)))

(declare-fun bm!43034 () Bool)

(assert (=> bm!43034 (= call!43038 call!43037)))

(declare-fun b!1019069 () Bool)

(assert (=> b!1019069 (= e!573473 e!573475)))

(assert (=> b!1019069 (= c!103258 (and ((_ is Cons!21607) l!996) (= (_1!7707 (h!22805 l!996)) key!261)))))

(declare-fun b!1019070 () Bool)

(declare-fun contains!5905 (List!21611 tuple2!15392) Bool)

(assert (=> b!1019070 (= e!573474 (contains!5905 lt!449622 (tuple2!15393 key!261 value!172)))))

(declare-fun b!1019071 () Bool)

(declare-fun res!683246 () Bool)

(assert (=> b!1019071 (=> (not res!683246) (not e!573474))))

(assert (=> b!1019071 (= res!683246 (containsKey!536 lt!449622 key!261))))

(declare-fun bm!43035 () Bool)

(declare-fun $colon$colon!585 (List!21611 tuple2!15392) List!21611)

(assert (=> bm!43035 (= call!43036 ($colon$colon!585 e!573476 (ite c!103255 (h!22805 l!996) (tuple2!15393 key!261 value!172))))))

(declare-fun c!103256 () Bool)

(assert (=> bm!43035 (= c!103256 c!103255)))

(assert (= (and d!121971 c!103255) b!1019063))

(assert (= (and d!121971 (not c!103255)) b!1019069))

(assert (= (and b!1019069 c!103258) b!1019068))

(assert (= (and b!1019069 (not c!103258)) b!1019065))

(assert (= (and b!1019065 c!103257) b!1019062))

(assert (= (and b!1019065 (not c!103257)) b!1019066))

(assert (= (or b!1019062 b!1019066) bm!43034))

(assert (= (or b!1019068 bm!43034) bm!43033))

(assert (= (or b!1019063 bm!43033) bm!43035))

(assert (= (and bm!43035 c!103256) b!1019064))

(assert (= (and bm!43035 (not c!103256)) b!1019067))

(assert (= (and d!121971 res!683247) b!1019071))

(assert (= (and b!1019071 res!683246) b!1019070))

(declare-fun m!939585 () Bool)

(assert (=> b!1019071 m!939585))

(declare-fun m!939587 () Bool)

(assert (=> d!121971 m!939587))

(assert (=> d!121971 m!939545))

(declare-fun m!939589 () Bool)

(assert (=> b!1019064 m!939589))

(declare-fun m!939591 () Bool)

(assert (=> bm!43035 m!939591))

(declare-fun m!939593 () Bool)

(assert (=> b!1019070 m!939593))

(assert (=> b!1018950 d!121971))

(declare-fun d!121991 () Bool)

(declare-fun res!683252 () Bool)

(declare-fun e!573489 () Bool)

(assert (=> d!121991 (=> res!683252 e!573489)))

(assert (=> d!121991 (= res!683252 (and ((_ is Cons!21607) l!996) (= (_1!7707 (h!22805 l!996)) key!261)))))

(assert (=> d!121991 (= (containsKey!536 l!996 key!261) e!573489)))

(declare-fun b!1019089 () Bool)

(declare-fun e!573490 () Bool)

(assert (=> b!1019089 (= e!573489 e!573490)))

(declare-fun res!683253 () Bool)

(assert (=> b!1019089 (=> (not res!683253) (not e!573490))))

(assert (=> b!1019089 (= res!683253 (and (or (not ((_ is Cons!21607) l!996)) (bvsle (_1!7707 (h!22805 l!996)) key!261)) ((_ is Cons!21607) l!996) (bvslt (_1!7707 (h!22805 l!996)) key!261)))))

(declare-fun b!1019090 () Bool)

(assert (=> b!1019090 (= e!573490 (containsKey!536 (t!30615 l!996) key!261))))

(assert (= (and d!121991 (not res!683252)) b!1019089))

(assert (= (and b!1019089 res!683253) b!1019090))

(assert (=> b!1019090 m!939553))

(assert (=> b!1018952 d!121991))

(declare-fun d!121993 () Bool)

(declare-fun res!683254 () Bool)

(declare-fun e!573491 () Bool)

(assert (=> d!121993 (=> res!683254 e!573491)))

(assert (=> d!121993 (= res!683254 (and ((_ is Cons!21607) (t!30615 l!996)) (= (_1!7707 (h!22805 (t!30615 l!996))) key!261)))))

(assert (=> d!121993 (= (containsKey!536 (t!30615 l!996) key!261) e!573491)))

(declare-fun b!1019091 () Bool)

(declare-fun e!573492 () Bool)

(assert (=> b!1019091 (= e!573491 e!573492)))

(declare-fun res!683255 () Bool)

(assert (=> b!1019091 (=> (not res!683255) (not e!573492))))

(assert (=> b!1019091 (= res!683255 (and (or (not ((_ is Cons!21607) (t!30615 l!996))) (bvsle (_1!7707 (h!22805 (t!30615 l!996))) key!261)) ((_ is Cons!21607) (t!30615 l!996)) (bvslt (_1!7707 (h!22805 (t!30615 l!996))) key!261)))))

(declare-fun b!1019092 () Bool)

(assert (=> b!1019092 (= e!573492 (containsKey!536 (t!30615 (t!30615 l!996)) key!261))))

(assert (= (and d!121993 (not res!683254)) b!1019091))

(assert (= (and b!1019091 res!683255) b!1019092))

(declare-fun m!939595 () Bool)

(assert (=> b!1019092 m!939595))

(assert (=> b!1018951 d!121993))

(declare-fun b!1019097 () Bool)

(declare-fun e!573495 () Bool)

(declare-fun tp!71125 () Bool)

