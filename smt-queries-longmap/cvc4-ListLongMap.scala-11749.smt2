; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137812 () Bool)

(assert start!137812)

(declare-fun b!1583084 () Bool)

(declare-fun res!1081487 () Bool)

(declare-fun e!883594 () Bool)

(assert (=> b!1583084 (=> (not res!1081487) (not e!883594))))

(declare-datatypes ((B!2838 0))(
  ( (B!2839 (val!19781 Int)) )
))
(declare-datatypes ((tuple2!25730 0))(
  ( (tuple2!25731 (_1!12876 (_ BitVec 64)) (_2!12876 B!2838)) )
))
(declare-datatypes ((List!36901 0))(
  ( (Nil!36898) (Cons!36897 (h!38440 tuple2!25730) (t!51815 List!36901)) )
))
(declare-fun l!1065 () List!36901)

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!981 (List!36901 (_ BitVec 64)) Bool)

(assert (=> b!1583084 (= res!1081487 (containsKey!981 l!1065 key!287))))

(declare-fun b!1583085 () Bool)

(declare-fun res!1081484 () Bool)

(assert (=> b!1583085 (=> (not res!1081484) (not e!883594))))

(assert (=> b!1583085 (= res!1081484 (and (is-Cons!36897 l!1065) (not (= (_1!12876 (h!38440 l!1065)) key!287))))))

(declare-fun b!1583086 () Bool)

(declare-fun res!1081486 () Bool)

(assert (=> b!1583086 (=> (not res!1081486) (not e!883594))))

(assert (=> b!1583086 (= res!1081486 (containsKey!981 (t!51815 l!1065) key!287))))

(declare-fun b!1583087 () Bool)

(declare-fun res!1081485 () Bool)

(assert (=> b!1583087 (=> (not res!1081485) (not e!883594))))

(declare-fun isStrictlySorted!1135 (List!36901) Bool)

(assert (=> b!1583087 (= res!1081485 (isStrictlySorted!1135 (t!51815 l!1065)))))

(declare-fun b!1583088 () Bool)

(declare-datatypes ((Option!943 0))(
  ( (Some!942 (v!22470 B!2838)) (None!941) )
))
(declare-fun isDefined!608 (Option!943) Bool)

(declare-fun getValueByKey!834 (List!36901 (_ BitVec 64)) Option!943)

(assert (=> b!1583088 (= e!883594 (not (isDefined!608 (getValueByKey!834 l!1065 key!287))))))

(assert (=> b!1583088 (isDefined!608 (getValueByKey!834 (t!51815 l!1065) key!287))))

(declare-datatypes ((Unit!52283 0))(
  ( (Unit!52284) )
))
(declare-fun lt!677157 () Unit!52283)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!557 (List!36901 (_ BitVec 64)) Unit!52283)

(assert (=> b!1583088 (= lt!677157 (lemmaContainsKeyImpliesGetValueByKeyDefined!557 (t!51815 l!1065) key!287))))

(declare-fun res!1081488 () Bool)

(assert (=> start!137812 (=> (not res!1081488) (not e!883594))))

(assert (=> start!137812 (= res!1081488 (isStrictlySorted!1135 l!1065))))

(assert (=> start!137812 e!883594))

(declare-fun e!883595 () Bool)

(assert (=> start!137812 e!883595))

(assert (=> start!137812 true))

(declare-fun b!1583089 () Bool)

(declare-fun tp_is_empty!39371 () Bool)

(declare-fun tp!114899 () Bool)

(assert (=> b!1583089 (= e!883595 (and tp_is_empty!39371 tp!114899))))

(assert (= (and start!137812 res!1081488) b!1583084))

(assert (= (and b!1583084 res!1081487) b!1583085))

(assert (= (and b!1583085 res!1081484) b!1583087))

(assert (= (and b!1583087 res!1081485) b!1583086))

(assert (= (and b!1583086 res!1081486) b!1583088))

(assert (= (and start!137812 (is-Cons!36897 l!1065)) b!1583089))

(declare-fun m!1453169 () Bool)

(assert (=> b!1583087 m!1453169))

(declare-fun m!1453171 () Bool)

(assert (=> start!137812 m!1453171))

(declare-fun m!1453173 () Bool)

(assert (=> b!1583086 m!1453173))

(declare-fun m!1453175 () Bool)

(assert (=> b!1583084 m!1453175))

(declare-fun m!1453177 () Bool)

(assert (=> b!1583088 m!1453177))

(declare-fun m!1453179 () Bool)

(assert (=> b!1583088 m!1453179))

(assert (=> b!1583088 m!1453177))

(declare-fun m!1453181 () Bool)

(assert (=> b!1583088 m!1453181))

(declare-fun m!1453183 () Bool)

(assert (=> b!1583088 m!1453183))

(assert (=> b!1583088 m!1453179))

(declare-fun m!1453185 () Bool)

(assert (=> b!1583088 m!1453185))

(push 1)

(assert (not b!1583087))

