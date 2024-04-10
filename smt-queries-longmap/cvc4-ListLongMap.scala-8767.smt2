; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106508 () Bool)

(assert start!106508)

(declare-fun b!1265996 () Bool)

(declare-fun e!721012 () Bool)

(declare-fun tp_is_empty!32531 () Bool)

(declare-fun tp!96416 () Bool)

(assert (=> b!1265996 (= e!721012 (and tp_is_empty!32531 tp!96416))))

(declare-datatypes ((B!1998 0))(
  ( (B!1999 (val!16334 Int)) )
))
(declare-datatypes ((tuple2!21186 0))(
  ( (tuple2!21187 (_1!10604 (_ BitVec 64)) (_2!10604 B!1998)) )
))
(declare-datatypes ((List!28326 0))(
  ( (Nil!28323) (Cons!28322 (h!29531 tuple2!21186) (t!41847 List!28326)) )
))
(declare-fun l!706 () List!28326)

(declare-fun e!721013 () Bool)

(declare-fun v1!26 () B!1998)

(declare-fun b!1265997 () Bool)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun removeStrictlySorted!157 (List!28326 (_ BitVec 64)) List!28326)

(declare-fun insertStrictlySorted!467 (List!28326 (_ BitVec 64) B!1998) List!28326)

(assert (=> b!1265997 (= e!721013 (not (= (removeStrictlySorted!157 (insertStrictlySorted!467 l!706 key1!31 v1!26) key1!31) l!706)))))

(assert (=> b!1265997 (= (removeStrictlySorted!157 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26) key1!31) (t!41847 l!706))))

(declare-datatypes ((Unit!42187 0))(
  ( (Unit!42188) )
))
(declare-fun lt!574080 () Unit!42187)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!12 (List!28326 (_ BitVec 64) B!1998) Unit!42187)

(assert (=> b!1265997 (= lt!574080 (lemmaInsertStrictlySortedThenRemoveIsSame!12 (t!41847 l!706) key1!31 v1!26))))

(declare-fun b!1265998 () Bool)

(declare-fun res!842934 () Bool)

(assert (=> b!1265998 (=> (not res!842934) (not e!721013))))

(declare-fun containsKey!660 (List!28326 (_ BitVec 64)) Bool)

(assert (=> b!1265998 (= res!842934 (not (containsKey!660 l!706 key1!31)))))

(declare-fun b!1265999 () Bool)

(declare-fun res!842931 () Bool)

(assert (=> b!1265999 (=> (not res!842931) (not e!721013))))

(assert (=> b!1265999 (= res!842931 (not (containsKey!660 (t!41847 l!706) key1!31)))))

(declare-fun b!1266000 () Bool)

(declare-fun res!842933 () Bool)

(assert (=> b!1266000 (=> (not res!842933) (not e!721013))))

(declare-fun isStrictlySorted!801 (List!28326) Bool)

(assert (=> b!1266000 (= res!842933 (isStrictlySorted!801 (t!41847 l!706)))))

(declare-fun b!1266001 () Bool)

(declare-fun res!842932 () Bool)

(assert (=> b!1266001 (=> (not res!842932) (not e!721013))))

(assert (=> b!1266001 (= res!842932 (is-Cons!28322 l!706))))

(declare-fun res!842935 () Bool)

(assert (=> start!106508 (=> (not res!842935) (not e!721013))))

(assert (=> start!106508 (= res!842935 (isStrictlySorted!801 l!706))))

(assert (=> start!106508 e!721013))

(assert (=> start!106508 e!721012))

(assert (=> start!106508 true))

(assert (=> start!106508 tp_is_empty!32531))

(assert (= (and start!106508 res!842935) b!1265998))

(assert (= (and b!1265998 res!842934) b!1266001))

(assert (= (and b!1266001 res!842932) b!1266000))

(assert (= (and b!1266000 res!842933) b!1265999))

(assert (= (and b!1265999 res!842931) b!1265997))

(assert (= (and start!106508 (is-Cons!28322 l!706)) b!1265996))

(declare-fun m!1165839 () Bool)

