; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2724 () Bool)

(assert start!2724)

(declare-fun b_free!559 () Bool)

(declare-fun b_next!559 () Bool)

(assert (=> start!2724 (= b_free!559 (not b_next!559))))

(declare-fun tp!2824 () Bool)

(declare-fun b_and!1083 () Bool)

(assert (=> start!2724 (= tp!2824 b_and!1083)))

(declare-fun b!16031 () Bool)

(declare-fun res!11996 () Bool)

(declare-fun e!9828 () Bool)

(assert (=> b!16031 (=> (not res!11996) (not e!9828))))

(declare-datatypes ((B!680 0))(
  ( (B!681 (val!438 Int)) )
))
(declare-datatypes ((tuple2!676 0))(
  ( (tuple2!677 (_1!338 (_ BitVec 64)) (_2!338 B!680)) )
))
(declare-datatypes ((List!523 0))(
  ( (Nil!520) (Cons!519 (h!1085 tuple2!676) (t!3039 List!523)) )
))
(declare-datatypes ((ListLongMap!507 0))(
  ( (ListLongMap!508 (toList!269 List!523)) )
))
(declare-fun lm!221 () ListLongMap!507)

(declare-fun isEmpty!150 (ListLongMap!507) Bool)

(assert (=> b!16031 (= res!11996 (not (isEmpty!150 lm!221)))))

(declare-fun b!16033 () Bool)

(declare-fun e!9829 () Bool)

(declare-fun lt!3936 () ListLongMap!507)

(declare-fun size!511 (List!523) Int)

(assert (=> b!16033 (= e!9829 (>= (size!511 (toList!269 lt!3936)) (size!511 (toList!269 lm!221))))))

(declare-fun b!16032 () Bool)

(assert (=> b!16032 (= e!9828 e!9829)))

(declare-fun res!11997 () Bool)

(assert (=> b!16032 (=> (not res!11997) (not e!9829))))

(declare-fun p!191 () Int)

(declare-fun forall!140 (List!523 Int) Bool)

(assert (=> b!16032 (= res!11997 (forall!140 (toList!269 lt!3936) p!191))))

(declare-fun tail!74 (ListLongMap!507) ListLongMap!507)

(assert (=> b!16032 (= lt!3936 (tail!74 lm!221))))

(declare-fun res!11998 () Bool)

(assert (=> start!2724 (=> (not res!11998) (not e!9828))))

(assert (=> start!2724 (= res!11998 (forall!140 (toList!269 lm!221) p!191))))

(assert (=> start!2724 e!9828))

(declare-fun e!9830 () Bool)

(declare-fun inv!880 (ListLongMap!507) Bool)

(assert (=> start!2724 (and (inv!880 lm!221) e!9830)))

(assert (=> start!2724 tp!2824))

(declare-fun b!16034 () Bool)

(declare-fun tp!2825 () Bool)

(assert (=> b!16034 (= e!9830 tp!2825)))

(assert (= (and start!2724 res!11998) b!16031))

(assert (= (and b!16031 res!11996) b!16032))

(assert (= (and b!16032 res!11997) b!16033))

(assert (= start!2724 b!16034))

(declare-fun m!11039 () Bool)

(assert (=> b!16031 m!11039))

(declare-fun m!11041 () Bool)

(assert (=> b!16033 m!11041))

(declare-fun m!11043 () Bool)

(assert (=> b!16033 m!11043))

(declare-fun m!11045 () Bool)

(assert (=> b!16032 m!11045))

(declare-fun m!11047 () Bool)

(assert (=> b!16032 m!11047))

(declare-fun m!11049 () Bool)

(assert (=> start!2724 m!11049))

(declare-fun m!11051 () Bool)

(assert (=> start!2724 m!11051))

(push 1)

(assert (not b!16032))

(assert (not start!2724))

(assert (not b!16034))

(assert (not b!16031))

(assert (not b!16033))

(assert b_and!1083)

(assert (not b_next!559))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1083)

(assert (not b_next!559))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2949 () Bool)

(declare-fun lt!3945 () Int)

(assert (=> d!2949 (>= lt!3945 0)))

