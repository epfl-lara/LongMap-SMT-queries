; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43894 () Bool)

(assert start!43894)

(declare-fun b!484722 () Bool)

(declare-fun res!288752 () Bool)

(declare-fun e!285349 () Bool)

(assert (=> b!484722 (=> (not res!288752) (not e!285349))))

(declare-datatypes ((B!1146 0))(
  ( (B!1147 (val!7025 Int)) )
))
(declare-datatypes ((tuple2!9252 0))(
  ( (tuple2!9253 (_1!4637 (_ BitVec 64)) (_2!4637 B!1146)) )
))
(declare-datatypes ((List!9289 0))(
  ( (Nil!9286) (Cons!9285 (h!10141 tuple2!9252) (t!15511 List!9289)) )
))
(declare-fun l!956 () List!9289)

(declare-fun isStrictlySorted!428 (List!9289) Bool)

(assert (=> b!484722 (= res!288752 (isStrictlySorted!428 (t!15511 l!956)))))

(declare-fun b!484723 () Bool)

(declare-fun lt!219424 () List!9289)

(declare-fun length!13 (List!9289) Int)

(assert (=> b!484723 (= e!285349 (not (= (length!13 lt!219424) (+ 1 (length!13 l!956)))))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun value!166 () B!1146)

(declare-fun insertStrictlySorted!243 (List!9289 (_ BitVec 64) B!1146) List!9289)

(assert (=> b!484723 (= (length!13 (insertStrictlySorted!243 (t!15511 l!956) key!251 value!166)) (+ 1 (length!13 (t!15511 l!956))))))

(declare-datatypes ((Unit!14186 0))(
  ( (Unit!14187) )
))
(declare-fun lt!219423 () Unit!14186)

(declare-fun lemmaAddNewKeyIncrementSize!6 (List!9289 (_ BitVec 64) B!1146) Unit!14186)

(assert (=> b!484723 (= lt!219423 (lemmaAddNewKeyIncrementSize!6 (t!15511 l!956) key!251 value!166))))

(declare-fun b!484724 () Bool)

(declare-fun e!285351 () Bool)

(declare-fun tp_is_empty!13955 () Bool)

(declare-fun tp!43558 () Bool)

(assert (=> b!484724 (= e!285351 (and tp_is_empty!13955 tp!43558))))

(declare-fun res!288753 () Bool)

(declare-fun e!285350 () Bool)

(assert (=> start!43894 (=> (not res!288753) (not e!285350))))

(assert (=> start!43894 (= res!288753 (isStrictlySorted!428 l!956))))

(assert (=> start!43894 e!285350))

(assert (=> start!43894 e!285351))

(assert (=> start!43894 true))

(assert (=> start!43894 tp_is_empty!13955))

(declare-fun b!484725 () Bool)

(assert (=> b!484725 (= e!285350 e!285349)))

(declare-fun res!288751 () Bool)

(assert (=> b!484725 (=> (not res!288751) (not e!285349))))

(assert (=> b!484725 (= res!288751 (and (is-Cons!9285 l!956) (bvslt (_1!4637 (h!10141 l!956)) key!251)))))

(assert (=> b!484725 (= lt!219424 (insertStrictlySorted!243 l!956 key!251 value!166))))

(declare-fun b!484726 () Bool)

(declare-fun res!288755 () Bool)

(assert (=> b!484726 (=> (not res!288755) (not e!285349))))

(declare-fun containsKey!391 (List!9289 (_ BitVec 64)) Bool)

(assert (=> b!484726 (= res!288755 (not (containsKey!391 (t!15511 l!956) key!251)))))

(declare-fun b!484727 () Bool)

(declare-fun res!288754 () Bool)

(assert (=> b!484727 (=> (not res!288754) (not e!285350))))

(assert (=> b!484727 (= res!288754 (not (containsKey!391 l!956 key!251)))))

(assert (= (and start!43894 res!288753) b!484727))

(assert (= (and b!484727 res!288754) b!484725))

(assert (= (and b!484725 res!288751) b!484722))

(assert (= (and b!484722 res!288752) b!484726))

(assert (= (and b!484726 res!288755) b!484723))

(assert (= (and start!43894 (is-Cons!9285 l!956)) b!484724))

(declare-fun m!465149 () Bool)

(assert (=> b!484726 m!465149))

(declare-fun m!465151 () Bool)

(assert (=> b!484727 m!465151))

(declare-fun m!465153 () Bool)

(assert (=> start!43894 m!465153))

(declare-fun m!465155 () Bool)

(assert (=> b!484722 m!465155))

(declare-fun m!465157 () Bool)

(assert (=> b!484725 m!465157))

(declare-fun m!465159 () Bool)

(assert (=> b!484723 m!465159))

(declare-fun m!465161 () Bool)

(assert (=> b!484723 m!465161))

(declare-fun m!465163 () Bool)

(assert (=> b!484723 m!465163))

(declare-fun m!465165 () Bool)

(assert (=> b!484723 m!465165))

(assert (=> b!484723 m!465159))

(declare-fun m!465167 () Bool)

(assert (=> b!484723 m!465167))

(declare-fun m!465169 () Bool)

(assert (=> b!484723 m!465169))

(push 1)

(assert (not b!484724))

(assert (not b!484725))

(assert (not b!484727))

(assert tp_is_empty!13955)

(assert (not b!484722))

(assert (not b!484726))

(assert (not b!484723))

(assert (not start!43894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!484794 () Bool)

(declare-fun e!285393 () List!9289)

(declare-fun call!31167 () List!9289)

(assert (=> b!484794 (= e!285393 call!31167)))

(declare-fun b!484795 () Bool)

(declare-fun c!58315 () Bool)

(declare-fun c!58316 () Bool)

(declare-fun e!285392 () List!9289)

(assert (=> b!484795 (= e!285392 (ite c!58316 (t!15511 (t!15511 l!956)) (ite c!58315 (Cons!9285 (h!10141 (t!15511 l!956)) (t!15511 (t!15511 l!956))) Nil!9286)))))

(declare-fun b!484797 () Bool)

(assert (=> b!484797 (= e!285392 (insertStrictlySorted!243 (t!15511 (t!15511 l!956)) key!251 value!166))))

(declare-fun b!484798 () Bool)

(declare-fun e!285396 () List!9289)

(declare-fun e!285395 () List!9289)

(assert (=> b!484798 (= e!285396 e!285395)))

(assert (=> b!484798 (= c!58316 (and (is-Cons!9285 (t!15511 l!956)) (= (_1!4637 (h!10141 (t!15511 l!956))) key!251)))))

(declare-fun d!77151 () Bool)

(declare-fun e!285394 () Bool)

(assert (=> d!77151 e!285394))

(declare-fun res!288778 () Bool)

(assert (=> d!77151 (=> (not res!288778) (not e!285394))))

(declare-fun lt!219431 () List!9289)

(assert (=> d!77151 (= res!288778 (isStrictlySorted!428 lt!219431))))

(assert (=> d!77151 (= lt!219431 e!285396)))

(declare-fun c!58317 () Bool)

(assert (=> d!77151 (= c!58317 (and (is-Cons!9285 (t!15511 l!956)) (bvslt (_1!4637 (h!10141 (t!15511 l!956))) key!251)))))

(assert (=> d!77151 (isStrictlySorted!428 (t!15511 l!956))))

(assert (=> d!77151 (= (insertStrictlySorted!243 (t!15511 l!956) key!251 value!166) lt!219431)))

(declare-fun b!484796 () Bool)

(declare-fun call!31165 () List!9289)

(assert (=> b!484796 (= e!285395 call!31165)))

(declare-fun bm!31160 () Bool)

(declare-fun call!31166 () List!9289)

(declare-fun $colon$colon!125 (List!9289 tuple2!9252) List!9289)

(assert (=> bm!31160 (= call!31166 ($colon$colon!125 e!285392 (ite c!58317 (h!10141 (t!15511 l!956)) (tuple2!9253 key!251 value!166))))))

(declare-fun c!58318 () Bool)

(assert (=> bm!31160 (= c!58318 c!58317)))

(declare-fun b!484799 () Bool)

(declare-fun res!288779 () Bool)

(assert (=> b!484799 (=> (not res!288779) (not e!285394))))

(assert (=> b!484799 (= res!288779 (containsKey!391 lt!219431 key!251))))

(declare-fun b!484800 () Bool)

(assert (=> b!484800 (= c!58315 (and (is-Cons!9285 (t!15511 l!956)) (bvsgt (_1!4637 (h!10141 (t!15511 l!956))) key!251)))))

(assert (=> b!484800 (= e!285395 e!285393)))

(declare-fun bm!31161 () Bool)

(assert (=> bm!31161 (= call!31165 call!31166)))

(declare-fun b!484801 () Bool)

(assert (=> b!484801 (= e!285396 call!31166)))

(declare-fun bm!31162 () Bool)

(assert (=> bm!31162 (= call!31167 call!31165)))

(declare-fun b!484802 () Bool)

(declare-fun contains!2685 (List!9289 tuple2!9252) Bool)

(assert (=> b!484802 (= e!285394 (contains!2685 lt!219431 (tuple2!9253 key!251 value!166)))))

(declare-fun b!484803 () Bool)

(assert (=> b!484803 (= e!285393 call!31167)))

(assert (= (and d!77151 c!58317) b!484801))

(assert (= (and d!77151 (not c!58317)) b!484798))

(assert (= (and b!484798 c!58316) b!484796))

(assert (= (and b!484798 (not c!58316)) b!484800))

(assert (= (and b!484800 c!58315) b!484803))

(assert (= (and b!484800 (not c!58315)) b!484794))

(assert (= (or b!484803 b!484794) bm!31162))

(assert (= (or b!484796 bm!31162) bm!31161))

(assert (= (or b!484801 bm!31161) bm!31160))

(assert (= (and bm!31160 c!58318) b!484797))

(assert (= (and bm!31160 (not c!58318)) b!484795))

(assert (= (and d!77151 res!288778) b!484799))

(assert (= (and b!484799 res!288779) b!484802))

(declare-fun m!465173 () Bool)

(assert (=> bm!31160 m!465173))

(declare-fun m!465175 () Bool)

(assert (=> b!484799 m!465175))

(declare-fun m!465177 () Bool)

(assert (=> b!484802 m!465177))

(declare-fun m!465179 () Bool)

(assert (=> b!484797 m!465179))

(declare-fun m!465181 () Bool)

(assert (=> d!77151 m!465181))

(assert (=> d!77151 m!465155))

(assert (=> b!484723 d!77151))

(declare-fun d!77159 () Bool)

(declare-fun size!15461 (List!9289) Int)

(assert (=> d!77159 (= (length!13 (insertStrictlySorted!243 (t!15511 l!956) key!251 value!166)) (size!15461 (insertStrictlySorted!243 (t!15511 l!956) key!251 value!166)))))

(declare-fun bs!15427 () Bool)

(assert (= bs!15427 d!77159))

(assert (=> bs!15427 m!465159))

(declare-fun m!465183 () Bool)

(assert (=> bs!15427 m!465183))

(assert (=> b!484723 d!77159))

(declare-fun d!77161 () Bool)

(assert (=> d!77161 (= (length!13 (insertStrictlySorted!243 (t!15511 l!956) key!251 value!166)) (+ (length!13 (t!15511 l!956)) 1))))

(declare-fun lt!219435 () Unit!14186)

(declare-fun choose!1383 (List!9289 (_ BitVec 64) B!1146) Unit!14186)

(assert (=> d!77161 (= lt!219435 (choose!1383 (t!15511 l!956) key!251 value!166))))

(assert (=> d!77161 (isStrictlySorted!428 (t!15511 l!956))))

(assert (=> d!77161 (= (lemmaAddNewKeyIncrementSize!6 (t!15511 l!956) key!251 value!166) lt!219435)))

(declare-fun bs!15429 () Bool)

(assert (= bs!15429 d!77161))

(assert (=> bs!15429 m!465159))

(assert (=> bs!15429 m!465163))

(declare-fun m!465197 () Bool)

(assert (=> bs!15429 m!465197))

(assert (=> bs!15429 m!465155))

(assert (=> bs!15429 m!465159))

(assert (=> bs!15429 m!465161))

(assert (=> b!484723 d!77161))

(declare-fun d!77167 () Bool)

(assert (=> d!77167 (= (length!13 lt!219424) (size!15461 lt!219424))))

(declare-fun bs!15430 () Bool)

(assert (= bs!15430 d!77167))

(declare-fun m!465199 () Bool)

(assert (=> bs!15430 m!465199))

(assert (=> b!484723 d!77167))

(declare-fun d!77169 () Bool)

(assert (=> d!77169 (= (length!13 (t!15511 l!956)) (size!15461 (t!15511 l!956)))))

(declare-fun bs!15431 () Bool)

(assert (= bs!15431 d!77169))

(declare-fun m!465201 () Bool)

(assert (=> bs!15431 m!465201))

(assert (=> b!484723 d!77169))

(declare-fun d!77171 () Bool)

(assert (=> d!77171 (= (length!13 l!956) (size!15461 l!956))))

(declare-fun bs!15432 () Bool)

(assert (= bs!15432 d!77171))

(declare-fun m!465203 () Bool)

(assert (=> bs!15432 m!465203))

(assert (=> b!484723 d!77171))

(declare-fun b!484832 () Bool)

(declare-fun e!285412 () List!9289)

(declare-fun call!31178 () List!9289)

(assert (=> b!484832 (= e!285412 call!31178)))

(declare-fun c!58330 () Bool)

(declare-fun e!285411 () List!9289)

(declare-fun c!58329 () Bool)

(declare-fun b!484833 () Bool)

(assert (=> b!484833 (= e!285411 (ite c!58330 (t!15511 l!956) (ite c!58329 (Cons!9285 (h!10141 l!956) (t!15511 l!956)) Nil!9286)))))

(declare-fun b!484835 () Bool)

(assert (=> b!484835 (= e!285411 (insertStrictlySorted!243 (t!15511 l!956) key!251 value!166))))

(declare-fun b!484836 () Bool)

(declare-fun e!285415 () List!9289)

(declare-fun e!285414 () List!9289)

(assert (=> b!484836 (= e!285415 e!285414)))

(assert (=> b!484836 (= c!58330 (and (is-Cons!9285 l!956) (= (_1!4637 (h!10141 l!956)) key!251)))))

(declare-fun d!77173 () Bool)

(declare-fun e!285413 () Bool)

(assert (=> d!77173 e!285413))

(declare-fun res!288788 () Bool)

(assert (=> d!77173 (=> (not res!288788) (not e!285413))))

(declare-fun lt!219437 () List!9289)

(assert (=> d!77173 (= res!288788 (isStrictlySorted!428 lt!219437))))

(assert (=> d!77173 (= lt!219437 e!285415)))

(declare-fun c!58331 () Bool)

(assert (=> d!77173 (= c!58331 (and (is-Cons!9285 l!956) (bvslt (_1!4637 (h!10141 l!956)) key!251)))))

(assert (=> d!77173 (isStrictlySorted!428 l!956)))

(assert (=> d!77173 (= (insertStrictlySorted!243 l!956 key!251 value!166) lt!219437)))

(declare-fun b!484834 () Bool)

(declare-fun call!31176 () List!9289)

(assert (=> b!484834 (= e!285414 call!31176)))

(declare-fun bm!31173 () Bool)

(declare-fun call!31177 () List!9289)

(assert (=> bm!31173 (= call!31177 ($colon$colon!125 e!285411 (ite c!58331 (h!10141 l!956) (tuple2!9253 key!251 value!166))))))

(declare-fun c!58332 () Bool)

(assert (=> bm!31173 (= c!58332 c!58331)))

(declare-fun b!484837 () Bool)

(declare-fun res!288789 () Bool)

(assert (=> b!484837 (=> (not res!288789) (not e!285413))))

(assert (=> b!484837 (= res!288789 (containsKey!391 lt!219437 key!251))))

(declare-fun b!484838 () Bool)

(assert (=> b!484838 (= c!58329 (and (is-Cons!9285 l!956) (bvsgt (_1!4637 (h!10141 l!956)) key!251)))))

(assert (=> b!484838 (= e!285414 e!285412)))

(declare-fun bm!31174 () Bool)

(assert (=> bm!31174 (= call!31176 call!31177)))

(declare-fun b!484839 () Bool)

(assert (=> b!484839 (= e!285415 call!31177)))

(declare-fun bm!31175 () Bool)

(assert (=> bm!31175 (= call!31178 call!31176)))

(declare-fun b!484840 () Bool)

(assert (=> b!484840 (= e!285413 (contains!2685 lt!219437 (tuple2!9253 key!251 value!166)))))

(declare-fun b!484841 () Bool)

(assert (=> b!484841 (= e!285412 call!31178)))

(assert (= (and d!77173 c!58331) b!484839))

(assert (= (and d!77173 (not c!58331)) b!484836))

(assert (= (and b!484836 c!58330) b!484834))

(assert (= (and b!484836 (not c!58330)) b!484838))

(assert (= (and b!484838 c!58329) b!484841))

(assert (= (and b!484838 (not c!58329)) b!484832))

(assert (= (or b!484841 b!484832) bm!31175))

(assert (= (or b!484834 bm!31175) bm!31174))

(assert (= (or b!484839 bm!31174) bm!31173))

(assert (= (and bm!31173 c!58332) b!484835))

(assert (= (and bm!31173 (not c!58332)) b!484833))

(assert (= (and d!77173 res!288788) b!484837))

(assert (= (and b!484837 res!288789) b!484840))

(declare-fun m!465215 () Bool)

(assert (=> bm!31173 m!465215))

(declare-fun m!465217 () Bool)

(assert (=> b!484837 m!465217))

(declare-fun m!465219 () Bool)

(assert (=> b!484840 m!465219))

(assert (=> b!484835 m!465159))

(declare-fun m!465221 () Bool)

(assert (=> d!77173 m!465221))

(assert (=> d!77173 m!465153))

(assert (=> b!484725 d!77173))

(declare-fun d!77177 () Bool)

(declare-fun res!288798 () Bool)

(declare-fun e!285424 () Bool)

(assert (=> d!77177 (=> res!288798 e!285424)))

(assert (=> d!77177 (= res!288798 (and (is-Cons!9285 (t!15511 l!956)) (= (_1!4637 (h!10141 (t!15511 l!956))) key!251)))))

(assert (=> d!77177 (= (containsKey!391 (t!15511 l!956) key!251) e!285424)))

(declare-fun b!484850 () Bool)

(declare-fun e!285425 () Bool)

(assert (=> b!484850 (= e!285424 e!285425)))

(declare-fun res!288799 () Bool)

(assert (=> b!484850 (=> (not res!288799) (not e!285425))))

(assert (=> b!484850 (= res!288799 (and (or (not (is-Cons!9285 (t!15511 l!956))) (bvsle (_1!4637 (h!10141 (t!15511 l!956))) key!251)) (is-Cons!9285 (t!15511 l!956)) (bvslt (_1!4637 (h!10141 (t!15511 l!956))) key!251)))))

(declare-fun b!484851 () Bool)

(assert (=> b!484851 (= e!285425 (containsKey!391 (t!15511 (t!15511 l!956)) key!251))))

(assert (= (and d!77177 (not res!288798)) b!484850))

(assert (= (and b!484850 res!288799) b!484851))

(declare-fun m!465237 () Bool)

(assert (=> b!484851 m!465237))

(assert (=> b!484726 d!77177))

(declare-fun d!77193 () Bool)

(declare-fun res!288810 () Bool)

(declare-fun e!285441 () Bool)

(assert (=> d!77193 (=> res!288810 e!285441)))

(assert (=> d!77193 (= res!288810 (or (is-Nil!9286 (t!15511 l!956)) (is-Nil!9286 (t!15511 (t!15511 l!956)))))))

(assert (=> d!77193 (= (isStrictlySorted!428 (t!15511 l!956)) e!285441)))

(declare-fun b!484874 () Bool)

(declare-fun e!285442 () Bool)

(assert (=> b!484874 (= e!285441 e!285442)))

(declare-fun res!288811 () Bool)

(assert (=> b!484874 (=> (not res!288811) (not e!285442))))

(assert (=> b!484874 (= res!288811 (bvslt (_1!4637 (h!10141 (t!15511 l!956))) (_1!4637 (h!10141 (t!15511 (t!15511 l!956))))))))

(declare-fun b!484875 () Bool)

(assert (=> b!484875 (= e!285442 (isStrictlySorted!428 (t!15511 (t!15511 l!956))))))

(assert (= (and d!77193 (not res!288810)) b!484874))

(assert (= (and b!484874 res!288811) b!484875))

(declare-fun m!465253 () Bool)

(assert (=> b!484875 m!465253))

(assert (=> b!484722 d!77193))

(declare-fun d!77203 () Bool)

(declare-fun res!288812 () Bool)

(declare-fun e!285443 () Bool)

(assert (=> d!77203 (=> res!288812 e!285443)))

(assert (=> d!77203 (= res!288812 (or (is-Nil!9286 l!956) (is-Nil!9286 (t!15511 l!956))))))

(assert (=> d!77203 (= (isStrictlySorted!428 l!956) e!285443)))

(declare-fun b!484876 () Bool)

(declare-fun e!285444 () Bool)

(assert (=> b!484876 (= e!285443 e!285444)))

(declare-fun res!288813 () Bool)

(assert (=> b!484876 (=> (not res!288813) (not e!285444))))

(assert (=> b!484876 (= res!288813 (bvslt (_1!4637 (h!10141 l!956)) (_1!4637 (h!10141 (t!15511 l!956)))))))

(declare-fun b!484877 () Bool)

(assert (=> b!484877 (= e!285444 (isStrictlySorted!428 (t!15511 l!956)))))

(assert (= (and d!77203 (not res!288812)) b!484876))

(assert (= (and b!484876 res!288813) b!484877))

(assert (=> b!484877 m!465155))

(assert (=> start!43894 d!77203))

(declare-fun d!77205 () Bool)

(declare-fun res!288814 () Bool)

(declare-fun e!285446 () Bool)

(assert (=> d!77205 (=> res!288814 e!285446)))

(assert (=> d!77205 (= res!288814 (and (is-Cons!9285 l!956) (= (_1!4637 (h!10141 l!956)) key!251)))))

(assert (=> d!77205 (= (containsKey!391 l!956 key!251) e!285446)))

(declare-fun b!484879 () Bool)

(declare-fun e!285447 () Bool)

(assert (=> b!484879 (= e!285446 e!285447)))

(declare-fun res!288815 () Bool)

(assert (=> b!484879 (=> (not res!288815) (not e!285447))))

(assert (=> b!484879 (= res!288815 (and (or (not (is-Cons!9285 l!956)) (bvsle (_1!4637 (h!10141 l!956)) key!251)) (is-Cons!9285 l!956) (bvslt (_1!4637 (h!10141 l!956)) key!251)))))

(declare-fun b!484880 () Bool)

(assert (=> b!484880 (= e!285447 (containsKey!391 (t!15511 l!956) key!251))))

(assert (= (and d!77205 (not res!288814)) b!484879))

(assert (= (and b!484879 res!288815) b!484880))

(assert (=> b!484880 m!465149))

(assert (=> b!484727 d!77205))

(declare-fun b!484885 () Bool)

(declare-fun e!285450 () Bool)

(declare-fun tp!43564 () Bool)

(assert (=> b!484885 (= e!285450 (and tp_is_empty!13955 tp!43564))))

(assert (=> b!484724 (= tp!43558 e!285450)))

(assert (= (and b!484724 (is-Cons!9285 (t!15511 l!956))) b!484885))

(push 1)

(assert (not b!484880))

(assert (not bm!31160))

(assert (not b!484877))

(assert (not d!77171))

(assert tp_is_empty!13955)

(assert (not b!484837))

(assert (not d!77173))

(assert (not d!77151))

(assert (not b!484885))

(assert (not b!484851))

(assert (not b!484875))

(assert (not b!484797))

(assert (not bm!31173))

(assert (not b!484835))

(assert (not b!484840))

(assert (not d!77159))

(assert (not d!77161))

(assert (not b!484802))

(assert (not d!77167))

(assert (not d!77169))

(assert (not b!484799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77277 () Bool)

(declare-fun res!288872 () Bool)

(declare-fun e!285533 () Bool)

(assert (=> d!77277 (=> res!288872 e!285533)))

(assert (=> d!77277 (= res!288872 (or (is-Nil!9286 (t!15511 (t!15511 l!956))) (is-Nil!9286 (t!15511 (t!15511 (t!15511 l!956))))))))

(assert (=> d!77277 (= (isStrictlySorted!428 (t!15511 (t!15511 l!956))) e!285533)))

(declare-fun b!484997 () Bool)

(declare-fun e!285534 () Bool)

(assert (=> b!484997 (= e!285533 e!285534)))

(declare-fun res!288873 () Bool)

(assert (=> b!484997 (=> (not res!288873) (not e!285534))))

(assert (=> b!484997 (= res!288873 (bvslt (_1!4637 (h!10141 (t!15511 (t!15511 l!956)))) (_1!4637 (h!10141 (t!15511 (t!15511 (t!15511 l!956)))))))))

(declare-fun b!484998 () Bool)

(assert (=> b!484998 (= e!285534 (isStrictlySorted!428 (t!15511 (t!15511 (t!15511 l!956)))))))

(assert (= (and d!77277 (not res!288872)) b!484997))

(assert (= (and b!484997 res!288873) b!484998))

(declare-fun m!465347 () Bool)

(assert (=> b!484998 m!465347))

(assert (=> b!484875 d!77277))

(declare-fun d!77279 () Bool)

(declare-fun res!288874 () Bool)

(declare-fun e!285535 () Bool)

(assert (=> d!77279 (=> res!288874 e!285535)))

(assert (=> d!77279 (= res!288874 (and (is-Cons!9285 lt!219431) (= (_1!4637 (h!10141 lt!219431)) key!251)))))

(assert (=> d!77279 (= (containsKey!391 lt!219431 key!251) e!285535)))

(declare-fun b!484999 () Bool)

(declare-fun e!285536 () Bool)

(assert (=> b!484999 (= e!285535 e!285536)))

(declare-fun res!288875 () Bool)

(assert (=> b!484999 (=> (not res!288875) (not e!285536))))

(assert (=> b!484999 (= res!288875 (and (or (not (is-Cons!9285 lt!219431)) (bvsle (_1!4637 (h!10141 lt!219431)) key!251)) (is-Cons!9285 lt!219431) (bvslt (_1!4637 (h!10141 lt!219431)) key!251)))))

(declare-fun b!485000 () Bool)

(assert (=> b!485000 (= e!285536 (containsKey!391 (t!15511 lt!219431) key!251))))

(assert (= (and d!77279 (not res!288874)) b!484999))

(assert (= (and b!484999 res!288875) b!485000))

(declare-fun m!465349 () Bool)

(assert (=> b!485000 m!465349))

(assert (=> b!484799 d!77279))

(declare-fun d!77281 () Bool)

(declare-fun res!288876 () Bool)

(declare-fun e!285537 () Bool)

(assert (=> d!77281 (=> res!288876 e!285537)))

(assert (=> d!77281 (= res!288876 (and (is-Cons!9285 (t!15511 (t!15511 l!956))) (= (_1!4637 (h!10141 (t!15511 (t!15511 l!956)))) key!251)))))

(assert (=> d!77281 (= (containsKey!391 (t!15511 (t!15511 l!956)) key!251) e!285537)))

(declare-fun b!485001 () Bool)

(declare-fun e!285538 () Bool)

(assert (=> b!485001 (= e!285537 e!285538)))

(declare-fun res!288877 () Bool)

(assert (=> b!485001 (=> (not res!288877) (not e!285538))))

(assert (=> b!485001 (= res!288877 (and (or (not (is-Cons!9285 (t!15511 (t!15511 l!956)))) (bvsle (_1!4637 (h!10141 (t!15511 (t!15511 l!956)))) key!251)) (is-Cons!9285 (t!15511 (t!15511 l!956))) (bvslt (_1!4637 (h!10141 (t!15511 (t!15511 l!956)))) key!251)))))

(declare-fun b!485002 () Bool)

(assert (=> b!485002 (= e!285538 (containsKey!391 (t!15511 (t!15511 (t!15511 l!956))) key!251))))

(assert (= (and d!77281 (not res!288876)) b!485001))

(assert (= (and b!485001 res!288877) b!485002))

(declare-fun m!465351 () Bool)

(assert (=> b!485002 m!465351))

(assert (=> b!484851 d!77281))

(declare-fun d!77283 () Bool)

(assert (=> d!77283 (= ($colon$colon!125 e!285392 (ite c!58317 (h!10141 (t!15511 l!956)) (tuple2!9253 key!251 value!166))) (Cons!9285 (ite c!58317 (h!10141 (t!15511 l!956)) (tuple2!9253 key!251 value!166)) e!285392))))

(assert (=> bm!31160 d!77283))

(declare-fun d!77285 () Bool)

(declare-fun res!288878 () Bool)

(declare-fun e!285539 () Bool)

(assert (=> d!77285 (=> res!288878 e!285539)))

(assert (=> d!77285 (= res!288878 (or (is-Nil!9286 lt!219431) (is-Nil!9286 (t!15511 lt!219431))))))

(assert (=> d!77285 (= (isStrictlySorted!428 lt!219431) e!285539)))

(declare-fun b!485003 () Bool)

(declare-fun e!285540 () Bool)

(assert (=> b!485003 (= e!285539 e!285540)))

(declare-fun res!288879 () Bool)

(assert (=> b!485003 (=> (not res!288879) (not e!285540))))

(assert (=> b!485003 (= res!288879 (bvslt (_1!4637 (h!10141 lt!219431)) (_1!4637 (h!10141 (t!15511 lt!219431)))))))

(declare-fun b!485004 () Bool)

(assert (=> b!485004 (= e!285540 (isStrictlySorted!428 (t!15511 lt!219431)))))

(assert (= (and d!77285 (not res!288878)) b!485003))

(assert (= (and b!485003 res!288879) b!485004))

(declare-fun m!465353 () Bool)

(assert (=> b!485004 m!465353))

(assert (=> d!77151 d!77285))

(assert (=> d!77151 d!77193))

(declare-fun d!77287 () Bool)

(declare-fun lt!219470 () Int)

(assert (=> d!77287 (>= lt!219470 0)))

(declare-fun e!285543 () Int)

(assert (=> d!77287 (= lt!219470 e!285543)))

(declare-fun c!58363 () Bool)

(assert (=> d!77287 (= c!58363 (is-Nil!9286 l!956))))

(assert (=> d!77287 (= (size!15461 l!956) lt!219470)))

(declare-fun b!485009 () Bool)

(assert (=> b!485009 (= e!285543 0)))

(declare-fun b!485010 () Bool)

(assert (=> b!485010 (= e!285543 (+ 1 (size!15461 (t!15511 l!956))))))

(assert (= (and d!77287 c!58363) b!485009))

(assert (= (and d!77287 (not c!58363)) b!485010))

(assert (=> b!485010 m!465201))

(assert (=> d!77171 d!77287))

(declare-fun lt!219473 () Bool)

(declare-fun d!77289 () Bool)

(declare-fun content!215 (List!9289) (Set tuple2!9252))

(assert (=> d!77289 (= lt!219473 (member (tuple2!9253 key!251 value!166) (content!215 lt!219437)))))

(declare-fun e!285549 () Bool)

(assert (=> d!77289 (= lt!219473 e!285549)))

(declare-fun res!288884 () Bool)

(assert (=> d!77289 (=> (not res!288884) (not e!285549))))

(assert (=> d!77289 (= res!288884 (is-Cons!9285 lt!219437))))

(assert (=> d!77289 (= (contains!2685 lt!219437 (tuple2!9253 key!251 value!166)) lt!219473)))

(declare-fun b!485015 () Bool)

(declare-fun e!285548 () Bool)

(assert (=> b!485015 (= e!285549 e!285548)))

(declare-fun res!288885 () Bool)

(assert (=> b!485015 (=> res!288885 e!285548)))

(assert (=> b!485015 (= res!288885 (= (h!10141 lt!219437) (tuple2!9253 key!251 value!166)))))

(declare-fun b!485016 () Bool)

(assert (=> b!485016 (= e!285548 (contains!2685 (t!15511 lt!219437) (tuple2!9253 key!251 value!166)))))

(assert (= (and d!77289 res!288884) b!485015))

(assert (= (and b!485015 (not res!288885)) b!485016))

(declare-fun m!465355 () Bool)

(assert (=> d!77289 m!465355))

(declare-fun m!465357 () Bool)

(assert (=> d!77289 m!465357))

(declare-fun m!465359 () Bool)

(assert (=> b!485016 m!465359))

(assert (=> b!484840 d!77289))

(assert (=> b!484877 d!77193))

(declare-fun d!77291 () Bool)

(declare-fun lt!219474 () Int)

(assert (=> d!77291 (>= lt!219474 0)))

(declare-fun e!285550 () Int)

(assert (=> d!77291 (= lt!219474 e!285550)))

(declare-fun c!58364 () Bool)

(assert (=> d!77291 (= c!58364 (is-Nil!9286 lt!219424))))

(assert (=> d!77291 (= (size!15461 lt!219424) lt!219474)))

(declare-fun b!485017 () Bool)

(assert (=> b!485017 (= e!285550 0)))

(declare-fun b!485018 () Bool)

(assert (=> b!485018 (= e!285550 (+ 1 (size!15461 (t!15511 lt!219424))))))

(assert (= (and d!77291 c!58364) b!485017))

(assert (= (and d!77291 (not c!58364)) b!485018))

(declare-fun m!465361 () Bool)

(assert (=> b!485018 m!465361))

(assert (=> d!77167 d!77291))

(declare-fun d!77293 () Bool)

(declare-fun lt!219475 () Int)

(assert (=> d!77293 (>= lt!219475 0)))

(declare-fun e!285551 () Int)

(assert (=> d!77293 (= lt!219475 e!285551)))

(declare-fun c!58365 () Bool)

(assert (=> d!77293 (= c!58365 (is-Nil!9286 (insertStrictlySorted!243 (t!15511 l!956) key!251 value!166)))))

(assert (=> d!77293 (= (size!15461 (insertStrictlySorted!243 (t!15511 l!956) key!251 value!166)) lt!219475)))

(declare-fun b!485019 () Bool)

(assert (=> b!485019 (= e!285551 0)))

(declare-fun b!485020 () Bool)

(assert (=> b!485020 (= e!285551 (+ 1 (size!15461 (t!15511 (insertStrictlySorted!243 (t!15511 l!956) key!251 value!166)))))))

(assert (= (and d!77293 c!58365) b!485019))

(assert (= (and d!77293 (not c!58365)) b!485020))

(declare-fun m!465363 () Bool)

(assert (=> b!485020 m!465363))

(assert (=> d!77159 d!77293))

(assert (=> b!484880 d!77177))

(assert (=> b!484835 d!77151))

(declare-fun lt!219476 () Bool)

(declare-fun d!77295 () Bool)

(assert (=> d!77295 (= lt!219476 (member (tuple2!9253 key!251 value!166) (content!215 lt!219431)))))

(declare-fun e!285553 () Bool)

(assert (=> d!77295 (= lt!219476 e!285553)))

(declare-fun res!288886 () Bool)

(assert (=> d!77295 (=> (not res!288886) (not e!285553))))

(assert (=> d!77295 (= res!288886 (is-Cons!9285 lt!219431))))

(assert (=> d!77295 (= (contains!2685 lt!219431 (tuple2!9253 key!251 value!166)) lt!219476)))

(declare-fun b!485021 () Bool)

(declare-fun e!285552 () Bool)

(assert (=> b!485021 (= e!285553 e!285552)))

(declare-fun res!288887 () Bool)

(assert (=> b!485021 (=> res!288887 e!285552)))

(assert (=> b!485021 (= res!288887 (= (h!10141 lt!219431) (tuple2!9253 key!251 value!166)))))

(declare-fun b!485022 () Bool)

(assert (=> b!485022 (= e!285552 (contains!2685 (t!15511 lt!219431) (tuple2!9253 key!251 value!166)))))

(assert (= (and d!77295 res!288886) b!485021))

(assert (= (and b!485021 (not res!288887)) b!485022))

(declare-fun m!465365 () Bool)

(assert (=> d!77295 m!465365))

(declare-fun m!465367 () Bool)

(assert (=> d!77295 m!465367))

(declare-fun m!465369 () Bool)

(assert (=> b!485022 m!465369))

(assert (=> b!484802 d!77295))

(declare-fun d!77297 () Bool)

(declare-fun res!288888 () Bool)

(declare-fun e!285554 () Bool)

(assert (=> d!77297 (=> res!288888 e!285554)))

(assert (=> d!77297 (= res!288888 (or (is-Nil!9286 lt!219437) (is-Nil!9286 (t!15511 lt!219437))))))

(assert (=> d!77297 (= (isStrictlySorted!428 lt!219437) e!285554)))

(declare-fun b!485023 () Bool)

(declare-fun e!285555 () Bool)

(assert (=> b!485023 (= e!285554 e!285555)))

(declare-fun res!288889 () Bool)

(assert (=> b!485023 (=> (not res!288889) (not e!285555))))

(assert (=> b!485023 (= res!288889 (bvslt (_1!4637 (h!10141 lt!219437)) (_1!4637 (h!10141 (t!15511 lt!219437)))))))

(declare-fun b!485024 () Bool)

(assert (=> b!485024 (= e!285555 (isStrictlySorted!428 (t!15511 lt!219437)))))

(assert (= (and d!77297 (not res!288888)) b!485023))

(assert (= (and b!485023 res!288889) b!485024))

(declare-fun m!465371 () Bool)

(assert (=> b!485024 m!465371))

(assert (=> d!77173 d!77297))

(assert (=> d!77173 d!77203))

(declare-fun d!77299 () Bool)

(assert (=> d!77299 (= ($colon$colon!125 e!285411 (ite c!58331 (h!10141 l!956) (tuple2!9253 key!251 value!166))) (Cons!9285 (ite c!58331 (h!10141 l!956) (tuple2!9253 key!251 value!166)) e!285411))))

(assert (=> bm!31173 d!77299))

(declare-fun d!77301 () Bool)

(declare-fun lt!219477 () Int)

(assert (=> d!77301 (>= lt!219477 0)))

(declare-fun e!285556 () Int)

(assert (=> d!77301 (= lt!219477 e!285556)))

(declare-fun c!58366 () Bool)

(assert (=> d!77301 (= c!58366 (is-Nil!9286 (t!15511 l!956)))))

(assert (=> d!77301 (= (size!15461 (t!15511 l!956)) lt!219477)))

(declare-fun b!485025 () Bool)

(assert (=> b!485025 (= e!285556 0)))

(declare-fun b!485026 () Bool)

(assert (=> b!485026 (= e!285556 (+ 1 (size!15461 (t!15511 (t!15511 l!956)))))))

(assert (= (and d!77301 c!58366) b!485025))

(assert (= (and d!77301 (not c!58366)) b!485026))

(declare-fun m!465373 () Bool)

(assert (=> b!485026 m!465373))

(assert (=> d!77169 d!77301))

(declare-fun d!77303 () Bool)

(declare-fun res!288890 () Bool)

(declare-fun e!285557 () Bool)

(assert (=> d!77303 (=> res!288890 e!285557)))

(assert (=> d!77303 (= res!288890 (and (is-Cons!9285 lt!219437) (= (_1!4637 (h!10141 lt!219437)) key!251)))))

(assert (=> d!77303 (= (containsKey!391 lt!219437 key!251) e!285557)))

(declare-fun b!485027 () Bool)

(declare-fun e!285558 () Bool)

(assert (=> b!485027 (= e!285557 e!285558)))

(declare-fun res!288891 () Bool)

(assert (=> b!485027 (=> (not res!288891) (not e!285558))))

(assert (=> b!485027 (= res!288891 (and (or (not (is-Cons!9285 lt!219437)) (bvsle (_1!4637 (h!10141 lt!219437)) key!251)) (is-Cons!9285 lt!219437) (bvslt (_1!4637 (h!10141 lt!219437)) key!251)))))

