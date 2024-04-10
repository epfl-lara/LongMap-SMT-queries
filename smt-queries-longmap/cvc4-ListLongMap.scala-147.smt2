; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2728 () Bool)

(assert start!2728)

(declare-fun b_free!563 () Bool)

(declare-fun b_next!563 () Bool)

(assert (=> start!2728 (= b_free!563 (not b_next!563))))

(declare-fun tp!2837 () Bool)

(declare-fun b_and!1087 () Bool)

(assert (=> start!2728 (= tp!2837 b_and!1087)))

(declare-fun b!16056 () Bool)

(declare-fun e!9846 () Bool)

(declare-fun e!9848 () Bool)

(assert (=> b!16056 (= e!9846 e!9848)))

(declare-fun res!12015 () Bool)

(assert (=> b!16056 (=> (not res!12015) (not e!9848))))

(declare-datatypes ((B!684 0))(
  ( (B!685 (val!440 Int)) )
))
(declare-datatypes ((tuple2!680 0))(
  ( (tuple2!681 (_1!340 (_ BitVec 64)) (_2!340 B!684)) )
))
(declare-datatypes ((List!525 0))(
  ( (Nil!522) (Cons!521 (h!1087 tuple2!680) (t!3041 List!525)) )
))
(declare-datatypes ((ListLongMap!511 0))(
  ( (ListLongMap!512 (toList!271 List!525)) )
))
(declare-fun lt!3942 () ListLongMap!511)

(declare-fun p!191 () Int)

(declare-fun forall!142 (List!525 Int) Bool)

(assert (=> b!16056 (= res!12015 (forall!142 (toList!271 lt!3942) p!191))))

(declare-fun lm!221 () ListLongMap!511)

(declare-fun tail!76 (ListLongMap!511) ListLongMap!511)

(assert (=> b!16056 (= lt!3942 (tail!76 lm!221))))

(declare-fun b!16055 () Bool)

(declare-fun res!12016 () Bool)

(assert (=> b!16055 (=> (not res!12016) (not e!9846))))

(declare-fun isEmpty!152 (ListLongMap!511) Bool)

(assert (=> b!16055 (= res!12016 (not (isEmpty!152 lm!221)))))

(declare-fun b!16057 () Bool)

(declare-fun size!513 (List!525) Int)

(assert (=> b!16057 (= e!9848 (>= (size!513 (toList!271 lt!3942)) (size!513 (toList!271 lm!221))))))

(declare-fun res!12014 () Bool)

(assert (=> start!2728 (=> (not res!12014) (not e!9846))))

(assert (=> start!2728 (= res!12014 (forall!142 (toList!271 lm!221) p!191))))

(assert (=> start!2728 e!9846))

(declare-fun e!9847 () Bool)

(declare-fun inv!882 (ListLongMap!511) Bool)

(assert (=> start!2728 (and (inv!882 lm!221) e!9847)))

(assert (=> start!2728 tp!2837))

(declare-fun b!16058 () Bool)

(declare-fun tp!2836 () Bool)

(assert (=> b!16058 (= e!9847 tp!2836)))

(assert (= (and start!2728 res!12014) b!16055))

(assert (= (and b!16055 res!12016) b!16056))

(assert (= (and b!16056 res!12015) b!16057))

(assert (= start!2728 b!16058))

(declare-fun m!11067 () Bool)

(assert (=> b!16056 m!11067))

(declare-fun m!11069 () Bool)

(assert (=> b!16056 m!11069))

(declare-fun m!11071 () Bool)

(assert (=> b!16055 m!11071))

(declare-fun m!11073 () Bool)

(assert (=> b!16057 m!11073))

(declare-fun m!11075 () Bool)

(assert (=> b!16057 m!11075))

(declare-fun m!11077 () Bool)

(assert (=> start!2728 m!11077))

(declare-fun m!11079 () Bool)

(assert (=> start!2728 m!11079))

(push 1)

(assert (not b!16056))

(assert (not b!16058))

(assert (not b_next!563))

(assert (not b!16055))

(assert (not start!2728))

(assert (not b!16057))

(assert b_and!1087)

(check-sat)

(pop 1)

(push 1)

(assert b_and!1087)