(assert (=> b!1265997 m!1165839))

(declare-fun m!1165841 () Bool)

(assert (=> b!1265997 m!1165841))

(assert (=> b!1265997 m!1165839))

(declare-fun m!1165843 () Bool)

(assert (=> b!1265997 m!1165843))

(declare-fun m!1165845 () Bool)

(assert (=> b!1265997 m!1165845))

(assert (=> b!1265997 m!1165845))

(declare-fun m!1165847 () Bool)

(assert (=> b!1265997 m!1165847))

(declare-fun m!1165849 () Bool)

(assert (=> b!1265999 m!1165849))

(declare-fun m!1165851 () Bool)

(assert (=> b!1265998 m!1165851))

(declare-fun m!1165853 () Bool)

(assert (=> start!106508 m!1165853))

(declare-fun m!1165855 () Bool)

(assert (=> b!1266000 m!1165855))

(push 1)

(assert (not b!1265998))

(assert (not b!1266000))

(assert (not start!106508))

(assert (not b!1265999))

(assert tp_is_empty!32531)

(assert (not b!1265996))

(assert (not b!1265997))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139035 () Bool)

(declare-fun res!842950 () Bool)

(declare-fun e!721028 () Bool)

(assert (=> d!139035 (=> res!842950 e!721028)))

(assert (=> d!139035 (= res!842950 (or (is-Nil!28323 l!706) (is-Nil!28323 (t!41847 l!706))))))

(assert (=> d!139035 (= (isStrictlySorted!801 l!706) e!721028)))

(declare-fun b!1266016 () Bool)

(declare-fun e!721029 () Bool)

(assert (=> b!1266016 (= e!721028 e!721029)))

(declare-fun res!842951 () Bool)

(assert (=> b!1266016 (=> (not res!842951) (not e!721029))))

(assert (=> b!1266016 (= res!842951 (bvslt (_1!10604 (h!29531 l!706)) (_1!10604 (h!29531 (t!41847 l!706)))))))

(declare-fun b!1266017 () Bool)

(assert (=> b!1266017 (= e!721029 (isStrictlySorted!801 (t!41847 l!706)))))

(assert (= (and d!139035 (not res!842950)) b!1266016))

(assert (= (and b!1266016 res!842951) b!1266017))

(assert (=> b!1266017 m!1165855))

(assert (=> start!106508 d!139035))

(declare-fun b!1266060 () Bool)

(declare-fun e!721056 () List!28326)

(declare-fun e!721057 () List!28326)

(assert (=> b!1266060 (= e!721056 e!721057)))

(declare-fun c!123358 () Bool)

(assert (=> b!1266060 (= c!123358 (and (is-Cons!28322 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26)) (not (= (_1!10604 (h!29531 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26))) key1!31))))))

(declare-fun b!1266061 () Bool)

(declare-fun e!721058 () Bool)

(declare-fun lt!574089 () List!28326)

(assert (=> b!1266061 (= e!721058 (not (containsKey!660 lt!574089 key1!31)))))

(declare-fun b!1266062 () Bool)

(assert (=> b!1266062 (= e!721057 Nil!28323)))

(declare-fun d!139039 () Bool)

(assert (=> d!139039 e!721058))

(declare-fun res!842962 () Bool)

(assert (=> d!139039 (=> (not res!842962) (not e!721058))))

(assert (=> d!139039 (= res!842962 (isStrictlySorted!801 lt!574089))))

(assert (=> d!139039 (= lt!574089 e!721056)))

(declare-fun c!123357 () Bool)

(assert (=> d!139039 (= c!123357 (and (is-Cons!28322 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26)) (= (_1!10604 (h!29531 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!139039 (isStrictlySorted!801 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26))))

(assert (=> d!139039 (= (removeStrictlySorted!157 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26) key1!31) lt!574089)))

(declare-fun b!1266063 () Bool)

(declare-fun $colon$colon!643 (List!28326 tuple2!21186) List!28326)

(assert (=> b!1266063 (= e!721057 ($colon$colon!643 (removeStrictlySorted!157 (t!41847 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26)) key1!31) (h!29531 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26))))))

