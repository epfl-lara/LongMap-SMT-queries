; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137954 () Bool)

(assert start!137954)

(declare-fun b!1583708 () Bool)

(declare-fun e!884014 () Bool)

(declare-fun tp_is_empty!39425 () Bool)

(declare-fun tp!115027 () Bool)

(assert (=> b!1583708 (= e!884014 (and tp_is_empty!39425 tp!115027))))

(declare-fun b!1583709 () Bool)

(declare-fun res!1081819 () Bool)

(declare-fun e!884013 () Bool)

(assert (=> b!1583709 (=> (not res!1081819) (not e!884013))))

(declare-datatypes ((B!2892 0))(
  ( (B!2893 (val!19808 Int)) )
))
(declare-datatypes ((tuple2!25784 0))(
  ( (tuple2!25785 (_1!12903 (_ BitVec 64)) (_2!12903 B!2892)) )
))
(declare-datatypes ((List!36928 0))(
  ( (Nil!36925) (Cons!36924 (h!38467 tuple2!25784) (t!51842 List!36928)) )
))
(declare-fun l!1251 () List!36928)

(declare-fun isStrictlySorted!1156 (List!36928) Bool)

(assert (=> b!1583709 (= res!1081819 (isStrictlySorted!1156 (t!51842 l!1251)))))

(declare-fun b!1583710 () Bool)

(declare-fun res!1081816 () Bool)

(assert (=> b!1583710 (=> (not res!1081816) (not e!884013))))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!990 (List!36928 (_ BitVec 64)) Bool)

(assert (=> b!1583710 (= res!1081816 (not (containsKey!990 (t!51842 l!1251) otherKey!56)))))

(declare-fun res!1081817 () Bool)

(assert (=> start!137954 (=> (not res!1081817) (not e!884013))))

(assert (=> start!137954 (= res!1081817 (isStrictlySorted!1156 l!1251))))

(assert (=> start!137954 e!884013))

(assert (=> start!137954 e!884014))

(assert (=> start!137954 true))

(assert (=> start!137954 tp_is_empty!39425))

(declare-fun b!1583711 () Bool)

(declare-fun res!1081820 () Bool)

(assert (=> b!1583711 (=> (not res!1081820) (not e!884013))))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1583711 (= res!1081820 (and (not (= otherKey!56 newKey!123)) (is-Cons!36924 l!1251)))))

(declare-fun b!1583712 () Bool)

(declare-fun newValue!123 () B!2892)

(declare-fun insertStrictlySorted!622 (List!36928 (_ BitVec 64) B!2892) List!36928)

(assert (=> b!1583712 (= e!884013 (not (isStrictlySorted!1156 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123))))))