(assert (not b_next!563))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2951 () Bool)

(declare-fun isEmpty!153 (List!525) Bool)

(assert (=> d!2951 (= (isEmpty!152 lm!221) (isEmpty!153 (toList!271 lm!221)))))

(declare-fun bs!747 () Bool)

(assert (= bs!747 d!2951))

(declare-fun m!11081 () Bool)

(assert (=> bs!747 m!11081))

(assert (=> b!16055 d!2951))

(declare-fun d!2953 () Bool)

(declare-fun lt!3949 () Int)

(assert (=> d!2953 (>= lt!3949 0)))

(declare-fun e!9865 () Int)

(assert (=> d!2953 (= lt!3949 e!9865)))

(declare-fun c!1509 () Bool)

(assert (=> d!2953 (= c!1509 (is-Nil!522 (toList!271 lt!3942)))))

(assert (=> d!2953 (= (size!513 (toList!271 lt!3942)) lt!3949)))

(declare-fun b!16081 () Bool)

(assert (=> b!16081 (= e!9865 0)))

(declare-fun b!16082 () Bool)

(assert (=> b!16082 (= e!9865 (+ 1 (size!513 (t!3041 (toList!271 lt!3942)))))))

(assert (= (and d!2953 c!1509) b!16081))

(assert (= (and d!2953 (not c!1509)) b!16082))

(declare-fun m!11091 () Bool)

(assert (=> b!16082 m!11091))

(assert (=> b!16057 d!2953))

(declare-fun d!2961 () Bool)

(declare-fun lt!3950 () Int)

(assert (=> d!2961 (>= lt!3950 0)))

(declare-fun e!9866 () Int)

(assert (=> d!2961 (= lt!3950 e!9866)))

(declare-fun c!1510 () Bool)

(assert (=> d!2961 (= c!1510 (is-Nil!522 (toList!271 lm!221)))))

(assert (=> d!2961 (= (size!513 (toList!271 lm!221)) lt!3950)))

(declare-fun b!16083 () Bool)

(assert (=> b!16083 (= e!9866 0)))

(declare-fun b!16084 () Bool)

(assert (=> b!16084 (= e!9866 (+ 1 (size!513 (t!3041 (toList!271 lm!221)))))))

(assert (= (and d!2961 c!1510) b!16083))

(assert (= (and d!2961 (not c!1510)) b!16084))

(declare-fun m!11095 () Bool)

(assert (=> b!16084 m!11095))

(assert (=> b!16057 d!2961))

(declare-fun d!2965 () Bool)

(declare-fun res!12035 () Bool)

(declare-fun e!9875 () Bool)

(assert (=> d!2965 (=> res!12035 e!9875)))

(assert (=> d!2965 (= res!12035 (is-Nil!522 (toList!271 lm!221)))))

(assert (=> d!2965 (= (forall!142 (toList!271 lm!221) p!191) e!9875)))

(declare-fun b!16093 () Bool)

(declare-fun e!9876 () Bool)

(assert (=> b!16093 (= e!9875 e!9876)))

(declare-fun res!12036 () Bool)

(assert (=> b!16093 (=> (not res!12036) (not e!9876))))

(declare-fun dynLambda!125 (Int tuple2!680) Bool)

(assert (=> b!16093 (= res!12036 (dynLambda!125 p!191 (h!1087 (toList!271 lm!221))))))

(declare-fun b!16094 () Bool)

(assert (=> b!16094 (= e!9876 (forall!142 (t!3041 (toList!271 lm!221)) p!191))))

(assert (= (and d!2965 (not res!12035)) b!16093))

(assert (= (and b!16093 res!12036) b!16094))

(declare-fun b_lambda!1205 () Bool)

(assert (=> (not b_lambda!1205) (not b!16093)))

(declare-fun t!3049 () Bool)

(declare-fun tb!513 () Bool)

(assert (=> (and start!2728 (= p!191 p!191) t!3049) tb!513))

(declare-fun result!873 () Bool)

(assert (=> tb!513 (= result!873 true)))

(assert (=> b!16093 t!3049))

(declare-fun b_and!1095 () Bool)

(assert (= b_and!1087 (and (=> t!3049 result!873) b_and!1095)))