(declare-fun b!1266064 () Bool)

(assert (=> b!1266064 (= e!721056 (t!41847 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26)))))

(assert (= (and d!139039 c!123357) b!1266064))

(assert (= (and d!139039 (not c!123357)) b!1266060))

(assert (= (and b!1266060 c!123358) b!1266063))

(assert (= (and b!1266060 (not c!123358)) b!1266062))

(assert (= (and d!139039 res!842962) b!1266061))

(declare-fun m!1165881 () Bool)

(assert (=> b!1266061 m!1165881))

(declare-fun m!1165883 () Bool)

(assert (=> d!139039 m!1165883))

(assert (=> d!139039 m!1165839))

(declare-fun m!1165885 () Bool)

(assert (=> d!139039 m!1165885))

(declare-fun m!1165887 () Bool)

(assert (=> b!1266063 m!1165887))

(assert (=> b!1266063 m!1165887))

(declare-fun m!1165889 () Bool)

(assert (=> b!1266063 m!1165889))

(assert (=> b!1265997 d!139039))

(declare-fun bm!62447 () Bool)

(declare-fun call!62452 () List!28326)

(declare-fun call!62451 () List!28326)

(assert (=> bm!62447 (= call!62452 call!62451)))

(declare-fun b!1266174 () Bool)

(declare-fun e!721118 () List!28326)

(assert (=> b!1266174 (= e!721118 call!62452)))

(declare-fun e!721117 () List!28326)

(declare-fun call!62450 () List!28326)

(declare-fun c!123402 () Bool)

(declare-fun bm!62448 () Bool)

(assert (=> bm!62448 (= call!62450 ($colon$colon!643 e!721117 (ite c!123402 (h!29531 l!706) (tuple2!21187 key1!31 v1!26))))))

(declare-fun c!123401 () Bool)

(assert (=> bm!62448 (= c!123401 c!123402)))

(declare-fun b!1266175 () Bool)

(declare-fun c!123399 () Bool)

(assert (=> b!1266175 (= c!123399 (and (is-Cons!28322 l!706) (bvsgt (_1!10604 (h!29531 l!706)) key1!31)))))

(declare-fun e!721121 () List!28326)

(assert (=> b!1266175 (= e!721121 e!721118)))

(declare-fun c!123400 () Bool)

(declare-fun b!1266176 () Bool)

(assert (=> b!1266176 (= e!721117 (ite c!123400 (t!41847 l!706) (ite c!123399 (Cons!28322 (h!29531 l!706) (t!41847 l!706)) Nil!28323)))))

(declare-fun b!1266177 () Bool)

(assert (=> b!1266177 (= e!721121 call!62451)))

(declare-fun b!1266178 () Bool)

(assert (=> b!1266178 (= e!721118 call!62452)))

(declare-fun d!139047 () Bool)

(declare-fun e!721120 () Bool)

(assert (=> d!139047 e!721120))

(declare-fun res!842987 () Bool)

(assert (=> d!139047 (=> (not res!842987) (not e!721120))))

(declare-fun lt!574104 () List!28326)

(assert (=> d!139047 (= res!842987 (isStrictlySorted!801 lt!574104))))

(declare-fun e!721119 () List!28326)

(assert (=> d!139047 (= lt!574104 e!721119)))

(assert (=> d!139047 (= c!123402 (and (is-Cons!28322 l!706) (bvslt (_1!10604 (h!29531 l!706)) key1!31)))))

(assert (=> d!139047 (isStrictlySorted!801 l!706)))

(assert (=> d!139047 (= (insertStrictlySorted!467 l!706 key1!31 v1!26) lt!574104)))

(declare-fun bm!62449 () Bool)

(assert (=> bm!62449 (= call!62451 call!62450)))

(declare-fun b!1266179 () Bool)

(declare-fun contains!7642 (List!28326 tuple2!21186) Bool)

(assert (=> b!1266179 (= e!721120 (contains!7642 lt!574104 (tuple2!21187 key1!31 v1!26)))))

(declare-fun b!1266180 () Bool)

(assert (=> b!1266180 (= e!721119 call!62450)))

