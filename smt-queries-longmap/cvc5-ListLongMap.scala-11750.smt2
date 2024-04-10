; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137844 () Bool)

(assert start!137844)

(declare-fun b!1583219 () Bool)

(declare-fun res!1081553 () Bool)

(declare-fun e!883690 () Bool)

(assert (=> b!1583219 (=> (not res!1081553) (not e!883690))))

(declare-datatypes ((B!2840 0))(
  ( (B!2841 (val!19782 Int)) )
))
(declare-datatypes ((tuple2!25732 0))(
  ( (tuple2!25733 (_1!12877 (_ BitVec 64)) (_2!12877 B!2840)) )
))
(declare-datatypes ((List!36902 0))(
  ( (Nil!36899) (Cons!36898 (h!38441 tuple2!25732) (t!51816 List!36902)) )
))
(declare-fun l!1065 () List!36902)

(declare-fun key!287 () (_ BitVec 64))

(assert (=> b!1583219 (= res!1081553 (or (not (is-Cons!36898 l!1065)) (= (_1!12877 (h!38441 l!1065)) key!287)))))

(declare-fun b!1583221 () Bool)

(declare-fun e!883691 () Bool)

(declare-fun tp_is_empty!39373 () Bool)

(declare-fun tp!114911 () Bool)

(assert (=> b!1583221 (= e!883691 (and tp_is_empty!39373 tp!114911))))

(declare-fun b!1583220 () Bool)

(declare-datatypes ((Option!944 0))(
  ( (Some!943 (v!22471 B!2840)) (None!942) )
))
(declare-fun isDefined!609 (Option!944) Bool)

(declare-fun getValueByKey!835 (List!36902 (_ BitVec 64)) Option!944)

(assert (=> b!1583220 (= e!883690 (not (isDefined!609 (getValueByKey!835 l!1065 key!287))))))

(declare-fun b!1583218 () Bool)

(declare-fun res!1081552 () Bool)

(assert (=> b!1583218 (=> (not res!1081552) (not e!883690))))

(declare-fun containsKey!982 (List!36902 (_ BitVec 64)) Bool)

(assert (=> b!1583218 (= res!1081552 (containsKey!982 l!1065 key!287))))

(declare-fun res!1081554 () Bool)

(assert (=> start!137844 (=> (not res!1081554) (not e!883690))))

(declare-fun isStrictlySorted!1136 (List!36902) Bool)

(assert (=> start!137844 (= res!1081554 (isStrictlySorted!1136 l!1065))))

(assert (=> start!137844 e!883690))

(assert (=> start!137844 e!883691))

(assert (=> start!137844 true))

(assert (= (and start!137844 res!1081554) b!1583218))

(assert (= (and b!1583218 res!1081552) b!1583219))

(assert (= (and b!1583219 res!1081553) b!1583220))

(assert (= (and start!137844 (is-Cons!36898 l!1065)) b!1583221))

(declare-fun m!1453223 () Bool)

(assert (=> b!1583220 m!1453223))

(assert (=> b!1583220 m!1453223))

(declare-fun m!1453225 () Bool)

(assert (=> b!1583220 m!1453225))

(declare-fun m!1453227 () Bool)

(assert (=> b!1583218 m!1453227))

(declare-fun m!1453229 () Bool)

(assert (=> start!137844 m!1453229))

(push 1)

(assert (not b!1583220))

(assert (not start!137844))

(assert (not b!1583218))

(assert tp_is_empty!39373)