(declare-fun e!9855 () Int)

(assert (=> d!2949 (= lt!3945 e!9855)))

(declare-fun c!1505 () Bool)

(assert (=> d!2949 (= c!1505 (is-Nil!520 (toList!269 lt!3936)))))

(assert (=> d!2949 (= (size!511 (toList!269 lt!3936)) lt!3945)))

(declare-fun b!16067 () Bool)

(assert (=> b!16067 (= e!9855 0)))

(declare-fun b!16068 () Bool)

(assert (=> b!16068 (= e!9855 (+ 1 (size!511 (t!3039 (toList!269 lt!3936)))))))

(assert (= (and d!2949 c!1505) b!16067))

(assert (= (and d!2949 (not c!1505)) b!16068))

(declare-fun m!11083 () Bool)

(assert (=> b!16068 m!11083))

(assert (=> b!16033 d!2949))

(declare-fun d!2955 () Bool)

(declare-fun lt!3946 () Int)

(assert (=> d!2955 (>= lt!3946 0)))

(declare-fun e!9858 () Int)

(assert (=> d!2955 (= lt!3946 e!9858)))

(declare-fun c!1506 () Bool)

(assert (=> d!2955 (= c!1506 (is-Nil!520 (toList!269 lm!221)))))

(assert (=> d!2955 (= (size!511 (toList!269 lm!221)) lt!3946)))

(declare-fun b!16071 () Bool)

(assert (=> b!16071 (= e!9858 0)))

(declare-fun b!16072 () Bool)

(assert (=> b!16072 (= e!9858 (+ 1 (size!511 (t!3039 (toList!269 lm!221)))))))

(assert (= (and d!2955 c!1506) b!16071))

(assert (= (and d!2955 (not c!1506)) b!16072))

(declare-fun m!11085 () Bool)

(assert (=> b!16072 m!11085))

(assert (=> b!16033 d!2955))

(declare-fun d!2957 () Bool)

(declare-fun res!12029 () Bool)

(declare-fun e!9869 () Bool)

(assert (=> d!2957 (=> res!12029 e!9869)))

(assert (=> d!2957 (= res!12029 (is-Nil!520 (toList!269 lm!221)))))

(assert (=> d!2957 (= (forall!140 (toList!269 lm!221) p!191) e!9869)))

(declare-fun b!16087 () Bool)

(declare-fun e!9870 () Bool)

(assert (=> b!16087 (= e!9869 e!9870)))

(declare-fun res!12030 () Bool)

(assert (=> b!16087 (=> (not res!12030) (not e!9870))))

(declare-fun dynLambda!124 (Int tuple2!676) Bool)

(assert (=> b!16087 (= res!12030 (dynLambda!124 p!191 (h!1085 (toList!269 lm!221))))))

(declare-fun b!16088 () Bool)

(assert (=> b!16088 (= e!9870 (forall!140 (t!3039 (toList!269 lm!221)) p!191))))

(assert (= (and d!2957 (not res!12029)) b!16087))

(assert (= (and b!16087 res!12030) b!16088))

(declare-fun b_lambda!1203 () Bool)

(assert (=> (not b_lambda!1203) (not b!16087)))

(declare-fun t!3047 () Bool)

(declare-fun tb!511 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3047) tb!511))

(declare-fun result!871 () Bool)

(assert (=> tb!511 (= result!871 true)))

(assert (=> b!16087 t!3047))

(declare-fun b_and!1093 () Bool)

(assert (= b_and!1083 (and (=> t!3047 result!871) b_and!1093)))

(declare-fun m!11101 () Bool)

(assert (=> b!16087 m!11101))

(declare-fun m!11103 () Bool)

(assert (=> b!16088 m!11103))

(assert (=> start!2724 d!2957))

(declare-fun d!2969 () Bool)

(declare-fun isStrictlySorted!162 (List!523) Bool)

(assert (=> d!2969 (= (inv!880 lm!221) (isStrictlySorted!162 (toList!269 lm!221)))))

(declare-fun bs!750 () Bool)

(assert (= bs!750 d!2969))

(declare-fun m!11107 () Bool)