(declare-fun m!11111 () Bool)

(assert (=> b!16093 m!11111))

(declare-fun m!11113 () Bool)

(assert (=> b!16094 m!11113))

(assert (=> start!2728 d!2965))

(declare-fun d!2977 () Bool)

(declare-fun isStrictlySorted!163 (List!525) Bool)

(assert (=> d!2977 (= (inv!882 lm!221) (isStrictlySorted!163 (toList!271 lm!221)))))

(declare-fun bs!753 () Bool)

(assert (= bs!753 d!2977))

(declare-fun m!11121 () Bool)

(assert (=> bs!753 m!11121))

(assert (=> start!2728 d!2977))

(declare-fun d!2983 () Bool)

(declare-fun res!12039 () Bool)

(declare-fun e!9881 () Bool)

(assert (=> d!2983 (=> res!12039 e!9881)))

(assert (=> d!2983 (= res!12039 (is-Nil!522 (toList!271 lt!3942)))))

(assert (=> d!2983 (= (forall!142 (toList!271 lt!3942) p!191) e!9881)))

(declare-fun b!16101 () Bool)

(declare-fun e!9882 () Bool)

(assert (=> b!16101 (= e!9881 e!9882)))

(declare-fun res!12040 () Bool)

(assert (=> b!16101 (=> (not res!12040) (not e!9882))))

(assert (=> b!16101 (= res!12040 (dynLambda!125 p!191 (h!1087 (toList!271 lt!3942))))))

(declare-fun b!16102 () Bool)

(assert (=> b!16102 (= e!9882 (forall!142 (t!3041 (toList!271 lt!3942)) p!191))))

(assert (= (and d!2983 (not res!12039)) b!16101))

(assert (= (and b!16101 res!12040) b!16102))

(declare-fun b_lambda!1209 () Bool)

(assert (=> (not b_lambda!1209) (not b!16101)))

(declare-fun t!3053 () Bool)

(declare-fun tb!517 () Bool)

(assert (=> (and start!2728 (= p!191 p!191) t!3053) tb!517))

(declare-fun result!877 () Bool)

(assert (=> tb!517 (= result!877 true)))

(assert (=> b!16101 t!3053))

(declare-fun b_and!1099 () Bool)

(assert (= b_and!1095 (and (=> t!3053 result!877) b_and!1099)))

(declare-fun m!11127 () Bool)

(assert (=> b!16101 m!11127))

(declare-fun m!11129 () Bool)

(assert (=> b!16102 m!11129))

(assert (=> b!16056 d!2983))

(declare-fun d!2987 () Bool)

(declare-fun tail!79 (List!525) List!525)

(assert (=> d!2987 (= (tail!76 lm!221) (ListLongMap!512 (tail!79 (toList!271 lm!221))))))

(declare-fun bs!755 () Bool)

(assert (= bs!755 d!2987))

(declare-fun m!11133 () Bool)

(assert (=> bs!755 m!11133))

(assert (=> b!16056 d!2987))

(declare-fun b!16121 () Bool)

(declare-fun e!9893 () Bool)

(declare-fun tp_is_empty!827 () Bool)

(declare-fun tp!2846 () Bool)

(assert (=> b!16121 (= e!9893 (and tp_is_empty!827 tp!2846))))

(assert (=> b!16058 (= tp!2836 e!9893)))

(assert (= (and b!16058 (is-Cons!521 (toList!271 lm!221))) b!16121))

(declare-fun b_lambda!1219 () Bool)

(assert (= b_lambda!1209 (or (and start!2728 b_free!563) b_lambda!1219)))

(declare-fun b_lambda!1221 () Bool)

(assert (= b_lambda!1205 (or (and start!2728 b_free!563) b_lambda!1221)))

(push 1)

(assert (not b_lambda!1219))

(assert (not b!16082))

(assert (not b!16102))

(assert (not b!16121))

(assert (not d!2951))

(assert b_and!1099)

(assert (not b!16084))

(assert (not b_next!563))

(assert (not d!2977))

(assert (not b_lambda!1221))

(assert (not d!2987))

(assert tp_is_empty!827)

(assert (not b!16094))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1099)

(assert (not b_next!563))

(check-sat)

(get-model)

(pop 1)