(assert (not start!137812))

(assert (not b!1583089))

(assert (not b!1583086))

(assert (not b!1583084))

(assert tp_is_empty!39371)

(assert (not b!1583088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167119 () Bool)

(declare-fun res!1081505 () Bool)

(declare-fun e!883612 () Bool)

(assert (=> d!167119 (=> res!1081505 e!883612)))

(assert (=> d!167119 (= res!1081505 (and (is-Cons!36897 (t!51815 l!1065)) (= (_1!12876 (h!38440 (t!51815 l!1065))) key!287)))))

(assert (=> d!167119 (= (containsKey!981 (t!51815 l!1065) key!287) e!883612)))

(declare-fun b!1583106 () Bool)

(declare-fun e!883613 () Bool)

(assert (=> b!1583106 (= e!883612 e!883613)))

(declare-fun res!1081506 () Bool)

(assert (=> b!1583106 (=> (not res!1081506) (not e!883613))))

(assert (=> b!1583106 (= res!1081506 (and (or (not (is-Cons!36897 (t!51815 l!1065))) (bvsle (_1!12876 (h!38440 (t!51815 l!1065))) key!287)) (is-Cons!36897 (t!51815 l!1065)) (bvslt (_1!12876 (h!38440 (t!51815 l!1065))) key!287)))))

(declare-fun b!1583107 () Bool)

(assert (=> b!1583107 (= e!883613 (containsKey!981 (t!51815 (t!51815 l!1065)) key!287))))

(assert (= (and d!167119 (not res!1081505)) b!1583106))

(assert (= (and b!1583106 res!1081506) b!1583107))

(declare-fun m!1453189 () Bool)

(assert (=> b!1583107 m!1453189))

(assert (=> b!1583086 d!167119))

(declare-fun d!167127 () Bool)

(declare-fun res!1081525 () Bool)

(declare-fun e!883632 () Bool)

(assert (=> d!167127 (=> res!1081525 e!883632)))

(assert (=> d!167127 (= res!1081525 (or (is-Nil!36898 (t!51815 l!1065)) (is-Nil!36898 (t!51815 (t!51815 l!1065)))))))

(assert (=> d!167127 (= (isStrictlySorted!1135 (t!51815 l!1065)) e!883632)))

(declare-fun b!1583126 () Bool)

(declare-fun e!883633 () Bool)

(assert (=> b!1583126 (= e!883632 e!883633)))

(declare-fun res!1081526 () Bool)

(assert (=> b!1583126 (=> (not res!1081526) (not e!883633))))

(assert (=> b!1583126 (= res!1081526 (bvslt (_1!12876 (h!38440 (t!51815 l!1065))) (_1!12876 (h!38440 (t!51815 (t!51815 l!1065))))))))

(declare-fun b!1583127 () Bool)

(assert (=> b!1583127 (= e!883633 (isStrictlySorted!1135 (t!51815 (t!51815 l!1065))))))

(assert (= (and d!167127 (not res!1081525)) b!1583126))

(assert (= (and b!1583126 res!1081526) b!1583127))

(declare-fun m!1453197 () Bool)

(assert (=> b!1583127 m!1453197))

(assert (=> b!1583087 d!167127))

(declare-fun d!167137 () Bool)

(declare-fun isEmpty!1188 (Option!943) Bool)

(assert (=> d!167137 (= (isDefined!608 (getValueByKey!834 l!1065 key!287)) (not (isEmpty!1188 (getValueByKey!834 l!1065 key!287))))))

(declare-fun bs!45886 () Bool)

(assert (= bs!45886 d!167137))

(assert (=> bs!45886 m!1453177))

(declare-fun m!1453199 () Bool)

(assert (=> bs!45886 m!1453199))

(assert (=> b!1583088 d!167137))

(declare-fun b!1583165 () Bool)

(declare-fun e!883653 () Option!943)

(assert (=> b!1583165 (= e!883653 None!941)))

(declare-fun b!1583162 () Bool)

(declare-fun e!883652 () Option!943)

(assert (=> b!1583162 (= e!883652 (Some!942 (_2!12876 (h!38440 l!1065))))))

(declare-fun d!167139 () Bool)

(declare-fun c!146700 () Bool)

(assert (=> d!167139 (= c!146700 (and (is-Cons!36897 l!1065) (= (_1!12876 (h!38440 l!1065)) key!287)))))

(assert (=> d!167139 (= (getValueByKey!834 l!1065 key!287) e!883652)))

(declare-fun b!1583164 () Bool)

(assert (=> b!1583164 (= e!883653 (getValueByKey!834 (t!51815 l!1065) key!287))))

(declare-fun b!1583163 () Bool)

(assert (=> b!1583163 (= e!883652 e!883653)))

(declare-fun c!146701 () Bool)

(assert (=> b!1583163 (= c!146701 (and (is-Cons!36897 l!1065) (not (= (_1!12876 (h!38440 l!1065)) key!287))))))

(assert (= (and d!167139 c!146700) b!1583162))

(assert (= (and d!167139 (not c!146700)) b!1583163))

(assert (= (and b!1583163 c!146701) b!1583164))

(assert (= (and b!1583163 (not c!146701)) b!1583165))

(assert (=> b!1583164 m!1453179))

(assert (=> b!1583088 d!167139))

(declare-fun b!1583169 () Bool)

(declare-fun e!883655 () Option!943)

(assert (=> b!1583169 (= e!883655 None!941)))

(declare-fun b!1583166 () Bool)

(declare-fun e!883654 () Option!943)

(assert (=> b!1583166 (= e!883654 (Some!942 (_2!12876 (h!38440 (t!51815 l!1065)))))))

(declare-fun d!167151 () Bool)

(declare-fun c!146702 () Bool)

(assert (=> d!167151 (= c!146702 (and (is-Cons!36897 (t!51815 l!1065)) (= (_1!12876 (h!38440 (t!51815 l!1065))) key!287)))))

(assert (=> d!167151 (= (getValueByKey!834 (t!51815 l!1065) key!287) e!883654)))

(declare-fun b!1583168 () Bool)

(assert (=> b!1583168 (= e!883655 (getValueByKey!834 (t!51815 (t!51815 l!1065)) key!287))))

(declare-fun b!1583167 () Bool)

(assert (=> b!1583167 (= e!883654 e!883655)))

(declare-fun c!146703 () Bool)

(assert (=> b!1583167 (= c!146703 (and (is-Cons!36897 (t!51815 l!1065)) (not (= (_1!12876 (h!38440 (t!51815 l!1065))) key!287))))))

(assert (= (and d!167151 c!146702) b!1583166))

(assert (= (and d!167151 (not c!146702)) b!1583167))

(assert (= (and b!1583167 c!146703) b!1583168))

(assert (= (and b!1583167 (not c!146703)) b!1583169))

(declare-fun m!1453207 () Bool)

(assert (=> b!1583168 m!1453207))

(assert (=> b!1583088 d!167151))

(declare-fun d!167153 () Bool)

(assert (=> d!167153 (= (isDefined!608 (getValueByKey!834 (t!51815 l!1065) key!287)) (not (isEmpty!1188 (getValueByKey!834 (t!51815 l!1065) key!287))))))

(declare-fun bs!45889 () Bool)

(assert (= bs!45889 d!167153))

(assert (=> bs!45889 m!1453179))

(declare-fun m!1453209 () Bool)

(assert (=> bs!45889 m!1453209))

(assert (=> b!1583088 d!167153))

(declare-fun d!167155 () Bool)

(assert (=> d!167155 (isDefined!608 (getValueByKey!834 (t!51815 l!1065) key!287))))

(declare-fun lt!677165 () Unit!52283)

(declare-fun choose!2106 (List!36901 (_ BitVec 64)) Unit!52283)

(assert (=> d!167155 (= lt!677165 (choose!2106 (t!51815 l!1065) key!287))))

(declare-fun e!883669 () Bool)

(assert (=> d!167155 e!883669))

(declare-fun res!1081536 () Bool)

(assert (=> d!167155 (=> (not res!1081536) (not e!883669))))

(assert (=> d!167155 (= res!1081536 (isStrictlySorted!1135 (t!51815 l!1065)))))

(assert (=> d!167155 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!557 (t!51815 l!1065) key!287) lt!677165)))

