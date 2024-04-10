; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75204 () Bool)

(assert start!75204)

(declare-fun b!886018 () Bool)

(declare-fun res!601604 () Bool)

(declare-fun e!493160 () Bool)

(assert (=> b!886018 (=> (not res!601604) (not e!493160))))

(declare-datatypes ((B!1300 0))(
  ( (B!1301 (val!8956 Int)) )
))
(declare-datatypes ((tuple2!11906 0))(
  ( (tuple2!11907 (_1!5964 (_ BitVec 64)) (_2!5964 B!1300)) )
))
(declare-datatypes ((List!17672 0))(
  ( (Nil!17669) (Cons!17668 (h!18799 tuple2!11906) (t!24949 List!17672)) )
))
(declare-fun l!906 () List!17672)

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!886018 (= res!601604 (and ((_ is Cons!17668) l!906) (bvslt (_1!5964 (h!18799 l!906)) key1!49)))))

(declare-fun res!601606 () Bool)

(assert (=> start!75204 (=> (not res!601606) (not e!493160))))

(declare-fun isStrictlySorted!490 (List!17672) Bool)

(assert (=> start!75204 (= res!601606 (isStrictlySorted!490 l!906))))

(assert (=> start!75204 e!493160))

(declare-fun e!493161 () Bool)

(assert (=> start!75204 e!493161))

(assert (=> start!75204 true))

(declare-fun tp_is_empty!17811 () Bool)

(assert (=> start!75204 tp_is_empty!17811))

(declare-fun b!886021 () Bool)

(declare-fun tp!54368 () Bool)

(assert (=> b!886021 (= e!493161 (and tp_is_empty!17811 tp!54368))))

(declare-fun b!886019 () Bool)

(declare-fun res!601605 () Bool)

(assert (=> b!886019 (=> (not res!601605) (not e!493160))))

(assert (=> b!886019 (= res!601605 (isStrictlySorted!490 (t!24949 l!906)))))

(declare-fun v2!16 () B!1300)

(declare-fun b!886020 () Bool)

(declare-fun v1!38 () B!1300)

(declare-fun insertStrictlySorted!298 (List!17672 (_ BitVec 64) B!1300) List!17672)

(assert (=> b!886020 (= e!493160 (not (= (insertStrictlySorted!298 (insertStrictlySorted!298 l!906 key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 l!906 key1!49 v2!16))))))

(assert (=> b!886020 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 (t!24949 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30242 0))(
  ( (Unit!30243) )
))
(declare-fun lt!401071 () Unit!30242)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!14 (List!17672 (_ BitVec 64) B!1300 B!1300) Unit!30242)

(assert (=> b!886020 (= lt!401071 (lemmaInsertStrictlySortedErasesIfSameKey!14 (t!24949 l!906) key1!49 v1!38 v2!16))))

(assert (= (and start!75204 res!601606) b!886018))

(assert (= (and b!886018 res!601604) b!886019))

(assert (= (and b!886019 res!601605) b!886020))

(assert (= (and start!75204 ((_ is Cons!17668) l!906)) b!886021))

(declare-fun m!825937 () Bool)

(assert (=> start!75204 m!825937))

(declare-fun m!825939 () Bool)

(assert (=> b!886019 m!825939))

(declare-fun m!825941 () Bool)

(assert (=> b!886020 m!825941))

(declare-fun m!825943 () Bool)

(assert (=> b!886020 m!825943))

(declare-fun m!825945 () Bool)

(assert (=> b!886020 m!825945))

(declare-fun m!825947 () Bool)

(assert (=> b!886020 m!825947))

(declare-fun m!825949 () Bool)

(assert (=> b!886020 m!825949))

(assert (=> b!886020 m!825947))

(declare-fun m!825951 () Bool)

(assert (=> b!886020 m!825951))

(assert (=> b!886020 m!825941))

(declare-fun m!825953 () Bool)

(assert (=> b!886020 m!825953))

(check-sat (not start!75204) (not b!886019) (not b!886021) (not b!886020) tp_is_empty!17811)
(check-sat)
(get-model)

(declare-fun d!109497 () Bool)

(assert (=> d!109497 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 (t!24949 l!906) key1!49 v2!16))))

(declare-fun lt!401077 () Unit!30242)

(declare-fun choose!1451 (List!17672 (_ BitVec 64) B!1300 B!1300) Unit!30242)