(assert (=> bs!750 m!11107))

(assert (=> start!2724 d!2969))

(declare-fun d!2973 () Bool)

(declare-fun res!12037 () Bool)

(declare-fun e!9877 () Bool)

(assert (=> d!2973 (=> res!12037 e!9877)))

(assert (=> d!2973 (= res!12037 (is-Nil!520 (toList!269 lt!3936)))))

(assert (=> d!2973 (= (forall!140 (toList!269 lt!3936) p!191) e!9877)))

(declare-fun b!16095 () Bool)

(declare-fun e!9878 () Bool)

(assert (=> b!16095 (= e!9877 e!9878)))

(declare-fun res!12038 () Bool)

(assert (=> b!16095 (=> (not res!12038) (not e!9878))))

(assert (=> b!16095 (= res!12038 (dynLambda!124 p!191 (h!1085 (toList!269 lt!3936))))))

(declare-fun b!16096 () Bool)

(assert (=> b!16096 (= e!9878 (forall!140 (t!3039 (toList!269 lt!3936)) p!191))))

(assert (= (and d!2973 (not res!12037)) b!16095))

(assert (= (and b!16095 res!12038) b!16096))

(declare-fun b_lambda!1207 () Bool)

(assert (=> (not b_lambda!1207) (not b!16095)))

(declare-fun t!3051 () Bool)

(declare-fun tb!515 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3051) tb!515))

(declare-fun result!875 () Bool)

(assert (=> tb!515 (= result!875 true)))

(assert (=> b!16095 t!3051))

(declare-fun b_and!1097 () Bool)

(assert (= b_and!1093 (and (=> t!3051 result!875) b_and!1097)))

(declare-fun m!11115 () Bool)

(assert (=> b!16095 m!11115))

(declare-fun m!11117 () Bool)

(assert (=> b!16096 m!11117))

(assert (=> b!16032 d!2973))

(declare-fun d!2979 () Bool)

(declare-fun tail!78 (List!523) List!523)

(assert (=> d!2979 (= (tail!74 lm!221) (ListLongMap!508 (tail!78 (toList!269 lm!221))))))

(declare-fun bs!752 () Bool)

(assert (= bs!752 d!2979))

(declare-fun m!11119 () Bool)

(assert (=> bs!752 m!11119))

(assert (=> b!16032 d!2979))

(declare-fun d!2981 () Bool)

(declare-fun isEmpty!155 (List!523) Bool)

(assert (=> d!2981 (= (isEmpty!150 lm!221) (isEmpty!155 (toList!269 lm!221)))))

(declare-fun bs!754 () Bool)

(assert (= bs!754 d!2981))

(declare-fun m!11123 () Bool)

(assert (=> bs!754 m!11123))

(assert (=> b!16031 d!2981))

(declare-fun b!16115 () Bool)

(declare-fun e!9889 () Bool)

(declare-fun tp_is_empty!823 () Bool)

(declare-fun tp!2840 () Bool)

(assert (=> b!16115 (= e!9889 (and tp_is_empty!823 tp!2840))))

(assert (=> b!16034 (= tp!2825 e!9889)))

(assert (= (and b!16034 (is-Cons!519 (toList!269 lm!221))) b!16115))

(declare-fun b_lambda!1211 () Bool)

(assert (= b_lambda!1203 (or (and start!2724 b_free!559) b_lambda!1211)))

(declare-fun b_lambda!1213 () Bool)

(assert (= b_lambda!1207 (or (and start!2724 b_free!559) b_lambda!1213)))

(push 1)

(assert (not b!16115))

(assert (not b_lambda!1211))

(assert tp_is_empty!823)

(assert (not b!16072))

(assert (not b!16068))

(assert (not b!16096))

(assert (not b_lambda!1213))

(assert (not b!16088))

(assert (not d!2979))

(assert (not d!2981))

(assert b_and!1097)

(assert (not d!2969))

(assert (not b_next!559))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1097)

(assert (not b_next!559))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!2993 () Bool)

(assert (=> d!2993 (= (tail!78 (toList!269 lm!221)) (t!3039 (toList!269 lm!221)))))

(assert (=> d!2979 d!2993))