(assert (not b!1583221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167177 () Bool)

(declare-fun isEmpty!1191 (Option!944) Bool)

(assert (=> d!167177 (= (isDefined!609 (getValueByKey!835 l!1065 key!287)) (not (isEmpty!1191 (getValueByKey!835 l!1065 key!287))))))

(declare-fun bs!45894 () Bool)

(assert (= bs!45894 d!167177))

(assert (=> bs!45894 m!1453223))

(declare-fun m!1453249 () Bool)

(assert (=> bs!45894 m!1453249))

(assert (=> b!1583220 d!167177))

(declare-fun b!1583275 () Bool)

(declare-fun e!883724 () Option!944)

(declare-fun e!883725 () Option!944)

(assert (=> b!1583275 (= e!883724 e!883725)))

(declare-fun c!146717 () Bool)

(assert (=> b!1583275 (= c!146717 (and (is-Cons!36898 l!1065) (not (= (_1!12877 (h!38441 l!1065)) key!287))))))

(declare-fun b!1583276 () Bool)

(assert (=> b!1583276 (= e!883725 (getValueByKey!835 (t!51816 l!1065) key!287))))

(declare-fun d!167181 () Bool)

(declare-fun c!146716 () Bool)

(assert (=> d!167181 (= c!146716 (and (is-Cons!36898 l!1065) (= (_1!12877 (h!38441 l!1065)) key!287)))))

(assert (=> d!167181 (= (getValueByKey!835 l!1065 key!287) e!883724)))

(declare-fun b!1583277 () Bool)

(assert (=> b!1583277 (= e!883725 None!942)))

(declare-fun b!1583274 () Bool)

(assert (=> b!1583274 (= e!883724 (Some!943 (_2!12877 (h!38441 l!1065))))))

(assert (= (and d!167181 c!146716) b!1583274))

(assert (= (and d!167181 (not c!146716)) b!1583275))

(assert (= (and b!1583275 c!146717) b!1583276))

(assert (= (and b!1583275 (not c!146717)) b!1583277))

(declare-fun m!1453255 () Bool)

(assert (=> b!1583276 m!1453255))

(assert (=> b!1583220 d!167181))

(declare-fun d!167187 () Bool)

(declare-fun res!1081599 () Bool)

(declare-fun e!883742 () Bool)

(assert (=> d!167187 (=> res!1081599 e!883742)))

(assert (=> d!167187 (= res!1081599 (and (is-Cons!36898 l!1065) (= (_1!12877 (h!38441 l!1065)) key!287)))))

(assert (=> d!167187 (= (containsKey!982 l!1065 key!287) e!883742)))

(declare-fun b!1583296 () Bool)

(declare-fun e!883743 () Bool)

(assert (=> b!1583296 (= e!883742 e!883743)))

(declare-fun res!1081600 () Bool)

(assert (=> b!1583296 (=> (not res!1081600) (not e!883743))))

(assert (=> b!1583296 (= res!1081600 (and (or (not (is-Cons!36898 l!1065)) (bvsle (_1!12877 (h!38441 l!1065)) key!287)) (is-Cons!36898 l!1065) (bvslt (_1!12877 (h!38441 l!1065)) key!287)))))

(declare-fun b!1583297 () Bool)

(assert (=> b!1583297 (= e!883743 (containsKey!982 (t!51816 l!1065) key!287))))

(assert (= (and d!167187 (not res!1081599)) b!1583296))

(assert (= (and b!1583296 res!1081600) b!1583297))

(declare-fun m!1453263 () Bool)

(assert (=> b!1583297 m!1453263))

(assert (=> b!1583218 d!167187))

(declare-fun d!167195 () Bool)

(declare-fun res!1081607 () Bool)

(declare-fun e!883759 () Bool)

(assert (=> d!167195 (=> res!1081607 e!883759)))

(assert (=> d!167195 (= res!1081607 (or (is-Nil!36899 l!1065) (is-Nil!36899 (t!51816 l!1065))))))

(assert (=> d!167195 (= (isStrictlySorted!1136 l!1065) e!883759)))

(declare-fun b!1583321 () Bool)

(declare-fun e!883760 () Bool)

(assert (=> b!1583321 (= e!883759 e!883760)))

(declare-fun res!1081608 () Bool)

(assert (=> b!1583321 (=> (not res!1081608) (not e!883760))))

(assert (=> b!1583321 (= res!1081608 (bvslt (_1!12877 (h!38441 l!1065)) (_1!12877 (h!38441 (t!51816 l!1065)))))))

(declare-fun b!1583322 () Bool)

(assert (=> b!1583322 (= e!883760 (isStrictlySorted!1136 (t!51816 l!1065)))))

(assert (= (and d!167195 (not res!1081607)) b!1583321))

(assert (= (and b!1583321 res!1081608) b!1583322))

(declare-fun m!1453269 () Bool)

(assert (=> b!1583322 m!1453269))

(assert (=> start!137844 d!167195))

(declare-fun b!1583332 () Bool)

(declare-fun e!883766 () Bool)

(declare-fun tp!114926 () Bool)

(assert (=> b!1583332 (= e!883766 (and tp_is_empty!39373 tp!114926))))

(assert (=> b!1583221 (= tp!114911 e!883766)))

(assert (= (and b!1583221 (is-Cons!36898 (t!51816 l!1065))) b!1583332))

(push 1)

(assert (not b!1583322))

(assert (not b!1583332))

(assert (not b!1583297))

(assert (not d!167177))

(assert (not b!1583276))

(assert tp_is_empty!39373)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167205 () Bool)

(declare-fun res!1081613 () Bool)

(declare-fun e!883774 () Bool)

(assert (=> d!167205 (=> res!1081613 e!883774)))

(assert (=> d!167205 (= res!1081613 (or (is-Nil!36899 (t!51816 l!1065)) (is-Nil!36899 (t!51816 (t!51816 l!1065)))))))

(assert (=> d!167205 (= (isStrictlySorted!1136 (t!51816 l!1065)) e!883774)))

(declare-fun b!1583342 () Bool)

(declare-fun e!883775 () Bool)

(assert (=> b!1583342 (= e!883774 e!883775)))

(declare-fun res!1081614 () Bool)

(assert (=> b!1583342 (=> (not res!1081614) (not e!883775))))

(assert (=> b!1583342 (= res!1081614 (bvslt (_1!12877 (h!38441 (t!51816 l!1065))) (_1!12877 (h!38441 (t!51816 (t!51816 l!1065))))))))

(declare-fun b!1583343 () Bool)

(assert (=> b!1583343 (= e!883775 (isStrictlySorted!1136 (t!51816 (t!51816 l!1065))))))

(assert (= (and d!167205 (not res!1081613)) b!1583342))

(assert (= (and b!1583342 res!1081614) b!1583343))

(declare-fun m!1453277 () Bool)

(assert (=> b!1583343 m!1453277))

(assert (=> b!1583322 d!167205))

(declare-fun d!167207 () Bool)

(assert (=> d!167207 (= (isEmpty!1191 (getValueByKey!835 l!1065 key!287)) (not (is-Some!943 (getValueByKey!835 l!1065 key!287))))))

(assert (=> d!167177 d!167207))

(declare-fun d!167209 () Bool)