(assert (=> d!109497 (= lt!401077 (choose!1451 (t!24949 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109497 (isStrictlySorted!490 (t!24949 l!906))))

(assert (=> d!109497 (= (lemmaInsertStrictlySortedErasesIfSameKey!14 (t!24949 l!906) key1!49 v1!38 v2!16) lt!401077)))

(declare-fun bs!24849 () Bool)

(assert (= bs!24849 d!109497))

(declare-fun m!825973 () Bool)

(assert (=> bs!24849 m!825973))

(assert (=> bs!24849 m!825941))

(assert (=> bs!24849 m!825943))

(assert (=> bs!24849 m!825941))

(assert (=> bs!24849 m!825939))

(assert (=> bs!24849 m!825951))

(assert (=> b!886020 d!109497))

(declare-fun b!886100 () Bool)

(declare-fun res!601643 () Bool)

(declare-fun e!493211 () Bool)

(assert (=> b!886100 (=> (not res!601643) (not e!493211))))

(declare-fun lt!401089 () List!17672)

(declare-fun containsKey!411 (List!17672 (_ BitVec 64)) Bool)

(assert (=> b!886100 (= res!601643 (containsKey!411 lt!401089 key1!49))))

(declare-fun b!886101 () Bool)

(declare-fun e!493212 () List!17672)

(declare-fun call!39165 () List!17672)

(assert (=> b!886101 (= e!493212 call!39165)))

(declare-fun b!886102 () Bool)

(declare-fun contains!4296 (List!17672 tuple2!11906) Bool)

(assert (=> b!886102 (= e!493211 (contains!4296 lt!401089 (tuple2!11907 key1!49 v2!16)))))

(declare-fun e!493213 () List!17672)

(declare-fun b!886103 () Bool)

(assert (=> b!886103 (= e!493213 (insertStrictlySorted!298 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun bm!39161 () Bool)

(declare-fun call!39164 () List!17672)

(assert (=> bm!39161 (= call!39164 call!39165)))

(declare-fun d!109501 () Bool)

(assert (=> d!109501 e!493211))

(declare-fun res!601642 () Bool)

(assert (=> d!109501 (=> (not res!601642) (not e!493211))))

(assert (=> d!109501 (= res!601642 (isStrictlySorted!490 lt!401089))))

(assert (=> d!109501 (= lt!401089 e!493212)))

(declare-fun c!93396 () Bool)

(assert (=> d!109501 (= c!93396 (and ((_ is Cons!17668) (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) (bvslt (_1!5964 (h!18799 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109501 (isStrictlySorted!490 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))))

(assert (=> d!109501 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38) key1!49 v2!16) lt!401089)))

(declare-fun b!886104 () Bool)

(declare-fun e!493209 () List!17672)

(assert (=> b!886104 (= e!493212 e!493209)))

(declare-fun c!93395 () Bool)

(assert (=> b!886104 (= c!93395 (and ((_ is Cons!17668) (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) (= (_1!5964 (h!18799 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun bm!39162 () Bool)

(declare-fun $colon$colon!546 (List!17672 tuple2!11906) List!17672)

(assert (=> bm!39162 (= call!39165 ($colon$colon!546 e!493213 (ite c!93396 (h!18799 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) (tuple2!11907 key1!49 v2!16))))))

(declare-fun c!93398 () Bool)

(assert (=> bm!39162 (= c!93398 c!93396)))

(declare-fun b!886105 () Bool)

(declare-fun e!493210 () List!17672)

(declare-fun call!39166 () List!17672)

(assert (=> b!886105 (= e!493210 call!39166)))

(declare-fun b!886106 () Bool)

(assert (=> b!886106 (= e!493209 call!39164)))

(declare-fun b!886107 () Bool)

(declare-fun c!93397 () Bool)

(assert (=> b!886107 (= e!493213 (ite c!93395 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) (ite c!93397 (Cons!17668 (h!18799 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) Nil!17669)))))

(declare-fun b!886108 () Bool)

(assert (=> b!886108 (= e!493210 call!39166)))

(declare-fun b!886109 () Bool)

(assert (=> b!886109 (= c!93397 (and ((_ is Cons!17668) (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) (bvsgt (_1!5964 (h!18799 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> b!886109 (= e!493209 e!493210)))

(declare-fun bm!39163 () Bool)

(assert (=> bm!39163 (= call!39166 call!39164)))

(assert (= (and d!109501 c!93396) b!886101))

(assert (= (and d!109501 (not c!93396)) b!886104))

(assert (= (and b!886104 c!93395) b!886106))

(assert (= (and b!886104 (not c!93395)) b!886109))

(assert (= (and b!886109 c!93397) b!886105))

(assert (= (and b!886109 (not c!93397)) b!886108))

(assert (= (or b!886105 b!886108) bm!39163))

(assert (= (or b!886106 bm!39163) bm!39161))

(assert (= (or b!886101 bm!39161) bm!39162))

(assert (= (and bm!39162 c!93398) b!886103))

(assert (= (and bm!39162 (not c!93398)) b!886107))

(assert (= (and d!109501 res!601642) b!886100))

(assert (= (and b!886100 res!601643) b!886102))

(declare-fun m!825995 () Bool)

(assert (=> d!109501 m!825995))

(assert (=> d!109501 m!825941))

(declare-fun m!825997 () Bool)

(assert (=> d!109501 m!825997))

(declare-fun m!825999 () Bool)

(assert (=> b!886100 m!825999))

(declare-fun m!826001 () Bool)

(assert (=> b!886103 m!826001))

(declare-fun m!826003 () Bool)

(assert (=> b!886102 m!826003))

(declare-fun m!826005 () Bool)

(assert (=> bm!39162 m!826005))

(assert (=> b!886020 d!109501))

(declare-fun b!886120 () Bool)

(declare-fun res!601647 () Bool)

(declare-fun e!493221 () Bool)

(assert (=> b!886120 (=> (not res!601647) (not e!493221))))

(declare-fun lt!401091 () List!17672)

(assert (=> b!886120 (= res!601647 (containsKey!411 lt!401091 key1!49))))

(declare-fun b!886121 () Bool)

(declare-fun e!493222 () List!17672)

(declare-fun call!39171 () List!17672)

(assert (=> b!886121 (= e!493222 call!39171)))

(declare-fun b!886122 () Bool)

(assert (=> b!886122 (= e!493221 (contains!4296 lt!401091 (tuple2!11907 key1!49 v2!16)))))

(declare-fun e!493223 () List!17672)

(declare-fun b!886123 () Bool)

(assert (=> b!886123 (= e!493223 (insertStrictlySorted!298 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38)) key1!49 v2!16))))

(declare-fun bm!39167 () Bool)

(declare-fun call!39170 () List!17672)

(assert (=> bm!39167 (= call!39170 call!39171)))

(declare-fun d!109519 () Bool)

(assert (=> d!109519 e!493221))

(declare-fun res!601646 () Bool)

(assert (=> d!109519 (=> (not res!601646) (not e!493221))))

(assert (=> d!109519 (= res!601646 (isStrictlySorted!490 lt!401091))))

(assert (=> d!109519 (= lt!401091 e!493222)))

(declare-fun c!93404 () Bool)

(assert (=> d!109519 (= c!93404 (and ((_ is Cons!17668) (insertStrictlySorted!298 l!906 key1!49 v1!38)) (bvslt (_1!5964 (h!18799 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> d!109519 (isStrictlySorted!490 (insertStrictlySorted!298 l!906 key1!49 v1!38))))

(assert (=> d!109519 (= (insertStrictlySorted!298 (insertStrictlySorted!298 l!906 key1!49 v1!38) key1!49 v2!16) lt!401091)))

(declare-fun b!886124 () Bool)

(declare-fun e!493219 () List!17672)

(assert (=> b!886124 (= e!493222 e!493219)))

(declare-fun c!93403 () Bool)

(assert (=> b!886124 (= c!93403 (and ((_ is Cons!17668) (insertStrictlySorted!298 l!906 key1!49 v1!38)) (= (_1!5964 (h!18799 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49)))))

(declare-fun bm!39168 () Bool)

(assert (=> bm!39168 (= call!39171 ($colon$colon!546 e!493223 (ite c!93404 (h!18799 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (tuple2!11907 key1!49 v2!16))))))

(declare-fun c!93406 () Bool)

(assert (=> bm!39168 (= c!93406 c!93404)))

(declare-fun b!886125 () Bool)

(declare-fun e!493220 () List!17672)

(declare-fun call!39172 () List!17672)

(assert (=> b!886125 (= e!493220 call!39172)))

(declare-fun b!886126 () Bool)

(assert (=> b!886126 (= e!493219 call!39170)))

(declare-fun b!886127 () Bool)

(declare-fun c!93405 () Bool)

(assert (=> b!886127 (= e!493223 (ite c!93403 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (ite c!93405 (Cons!17668 (h!18799 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))) Nil!17669)))))

(declare-fun b!886128 () Bool)

(assert (=> b!886128 (= e!493220 call!39172)))

(declare-fun b!886129 () Bool)

(assert (=> b!886129 (= c!93405 (and ((_ is Cons!17668) (insertStrictlySorted!298 l!906 key1!49 v1!38)) (bvsgt (_1!5964 (h!18799 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49)))))

(assert (=> b!886129 (= e!493219 e!493220)))

(declare-fun bm!39169 () Bool)

(assert (=> bm!39169 (= call!39172 call!39170)))

(assert (= (and d!109519 c!93404) b!886121))

(assert (= (and d!109519 (not c!93404)) b!886124))

(assert (= (and b!886124 c!93403) b!886126))

(assert (= (and b!886124 (not c!93403)) b!886129))

(assert (= (and b!886129 c!93405) b!886125))

(assert (= (and b!886129 (not c!93405)) b!886128))

(assert (= (or b!886125 b!886128) bm!39169))

(assert (= (or b!886126 bm!39169) bm!39167))

(assert (= (or b!886121 bm!39167) bm!39168))

(assert (= (and bm!39168 c!93406) b!886123))

(assert (= (and bm!39168 (not c!93406)) b!886127))

(assert (= (and d!109519 res!601646) b!886120))

(assert (= (and b!886120 res!601647) b!886122))

(declare-fun m!826021 () Bool)

(assert (=> d!109519 m!826021))

(assert (=> d!109519 m!825947))

(declare-fun m!826025 () Bool)

(assert (=> d!109519 m!826025))

(declare-fun m!826029 () Bool)

(assert (=> b!886120 m!826029))

(declare-fun m!826033 () Bool)

(assert (=> b!886123 m!826033))

(declare-fun m!826037 () Bool)

(assert (=> b!886122 m!826037))

(declare-fun m!826039 () Bool)

(assert (=> bm!39168 m!826039))

(assert (=> b!886020 d!109519))

(declare-fun b!886150 () Bool)

(declare-fun res!601653 () Bool)

(declare-fun e!493236 () Bool)

(assert (=> b!886150 (=> (not res!601653) (not e!493236))))

(declare-fun lt!401094 () List!17672)

(assert (=> b!886150 (= res!601653 (containsKey!411 lt!401094 key1!49))))

(declare-fun b!886151 () Bool)

(declare-fun e!493237 () List!17672)

(declare-fun call!39180 () List!17672)

(assert (=> b!886151 (= e!493237 call!39180)))

(declare-fun b!886152 () Bool)

(assert (=> b!886152 (= e!493236 (contains!4296 lt!401094 (tuple2!11907 key1!49 v2!16)))))

(declare-fun b!886153 () Bool)

(declare-fun e!493238 () List!17672)

(assert (=> b!886153 (= e!493238 (insertStrictlySorted!298 (t!24949 (t!24949 l!906)) key1!49 v2!16))))

(declare-fun bm!39176 () Bool)

(declare-fun call!39179 () List!17672)

(assert (=> bm!39176 (= call!39179 call!39180)))

(declare-fun d!109525 () Bool)

(assert (=> d!109525 e!493236))

(declare-fun res!601652 () Bool)

(assert (=> d!109525 (=> (not res!601652) (not e!493236))))

(assert (=> d!109525 (= res!601652 (isStrictlySorted!490 lt!401094))))

(assert (=> d!109525 (= lt!401094 e!493237)))

(declare-fun c!93416 () Bool)

(assert (=> d!109525 (= c!93416 (and ((_ is Cons!17668) (t!24949 l!906)) (bvslt (_1!5964 (h!18799 (t!24949 l!906))) key1!49)))))

(assert (=> d!109525 (isStrictlySorted!490 (t!24949 l!906))))

(assert (=> d!109525 (= (insertStrictlySorted!298 (t!24949 l!906) key1!49 v2!16) lt!401094)))

(declare-fun b!886154 () Bool)

(declare-fun e!493234 () List!17672)

(assert (=> b!886154 (= e!493237 e!493234)))

(declare-fun c!93415 () Bool)

(assert (=> b!886154 (= c!93415 (and ((_ is Cons!17668) (t!24949 l!906)) (= (_1!5964 (h!18799 (t!24949 l!906))) key1!49)))))

(declare-fun bm!39177 () Bool)

(assert (=> bm!39177 (= call!39180 ($colon$colon!546 e!493238 (ite c!93416 (h!18799 (t!24949 l!906)) (tuple2!11907 key1!49 v2!16))))))

(declare-fun c!93418 () Bool)

(assert (=> bm!39177 (= c!93418 c!93416)))

(declare-fun b!886155 () Bool)

(declare-fun e!493235 () List!17672)

(declare-fun call!39181 () List!17672)

(assert (=> b!886155 (= e!493235 call!39181)))

(declare-fun b!886156 () Bool)

(assert (=> b!886156 (= e!493234 call!39179)))

(declare-fun c!93417 () Bool)

(declare-fun b!886157 () Bool)

(assert (=> b!886157 (= e!493238 (ite c!93415 (t!24949 (t!24949 l!906)) (ite c!93417 (Cons!17668 (h!18799 (t!24949 l!906)) (t!24949 (t!24949 l!906))) Nil!17669)))))

(declare-fun b!886158 () Bool)

(assert (=> b!886158 (= e!493235 call!39181)))

(declare-fun b!886159 () Bool)

(assert (=> b!886159 (= c!93417 (and ((_ is Cons!17668) (t!24949 l!906)) (bvsgt (_1!5964 (h!18799 (t!24949 l!906))) key1!49)))))

(assert (=> b!886159 (= e!493234 e!493235)))

(declare-fun bm!39178 () Bool)

(assert (=> bm!39178 (= call!39181 call!39179)))

(assert (= (and d!109525 c!93416) b!886151))

(assert (= (and d!109525 (not c!93416)) b!886154))

(assert (= (and b!886154 c!93415) b!886156))

(assert (= (and b!886154 (not c!93415)) b!886159))

(assert (= (and b!886159 c!93417) b!886155))

(assert (= (and b!886159 (not c!93417)) b!886158))

(assert (= (or b!886155 b!886158) bm!39178))

(assert (= (or b!886156 bm!39178) bm!39176))

(assert (= (or b!886151 bm!39176) bm!39177))

(assert (= (and bm!39177 c!93418) b!886153))

(assert (= (and bm!39177 (not c!93418)) b!886157))

(assert (= (and d!109525 res!601652) b!886150))

(assert (= (and b!886150 res!601653) b!886152))

(declare-fun m!826049 () Bool)

(assert (=> d!109525 m!826049))

(assert (=> d!109525 m!825939))

(declare-fun m!826053 () Bool)

(assert (=> b!886150 m!826053))

(declare-fun m!826055 () Bool)

(assert (=> b!886153 m!826055))

(declare-fun m!826057 () Bool)

(assert (=> b!886152 m!826057))

(declare-fun m!826059 () Bool)

(assert (=> bm!39177 m!826059))

(assert (=> b!886020 d!109525))

(declare-fun b!886182 () Bool)

(declare-fun res!601657 () Bool)

(declare-fun e!493252 () Bool)

(assert (=> b!886182 (=> (not res!601657) (not e!493252))))

(declare-fun lt!401098 () List!17672)

(assert (=> b!886182 (= res!601657 (containsKey!411 lt!401098 key1!49))))

(declare-fun b!886183 () Bool)

(declare-fun e!493253 () List!17672)

(declare-fun call!39186 () List!17672)

(assert (=> b!886183 (= e!493253 call!39186)))

(declare-fun b!886184 () Bool)

(assert (=> b!886184 (= e!493252 (contains!4296 lt!401098 (tuple2!11907 key1!49 v1!38)))))

(declare-fun b!886185 () Bool)

(declare-fun e!493254 () List!17672)

(assert (=> b!886185 (= e!493254 (insertStrictlySorted!298 (t!24949 (t!24949 l!906)) key1!49 v1!38))))

(declare-fun bm!39182 () Bool)

(declare-fun call!39185 () List!17672)

(assert (=> bm!39182 (= call!39185 call!39186)))

(declare-fun d!109529 () Bool)

(assert (=> d!109529 e!493252))

(declare-fun res!601656 () Bool)

(assert (=> d!109529 (=> (not res!601656) (not e!493252))))

(assert (=> d!109529 (= res!601656 (isStrictlySorted!490 lt!401098))))

(assert (=> d!109529 (= lt!401098 e!493253)))

(declare-fun c!93430 () Bool)

(assert (=> d!109529 (= c!93430 (and ((_ is Cons!17668) (t!24949 l!906)) (bvslt (_1!5964 (h!18799 (t!24949 l!906))) key1!49)))))

(assert (=> d!109529 (isStrictlySorted!490 (t!24949 l!906))))

(assert (=> d!109529 (= (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38) lt!401098)))

(declare-fun b!886186 () Bool)

(declare-fun e!493250 () List!17672)

(assert (=> b!886186 (= e!493253 e!493250)))

(declare-fun c!93429 () Bool)

(assert (=> b!886186 (= c!93429 (and ((_ is Cons!17668) (t!24949 l!906)) (= (_1!5964 (h!18799 (t!24949 l!906))) key1!49)))))

(declare-fun bm!39183 () Bool)

(assert (=> bm!39183 (= call!39186 ($colon$colon!546 e!493254 (ite c!93430 (h!18799 (t!24949 l!906)) (tuple2!11907 key1!49 v1!38))))))

(declare-fun c!93432 () Bool)

(assert (=> bm!39183 (= c!93432 c!93430)))

(declare-fun b!886187 () Bool)

(declare-fun e!493251 () List!17672)

(declare-fun call!39187 () List!17672)

(assert (=> b!886187 (= e!493251 call!39187)))

(declare-fun b!886188 () Bool)

(assert (=> b!886188 (= e!493250 call!39185)))

(declare-fun b!886189 () Bool)

(declare-fun c!93431 () Bool)

(assert (=> b!886189 (= e!493254 (ite c!93429 (t!24949 (t!24949 l!906)) (ite c!93431 (Cons!17668 (h!18799 (t!24949 l!906)) (t!24949 (t!24949 l!906))) Nil!17669)))))

(declare-fun b!886190 () Bool)

(assert (=> b!886190 (= e!493251 call!39187)))

(declare-fun b!886191 () Bool)

(assert (=> b!886191 (= c!93431 (and ((_ is Cons!17668) (t!24949 l!906)) (bvsgt (_1!5964 (h!18799 (t!24949 l!906))) key1!49)))))

(assert (=> b!886191 (= e!493250 e!493251)))

(declare-fun bm!39184 () Bool)

(assert (=> bm!39184 (= call!39187 call!39185)))

(assert (= (and d!109529 c!93430) b!886183))

(assert (= (and d!109529 (not c!93430)) b!886186))

(assert (= (and b!886186 c!93429) b!886188))

(assert (= (and b!886186 (not c!93429)) b!886191))

(assert (= (and b!886191 c!93431) b!886187))

(assert (= (and b!886191 (not c!93431)) b!886190))

(assert (= (or b!886187 b!886190) bm!39184))

(assert (= (or b!886188 bm!39184) bm!39182))

(assert (= (or b!886183 bm!39182) bm!39183))

(assert (= (and bm!39183 c!93432) b!886185))

(assert (= (and bm!39183 (not c!93432)) b!886189))

(assert (= (and d!109529 res!601656) b!886182))

(assert (= (and b!886182 res!601657) b!886184))

(declare-fun m!826069 () Bool)

(assert (=> d!109529 m!826069))

(assert (=> d!109529 m!825939))

(declare-fun m!826071 () Bool)

(assert (=> b!886182 m!826071))

(declare-fun m!826073 () Bool)

(assert (=> b!886185 m!826073))

(declare-fun m!826075 () Bool)

(assert (=> b!886184 m!826075))

(declare-fun m!826077 () Bool)

(assert (=> bm!39183 m!826077))

(assert (=> b!886020 d!109529))

(declare-fun b!886202 () Bool)

(declare-fun res!601661 () Bool)

(declare-fun e!493262 () Bool)

(assert (=> b!886202 (=> (not res!601661) (not e!493262))))

(declare-fun lt!401100 () List!17672)

(assert (=> b!886202 (= res!601661 (containsKey!411 lt!401100 key1!49))))

(declare-fun b!886203 () Bool)

(declare-fun e!493263 () List!17672)

(declare-fun call!39196 () List!17672)

(assert (=> b!886203 (= e!493263 call!39196)))

(declare-fun b!886204 () Bool)

(assert (=> b!886204 (= e!493262 (contains!4296 lt!401100 (tuple2!11907 key1!49 v2!16)))))

(declare-fun e!493264 () List!17672)

(declare-fun b!886205 () Bool)

(assert (=> b!886205 (= e!493264 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v2!16))))

(declare-fun bm!39190 () Bool)

(declare-fun call!39195 () List!17672)

(assert (=> bm!39190 (= call!39195 call!39196)))

(declare-fun d!109533 () Bool)

(assert (=> d!109533 e!493262))

(declare-fun res!601660 () Bool)

(assert (=> d!109533 (=> (not res!601660) (not e!493262))))

(assert (=> d!109533 (= res!601660 (isStrictlySorted!490 lt!401100))))

(assert (=> d!109533 (= lt!401100 e!493263)))

(declare-fun c!93438 () Bool)

(assert (=> d!109533 (= c!93438 (and ((_ is Cons!17668) l!906) (bvslt (_1!5964 (h!18799 l!906)) key1!49)))))

(assert (=> d!109533 (isStrictlySorted!490 l!906)))

(assert (=> d!109533 (= (insertStrictlySorted!298 l!906 key1!49 v2!16) lt!401100)))

(declare-fun b!886206 () Bool)

(declare-fun e!493260 () List!17672)

(assert (=> b!886206 (= e!493263 e!493260)))

(declare-fun c!93437 () Bool)

(assert (=> b!886206 (= c!93437 (and ((_ is Cons!17668) l!906) (= (_1!5964 (h!18799 l!906)) key1!49)))))

(declare-fun bm!39191 () Bool)

(assert (=> bm!39191 (= call!39196 ($colon$colon!546 e!493264 (ite c!93438 (h!18799 l!906) (tuple2!11907 key1!49 v2!16))))))

(declare-fun c!93440 () Bool)

(assert (=> bm!39191 (= c!93440 c!93438)))

(declare-fun b!886207 () Bool)

(declare-fun e!493261 () List!17672)

(declare-fun call!39197 () List!17672)

(assert (=> b!886207 (= e!493261 call!39197)))

(declare-fun b!886208 () Bool)

(assert (=> b!886208 (= e!493260 call!39195)))

(declare-fun b!886209 () Bool)

(declare-fun c!93439 () Bool)

(assert (=> b!886209 (= e!493264 (ite c!93437 (t!24949 l!906) (ite c!93439 (Cons!17668 (h!18799 l!906) (t!24949 l!906)) Nil!17669)))))

(declare-fun b!886210 () Bool)

(assert (=> b!886210 (= e!493261 call!39197)))

(declare-fun b!886211 () Bool)

(assert (=> b!886211 (= c!93439 (and ((_ is Cons!17668) l!906) (bvsgt (_1!5964 (h!18799 l!906)) key1!49)))))

(assert (=> b!886211 (= e!493260 e!493261)))

(declare-fun bm!39192 () Bool)

(assert (=> bm!39192 (= call!39197 call!39195)))

(assert (= (and d!109533 c!93438) b!886203))

(assert (= (and d!109533 (not c!93438)) b!886206))

(assert (= (and b!886206 c!93437) b!886208))

(assert (= (and b!886206 (not c!93437)) b!886211))

(assert (= (and b!886211 c!93439) b!886207))

(assert (= (and b!886211 (not c!93439)) b!886210))

(assert (= (or b!886207 b!886210) bm!39192))

(assert (= (or b!886208 bm!39192) bm!39190))

(assert (= (or b!886203 bm!39190) bm!39191))

(assert (= (and bm!39191 c!93440) b!886205))

(assert (= (and bm!39191 (not c!93440)) b!886209))

(assert (= (and d!109533 res!601660) b!886202))

(assert (= (and b!886202 res!601661) b!886204))

(declare-fun m!826087 () Bool)

(assert (=> d!109533 m!826087))

(assert (=> d!109533 m!825937))

(declare-fun m!826089 () Bool)

(assert (=> b!886202 m!826089))

(assert (=> b!886205 m!825951))

(declare-fun m!826091 () Bool)

(assert (=> b!886204 m!826091))

(declare-fun m!826093 () Bool)

(assert (=> bm!39191 m!826093))

(assert (=> b!886020 d!109533))

(declare-fun b!886216 () Bool)

(declare-fun res!601663 () Bool)

(declare-fun e!493269 () Bool)

(assert (=> b!886216 (=> (not res!601663) (not e!493269))))

(declare-fun lt!401101 () List!17672)

(assert (=> b!886216 (= res!601663 (containsKey!411 lt!401101 key1!49))))

(declare-fun b!886217 () Bool)

(declare-fun e!493270 () List!17672)

(declare-fun call!39201 () List!17672)

(assert (=> b!886217 (= e!493270 call!39201)))

(declare-fun b!886218 () Bool)

(assert (=> b!886218 (= e!493269 (contains!4296 lt!401101 (tuple2!11907 key1!49 v1!38)))))

(declare-fun b!886219 () Bool)

(declare-fun e!493271 () List!17672)

(assert (=> b!886219 (= e!493271 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))))

(declare-fun bm!39195 () Bool)

(declare-fun call!39200 () List!17672)

(assert (=> bm!39195 (= call!39200 call!39201)))

(declare-fun d!109535 () Bool)

(assert (=> d!109535 e!493269))

(declare-fun res!601662 () Bool)

(assert (=> d!109535 (=> (not res!601662) (not e!493269))))

(assert (=> d!109535 (= res!601662 (isStrictlySorted!490 lt!401101))))

(assert (=> d!109535 (= lt!401101 e!493270)))

(declare-fun c!93442 () Bool)

(assert (=> d!109535 (= c!93442 (and ((_ is Cons!17668) l!906) (bvslt (_1!5964 (h!18799 l!906)) key1!49)))))

(assert (=> d!109535 (isStrictlySorted!490 l!906)))

(assert (=> d!109535 (= (insertStrictlySorted!298 l!906 key1!49 v1!38) lt!401101)))

(declare-fun b!886220 () Bool)

(declare-fun e!493267 () List!17672)

(assert (=> b!886220 (= e!493270 e!493267)))

(declare-fun c!93441 () Bool)

(assert (=> b!886220 (= c!93441 (and ((_ is Cons!17668) l!906) (= (_1!5964 (h!18799 l!906)) key1!49)))))

(declare-fun bm!39196 () Bool)

(assert (=> bm!39196 (= call!39201 ($colon$colon!546 e!493271 (ite c!93442 (h!18799 l!906) (tuple2!11907 key1!49 v1!38))))))

(declare-fun c!93444 () Bool)

(assert (=> bm!39196 (= c!93444 c!93442)))

(declare-fun b!886221 () Bool)

(declare-fun e!493268 () List!17672)

(declare-fun call!39202 () List!17672)

(assert (=> b!886221 (= e!493268 call!39202)))

(declare-fun b!886222 () Bool)

(assert (=> b!886222 (= e!493267 call!39200)))

(declare-fun c!93443 () Bool)

(declare-fun b!886223 () Bool)

(assert (=> b!886223 (= e!493271 (ite c!93441 (t!24949 l!906) (ite c!93443 (Cons!17668 (h!18799 l!906) (t!24949 l!906)) Nil!17669)))))

(declare-fun b!886224 () Bool)

(assert (=> b!886224 (= e!493268 call!39202)))

(declare-fun b!886225 () Bool)

(assert (=> b!886225 (= c!93443 (and ((_ is Cons!17668) l!906) (bvsgt (_1!5964 (h!18799 l!906)) key1!49)))))

(assert (=> b!886225 (= e!493267 e!493268)))

(declare-fun bm!39197 () Bool)

(assert (=> bm!39197 (= call!39202 call!39200)))

(assert (= (and d!109535 c!93442) b!886217))

(assert (= (and d!109535 (not c!93442)) b!886220))

(assert (= (and b!886220 c!93441) b!886222))

(assert (= (and b!886220 (not c!93441)) b!886225))

(assert (= (and b!886225 c!93443) b!886221))

(assert (= (and b!886225 (not c!93443)) b!886224))

(assert (= (or b!886221 b!886224) bm!39197))

(assert (= (or b!886222 bm!39197) bm!39195))

(assert (= (or b!886217 bm!39195) bm!39196))

(assert (= (and bm!39196 c!93444) b!886219))

(assert (= (and bm!39196 (not c!93444)) b!886223))

(assert (= (and d!109535 res!601662) b!886216))

(assert (= (and b!886216 res!601663) b!886218))

(declare-fun m!826095 () Bool)

(assert (=> d!109535 m!826095))

(assert (=> d!109535 m!825937))

(declare-fun m!826097 () Bool)

(assert (=> b!886216 m!826097))

(assert (=> b!886219 m!825941))

(declare-fun m!826099 () Bool)

(assert (=> b!886218 m!826099))

(declare-fun m!826101 () Bool)

(assert (=> bm!39196 m!826101))

(assert (=> b!886020 d!109535))

(declare-fun d!109537 () Bool)

(declare-fun res!601672 () Bool)

(declare-fun e!493281 () Bool)

(assert (=> d!109537 (=> res!601672 e!493281)))

(assert (=> d!109537 (= res!601672 (or ((_ is Nil!17669) l!906) ((_ is Nil!17669) (t!24949 l!906))))))

(assert (=> d!109537 (= (isStrictlySorted!490 l!906) e!493281)))

(declare-fun b!886239 () Bool)

(declare-fun e!493282 () Bool)

(assert (=> b!886239 (= e!493281 e!493282)))

(declare-fun res!601673 () Bool)

(assert (=> b!886239 (=> (not res!601673) (not e!493282))))

(assert (=> b!886239 (= res!601673 (bvslt (_1!5964 (h!18799 l!906)) (_1!5964 (h!18799 (t!24949 l!906)))))))

(declare-fun b!886240 () Bool)

(assert (=> b!886240 (= e!493282 (isStrictlySorted!490 (t!24949 l!906)))))

(assert (= (and d!109537 (not res!601672)) b!886239))

(assert (= (and b!886239 res!601673) b!886240))

(assert (=> b!886240 m!825939))

(assert (=> start!75204 d!109537))

(declare-fun d!109539 () Bool)

(declare-fun res!601676 () Bool)

(declare-fun e!493288 () Bool)

(assert (=> d!109539 (=> res!601676 e!493288)))

(assert (=> d!109539 (= res!601676 (or ((_ is Nil!17669) (t!24949 l!906)) ((_ is Nil!17669) (t!24949 (t!24949 l!906)))))))

(assert (=> d!109539 (= (isStrictlySorted!490 (t!24949 l!906)) e!493288)))

(declare-fun b!886251 () Bool)

(declare-fun e!493289 () Bool)

(assert (=> b!886251 (= e!493288 e!493289)))

(declare-fun res!601677 () Bool)

(assert (=> b!886251 (=> (not res!601677) (not e!493289))))

(assert (=> b!886251 (= res!601677 (bvslt (_1!5964 (h!18799 (t!24949 l!906))) (_1!5964 (h!18799 (t!24949 (t!24949 l!906))))))))

(declare-fun b!886252 () Bool)

(assert (=> b!886252 (= e!493289 (isStrictlySorted!490 (t!24949 (t!24949 l!906))))))

(assert (= (and d!109539 (not res!601676)) b!886251))

(assert (= (and b!886251 res!601677) b!886252))

(declare-fun m!826103 () Bool)

(assert (=> b!886252 m!826103))

(assert (=> b!886019 d!109539))

(declare-fun b!886267 () Bool)

(declare-fun e!493297 () Bool)

(declare-fun tp!54377 () Bool)

(assert (=> b!886267 (= e!493297 (and tp_is_empty!17811 tp!54377))))

(assert (=> b!886021 (= tp!54368 e!493297)))

(assert (= (and b!886021 ((_ is Cons!17668) (t!24949 l!906))) b!886267))

(check-sat (not d!109497) (not b!886182) (not b!886205) (not b!886120) (not b!886204) (not d!109535) (not d!109533) (not bm!39177) (not b!886122) (not b!886102) (not d!109525) (not b!886216) (not bm!39168) (not bm!39191) (not b!886152) (not b!886202) (not b!886267) (not bm!39183) (not b!886184) (not bm!39196) (not d!109519) (not b!886252) (not d!109529) (not b!886153) (not b!886150) (not b!886185) tp_is_empty!17811 (not bm!39162) (not b!886123) (not b!886103) (not d!109501) (not b!886219) (not b!886240) (not b!886100) (not b!886218))
(check-sat)
(get-model)

(declare-fun d!109551 () Bool)

(declare-fun lt!401110 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!394 (List!17672) (InoxSet tuple2!11906))

(assert (=> d!109551 (= lt!401110 (select (content!394 lt!401098) (tuple2!11907 key1!49 v1!38)))))

(declare-fun e!493325 () Bool)

(assert (=> d!109551 (= lt!401110 e!493325)))

(declare-fun res!601693 () Bool)

(assert (=> d!109551 (=> (not res!601693) (not e!493325))))

(assert (=> d!109551 (= res!601693 ((_ is Cons!17668) lt!401098))))

(assert (=> d!109551 (= (contains!4296 lt!401098 (tuple2!11907 key1!49 v1!38)) lt!401110)))

(declare-fun b!886317 () Bool)

(declare-fun e!493326 () Bool)

(assert (=> b!886317 (= e!493325 e!493326)))

(declare-fun res!601692 () Bool)

(assert (=> b!886317 (=> res!601692 e!493326)))

(assert (=> b!886317 (= res!601692 (= (h!18799 lt!401098) (tuple2!11907 key1!49 v1!38)))))

(declare-fun b!886318 () Bool)

(assert (=> b!886318 (= e!493326 (contains!4296 (t!24949 lt!401098) (tuple2!11907 key1!49 v1!38)))))

(assert (= (and d!109551 res!601693) b!886317))

(assert (= (and b!886317 (not res!601692)) b!886318))

(declare-fun m!826165 () Bool)

(assert (=> d!109551 m!826165))

(declare-fun m!826167 () Bool)

(assert (=> d!109551 m!826167))

(declare-fun m!826169 () Bool)

(assert (=> b!886318 m!826169))

(assert (=> b!886184 d!109551))

(assert (=> b!886205 d!109525))

(declare-fun d!109553 () Bool)

(assert (=> d!109553 (= ($colon$colon!546 e!493238 (ite c!93416 (h!18799 (t!24949 l!906)) (tuple2!11907 key1!49 v2!16))) (Cons!17668 (ite c!93416 (h!18799 (t!24949 l!906)) (tuple2!11907 key1!49 v2!16)) e!493238))))

(assert (=> bm!39177 d!109553))

(declare-fun lt!401111 () Bool)

(declare-fun d!109559 () Bool)

(assert (=> d!109559 (= lt!401111 (select (content!394 lt!401091) (tuple2!11907 key1!49 v2!16)))))

(declare-fun e!493329 () Bool)

(assert (=> d!109559 (= lt!401111 e!493329)))

(declare-fun res!601697 () Bool)

(assert (=> d!109559 (=> (not res!601697) (not e!493329))))

(assert (=> d!109559 (= res!601697 ((_ is Cons!17668) lt!401091))))

(assert (=> d!109559 (= (contains!4296 lt!401091 (tuple2!11907 key1!49 v2!16)) lt!401111)))

(declare-fun b!886321 () Bool)

(declare-fun e!493330 () Bool)

(assert (=> b!886321 (= e!493329 e!493330)))

(declare-fun res!601696 () Bool)

(assert (=> b!886321 (=> res!601696 e!493330)))

(assert (=> b!886321 (= res!601696 (= (h!18799 lt!401091) (tuple2!11907 key1!49 v2!16)))))

(declare-fun b!886322 () Bool)

(assert (=> b!886322 (= e!493330 (contains!4296 (t!24949 lt!401091) (tuple2!11907 key1!49 v2!16)))))

(assert (= (and d!109559 res!601697) b!886321))

(assert (= (and b!886321 (not res!601696)) b!886322))

(declare-fun m!826173 () Bool)

(assert (=> d!109559 m!826173))

(declare-fun m!826175 () Bool)

(assert (=> d!109559 m!826175))

(declare-fun m!826177 () Bool)

(assert (=> b!886322 m!826177))

(assert (=> b!886122 d!109559))

(declare-fun b!886323 () Bool)

(declare-fun res!601699 () Bool)

(declare-fun e!493333 () Bool)

(assert (=> b!886323 (=> (not res!601699) (not e!493333))))

(declare-fun lt!401112 () List!17672)

(assert (=> b!886323 (= res!601699 (containsKey!411 lt!401112 key1!49))))

(declare-fun b!886324 () Bool)

(declare-fun e!493334 () List!17672)

(declare-fun call!39222 () List!17672)

(assert (=> b!886324 (= e!493334 call!39222)))

(declare-fun b!886325 () Bool)

(assert (=> b!886325 (= e!493333 (contains!4296 lt!401112 (tuple2!11907 key1!49 v2!16)))))

(declare-fun e!493335 () List!17672)

(declare-fun b!886326 () Bool)

(assert (=> b!886326 (= e!493335 (insertStrictlySorted!298 (t!24949 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))) key1!49 v2!16))))

(declare-fun bm!39218 () Bool)

(declare-fun call!39221 () List!17672)

(assert (=> bm!39218 (= call!39221 call!39222)))

(declare-fun d!109561 () Bool)

(assert (=> d!109561 e!493333))

(declare-fun res!601698 () Bool)

(assert (=> d!109561 (=> (not res!601698) (not e!493333))))

(assert (=> d!109561 (= res!601698 (isStrictlySorted!490 lt!401112))))

(assert (=> d!109561 (= lt!401112 e!493334)))

(declare-fun c!93472 () Bool)

(assert (=> d!109561 (= c!93472 (and ((_ is Cons!17668) (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (bvslt (_1!5964 (h!18799 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> d!109561 (isStrictlySorted!490 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38)))))

(assert (=> d!109561 (= (insertStrictlySorted!298 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38)) key1!49 v2!16) lt!401112)))

(declare-fun b!886327 () Bool)

(declare-fun e!493331 () List!17672)

(assert (=> b!886327 (= e!493334 e!493331)))

(declare-fun c!93471 () Bool)

(assert (=> b!886327 (= c!93471 (and ((_ is Cons!17668) (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (= (_1!5964 (h!18799 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) key1!49)))))

(declare-fun bm!39219 () Bool)

(assert (=> bm!39219 (= call!39222 ($colon$colon!546 e!493335 (ite c!93472 (h!18799 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (tuple2!11907 key1!49 v2!16))))))

(declare-fun c!93474 () Bool)

(assert (=> bm!39219 (= c!93474 c!93472)))

(declare-fun b!886328 () Bool)

(declare-fun e!493332 () List!17672)

(declare-fun call!39223 () List!17672)

(assert (=> b!886328 (= e!493332 call!39223)))

(declare-fun b!886329 () Bool)

(assert (=> b!886329 (= e!493331 call!39221)))

(declare-fun c!93473 () Bool)

(declare-fun b!886330 () Bool)

(assert (=> b!886330 (= e!493335 (ite c!93471 (t!24949 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (ite c!93473 (Cons!17668 (h!18799 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (t!24949 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) Nil!17669)))))

(declare-fun b!886331 () Bool)

(assert (=> b!886331 (= e!493332 call!39223)))

(declare-fun b!886332 () Bool)

(assert (=> b!886332 (= c!93473 (and ((_ is Cons!17668) (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (bvsgt (_1!5964 (h!18799 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38)))) key1!49)))))

(assert (=> b!886332 (= e!493331 e!493332)))

(declare-fun bm!39220 () Bool)

(assert (=> bm!39220 (= call!39223 call!39221)))

(assert (= (and d!109561 c!93472) b!886324))

(assert (= (and d!109561 (not c!93472)) b!886327))

(assert (= (and b!886327 c!93471) b!886329))

(assert (= (and b!886327 (not c!93471)) b!886332))

(assert (= (and b!886332 c!93473) b!886328))

(assert (= (and b!886332 (not c!93473)) b!886331))

(assert (= (or b!886328 b!886331) bm!39220))

(assert (= (or b!886329 bm!39220) bm!39218))

(assert (= (or b!886324 bm!39218) bm!39219))

(assert (= (and bm!39219 c!93474) b!886326))

(assert (= (and bm!39219 (not c!93474)) b!886330))

(assert (= (and d!109561 res!601698) b!886323))

(assert (= (and b!886323 res!601699) b!886325))

(declare-fun m!826179 () Bool)

(assert (=> d!109561 m!826179))

(declare-fun m!826181 () Bool)

(assert (=> d!109561 m!826181))

(declare-fun m!826183 () Bool)

(assert (=> b!886323 m!826183))

(declare-fun m!826185 () Bool)

(assert (=> b!886326 m!826185))

(declare-fun m!826187 () Bool)

(assert (=> b!886325 m!826187))

(declare-fun m!826189 () Bool)

(assert (=> bm!39219 m!826189))

(assert (=> b!886123 d!109561))

(declare-fun b!886333 () Bool)

(declare-fun res!601701 () Bool)

(declare-fun e!493338 () Bool)

(assert (=> b!886333 (=> (not res!601701) (not e!493338))))

(declare-fun lt!401113 () List!17672)

(assert (=> b!886333 (= res!601701 (containsKey!411 lt!401113 key1!49))))

(declare-fun b!886334 () Bool)

(declare-fun e!493339 () List!17672)

(declare-fun call!39225 () List!17672)

(assert (=> b!886334 (= e!493339 call!39225)))

(declare-fun b!886335 () Bool)

(assert (=> b!886335 (= e!493338 (contains!4296 lt!401113 (tuple2!11907 key1!49 v1!38)))))

(declare-fun e!493340 () List!17672)

(declare-fun b!886336 () Bool)

(assert (=> b!886336 (= e!493340 (insertStrictlySorted!298 (t!24949 (t!24949 (t!24949 l!906))) key1!49 v1!38))))

(declare-fun bm!39221 () Bool)

(declare-fun call!39224 () List!17672)

(assert (=> bm!39221 (= call!39224 call!39225)))

(declare-fun d!109563 () Bool)

(assert (=> d!109563 e!493338))

(declare-fun res!601700 () Bool)

(assert (=> d!109563 (=> (not res!601700) (not e!493338))))

(assert (=> d!109563 (= res!601700 (isStrictlySorted!490 lt!401113))))

(assert (=> d!109563 (= lt!401113 e!493339)))

(declare-fun c!93476 () Bool)

(assert (=> d!109563 (= c!93476 (and ((_ is Cons!17668) (t!24949 (t!24949 l!906))) (bvslt (_1!5964 (h!18799 (t!24949 (t!24949 l!906)))) key1!49)))))

(assert (=> d!109563 (isStrictlySorted!490 (t!24949 (t!24949 l!906)))))

(assert (=> d!109563 (= (insertStrictlySorted!298 (t!24949 (t!24949 l!906)) key1!49 v1!38) lt!401113)))

(declare-fun b!886337 () Bool)

(declare-fun e!493336 () List!17672)

(assert (=> b!886337 (= e!493339 e!493336)))

(declare-fun c!93475 () Bool)

(assert (=> b!886337 (= c!93475 (and ((_ is Cons!17668) (t!24949 (t!24949 l!906))) (= (_1!5964 (h!18799 (t!24949 (t!24949 l!906)))) key1!49)))))

(declare-fun bm!39222 () Bool)

(assert (=> bm!39222 (= call!39225 ($colon$colon!546 e!493340 (ite c!93476 (h!18799 (t!24949 (t!24949 l!906))) (tuple2!11907 key1!49 v1!38))))))

(declare-fun c!93478 () Bool)

(assert (=> bm!39222 (= c!93478 c!93476)))

(declare-fun b!886338 () Bool)

(declare-fun e!493337 () List!17672)

(declare-fun call!39226 () List!17672)

(assert (=> b!886338 (= e!493337 call!39226)))

(declare-fun b!886339 () Bool)

(assert (=> b!886339 (= e!493336 call!39224)))

(declare-fun c!93477 () Bool)

(declare-fun b!886340 () Bool)

(assert (=> b!886340 (= e!493340 (ite c!93475 (t!24949 (t!24949 (t!24949 l!906))) (ite c!93477 (Cons!17668 (h!18799 (t!24949 (t!24949 l!906))) (t!24949 (t!24949 (t!24949 l!906)))) Nil!17669)))))

(declare-fun b!886341 () Bool)

(assert (=> b!886341 (= e!493337 call!39226)))

(declare-fun b!886342 () Bool)

(assert (=> b!886342 (= c!93477 (and ((_ is Cons!17668) (t!24949 (t!24949 l!906))) (bvsgt (_1!5964 (h!18799 (t!24949 (t!24949 l!906)))) key1!49)))))

(assert (=> b!886342 (= e!493336 e!493337)))

(declare-fun bm!39223 () Bool)

(assert (=> bm!39223 (= call!39226 call!39224)))

(assert (= (and d!109563 c!93476) b!886334))

(assert (= (and d!109563 (not c!93476)) b!886337))

(assert (= (and b!886337 c!93475) b!886339))

(assert (= (and b!886337 (not c!93475)) b!886342))

(assert (= (and b!886342 c!93477) b!886338))

(assert (= (and b!886342 (not c!93477)) b!886341))

(assert (= (or b!886338 b!886341) bm!39223))

(assert (= (or b!886339 bm!39223) bm!39221))

(assert (= (or b!886334 bm!39221) bm!39222))

(assert (= (and bm!39222 c!93478) b!886336))

(assert (= (and bm!39222 (not c!93478)) b!886340))

(assert (= (and d!109563 res!601700) b!886333))

(assert (= (and b!886333 res!601701) b!886335))

(declare-fun m!826191 () Bool)

(assert (=> d!109563 m!826191))

(assert (=> d!109563 m!826103))

(declare-fun m!826193 () Bool)

(assert (=> b!886333 m!826193))

(declare-fun m!826195 () Bool)

(assert (=> b!886336 m!826195))

(declare-fun m!826197 () Bool)

(assert (=> b!886335 m!826197))

(declare-fun m!826199 () Bool)

(assert (=> bm!39222 m!826199))

(assert (=> b!886185 d!109563))

(declare-fun lt!401116 () Bool)

(declare-fun d!109565 () Bool)

(assert (=> d!109565 (= lt!401116 (select (content!394 lt!401089) (tuple2!11907 key1!49 v2!16)))))

(declare-fun e!493345 () Bool)

(assert (=> d!109565 (= lt!401116 e!493345)))

(declare-fun res!601707 () Bool)

(assert (=> d!109565 (=> (not res!601707) (not e!493345))))

(assert (=> d!109565 (= res!601707 ((_ is Cons!17668) lt!401089))))

(assert (=> d!109565 (= (contains!4296 lt!401089 (tuple2!11907 key1!49 v2!16)) lt!401116)))

(declare-fun b!886347 () Bool)

(declare-fun e!493346 () Bool)

(assert (=> b!886347 (= e!493345 e!493346)))

(declare-fun res!601706 () Bool)

(assert (=> b!886347 (=> res!601706 e!493346)))

(assert (=> b!886347 (= res!601706 (= (h!18799 lt!401089) (tuple2!11907 key1!49 v2!16)))))

(declare-fun b!886348 () Bool)

(assert (=> b!886348 (= e!493346 (contains!4296 (t!24949 lt!401089) (tuple2!11907 key1!49 v2!16)))))

(assert (= (and d!109565 res!601707) b!886347))

(assert (= (and b!886347 (not res!601706)) b!886348))

(declare-fun m!826201 () Bool)

(assert (=> d!109565 m!826201))

(declare-fun m!826203 () Bool)

(assert (=> d!109565 m!826203))

(declare-fun m!826205 () Bool)

(assert (=> b!886348 m!826205))

(assert (=> b!886102 d!109565))

(declare-fun b!886351 () Bool)

(declare-fun res!601711 () Bool)

(declare-fun e!493351 () Bool)

(assert (=> b!886351 (=> (not res!601711) (not e!493351))))

(declare-fun lt!401118 () List!17672)

(assert (=> b!886351 (= res!601711 (containsKey!411 lt!401118 key1!49))))

(declare-fun b!886352 () Bool)

(declare-fun e!493352 () List!17672)

(declare-fun call!39228 () List!17672)

(assert (=> b!886352 (= e!493352 call!39228)))

(declare-fun b!886353 () Bool)

(assert (=> b!886353 (= e!493351 (contains!4296 lt!401118 (tuple2!11907 key1!49 v2!16)))))

(declare-fun b!886354 () Bool)

(declare-fun e!493353 () List!17672)

(assert (=> b!886354 (= e!493353 (insertStrictlySorted!298 (t!24949 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) key1!49 v2!16))))

(declare-fun bm!39224 () Bool)

(declare-fun call!39227 () List!17672)

(assert (=> bm!39224 (= call!39227 call!39228)))

(declare-fun d!109567 () Bool)

(assert (=> d!109567 e!493351))

(declare-fun res!601710 () Bool)

(assert (=> d!109567 (=> (not res!601710) (not e!493351))))

(assert (=> d!109567 (= res!601710 (isStrictlySorted!490 lt!401118))))

(assert (=> d!109567 (= lt!401118 e!493352)))

(declare-fun c!93480 () Bool)

(assert (=> d!109567 (= c!93480 (and ((_ is Cons!17668) (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) (bvslt (_1!5964 (h!18799 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)))) key1!49)))))

(assert (=> d!109567 (isStrictlySorted!490 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)))))

(assert (=> d!109567 (= (insertStrictlySorted!298 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) key1!49 v2!16) lt!401118)))

(declare-fun b!886355 () Bool)

(declare-fun e!493349 () List!17672)

(assert (=> b!886355 (= e!493352 e!493349)))

(declare-fun c!93479 () Bool)

(assert (=> b!886355 (= c!93479 (and ((_ is Cons!17668) (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) (= (_1!5964 (h!18799 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)))) key1!49)))))

(declare-fun bm!39225 () Bool)

(assert (=> bm!39225 (= call!39228 ($colon$colon!546 e!493353 (ite c!93480 (h!18799 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) (tuple2!11907 key1!49 v2!16))))))

(declare-fun c!93482 () Bool)

(assert (=> bm!39225 (= c!93482 c!93480)))

(declare-fun b!886356 () Bool)

(declare-fun e!493350 () List!17672)

(declare-fun call!39229 () List!17672)

(assert (=> b!886356 (= e!493350 call!39229)))

(declare-fun b!886357 () Bool)

(assert (=> b!886357 (= e!493349 call!39227)))

(declare-fun b!886358 () Bool)

(declare-fun c!93481 () Bool)

(assert (=> b!886358 (= e!493353 (ite c!93479 (t!24949 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) (ite c!93481 (Cons!17668 (h!18799 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) (t!24949 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)))) Nil!17669)))))

(declare-fun b!886359 () Bool)

(assert (=> b!886359 (= e!493350 call!39229)))

(declare-fun b!886360 () Bool)

(assert (=> b!886360 (= c!93481 (and ((_ is Cons!17668) (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) (bvsgt (_1!5964 (h!18799 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)))) key1!49)))))

(assert (=> b!886360 (= e!493349 e!493350)))

(declare-fun bm!39226 () Bool)

(assert (=> bm!39226 (= call!39229 call!39227)))

(assert (= (and d!109567 c!93480) b!886352))

(assert (= (and d!109567 (not c!93480)) b!886355))

(assert (= (and b!886355 c!93479) b!886357))

(assert (= (and b!886355 (not c!93479)) b!886360))

(assert (= (and b!886360 c!93481) b!886356))

(assert (= (and b!886360 (not c!93481)) b!886359))

(assert (= (or b!886356 b!886359) bm!39226))

(assert (= (or b!886357 bm!39226) bm!39224))

(assert (= (or b!886352 bm!39224) bm!39225))

(assert (= (and bm!39225 c!93482) b!886354))

(assert (= (and bm!39225 (not c!93482)) b!886358))

(assert (= (and d!109567 res!601710) b!886351))

(assert (= (and b!886351 res!601711) b!886353))

(declare-fun m!826215 () Bool)

(assert (=> d!109567 m!826215))

(declare-fun m!826217 () Bool)

(assert (=> d!109567 m!826217))

(declare-fun m!826219 () Bool)

(assert (=> b!886351 m!826219))

(declare-fun m!826223 () Bool)

(assert (=> b!886354 m!826223))

(declare-fun m!826225 () Bool)

(assert (=> b!886353 m!826225))

(declare-fun m!826231 () Bool)

(assert (=> bm!39225 m!826231))

(assert (=> b!886103 d!109567))

(declare-fun d!109575 () Bool)

(declare-fun res!601718 () Bool)

(declare-fun e!493360 () Bool)

(assert (=> d!109575 (=> res!601718 e!493360)))

(assert (=> d!109575 (= res!601718 (or ((_ is Nil!17669) lt!401100) ((_ is Nil!17669) (t!24949 lt!401100))))))

(assert (=> d!109575 (= (isStrictlySorted!490 lt!401100) e!493360)))

(declare-fun b!886367 () Bool)

(declare-fun e!493361 () Bool)

(assert (=> b!886367 (= e!493360 e!493361)))

(declare-fun res!601719 () Bool)

(assert (=> b!886367 (=> (not res!601719) (not e!493361))))

(assert (=> b!886367 (= res!601719 (bvslt (_1!5964 (h!18799 lt!401100)) (_1!5964 (h!18799 (t!24949 lt!401100)))))))

(declare-fun b!886368 () Bool)

(assert (=> b!886368 (= e!493361 (isStrictlySorted!490 (t!24949 lt!401100)))))

(assert (= (and d!109575 (not res!601718)) b!886367))

(assert (= (and b!886367 res!601719) b!886368))

(declare-fun m!826235 () Bool)

(assert (=> b!886368 m!826235))

(assert (=> d!109533 d!109575))

(assert (=> d!109533 d!109537))

(declare-fun d!109579 () Bool)

(assert (=> d!109579 (= ($colon$colon!546 e!493264 (ite c!93438 (h!18799 l!906) (tuple2!11907 key1!49 v2!16))) (Cons!17668 (ite c!93438 (h!18799 l!906) (tuple2!11907 key1!49 v2!16)) e!493264))))

(assert (=> bm!39191 d!109579))

(declare-fun d!109581 () Bool)

(declare-fun res!601720 () Bool)

(declare-fun e!493362 () Bool)

(assert (=> d!109581 (=> res!601720 e!493362)))

(assert (=> d!109581 (= res!601720 (or ((_ is Nil!17669) lt!401098) ((_ is Nil!17669) (t!24949 lt!401098))))))

(assert (=> d!109581 (= (isStrictlySorted!490 lt!401098) e!493362)))

(declare-fun b!886369 () Bool)

(declare-fun e!493363 () Bool)

(assert (=> b!886369 (= e!493362 e!493363)))

(declare-fun res!601721 () Bool)

(assert (=> b!886369 (=> (not res!601721) (not e!493363))))

(assert (=> b!886369 (= res!601721 (bvslt (_1!5964 (h!18799 lt!401098)) (_1!5964 (h!18799 (t!24949 lt!401098)))))))

(declare-fun b!886370 () Bool)

(assert (=> b!886370 (= e!493363 (isStrictlySorted!490 (t!24949 lt!401098)))))

(assert (= (and d!109581 (not res!601720)) b!886369))

(assert (= (and b!886369 res!601721) b!886370))

(declare-fun m!826237 () Bool)

(assert (=> b!886370 m!826237))

(assert (=> d!109529 d!109581))

(assert (=> d!109529 d!109539))

(declare-fun d!109583 () Bool)

(declare-fun res!601722 () Bool)

(declare-fun e!493364 () Bool)

(assert (=> d!109583 (=> res!601722 e!493364)))

(assert (=> d!109583 (= res!601722 (or ((_ is Nil!17669) lt!401091) ((_ is Nil!17669) (t!24949 lt!401091))))))

(assert (=> d!109583 (= (isStrictlySorted!490 lt!401091) e!493364)))

(declare-fun b!886371 () Bool)

(declare-fun e!493365 () Bool)

(assert (=> b!886371 (= e!493364 e!493365)))

(declare-fun res!601723 () Bool)

(assert (=> b!886371 (=> (not res!601723) (not e!493365))))

(assert (=> b!886371 (= res!601723 (bvslt (_1!5964 (h!18799 lt!401091)) (_1!5964 (h!18799 (t!24949 lt!401091)))))))

(declare-fun b!886372 () Bool)

(assert (=> b!886372 (= e!493365 (isStrictlySorted!490 (t!24949 lt!401091)))))

(assert (= (and d!109583 (not res!601722)) b!886371))

(assert (= (and b!886371 res!601723) b!886372))

(declare-fun m!826239 () Bool)

(assert (=> b!886372 m!826239))

(assert (=> d!109519 d!109583))

(declare-fun d!109587 () Bool)

(declare-fun res!601726 () Bool)

(declare-fun e!493368 () Bool)

(assert (=> d!109587 (=> res!601726 e!493368)))

(assert (=> d!109587 (= res!601726 (or ((_ is Nil!17669) (insertStrictlySorted!298 l!906 key1!49 v1!38)) ((_ is Nil!17669) (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38)))))))

(assert (=> d!109587 (= (isStrictlySorted!490 (insertStrictlySorted!298 l!906 key1!49 v1!38)) e!493368)))

(declare-fun b!886375 () Bool)

(declare-fun e!493369 () Bool)

(assert (=> b!886375 (= e!493368 e!493369)))

(declare-fun res!601727 () Bool)

(assert (=> b!886375 (=> (not res!601727) (not e!493369))))

(assert (=> b!886375 (= res!601727 (bvslt (_1!5964 (h!18799 (insertStrictlySorted!298 l!906 key1!49 v1!38))) (_1!5964 (h!18799 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))))))))

(declare-fun b!886376 () Bool)

(assert (=> b!886376 (= e!493369 (isStrictlySorted!490 (t!24949 (insertStrictlySorted!298 l!906 key1!49 v1!38))))))

(assert (= (and d!109587 (not res!601726)) b!886375))

(assert (= (and b!886375 res!601727) b!886376))

(assert (=> b!886376 m!826181))

(assert (=> d!109519 d!109587))

(declare-fun d!109591 () Bool)

(assert (=> d!109591 (= ($colon$colon!546 e!493254 (ite c!93430 (h!18799 (t!24949 l!906)) (tuple2!11907 key1!49 v1!38))) (Cons!17668 (ite c!93430 (h!18799 (t!24949 l!906)) (tuple2!11907 key1!49 v1!38)) e!493254))))

(assert (=> bm!39183 d!109591))

(declare-fun d!109593 () Bool)

(assert (=> d!109593 (= ($colon$colon!546 e!493223 (ite c!93404 (h!18799 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (tuple2!11907 key1!49 v2!16))) (Cons!17668 (ite c!93404 (h!18799 (insertStrictlySorted!298 l!906 key1!49 v1!38)) (tuple2!11907 key1!49 v2!16)) e!493223))))

(assert (=> bm!39168 d!109593))

(declare-fun d!109597 () Bool)

(declare-fun lt!401120 () Bool)

(assert (=> d!109597 (= lt!401120 (select (content!394 lt!401101) (tuple2!11907 key1!49 v1!38)))))

(declare-fun e!493374 () Bool)

(assert (=> d!109597 (= lt!401120 e!493374)))

(declare-fun res!601733 () Bool)

(assert (=> d!109597 (=> (not res!601733) (not e!493374))))

(assert (=> d!109597 (= res!601733 ((_ is Cons!17668) lt!401101))))

(assert (=> d!109597 (= (contains!4296 lt!401101 (tuple2!11907 key1!49 v1!38)) lt!401120)))

(declare-fun b!886381 () Bool)

(declare-fun e!493375 () Bool)

(assert (=> b!886381 (= e!493374 e!493375)))

(declare-fun res!601732 () Bool)

(assert (=> b!886381 (=> res!601732 e!493375)))

(assert (=> b!886381 (= res!601732 (= (h!18799 lt!401101) (tuple2!11907 key1!49 v1!38)))))

(declare-fun b!886382 () Bool)

(assert (=> b!886382 (= e!493375 (contains!4296 (t!24949 lt!401101) (tuple2!11907 key1!49 v1!38)))))

(assert (= (and d!109597 res!601733) b!886381))

(assert (= (and b!886381 (not res!601732)) b!886382))

(declare-fun m!826247 () Bool)

(assert (=> d!109597 m!826247))

(declare-fun m!826249 () Bool)

(assert (=> d!109597 m!826249))

(declare-fun m!826251 () Bool)

(assert (=> b!886382 m!826251))

(assert (=> b!886218 d!109597))

(assert (=> b!886219 d!109529))

(declare-fun d!109601 () Bool)

(declare-fun lt!401121 () Bool)

(assert (=> d!109601 (= lt!401121 (select (content!394 lt!401094) (tuple2!11907 key1!49 v2!16)))))

(declare-fun e!493376 () Bool)

(assert (=> d!109601 (= lt!401121 e!493376)))

(declare-fun res!601735 () Bool)

(assert (=> d!109601 (=> (not res!601735) (not e!493376))))

(assert (=> d!109601 (= res!601735 ((_ is Cons!17668) lt!401094))))

(assert (=> d!109601 (= (contains!4296 lt!401094 (tuple2!11907 key1!49 v2!16)) lt!401121)))

(declare-fun b!886383 () Bool)

(declare-fun e!493377 () Bool)

(assert (=> b!886383 (= e!493376 e!493377)))

(declare-fun res!601734 () Bool)

(assert (=> b!886383 (=> res!601734 e!493377)))

(assert (=> b!886383 (= res!601734 (= (h!18799 lt!401094) (tuple2!11907 key1!49 v2!16)))))

(declare-fun b!886384 () Bool)

(assert (=> b!886384 (= e!493377 (contains!4296 (t!24949 lt!401094) (tuple2!11907 key1!49 v2!16)))))

(assert (= (and d!109601 res!601735) b!886383))

(assert (= (and b!886383 (not res!601734)) b!886384))

(declare-fun m!826253 () Bool)

(assert (=> d!109601 m!826253))

(declare-fun m!826255 () Bool)

(assert (=> d!109601 m!826255))

(declare-fun m!826257 () Bool)

(assert (=> b!886384 m!826257))

(assert (=> b!886152 d!109601))

(declare-fun b!886385 () Bool)

(declare-fun res!601737 () Bool)

(declare-fun e!493380 () Bool)

(assert (=> b!886385 (=> (not res!601737) (not e!493380))))

(declare-fun lt!401122 () List!17672)

(assert (=> b!886385 (= res!601737 (containsKey!411 lt!401122 key1!49))))

(declare-fun b!886386 () Bool)

(declare-fun e!493381 () List!17672)

(declare-fun call!39231 () List!17672)

(assert (=> b!886386 (= e!493381 call!39231)))

(declare-fun b!886387 () Bool)

(assert (=> b!886387 (= e!493380 (contains!4296 lt!401122 (tuple2!11907 key1!49 v2!16)))))

(declare-fun e!493382 () List!17672)

(declare-fun b!886388 () Bool)

(assert (=> b!886388 (= e!493382 (insertStrictlySorted!298 (t!24949 (t!24949 (t!24949 l!906))) key1!49 v2!16))))

(declare-fun bm!39227 () Bool)

(declare-fun call!39230 () List!17672)

(assert (=> bm!39227 (= call!39230 call!39231)))

(declare-fun d!109603 () Bool)

(assert (=> d!109603 e!493380))

(declare-fun res!601736 () Bool)

(assert (=> d!109603 (=> (not res!601736) (not e!493380))))

(assert (=> d!109603 (= res!601736 (isStrictlySorted!490 lt!401122))))

(assert (=> d!109603 (= lt!401122 e!493381)))

(declare-fun c!93484 () Bool)

(assert (=> d!109603 (= c!93484 (and ((_ is Cons!17668) (t!24949 (t!24949 l!906))) (bvslt (_1!5964 (h!18799 (t!24949 (t!24949 l!906)))) key1!49)))))

(assert (=> d!109603 (isStrictlySorted!490 (t!24949 (t!24949 l!906)))))

(assert (=> d!109603 (= (insertStrictlySorted!298 (t!24949 (t!24949 l!906)) key1!49 v2!16) lt!401122)))

(declare-fun b!886389 () Bool)

(declare-fun e!493378 () List!17672)

(assert (=> b!886389 (= e!493381 e!493378)))

(declare-fun c!93483 () Bool)

(assert (=> b!886389 (= c!93483 (and ((_ is Cons!17668) (t!24949 (t!24949 l!906))) (= (_1!5964 (h!18799 (t!24949 (t!24949 l!906)))) key1!49)))))

(declare-fun bm!39228 () Bool)

(assert (=> bm!39228 (= call!39231 ($colon$colon!546 e!493382 (ite c!93484 (h!18799 (t!24949 (t!24949 l!906))) (tuple2!11907 key1!49 v2!16))))))

(declare-fun c!93486 () Bool)

(assert (=> bm!39228 (= c!93486 c!93484)))

(declare-fun b!886390 () Bool)

(declare-fun e!493379 () List!17672)

(declare-fun call!39232 () List!17672)

(assert (=> b!886390 (= e!493379 call!39232)))

(declare-fun b!886391 () Bool)

(assert (=> b!886391 (= e!493378 call!39230)))

(declare-fun b!886392 () Bool)

(declare-fun c!93485 () Bool)

(assert (=> b!886392 (= e!493382 (ite c!93483 (t!24949 (t!24949 (t!24949 l!906))) (ite c!93485 (Cons!17668 (h!18799 (t!24949 (t!24949 l!906))) (t!24949 (t!24949 (t!24949 l!906)))) Nil!17669)))))

(declare-fun b!886393 () Bool)

(assert (=> b!886393 (= e!493379 call!39232)))

(declare-fun b!886394 () Bool)

(assert (=> b!886394 (= c!93485 (and ((_ is Cons!17668) (t!24949 (t!24949 l!906))) (bvsgt (_1!5964 (h!18799 (t!24949 (t!24949 l!906)))) key1!49)))))

(assert (=> b!886394 (= e!493378 e!493379)))

(declare-fun bm!39229 () Bool)

(assert (=> bm!39229 (= call!39232 call!39230)))

(assert (= (and d!109603 c!93484) b!886386))

(assert (= (and d!109603 (not c!93484)) b!886389))

(assert (= (and b!886389 c!93483) b!886391))

(assert (= (and b!886389 (not c!93483)) b!886394))

(assert (= (and b!886394 c!93485) b!886390))

(assert (= (and b!886394 (not c!93485)) b!886393))

(assert (= (or b!886390 b!886393) bm!39229))

(assert (= (or b!886391 bm!39229) bm!39227))

(assert (= (or b!886386 bm!39227) bm!39228))

(assert (= (and bm!39228 c!93486) b!886388))

(assert (= (and bm!39228 (not c!93486)) b!886392))

(assert (= (and d!109603 res!601736) b!886385))

(assert (= (and b!886385 res!601737) b!886387))

(declare-fun m!826259 () Bool)

(assert (=> d!109603 m!826259))

(assert (=> d!109603 m!826103))

(declare-fun m!826261 () Bool)

(assert (=> b!886385 m!826261))

(declare-fun m!826263 () Bool)

(assert (=> b!886388 m!826263))

(declare-fun m!826265 () Bool)

(assert (=> b!886387 m!826265))

(declare-fun m!826267 () Bool)

(assert (=> bm!39228 m!826267))

(assert (=> b!886153 d!109603))

(assert (=> b!886240 d!109539))

(declare-fun d!109605 () Bool)

(declare-fun res!601744 () Bool)

(declare-fun e!493392 () Bool)

(assert (=> d!109605 (=> res!601744 e!493392)))

(assert (=> d!109605 (= res!601744 (and ((_ is Cons!17668) lt!401100) (= (_1!5964 (h!18799 lt!401100)) key1!49)))))

(assert (=> d!109605 (= (containsKey!411 lt!401100 key1!49) e!493392)))

(declare-fun b!886409 () Bool)

(declare-fun e!493393 () Bool)

(assert (=> b!886409 (= e!493392 e!493393)))

(declare-fun res!601745 () Bool)

(assert (=> b!886409 (=> (not res!601745) (not e!493393))))

(assert (=> b!886409 (= res!601745 (and (or (not ((_ is Cons!17668) lt!401100)) (bvsle (_1!5964 (h!18799 lt!401100)) key1!49)) ((_ is Cons!17668) lt!401100) (bvslt (_1!5964 (h!18799 lt!401100)) key1!49)))))

(declare-fun b!886410 () Bool)

(assert (=> b!886410 (= e!493393 (containsKey!411 (t!24949 lt!401100) key1!49))))

(assert (= (and d!109605 (not res!601744)) b!886409))

(assert (= (and b!886409 res!601745) b!886410))

(declare-fun m!826279 () Bool)

(assert (=> b!886410 m!826279))

(assert (=> b!886202 d!109605))

(declare-fun d!109611 () Bool)

(declare-fun res!601746 () Bool)

(declare-fun e!493394 () Bool)

(assert (=> d!109611 (=> res!601746 e!493394)))

(assert (=> d!109611 (= res!601746 (and ((_ is Cons!17668) lt!401098) (= (_1!5964 (h!18799 lt!401098)) key1!49)))))

(assert (=> d!109611 (= (containsKey!411 lt!401098 key1!49) e!493394)))

(declare-fun b!886411 () Bool)

(declare-fun e!493395 () Bool)

(assert (=> b!886411 (= e!493394 e!493395)))

(declare-fun res!601747 () Bool)

(assert (=> b!886411 (=> (not res!601747) (not e!493395))))

(assert (=> b!886411 (= res!601747 (and (or (not ((_ is Cons!17668) lt!401098)) (bvsle (_1!5964 (h!18799 lt!401098)) key1!49)) ((_ is Cons!17668) lt!401098) (bvslt (_1!5964 (h!18799 lt!401098)) key1!49)))))

(declare-fun b!886412 () Bool)

(assert (=> b!886412 (= e!493395 (containsKey!411 (t!24949 lt!401098) key1!49))))

(assert (= (and d!109611 (not res!601746)) b!886411))

(assert (= (and b!886411 res!601747) b!886412))

(declare-fun m!826281 () Bool)

(assert (=> b!886412 m!826281))

(assert (=> b!886182 d!109611))

(declare-fun d!109613 () Bool)

(declare-fun res!601752 () Bool)

(declare-fun e!493400 () Bool)

(assert (=> d!109613 (=> res!601752 e!493400)))

(assert (=> d!109613 (= res!601752 (and ((_ is Cons!17668) lt!401091) (= (_1!5964 (h!18799 lt!401091)) key1!49)))))

(assert (=> d!109613 (= (containsKey!411 lt!401091 key1!49) e!493400)))

(declare-fun b!886415 () Bool)

(declare-fun e!493401 () Bool)

(assert (=> b!886415 (= e!493400 e!493401)))

(declare-fun res!601753 () Bool)

(assert (=> b!886415 (=> (not res!601753) (not e!493401))))

(assert (=> b!886415 (= res!601753 (and (or (not ((_ is Cons!17668) lt!401091)) (bvsle (_1!5964 (h!18799 lt!401091)) key1!49)) ((_ is Cons!17668) lt!401091) (bvslt (_1!5964 (h!18799 lt!401091)) key1!49)))))

(declare-fun b!886416 () Bool)

(assert (=> b!886416 (= e!493401 (containsKey!411 (t!24949 lt!401091) key1!49))))

(assert (= (and d!109613 (not res!601752)) b!886415))

(assert (= (and b!886415 res!601753) b!886416))

(declare-fun m!826283 () Bool)

(assert (=> b!886416 m!826283))

(assert (=> b!886120 d!109613))

(assert (=> d!109497 d!109501))

(assert (=> d!109497 d!109539))

(assert (=> d!109497 d!109525))

(assert (=> d!109497 d!109529))

(declare-fun d!109615 () Bool)

(assert (=> d!109615 (= (insertStrictlySorted!298 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!298 (t!24949 l!906) key1!49 v2!16))))

(assert (=> d!109615 true))

(declare-fun _$8!136 () Unit!30242)

(assert (=> d!109615 (= (choose!1451 (t!24949 l!906) key1!49 v1!38 v2!16) _$8!136)))

(declare-fun bs!24853 () Bool)

(assert (= bs!24853 d!109615))

(assert (=> bs!24853 m!825941))

(assert (=> bs!24853 m!825941))

(assert (=> bs!24853 m!825943))

(assert (=> bs!24853 m!825951))

(assert (=> d!109497 d!109615))

(declare-fun d!109621 () Bool)

(assert (=> d!109621 (= ($colon$colon!546 e!493271 (ite c!93442 (h!18799 l!906) (tuple2!11907 key1!49 v1!38))) (Cons!17668 (ite c!93442 (h!18799 l!906) (tuple2!11907 key1!49 v1!38)) e!493271))))

(assert (=> bm!39196 d!109621))

(declare-fun lt!401125 () Bool)

(declare-fun d!109623 () Bool)

(assert (=> d!109623 (= lt!401125 (select (content!394 lt!401100) (tuple2!11907 key1!49 v2!16)))))

(declare-fun e!493411 () Bool)

(assert (=> d!109623 (= lt!401125 e!493411)))

(declare-fun res!601761 () Bool)

(assert (=> d!109623 (=> (not res!601761) (not e!493411))))

(assert (=> d!109623 (= res!601761 ((_ is Cons!17668) lt!401100))))

(assert (=> d!109623 (= (contains!4296 lt!401100 (tuple2!11907 key1!49 v2!16)) lt!401125)))

(declare-fun b!886433 () Bool)

(declare-fun e!493412 () Bool)

(assert (=> b!886433 (= e!493411 e!493412)))

(declare-fun res!601760 () Bool)

(assert (=> b!886433 (=> res!601760 e!493412)))

(assert (=> b!886433 (= res!601760 (= (h!18799 lt!401100) (tuple2!11907 key1!49 v2!16)))))

(declare-fun b!886434 () Bool)

(assert (=> b!886434 (= e!493412 (contains!4296 (t!24949 lt!401100) (tuple2!11907 key1!49 v2!16)))))

(assert (= (and d!109623 res!601761) b!886433))

(assert (= (and b!886433 (not res!601760)) b!886434))

(declare-fun m!826299 () Bool)

(assert (=> d!109623 m!826299))

(declare-fun m!826301 () Bool)

(assert (=> d!109623 m!826301))

(declare-fun m!826303 () Bool)

(assert (=> b!886434 m!826303))

(assert (=> b!886204 d!109623))

(declare-fun d!109627 () Bool)

(declare-fun res!601764 () Bool)

(declare-fun e!493415 () Bool)

(assert (=> d!109627 (=> res!601764 e!493415)))

(assert (=> d!109627 (= res!601764 (or ((_ is Nil!17669) lt!401094) ((_ is Nil!17669) (t!24949 lt!401094))))))

(assert (=> d!109627 (= (isStrictlySorted!490 lt!401094) e!493415)))

(declare-fun b!886437 () Bool)

(declare-fun e!493416 () Bool)

(assert (=> b!886437 (= e!493415 e!493416)))

(declare-fun res!601765 () Bool)

(assert (=> b!886437 (=> (not res!601765) (not e!493416))))

(assert (=> b!886437 (= res!601765 (bvslt (_1!5964 (h!18799 lt!401094)) (_1!5964 (h!18799 (t!24949 lt!401094)))))))

(declare-fun b!886438 () Bool)

(assert (=> b!886438 (= e!493416 (isStrictlySorted!490 (t!24949 lt!401094)))))

(assert (= (and d!109627 (not res!601764)) b!886437))

(assert (= (and b!886437 res!601765) b!886438))

(declare-fun m!826311 () Bool)

(assert (=> b!886438 m!826311))

(assert (=> d!109525 d!109627))

(assert (=> d!109525 d!109539))

(declare-fun d!109631 () Bool)

(declare-fun res!601768 () Bool)

(declare-fun e!493422 () Bool)

(assert (=> d!109631 (=> res!601768 e!493422)))

(assert (=> d!109631 (= res!601768 (and ((_ is Cons!17668) lt!401089) (= (_1!5964 (h!18799 lt!401089)) key1!49)))))

(assert (=> d!109631 (= (containsKey!411 lt!401089 key1!49) e!493422)))

(declare-fun b!886449 () Bool)

(declare-fun e!493423 () Bool)

(assert (=> b!886449 (= e!493422 e!493423)))

(declare-fun res!601769 () Bool)

(assert (=> b!886449 (=> (not res!601769) (not e!493423))))

(assert (=> b!886449 (= res!601769 (and (or (not ((_ is Cons!17668) lt!401089)) (bvsle (_1!5964 (h!18799 lt!401089)) key1!49)) ((_ is Cons!17668) lt!401089) (bvslt (_1!5964 (h!18799 lt!401089)) key1!49)))))

(declare-fun b!886450 () Bool)

(assert (=> b!886450 (= e!493423 (containsKey!411 (t!24949 lt!401089) key1!49))))

(assert (= (and d!109631 (not res!601768)) b!886449))

(assert (= (and b!886449 res!601769) b!886450))

(declare-fun m!826313 () Bool)

(assert (=> b!886450 m!826313))

(assert (=> b!886100 d!109631))

(declare-fun d!109633 () Bool)

(declare-fun res!601770 () Bool)

(declare-fun e!493424 () Bool)

(assert (=> d!109633 (=> res!601770 e!493424)))

(assert (=> d!109633 (= res!601770 (or ((_ is Nil!17669) (t!24949 (t!24949 l!906))) ((_ is Nil!17669) (t!24949 (t!24949 (t!24949 l!906))))))))

(assert (=> d!109633 (= (isStrictlySorted!490 (t!24949 (t!24949 l!906))) e!493424)))

(declare-fun b!886451 () Bool)

(declare-fun e!493425 () Bool)

(assert (=> b!886451 (= e!493424 e!493425)))

(declare-fun res!601771 () Bool)

(assert (=> b!886451 (=> (not res!601771) (not e!493425))))

(assert (=> b!886451 (= res!601771 (bvslt (_1!5964 (h!18799 (t!24949 (t!24949 l!906)))) (_1!5964 (h!18799 (t!24949 (t!24949 (t!24949 l!906)))))))))

(declare-fun b!886452 () Bool)

(assert (=> b!886452 (= e!493425 (isStrictlySorted!490 (t!24949 (t!24949 (t!24949 l!906)))))))

(assert (= (and d!109633 (not res!601770)) b!886451))

(assert (= (and b!886451 res!601771) b!886452))

(declare-fun m!826315 () Bool)

(assert (=> b!886452 m!826315))

(assert (=> b!886252 d!109633))

(declare-fun d!109635 () Bool)

(declare-fun res!601772 () Bool)

(declare-fun e!493426 () Bool)

(assert (=> d!109635 (=> res!601772 e!493426)))

(assert (=> d!109635 (= res!601772 (and ((_ is Cons!17668) lt!401101) (= (_1!5964 (h!18799 lt!401101)) key1!49)))))

(assert (=> d!109635 (= (containsKey!411 lt!401101 key1!49) e!493426)))

(declare-fun b!886453 () Bool)

(declare-fun e!493427 () Bool)

(assert (=> b!886453 (= e!493426 e!493427)))

(declare-fun res!601773 () Bool)

(assert (=> b!886453 (=> (not res!601773) (not e!493427))))

(assert (=> b!886453 (= res!601773 (and (or (not ((_ is Cons!17668) lt!401101)) (bvsle (_1!5964 (h!18799 lt!401101)) key1!49)) ((_ is Cons!17668) lt!401101) (bvslt (_1!5964 (h!18799 lt!401101)) key1!49)))))

(declare-fun b!886454 () Bool)

(assert (=> b!886454 (= e!493427 (containsKey!411 (t!24949 lt!401101) key1!49))))

(assert (= (and d!109635 (not res!601772)) b!886453))

(assert (= (and b!886453 res!601773) b!886454))

(declare-fun m!826323 () Bool)

(assert (=> b!886454 m!826323))

(assert (=> b!886216 d!109635))

(declare-fun d!109637 () Bool)

(declare-fun res!601774 () Bool)

(declare-fun e!493428 () Bool)

(assert (=> d!109637 (=> res!601774 e!493428)))

(assert (=> d!109637 (= res!601774 (and ((_ is Cons!17668) lt!401094) (= (_1!5964 (h!18799 lt!401094)) key1!49)))))

(assert (=> d!109637 (= (containsKey!411 lt!401094 key1!49) e!493428)))

(declare-fun b!886455 () Bool)

(declare-fun e!493429 () Bool)

(assert (=> b!886455 (= e!493428 e!493429)))

(declare-fun res!601775 () Bool)

(assert (=> b!886455 (=> (not res!601775) (not e!493429))))

(assert (=> b!886455 (= res!601775 (and (or (not ((_ is Cons!17668) lt!401094)) (bvsle (_1!5964 (h!18799 lt!401094)) key1!49)) ((_ is Cons!17668) lt!401094) (bvslt (_1!5964 (h!18799 lt!401094)) key1!49)))))

(declare-fun b!886456 () Bool)

(assert (=> b!886456 (= e!493429 (containsKey!411 (t!24949 lt!401094) key1!49))))

(assert (= (and d!109637 (not res!601774)) b!886455))

(assert (= (and b!886455 res!601775) b!886456))

(declare-fun m!826329 () Bool)

(assert (=> b!886456 m!826329))

(assert (=> b!886150 d!109637))

(declare-fun d!109641 () Bool)

(declare-fun res!601778 () Bool)

(declare-fun e!493432 () Bool)

(assert (=> d!109641 (=> res!601778 e!493432)))

(assert (=> d!109641 (= res!601778 (or ((_ is Nil!17669) lt!401101) ((_ is Nil!17669) (t!24949 lt!401101))))))

(assert (=> d!109641 (= (isStrictlySorted!490 lt!401101) e!493432)))

(declare-fun b!886459 () Bool)

(declare-fun e!493433 () Bool)

(assert (=> b!886459 (= e!493432 e!493433)))

(declare-fun res!601779 () Bool)

(assert (=> b!886459 (=> (not res!601779) (not e!493433))))

(assert (=> b!886459 (= res!601779 (bvslt (_1!5964 (h!18799 lt!401101)) (_1!5964 (h!18799 (t!24949 lt!401101)))))))

(declare-fun b!886460 () Bool)

(assert (=> b!886460 (= e!493433 (isStrictlySorted!490 (t!24949 lt!401101)))))

(assert (= (and d!109641 (not res!601778)) b!886459))

(assert (= (and b!886459 res!601779) b!886460))

(declare-fun m!826337 () Bool)

(assert (=> b!886460 m!826337))

(assert (=> d!109535 d!109641))

(assert (=> d!109535 d!109537))

(declare-fun d!109645 () Bool)

(assert (=> d!109645 (= ($colon$colon!546 e!493213 (ite c!93396 (h!18799 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) (tuple2!11907 key1!49 v2!16))) (Cons!17668 (ite c!93396 (h!18799 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) (tuple2!11907 key1!49 v2!16)) e!493213))))

(assert (=> bm!39162 d!109645))

(declare-fun d!109647 () Bool)

(declare-fun res!601782 () Bool)

(declare-fun e!493436 () Bool)

(assert (=> d!109647 (=> res!601782 e!493436)))

(assert (=> d!109647 (= res!601782 (or ((_ is Nil!17669) lt!401089) ((_ is Nil!17669) (t!24949 lt!401089))))))

(assert (=> d!109647 (= (isStrictlySorted!490 lt!401089) e!493436)))

(declare-fun b!886463 () Bool)

(declare-fun e!493438 () Bool)

(assert (=> b!886463 (= e!493436 e!493438)))

(declare-fun res!601784 () Bool)

(assert (=> b!886463 (=> (not res!601784) (not e!493438))))

(assert (=> b!886463 (= res!601784 (bvslt (_1!5964 (h!18799 lt!401089)) (_1!5964 (h!18799 (t!24949 lt!401089)))))))

(declare-fun b!886465 () Bool)

(assert (=> b!886465 (= e!493438 (isStrictlySorted!490 (t!24949 lt!401089)))))

(assert (= (and d!109647 (not res!601782)) b!886463))

(assert (= (and b!886463 res!601784) b!886465))

(declare-fun m!826341 () Bool)

(assert (=> b!886465 m!826341))

(assert (=> d!109501 d!109647))

(declare-fun d!109651 () Bool)

(declare-fun res!601786 () Bool)

(declare-fun e!493440 () Bool)

(assert (=> d!109651 (=> res!601786 e!493440)))

(assert (=> d!109651 (= res!601786 (or ((_ is Nil!17669) (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) ((_ is Nil!17669) (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)))))))

(assert (=> d!109651 (= (isStrictlySorted!490 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38)) e!493440)))

(declare-fun b!886467 () Bool)

(declare-fun e!493441 () Bool)

(assert (=> b!886467 (= e!493440 e!493441)))

(declare-fun res!601787 () Bool)

(assert (=> b!886467 (=> (not res!601787) (not e!493441))))

(assert (=> b!886467 (= res!601787 (bvslt (_1!5964 (h!18799 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))) (_1!5964 (h!18799 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))))))))

(declare-fun b!886468 () Bool)

(assert (=> b!886468 (= e!493441 (isStrictlySorted!490 (t!24949 (insertStrictlySorted!298 (t!24949 l!906) key1!49 v1!38))))))

(assert (= (and d!109651 (not res!601786)) b!886467))

(assert (= (and b!886467 res!601787) b!886468))

(assert (=> b!886468 m!826217))

(assert (=> d!109501 d!109651))

(declare-fun b!886471 () Bool)

(declare-fun e!493444 () Bool)

(declare-fun tp!54381 () Bool)

(assert (=> b!886471 (= e!493444 (and tp_is_empty!17811 tp!54381))))

(assert (=> b!886267 (= tp!54377 e!493444)))

(assert (= (and b!886267 ((_ is Cons!17668) (t!24949 (t!24949 l!906)))) b!886471))

(check-sat (not b!886354) (not b!886471) (not b!886348) (not b!886456) (not b!886434) (not b!886323) (not d!109559) (not b!886382) (not b!886387) (not b!886370) (not b!886376) (not b!886468) (not d!109615) (not b!886372) (not d!109561) (not d!109601) (not b!886460) (not b!886410) (not b!886351) (not b!886465) (not d!109551) (not b!886452) (not b!886333) (not b!886325) (not bm!39219) (not d!109563) (not d!109565) (not b!886336) (not b!886412) (not b!886454) (not d!109623) (not d!109567) (not bm!39228) (not b!886368) (not d!109603) (not b!886450) (not b!886318) tp_is_empty!17811 (not d!109597) (not b!886322) (not bm!39222) (not b!886385) (not b!886326) (not b!886353) (not bm!39225) (not b!886388) (not b!886438) (not b!886335) (not b!886416) (not b!886384))
(check-sat)