(declare-fun d!2997 () Bool)

(declare-fun res!12047 () Bool)

(declare-fun e!9900 () Bool)

(assert (=> d!2997 (=> res!12047 e!9900)))

(assert (=> d!2997 (= res!12047 (is-Nil!520 (t!3039 (toList!269 lt!3936))))))

(assert (=> d!2997 (= (forall!140 (t!3039 (toList!269 lt!3936)) p!191) e!9900)))

(declare-fun b!16128 () Bool)

(declare-fun e!9901 () Bool)

(assert (=> b!16128 (= e!9900 e!9901)))

(declare-fun res!12048 () Bool)

(assert (=> b!16128 (=> (not res!12048) (not e!9901))))

(assert (=> b!16128 (= res!12048 (dynLambda!124 p!191 (h!1085 (t!3039 (toList!269 lt!3936)))))))

(declare-fun b!16129 () Bool)

(assert (=> b!16129 (= e!9901 (forall!140 (t!3039 (t!3039 (toList!269 lt!3936))) p!191))))

(assert (= (and d!2997 (not res!12047)) b!16128))

(assert (= (and b!16128 res!12048) b!16129))

(declare-fun b_lambda!1223 () Bool)

(assert (=> (not b_lambda!1223) (not b!16128)))

(declare-fun t!3055 () Bool)

(declare-fun tb!519 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3055) tb!519))

(declare-fun result!885 () Bool)

(assert (=> tb!519 (= result!885 true)))

(assert (=> b!16128 t!3055))

(declare-fun b_and!1101 () Bool)

(assert (= b_and!1097 (and (=> t!3055 result!885) b_and!1101)))

(declare-fun m!11137 () Bool)

(assert (=> b!16128 m!11137))

(declare-fun m!11139 () Bool)

(assert (=> b!16129 m!11139))

(assert (=> b!16096 d!2997))

(declare-fun d!3001 () Bool)

(declare-fun lt!3956 () Int)

(assert (=> d!3001 (>= lt!3956 0)))

(declare-fun e!9903 () Int)

(assert (=> d!3001 (= lt!3956 e!9903)))

(declare-fun c!1516 () Bool)

(assert (=> d!3001 (= c!1516 (is-Nil!520 (t!3039 (toList!269 lm!221))))))

(assert (=> d!3001 (= (size!511 (t!3039 (toList!269 lm!221))) lt!3956)))

(declare-fun b!16132 () Bool)

(assert (=> b!16132 (= e!9903 0)))

(declare-fun b!16133 () Bool)

(assert (=> b!16133 (= e!9903 (+ 1 (size!511 (t!3039 (t!3039 (toList!269 lm!221))))))))

(assert (= (and d!3001 c!1516) b!16132))

(assert (= (and d!3001 (not c!1516)) b!16133))

(declare-fun m!11143 () Bool)

(assert (=> b!16133 m!11143))

(assert (=> b!16072 d!3001))

(declare-fun d!3005 () Bool)

(declare-fun lt!3957 () Int)

(assert (=> d!3005 (>= lt!3957 0)))

(declare-fun e!9906 () Int)

(assert (=> d!3005 (= lt!3957 e!9906)))

(declare-fun c!1517 () Bool)

(assert (=> d!3005 (= c!1517 (is-Nil!520 (t!3039 (toList!269 lt!3936))))))

(assert (=> d!3005 (= (size!511 (t!3039 (toList!269 lt!3936))) lt!3957)))

(declare-fun b!16136 () Bool)

(assert (=> b!16136 (= e!9906 0)))

(declare-fun b!16137 () Bool)

(assert (=> b!16137 (= e!9906 (+ 1 (size!511 (t!3039 (t!3039 (toList!269 lt!3936))))))))

(assert (= (and d!3005 c!1517) b!16136))

(assert (= (and d!3005 (not c!1517)) b!16137))

(declare-fun m!11145 () Bool)

(assert (=> b!16137 m!11145))

(assert (=> b!16068 d!3005))

(declare-fun d!3007 () Bool)

(assert (=> d!3007 (= (isEmpty!155 (toList!269 lm!221)) (is-Nil!520 (toList!269 lm!221)))))