(declare-fun b!1583189 () Bool)

(assert (=> b!1583189 (= e!883669 (containsKey!981 (t!51815 l!1065) key!287))))

(assert (= (and d!167155 res!1081536) b!1583189))

(assert (=> d!167155 m!1453179))

(assert (=> d!167155 m!1453179))

(assert (=> d!167155 m!1453185))

(declare-fun m!1453217 () Bool)

(assert (=> d!167155 m!1453217))

(assert (=> d!167155 m!1453169))

(assert (=> b!1583189 m!1453173))

(assert (=> b!1583088 d!167155))

(declare-fun d!167163 () Bool)

(declare-fun res!1081537 () Bool)

(declare-fun e!883671 () Bool)

(assert (=> d!167163 (=> res!1081537 e!883671)))

(assert (=> d!167163 (= res!1081537 (and (is-Cons!36897 l!1065) (= (_1!12876 (h!38440 l!1065)) key!287)))))

(assert (=> d!167163 (= (containsKey!981 l!1065 key!287) e!883671)))

(declare-fun b!1583191 () Bool)

(declare-fun e!883672 () Bool)

(assert (=> b!1583191 (= e!883671 e!883672)))

(declare-fun res!1081538 () Bool)

(assert (=> b!1583191 (=> (not res!1081538) (not e!883672))))

(assert (=> b!1583191 (= res!1081538 (and (or (not (is-Cons!36897 l!1065)) (bvsle (_1!12876 (h!38440 l!1065)) key!287)) (is-Cons!36897 l!1065) (bvslt (_1!12876 (h!38440 l!1065)) key!287)))))