(declare-fun b!1266181 () Bool)

(assert (=> b!1266181 (= e!721119 e!721121)))

(assert (=> b!1266181 (= c!123400 (and (is-Cons!28322 l!706) (= (_1!10604 (h!29531 l!706)) key1!31)))))

(declare-fun b!1266182 () Bool)

(declare-fun res!842988 () Bool)

(assert (=> b!1266182 (=> (not res!842988) (not e!721120))))

(assert (=> b!1266182 (= res!842988 (containsKey!660 lt!574104 key1!31))))

(declare-fun b!1266183 () Bool)

(assert (=> b!1266183 (= e!721117 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26))))

(assert (= (and d!139047 c!123402) b!1266180))

(assert (= (and d!139047 (not c!123402)) b!1266181))

(assert (= (and b!1266181 c!123400) b!1266177))

(assert (= (and b!1266181 (not c!123400)) b!1266175))

(assert (= (and b!1266175 c!123399) b!1266174))

(assert (= (and b!1266175 (not c!123399)) b!1266178))

(assert (= (or b!1266174 b!1266178) bm!62447))

(assert (= (or b!1266177 bm!62447) bm!62449))

(assert (= (or b!1266180 bm!62449) bm!62448))

(assert (= (and bm!62448 c!123401) b!1266183))

(assert (= (and bm!62448 (not c!123401)) b!1266176))

(assert (= (and d!139047 res!842987) b!1266182))

(assert (= (and b!1266182 res!842988) b!1266179))

(declare-fun m!1165939 () Bool)

(assert (=> d!139047 m!1165939))

(assert (=> d!139047 m!1165853))

(assert (=> b!1266183 m!1165839))

(declare-fun m!1165941 () Bool)

(assert (=> b!1266179 m!1165941))

(declare-fun m!1165943 () Bool)

(assert (=> b!1266182 m!1165943))

(declare-fun m!1165945 () Bool)

(assert (=> bm!62448 m!1165945))

(assert (=> b!1265997 d!139047))

(declare-fun b!1266184 () Bool)

(declare-fun e!721122 () List!28326)

(declare-fun e!721123 () List!28326)

(assert (=> b!1266184 (= e!721122 e!721123)))

(declare-fun c!123404 () Bool)

(assert (=> b!1266184 (= c!123404 (and (is-Cons!28322 (insertStrictlySorted!467 l!706 key1!31 v1!26)) (not (= (_1!10604 (h!29531 (insertStrictlySorted!467 l!706 key1!31 v1!26))) key1!31))))))

(declare-fun b!1266185 () Bool)

(declare-fun e!721124 () Bool)

(declare-fun lt!574105 () List!28326)

(assert (=> b!1266185 (= e!721124 (not (containsKey!660 lt!574105 key1!31)))))

(declare-fun b!1266186 () Bool)

(assert (=> b!1266186 (= e!721123 Nil!28323)))

(declare-fun d!139063 () Bool)

(assert (=> d!139063 e!721124))

(declare-fun res!842989 () Bool)

(assert (=> d!139063 (=> (not res!842989) (not e!721124))))

(assert (=> d!139063 (= res!842989 (isStrictlySorted!801 lt!574105))))

(assert (=> d!139063 (= lt!574105 e!721122)))

(declare-fun c!123403 () Bool)