(assert (=> d!2981 d!3007))

(declare-fun d!3009 () Bool)

(declare-fun res!12051 () Bool)

(declare-fun e!9908 () Bool)

(assert (=> d!3009 (=> res!12051 e!9908)))

(assert (=> d!3009 (= res!12051 (is-Nil!520 (t!3039 (toList!269 lm!221))))))

(assert (=> d!3009 (= (forall!140 (t!3039 (toList!269 lm!221)) p!191) e!9908)))

(declare-fun b!16140 () Bool)

(declare-fun e!9909 () Bool)

(assert (=> b!16140 (= e!9908 e!9909)))

(declare-fun res!12052 () Bool)

(assert (=> b!16140 (=> (not res!12052) (not e!9909))))

(assert (=> b!16140 (= res!12052 (dynLambda!124 p!191 (h!1085 (t!3039 (toList!269 lm!221)))))))

(declare-fun b!16141 () Bool)

(assert (=> b!16141 (= e!9909 (forall!140 (t!3039 (t!3039 (toList!269 lm!221))) p!191))))

(assert (= (and d!3009 (not res!12051)) b!16140))

(assert (= (and b!16140 res!12052) b!16141))

(declare-fun b_lambda!1227 () Bool)

(assert (=> (not b_lambda!1227) (not b!16140)))

(declare-fun t!3059 () Bool)

(declare-fun tb!523 () Bool)

(assert (=> (and start!2724 (= p!191 p!191) t!3059) tb!523))

(declare-fun result!889 () Bool)

(assert (=> tb!523 (= result!889 true)))

(assert (=> b!16140 t!3059))

(declare-fun b_and!1105 () Bool)

(assert (= b_and!1101 (and (=> t!3059 result!889) b_and!1105)))

(declare-fun m!11153 () Bool)

(assert (=> b!16140 m!11153))

(declare-fun m!11155 () Bool)

(assert (=> b!16141 m!11155))

(assert (=> b!16088 d!3009))

(declare-fun d!3015 () Bool)

(declare-fun res!12059 () Bool)

(declare-fun e!9917 () Bool)

(assert (=> d!3015 (=> res!12059 e!9917)))

(assert (=> d!3015 (= res!12059 (or (is-Nil!520 (toList!269 lm!221)) (is-Nil!520 (t!3039 (toList!269 lm!221)))))))

(assert (=> d!3015 (= (isStrictlySorted!162 (toList!269 lm!221)) e!9917)))

(declare-fun b!16149 () Bool)

(declare-fun e!9918 () Bool)

(assert (=> b!16149 (= e!9917 e!9918)))

(declare-fun res!12060 () Bool)

(assert (=> b!16149 (=> (not res!12060) (not e!9918))))

(assert (=> b!16149 (= res!12060 (bvslt (_1!338 (h!1085 (toList!269 lm!221))) (_1!338 (h!1085 (t!3039 (toList!269 lm!221))))))))

(declare-fun b!16150 () Bool)

(assert (=> b!16150 (= e!9918 (isStrictlySorted!162 (t!3039 (toList!269 lm!221))))))

(assert (= (and d!3015 (not res!12059)) b!16149))

(assert (= (and b!16149 res!12060) b!16150))

(declare-fun m!11161 () Bool)

(assert (=> b!16150 m!11161))

(assert (=> d!2969 d!3015))

(declare-fun b!16151 () Bool)

(declare-fun e!9919 () Bool)

(declare-fun tp!2848 () Bool)

(assert (=> b!16151 (= e!9919 (and tp_is_empty!823 tp!2848))))

(assert (=> b!16115 (= tp!2840 e!9919)))

(assert (= (and b!16115 (is-Cons!519 (t!3039 (toList!269 lm!221)))) b!16151))

(declare-fun b_lambda!1235 () Bool)

(assert (= b_lambda!1227 (or (and start!2724 b_free!559) b_lambda!1235)))

(declare-fun b_lambda!1237 () Bool)

(assert (= b_lambda!1223 (or (and start!2724 b_free!559) b_lambda!1237)))