(assert (=> b!1583712 (not (containsKey!990 (insertStrictlySorted!622 (t!51842 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52295 0))(
  ( (Unit!52296) )
))
(declare-fun lt!677205 () Unit!52295)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!9 (List!36928 (_ BitVec 64) B!2892 (_ BitVec 64)) Unit!52295)

(assert (=> b!1583712 (= lt!677205 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!9 (t!51842 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun b!1583713 () Bool)

(declare-fun res!1081818 () Bool)

(assert (=> b!1583713 (=> (not res!1081818) (not e!884013))))

(assert (=> b!1583713 (= res!1081818 (not (containsKey!990 l!1251 otherKey!56)))))

(assert (= (and start!137954 res!1081817) b!1583713))

(assert (= (and b!1583713 res!1081818) b!1583711))

(assert (= (and b!1583711 res!1081820) b!1583709))

(assert (= (and b!1583709 res!1081819) b!1583710))

(assert (= (and b!1583710 res!1081816) b!1583712))

(assert (= (and start!137954 (is-Cons!36924 l!1251)) b!1583708))

(declare-fun m!1453439 () Bool)

(assert (=> b!1583713 m!1453439))

(declare-fun m!1453441 () Bool)

(assert (=> b!1583709 m!1453441))

(declare-fun m!1453443 () Bool)

(assert (=> b!1583710 m!1453443))

(declare-fun m!1453445 () Bool)

(assert (=> b!1583712 m!1453445))

(declare-fun m!1453447 () Bool)

(assert (=> b!1583712 m!1453447))

(declare-fun m!1453449 () Bool)

(assert (=> b!1583712 m!1453449))

(declare-fun m!1453451 () Bool)

(assert (=> b!1583712 m!1453451))

(assert (=> b!1583712 m!1453451))

(declare-fun m!1453453 () Bool)

(assert (=> b!1583712 m!1453453))

(assert (=> b!1583712 m!1453447))

(declare-fun m!1453455 () Bool)

(assert (=> start!137954 m!1453455))

(push 1)

(assert (not b!1583712))

(assert tp_is_empty!39425)

(assert (not b!1583710))

(assert (not b!1583709))

(assert (not b!1583708))

(assert (not start!137954))

(assert (not b!1583713))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167273 () Bool)

(declare-fun res!1081831 () Bool)

(declare-fun e!884025 () Bool)

(assert (=> d!167273 (=> res!1081831 e!884025)))

(assert (=> d!167273 (= res!1081831 (or (is-Nil!36925 l!1251) (is-Nil!36925 (t!51842 l!1251))))))

(assert (=> d!167273 (= (isStrictlySorted!1156 l!1251) e!884025)))

(declare-fun b!1583724 () Bool)

(declare-fun e!884026 () Bool)

(assert (=> b!1583724 (= e!884025 e!884026)))

(declare-fun res!1081832 () Bool)

(assert (=> b!1583724 (=> (not res!1081832) (not e!884026))))

(assert (=> b!1583724 (= res!1081832 (bvslt (_1!12903 (h!38467 l!1251)) (_1!12903 (h!38467 (t!51842 l!1251)))))))

(declare-fun b!1583725 () Bool)

(assert (=> b!1583725 (= e!884026 (isStrictlySorted!1156 (t!51842 l!1251)))))

(assert (= (and d!167273 (not res!1081831)) b!1583724))

(assert (= (and b!1583724 res!1081832) b!1583725))

(assert (=> b!1583725 m!1453441))

(assert (=> start!137954 d!167273))

(declare-fun d!167279 () Bool)

(declare-fun res!1081833 () Bool)

(declare-fun e!884027 () Bool)

(assert (=> d!167279 (=> res!1081833 e!884027)))

(assert (=> d!167279 (= res!1081833 (or (is-Nil!36925 (t!51842 l!1251)) (is-Nil!36925 (t!51842 (t!51842 l!1251)))))))

(assert (=> d!167279 (= (isStrictlySorted!1156 (t!51842 l!1251)) e!884027)))

(declare-fun b!1583726 () Bool)

(declare-fun e!884028 () Bool)

(assert (=> b!1583726 (= e!884027 e!884028)))

(declare-fun res!1081834 () Bool)

(assert (=> b!1583726 (=> (not res!1081834) (not e!884028))))

(assert (=> b!1583726 (= res!1081834 (bvslt (_1!12903 (h!38467 (t!51842 l!1251))) (_1!12903 (h!38467 (t!51842 (t!51842 l!1251))))))))

(declare-fun b!1583727 () Bool)

(assert (=> b!1583727 (= e!884028 (isStrictlySorted!1156 (t!51842 (t!51842 l!1251))))))

(assert (= (and d!167279 (not res!1081833)) b!1583726))

(assert (= (and b!1583726 res!1081834) b!1583727))

(declare-fun m!1453457 () Bool)

(assert (=> b!1583727 m!1453457))

(assert (=> b!1583709 d!167279))

(declare-fun d!167281 () Bool)

(declare-fun res!1081855 () Bool)

(declare-fun e!884049 () Bool)

(assert (=> d!167281 (=> res!1081855 e!884049)))

(assert (=> d!167281 (= res!1081855 (and (is-Cons!36924 l!1251) (= (_1!12903 (h!38467 l!1251)) otherKey!56)))))

(assert (=> d!167281 (= (containsKey!990 l!1251 otherKey!56) e!884049)))

(declare-fun b!1583748 () Bool)

(declare-fun e!884050 () Bool)

(assert (=> b!1583748 (= e!884049 e!884050)))

(declare-fun res!1081856 () Bool)

(assert (=> b!1583748 (=> (not res!1081856) (not e!884050))))

(assert (=> b!1583748 (= res!1081856 (and (or (not (is-Cons!36924 l!1251)) (bvsle (_1!12903 (h!38467 l!1251)) otherKey!56)) (is-Cons!36924 l!1251) (bvslt (_1!12903 (h!38467 l!1251)) otherKey!56)))))

(declare-fun b!1583749 () Bool)

(assert (=> b!1583749 (= e!884050 (containsKey!990 (t!51842 l!1251) otherKey!56))))

(assert (= (and d!167281 (not res!1081855)) b!1583748))

(assert (= (and b!1583748 res!1081856) b!1583749))

(assert (=> b!1583749 m!1453443))

(assert (=> b!1583713 d!167281))

(declare-fun b!1583826 () Bool)

(declare-fun e!884093 () List!36928)

(declare-fun e!884096 () List!36928)

(assert (=> b!1583826 (= e!884093 e!884096)))

(declare-fun c!146781 () Bool)

(assert (=> b!1583826 (= c!146781 (and (is-Cons!36924 l!1251) (= (_1!12903 (h!38467 l!1251)) newKey!123)))))

(declare-fun b!1583827 () Bool)

(declare-fun call!72502 () List!36928)

(assert (=> b!1583827 (= e!884093 call!72502)))

(declare-fun d!167289 () Bool)

(declare-fun e!884092 () Bool)

(assert (=> d!167289 e!884092))

(declare-fun res!1081878 () Bool)

(assert (=> d!167289 (=> (not res!1081878) (not e!884092))))

(declare-fun lt!677213 () List!36928)

(assert (=> d!167289 (= res!1081878 (isStrictlySorted!1156 lt!677213))))

(assert (=> d!167289 (= lt!677213 e!884093)))

(declare-fun c!146782 () Bool)

(assert (=> d!167289 (= c!146782 (and (is-Cons!36924 l!1251) (bvslt (_1!12903 (h!38467 l!1251)) newKey!123)))))

(assert (=> d!167289 (isStrictlySorted!1156 l!1251)))

(assert (=> d!167289 (= (insertStrictlySorted!622 l!1251 newKey!123 newValue!123) lt!677213)))

(declare-fun b!1583828 () Bool)

(declare-fun e!884095 () List!36928)

(declare-fun call!72503 () List!36928)

(assert (=> b!1583828 (= e!884095 call!72503)))

(declare-fun b!1583829 () Bool)

(declare-fun e!884094 () List!36928)

(assert (=> b!1583829 (= e!884094 (insertStrictlySorted!622 (t!51842 l!1251) newKey!123 newValue!123))))

(declare-fun b!1583830 () Bool)

(assert (=> b!1583830 (= e!884095 call!72503)))

(declare-fun bm!72498 () Bool)

(declare-fun call!72501 () List!36928)

(assert (=> bm!72498 (= call!72503 call!72501)))

(declare-fun bm!72499 () Bool)

(assert (=> bm!72499 (= call!72501 call!72502)))

(declare-fun c!146779 () Bool)

(declare-fun b!1583831 () Bool)

(assert (=> b!1583831 (= e!884094 (ite c!146781 (t!51842 l!1251) (ite c!146779 (Cons!36924 (h!38467 l!1251) (t!51842 l!1251)) Nil!36925)))))

(declare-fun b!1583832 () Bool)

(assert (=> b!1583832 (= c!146779 (and (is-Cons!36924 l!1251) (bvsgt (_1!12903 (h!38467 l!1251)) newKey!123)))))

(assert (=> b!1583832 (= e!884096 e!884095)))

(declare-fun bm!72500 () Bool)

(declare-fun $colon$colon!1018 (List!36928 tuple2!25784) List!36928)

(assert (=> bm!72500 (= call!72502 ($colon$colon!1018 e!884094 (ite c!146782 (h!38467 l!1251) (tuple2!25785 newKey!123 newValue!123))))))

(declare-fun c!146780 () Bool)

(assert (=> bm!72500 (= c!146780 c!146782)))

(declare-fun b!1583833 () Bool)

(declare-fun contains!10522 (List!36928 tuple2!25784) Bool)

(assert (=> b!1583833 (= e!884092 (contains!10522 lt!677213 (tuple2!25785 newKey!123 newValue!123)))))

(declare-fun b!1583834 () Bool)

(assert (=> b!1583834 (= e!884096 call!72501)))

(declare-fun b!1583835 () Bool)

(declare-fun res!1081877 () Bool)

(assert (=> b!1583835 (=> (not res!1081877) (not e!884092))))

(assert (=> b!1583835 (= res!1081877 (containsKey!990 lt!677213 newKey!123))))

(assert (= (and d!167289 c!146782) b!1583827))

(assert (= (and d!167289 (not c!146782)) b!1583826))

(assert (= (and b!1583826 c!146781) b!1583834))

(assert (= (and b!1583826 (not c!146781)) b!1583832))

(assert (= (and b!1583832 c!146779) b!1583830))

(assert (= (and b!1583832 (not c!146779)) b!1583828))

(assert (= (or b!1583830 b!1583828) bm!72498))

(assert (= (or b!1583834 bm!72498) bm!72499))

(assert (= (or b!1583827 bm!72499) bm!72500))

(assert (= (and bm!72500 c!146780) b!1583829))

(assert (= (and bm!72500 (not c!146780)) b!1583831))

(assert (= (and d!167289 res!1081878) b!1583835))

(assert (= (and b!1583835 res!1081877) b!1583833))

(declare-fun m!1453467 () Bool)

(assert (=> bm!72500 m!1453467))

(declare-fun m!1453471 () Bool)

(assert (=> d!167289 m!1453471))

(assert (=> d!167289 m!1453455))

(declare-fun m!1453475 () Bool)

(assert (=> b!1583835 m!1453475))

(declare-fun m!1453477 () Bool)

(assert (=> b!1583833 m!1453477))

(assert (=> b!1583829 m!1453451))

(assert (=> b!1583712 d!167289))

(declare-fun d!167297 () Bool)

(declare-fun res!1081881 () Bool)

(declare-fun e!884099 () Bool)

(assert (=> d!167297 (=> res!1081881 e!884099)))

(assert (=> d!167297 (= res!1081881 (or (is-Nil!36925 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123)) (is-Nil!36925 (t!51842 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!167297 (= (isStrictlySorted!1156 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123)) e!884099)))

(declare-fun b!1583838 () Bool)

(declare-fun e!884100 () Bool)

(assert (=> b!1583838 (= e!884099 e!884100)))

(declare-fun res!1081882 () Bool)

(assert (=> b!1583838 (=> (not res!1081882) (not e!884100))))

(assert (=> b!1583838 (= res!1081882 (bvslt (_1!12903 (h!38467 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123))) (_1!12903 (h!38467 (t!51842 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1583839 () Bool)

(assert (=> b!1583839 (= e!884100 (isStrictlySorted!1156 (t!51842 (insertStrictlySorted!622 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!167297 (not res!1081881)) b!1583838))

(assert (= (and b!1583838 res!1081882) b!1583839))

(declare-fun m!1453481 () Bool)

(assert (=> b!1583839 m!1453481))

(assert (=> b!1583712 d!167297))

(declare-fun b!1583860 () Bool)

(declare-fun e!884112 () List!36928)

(declare-fun e!884115 () List!36928)

(assert (=> b!1583860 (= e!884112 e!884115)))

(declare-fun c!146793 () Bool)

(assert (=> b!1583860 (= c!146793 (and (is-Cons!36924 (t!51842 l!1251)) (= (_1!12903 (h!38467 (t!51842 l!1251))) newKey!123)))))

(declare-fun b!1583861 () Bool)

(declare-fun call!72511 () List!36928)

(assert (=> b!1583861 (= e!884112 call!72511)))

(declare-fun d!167301 () Bool)

(declare-fun e!884111 () Bool)

(assert (=> d!167301 e!884111))

(declare-fun res!1081888 () Bool)

(assert (=> d!167301 (=> (not res!1081888) (not e!884111))))

(declare-fun lt!677216 () List!36928)

(assert (=> d!167301 (= res!1081888 (isStrictlySorted!1156 lt!677216))))

(assert (=> d!167301 (= lt!677216 e!884112)))

(declare-fun c!146794 () Bool)

(assert (=> d!167301 (= c!146794 (and (is-Cons!36924 (t!51842 l!1251)) (bvslt (_1!12903 (h!38467 (t!51842 l!1251))) newKey!123)))))

(assert (=> d!167301 (isStrictlySorted!1156 (t!51842 l!1251))))

(assert (=> d!167301 (= (insertStrictlySorted!622 (t!51842 l!1251) newKey!123 newValue!123) lt!677216)))

(declare-fun b!1583862 () Bool)

(declare-fun e!884114 () List!36928)

(declare-fun call!72512 () List!36928)

(assert (=> b!1583862 (= e!884114 call!72512)))

(declare-fun b!1583863 () Bool)

(declare-fun e!884113 () List!36928)

(assert (=> b!1583863 (= e!884113 (insertStrictlySorted!622 (t!51842 (t!51842 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1583864 () Bool)

(assert (=> b!1583864 (= e!884114 call!72512)))

(declare-fun bm!72507 () Bool)

(declare-fun call!72510 () List!36928)

(assert (=> bm!72507 (= call!72512 call!72510)))

(declare-fun bm!72508 () Bool)

(assert (=> bm!72508 (= call!72510 call!72511)))

(declare-fun c!146791 () Bool)

(declare-fun b!1583865 () Bool)

(assert (=> b!1583865 (= e!884113 (ite c!146793 (t!51842 (t!51842 l!1251)) (ite c!146791 (Cons!36924 (h!38467 (t!51842 l!1251)) (t!51842 (t!51842 l!1251))) Nil!36925)))))

(declare-fun b!1583866 () Bool)

(assert (=> b!1583866 (= c!146791 (and (is-Cons!36924 (t!51842 l!1251)) (bvsgt (_1!12903 (h!38467 (t!51842 l!1251))) newKey!123)))))

(assert (=> b!1583866 (= e!884115 e!884114)))

(declare-fun bm!72509 () Bool)

(assert (=> bm!72509 (= call!72511 ($colon$colon!1018 e!884113 (ite c!146794 (h!38467 (t!51842 l!1251)) (tuple2!25785 newKey!123 newValue!123))))))

(declare-fun c!146792 () Bool)

(assert (=> bm!72509 (= c!146792 c!146794)))

(declare-fun b!1583867 () Bool)

(assert (=> b!1583867 (= e!884111 (contains!10522 lt!677216 (tuple2!25785 newKey!123 newValue!123)))))

(declare-fun b!1583868 () Bool)

(assert (=> b!1583868 (= e!884115 call!72510)))

(declare-fun b!1583869 () Bool)

(declare-fun res!1081887 () Bool)

(assert (=> b!1583869 (=> (not res!1081887) (not e!884111))))

(assert (=> b!1583869 (= res!1081887 (containsKey!990 lt!677216 newKey!123))))

(assert (= (and d!167301 c!146794) b!1583861))

(assert (= (and d!167301 (not c!146794)) b!1583860))

(assert (= (and b!1583860 c!146793) b!1583868))

(assert (= (and b!1583860 (not c!146793)) b!1583866))

(assert (= (and b!1583866 c!146791) b!1583864))

(assert (= (and b!1583866 (not c!146791)) b!1583862))

(assert (= (or b!1583864 b!1583862) bm!72507))

(assert (= (or b!1583868 bm!72507) bm!72508))

(assert (= (or b!1583861 bm!72508) bm!72509))

(assert (= (and bm!72509 c!146792) b!1583863))

(assert (= (and bm!72509 (not c!146792)) b!1583865))

(assert (= (and d!167301 res!1081888) b!1583869))

(assert (= (and b!1583869 res!1081887) b!1583867))

(declare-fun m!1453495 () Bool)

(assert (=> bm!72509 m!1453495))

(declare-fun m!1453499 () Bool)

(assert (=> d!167301 m!1453499))

(assert (=> d!167301 m!1453441))

(declare-fun m!1453503 () Bool)

(assert (=> b!1583869 m!1453503))

(declare-fun m!1453507 () Bool)

(assert (=> b!1583867 m!1453507))

(declare-fun m!1453509 () Bool)

(assert (=> b!1583863 m!1453509))

(assert (=> b!1583712 d!167301))

(declare-fun d!167307 () Bool)

(assert (=> d!167307 (not (containsKey!990 (insertStrictlySorted!622 (t!51842 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!677225 () Unit!52295)

(declare-fun choose!2109 (List!36928 (_ BitVec 64) B!2892 (_ BitVec 64)) Unit!52295)

(assert (=> d!167307 (= lt!677225 (choose!2109 (t!51842 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!884130 () Bool)

(assert (=> d!167307 e!884130))

(declare-fun res!1081907 () Bool)

(assert (=> d!167307 (=> (not res!1081907) (not e!884130))))

(assert (=> d!167307 (= res!1081907 (isStrictlySorted!1156 (t!51842 l!1251)))))

(assert (=> d!167307 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!9 (t!51842 l!1251) newKey!123 newValue!123 otherKey!56) lt!677225)))

(declare-fun b!1583896 () Bool)

(declare-fun res!1081908 () Bool)

(assert (=> b!1583896 (=> (not res!1081908) (not e!884130))))

(assert (=> b!1583896 (= res!1081908 (not (containsKey!990 (t!51842 l!1251) otherKey!56)))))

(declare-fun b!1583897 () Bool)

(assert (=> b!1583897 (= e!884130 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!167307 res!1081907) b!1583896))

(assert (= (and b!1583896 res!1081908) b!1583897))