(assert (=> d!139063 (= c!123403 (and (is-Cons!28322 (insertStrictlySorted!467 l!706 key1!31 v1!26)) (= (_1!10604 (h!29531 (insertStrictlySorted!467 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!139063 (isStrictlySorted!801 (insertStrictlySorted!467 l!706 key1!31 v1!26))))

(assert (=> d!139063 (= (removeStrictlySorted!157 (insertStrictlySorted!467 l!706 key1!31 v1!26) key1!31) lt!574105)))

(declare-fun b!1266187 () Bool)

(assert (=> b!1266187 (= e!721123 ($colon$colon!643 (removeStrictlySorted!157 (t!41847 (insertStrictlySorted!467 l!706 key1!31 v1!26)) key1!31) (h!29531 (insertStrictlySorted!467 l!706 key1!31 v1!26))))))

(declare-fun b!1266188 () Bool)

(assert (=> b!1266188 (= e!721122 (t!41847 (insertStrictlySorted!467 l!706 key1!31 v1!26)))))

(assert (= (and d!139063 c!123403) b!1266188))

(assert (= (and d!139063 (not c!123403)) b!1266184))

(assert (= (and b!1266184 c!123404) b!1266187))

(assert (= (and b!1266184 (not c!123404)) b!1266186))

(assert (= (and d!139063 res!842989) b!1266185))

(declare-fun m!1165947 () Bool)

(assert (=> b!1266185 m!1165947))

(declare-fun m!1165949 () Bool)

(assert (=> d!139063 m!1165949))

(assert (=> d!139063 m!1165845))

(declare-fun m!1165951 () Bool)

(assert (=> d!139063 m!1165951))

(declare-fun m!1165953 () Bool)

(assert (=> b!1266187 m!1165953))

(assert (=> b!1266187 m!1165953))

(declare-fun m!1165955 () Bool)

(assert (=> b!1266187 m!1165955))

(assert (=> b!1265997 d!139063))

(declare-fun d!139065 () Bool)

(assert (=> d!139065 (= (removeStrictlySorted!157 (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26) key1!31) (t!41847 l!706))))

(declare-fun lt!574112 () Unit!42187)

(declare-fun choose!1888 (List!28326 (_ BitVec 64) B!1998) Unit!42187)

(assert (=> d!139065 (= lt!574112 (choose!1888 (t!41847 l!706) key1!31 v1!26))))

(assert (=> d!139065 (isStrictlySorted!801 (t!41847 l!706))))

(assert (=> d!139065 (= (lemmaInsertStrictlySortedThenRemoveIsSame!12 (t!41847 l!706) key1!31 v1!26) lt!574112)))

(declare-fun bs!35836 () Bool)

(assert (= bs!35836 d!139065))

(assert (=> bs!35836 m!1165839))

(assert (=> bs!35836 m!1165839))

(assert (=> bs!35836 m!1165843))

(declare-fun m!1165969 () Bool)

(assert (=> bs!35836 m!1165969))

(assert (=> bs!35836 m!1165855))

(assert (=> b!1265997 d!139065))

(declare-fun bm!62453 () Bool)

(declare-fun call!62458 () List!28326)

(declare-fun call!62457 () List!28326)

(assert (=> bm!62453 (= call!62458 call!62457)))

(declare-fun b!1266203 () Bool)

(declare-fun e!721135 () List!28326)

(assert (=> b!1266203 (= e!721135 call!62458)))

(declare-fun call!62456 () List!28326)

(declare-fun e!721134 () List!28326)

(declare-fun bm!62454 () Bool)

(declare-fun c!123412 () Bool)

(assert (=> bm!62454 (= call!62456 ($colon$colon!643 e!721134 (ite c!123412 (h!29531 (t!41847 l!706)) (tuple2!21187 key1!31 v1!26))))))

(declare-fun c!123411 () Bool)

(assert (=> bm!62454 (= c!123411 c!123412)))

(declare-fun b!1266204 () Bool)

(declare-fun c!123409 () Bool)

(assert (=> b!1266204 (= c!123409 (and (is-Cons!28322 (t!41847 l!706)) (bvsgt (_1!10604 (h!29531 (t!41847 l!706))) key1!31)))))

(declare-fun e!721138 () List!28326)

(assert (=> b!1266204 (= e!721138 e!721135)))

(declare-fun c!123410 () Bool)

(declare-fun b!1266205 () Bool)

(assert (=> b!1266205 (= e!721134 (ite c!123410 (t!41847 (t!41847 l!706)) (ite c!123409 (Cons!28322 (h!29531 (t!41847 l!706)) (t!41847 (t!41847 l!706))) Nil!28323)))))

(declare-fun b!1266206 () Bool)

(assert (=> b!1266206 (= e!721138 call!62457)))

(declare-fun b!1266207 () Bool)

(assert (=> b!1266207 (= e!721135 call!62458)))

(declare-fun d!139071 () Bool)

(declare-fun e!721137 () Bool)

(assert (=> d!139071 e!721137))

(declare-fun res!842996 () Bool)

(assert (=> d!139071 (=> (not res!842996) (not e!721137))))

(declare-fun lt!574113 () List!28326)

(assert (=> d!139071 (= res!842996 (isStrictlySorted!801 lt!574113))))

(declare-fun e!721136 () List!28326)

(assert (=> d!139071 (= lt!574113 e!721136)))

(assert (=> d!139071 (= c!123412 (and (is-Cons!28322 (t!41847 l!706)) (bvslt (_1!10604 (h!29531 (t!41847 l!706))) key1!31)))))

(assert (=> d!139071 (isStrictlySorted!801 (t!41847 l!706))))

(assert (=> d!139071 (= (insertStrictlySorted!467 (t!41847 l!706) key1!31 v1!26) lt!574113)))

(declare-fun bm!62455 () Bool)

(assert (=> bm!62455 (= call!62457 call!62456)))

(declare-fun b!1266208 () Bool)

(assert (=> b!1266208 (= e!721137 (contains!7642 lt!574113 (tuple2!21187 key1!31 v1!26)))))

(declare-fun b!1266209 () Bool)

(assert (=> b!1266209 (= e!721136 call!62456)))

(declare-fun b!1266210 () Bool)

(assert (=> b!1266210 (= e!721136 e!721138)))

(assert (=> b!1266210 (= c!123410 (and (is-Cons!28322 (t!41847 l!706)) (= (_1!10604 (h!29531 (t!41847 l!706))) key1!31)))))

(declare-fun b!1266211 () Bool)

(declare-fun res!842997 () Bool)

(assert (=> b!1266211 (=> (not res!842997) (not e!721137))))

(assert (=> b!1266211 (= res!842997 (containsKey!660 lt!574113 key1!31))))

(declare-fun b!1266212 () Bool)

(assert (=> b!1266212 (= e!721134 (insertStrictlySorted!467 (t!41847 (t!41847 l!706)) key1!31 v1!26))))

(assert (= (and d!139071 c!123412) b!1266209))

(assert (= (and d!139071 (not c!123412)) b!1266210))

(assert (= (and b!1266210 c!123410) b!1266206))

(assert (= (and b!1266210 (not c!123410)) b!1266204))

(assert (= (and b!1266204 c!123409) b!1266203))

(assert (= (and b!1266204 (not c!123409)) b!1266207))

(assert (= (or b!1266203 b!1266207) bm!62453))

(assert (= (or b!1266206 bm!62453) bm!62455))

(assert (= (or b!1266209 bm!62455) bm!62454))

(assert (= (and bm!62454 c!123411) b!1266212))

(assert (= (and bm!62454 (not c!123411)) b!1266205))

(assert (= (and d!139071 res!842996) b!1266211))

(assert (= (and b!1266211 res!842997) b!1266208))

(declare-fun m!1165971 () Bool)

(assert (=> d!139071 m!1165971))

(assert (=> d!139071 m!1165855))

(declare-fun m!1165973 () Bool)

(assert (=> b!1266212 m!1165973))

(declare-fun m!1165975 () Bool)

(assert (=> b!1266208 m!1165975))

(declare-fun m!1165977 () Bool)

(assert (=> b!1266211 m!1165977))

(declare-fun m!1165979 () Bool)

(assert (=> bm!62454 m!1165979))

(assert (=> b!1265997 d!139071))

(declare-fun d!139073 () Bool)

(declare-fun res!843010 () Bool)

(declare-fun e!721152 () Bool)

(assert (=> d!139073 (=> res!843010 e!721152)))

(assert (=> d!139073 (= res!843010 (and (is-Cons!28322 l!706) (= (_1!10604 (h!29531 l!706)) key1!31)))))

(assert (=> d!139073 (= (containsKey!660 l!706 key1!31) e!721152)))

(declare-fun b!1266225 () Bool)

(declare-fun e!721153 () Bool)

(assert (=> b!1266225 (= e!721152 e!721153)))

(declare-fun res!843012 () Bool)

(assert (=> b!1266225 (=> (not res!843012) (not e!721153))))

(assert (=> b!1266225 (= res!843012 (and (or (not (is-Cons!28322 l!706)) (bvsle (_1!10604 (h!29531 l!706)) key1!31)) (is-Cons!28322 l!706) (bvslt (_1!10604 (h!29531 l!706)) key1!31)))))

(declare-fun b!1266227 () Bool)

(assert (=> b!1266227 (= e!721153 (containsKey!660 (t!41847 l!706) key1!31))))

(assert (= (and d!139073 (not res!843010)) b!1266225))

(assert (= (and b!1266225 res!843012) b!1266227))

(assert (=> b!1266227 m!1165849))

(assert (=> b!1265998 d!139073))

(declare-fun d!139081 () Bool)

(declare-fun res!843016 () Bool)

(declare-fun e!721157 () Bool)

(assert (=> d!139081 (=> res!843016 e!721157)))

(assert (=> d!139081 (= res!843016 (and (is-Cons!28322 (t!41847 l!706)) (= (_1!10604 (h!29531 (t!41847 l!706))) key1!31)))))

(assert (=> d!139081 (= (containsKey!660 (t!41847 l!706) key1!31) e!721157)))

(declare-fun b!1266231 () Bool)

(declare-fun e!721158 () Bool)

(assert (=> b!1266231 (= e!721157 e!721158)))

(declare-fun res!843017 () Bool)

(assert (=> b!1266231 (=> (not res!843017) (not e!721158))))

(assert (=> b!1266231 (= res!843017 (and (or (not (is-Cons!28322 (t!41847 l!706))) (bvsle (_1!10604 (h!29531 (t!41847 l!706))) key1!31)) (is-Cons!28322 (t!41847 l!706)) (bvslt (_1!10604 (h!29531 (t!41847 l!706))) key1!31)))))

(declare-fun b!1266232 () Bool)

(assert (=> b!1266232 (= e!721158 (containsKey!660 (t!41847 (t!41847 l!706)) key1!31))))

(assert (= (and d!139081 (not res!843016)) b!1266231))

(assert (= (and b!1266231 res!843017) b!1266232))

(declare-fun m!1165985 () Bool)

(assert (=> b!1266232 m!1165985))

(assert (=> b!1265999 d!139081))

(declare-fun d!139083 () Bool)

(declare-fun res!843018 () Bool)

(declare-fun e!721159 () Bool)

(assert (=> d!139083 (=> res!843018 e!721159)))

(assert (=> d!139083 (= res!843018 (or (is-Nil!28323 (t!41847 l!706)) (is-Nil!28323 (t!41847 (t!41847 l!706)))))))

(assert (=> d!139083 (= (isStrictlySorted!801 (t!41847 l!706)) e!721159)))

(declare-fun b!1266235 () Bool)

(declare-fun e!721160 () Bool)

(assert (=> b!1266235 (= e!721159 e!721160)))

(declare-fun res!843019 () Bool)

(assert (=> b!1266235 (=> (not res!843019) (not e!721160))))

(assert (=> b!1266235 (= res!843019 (bvslt (_1!10604 (h!29531 (t!41847 l!706))) (_1!10604 (h!29531 (t!41847 (t!41847 l!706))))))))

(declare-fun b!1266236 () Bool)

(assert (=> b!1266236 (= e!721160 (isStrictlySorted!801 (t!41847 (t!41847 l!706))))))

(assert (= (and d!139083 (not res!843018)) b!1266235))

(assert (= (and b!1266235 res!843019) b!1266236))

(declare-fun m!1165987 () Bool)

(assert (=> b!1266236 m!1165987))

(assert (=> b!1266000 d!139083))

(declare-fun b!1266244 () Bool)

(declare-fun e!721166 () Bool)

(declare-fun tp!96425 () Bool)

(assert (=> b!1266244 (= e!721166 (and tp_is_empty!32531 tp!96425))))

(assert (=> b!1265996 (= tp!96416 e!721166)))

(assert (= (and b!1265996 (is-Cons!28322 (t!41847 l!706))) b!1266244))

(push 1)

(assert (not b!1266236))

(assert (not d!139039))

(assert (not bm!62454))

(assert (not b!1266185))

(assert (not b!1266244))

(assert (not b!1266061))

(assert (not b!1266227))

(assert (not d!139047))

(assert (not b!1266017))

(assert (not b!1266182))

(assert (not b!1266212))

(assert (not b!1266187))

(assert (not b!1266232))

(assert tp_is_empty!32531)

(assert (not d!139071))

(assert (not b!1266179))

(assert (not b!1266183))

(assert (not b!1266063))

(assert (not b!1266208))

(assert (not d!139065))

(assert (not b!1266211))

(assert (not bm!62448))

(assert (not d!139063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139173 () Bool)

(declare-fun res!843092 () Bool)

(declare-fun e!721255 () Bool)

(assert (=> d!139173 (=> res!843092 e!721255)))

(assert (=> d!139173 (= res!843092 (and (is-Cons!28322 lt!574089) (= (_1!10604 (h!29531 lt!574089)) key1!31)))))

(assert (=> d!139173 (= (containsKey!660 lt!574089 key1!31) e!721255)))

(declare-fun b!1266351 () Bool)

(declare-fun e!721256 () Bool)

(assert (=> b!1266351 (= e!721255 e!721256)))

(declare-fun res!843093 () Bool)

(assert (=> b!1266351 (=> (not res!843093) (not e!721256))))

(assert (=> b!1266351 (= res!843093 (and (or (not (is-Cons!28322 lt!574089)) (bvsle (_1!10604 (h!29531 lt!574089)) key1!31)) (is-Cons!28322 lt!574089) (bvslt (_1!10604 (h!29531 lt!574089)) key1!31)))))

(declare-fun b!1266352 () Bool)

(assert (=> b!1266352 (= e!721256 (containsKey!660 (t!41847 lt!574089) key1!31))))

(assert (= (and d!139173 (not res!843092)) b!1266351))

(assert (= (and b!1266351 res!843093) b!1266352))

(declare-fun m!1166113 () Bool)

(assert (=> b!1266352 m!1166113))

(assert (=> b!1266061 d!139173))

(declare-fun lt!574130 () Bool)

(declare-fun d!139175 () Bool)

(declare-fun content!636 (List!28326) (Set tuple2!21186))

(assert (=> d!139175 (= lt!574130 (member (tuple2!21187 key1!31 v1!26) (content!636 lt!574113)))))

(declare-fun e!721261 () Bool)

(assert (=> d!139175 (= lt!574130 e!721261)))

(declare-fun res!843098 () Bool)

(assert (=> d!139175 (=> (not res!843098) (not e!721261))))

(assert (=> d!139175 (= res!843098 (is-Cons!28322 lt!574113))))

(assert (=> d!139175 (= (contains!7642 lt!574113 (tuple2!21187 key1!31 v1!26)) lt!574130)))

(declare-fun b!1266357 () Bool)

(declare-fun e!721262 () Bool)

(assert (=> b!1266357 (= e!721261 e!721262)))

(declare-fun res!843099 () Bool)

(assert (=> b!1266357 (=> res!843099 e!721262)))

(assert (=> b!1266357 (= res!843099 (= (h!29531 lt!574113) (tuple2!21187 key1!31 v1!26)))))

(declare-fun b!1266358 () Bool)

(assert (=> b!1266358 (= e!721262 (contains!7642 (t!41847 lt!574113) (tuple2!21187 key1!31 v1!26)))))

(assert (= (and d!139175 res!843098) b!1266357))

(assert (= (and b!1266357 (not res!843099)) b!1266358))

(declare-fun m!1166115 () Bool)

(assert (=> d!139175 m!1166115))

(declare-fun m!1166117 () Bool)

(assert (=> d!139175 m!1166117))

(declare-fun m!1166119 () Bool)

(assert (=> b!1266358 m!1166119))

(assert (=> b!1266208 d!139175))

(assert (=> b!1266017 d!139083))

